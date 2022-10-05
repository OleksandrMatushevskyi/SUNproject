import { LightningElement, track } from 'lwc';
import getGroupsForCombobox from '@salesforce/apex/KidsGroupController.getGroupsForCombobox';
import getRelatedContacts from '@salesforce/apex/KidsGroupController.getRelatedContacts';
import newVisit from '@salesforce/apex/KidsGroupController.newVisit';
//import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

//Define columns for Datatable
const columns = [
  { label : 'Contacts Name' , fieldName : 'Name'},  //field name is defined in object manager
  { label : 'Age' , fieldName : 'Age__c'},
  { label : 'Birthdate' , fieldName : 'Birthdate'},
]

export default class MarkVisitsByGroup extends LightningElement {

  @track value = '';
  @track optionsArray = []; //this array will store the options for combobox
  @track cardVisible = false;   //used for show/hide card functionality
  @track data = []; //used for storing contact details in data-table
  columns = columns;
  selectedRows = [];
  inputDate = new Date();
  currentDate =  this.inputDate.getFullYear() + '/' + (this.inputDate.getMonth() + 1)+ '/' + this.inputDate.getDate();

  //I change date
  handleChangedDate(event) {
    this.inputDate = event.target.value;
    //console.log("change date: " + this.inputDate);

  }

  //Now store option by returning the optionsArray
  get options(){
    return this.optionsArray;
  }

  //call apex method to get Group stored in Salesforce org Database
  connectedCallback(){
    getGroupsForCombobox()
      .then(response=>{
        let arr = []; //This array store the groups details in table and value pair
        for(let i=0 ; i<response.length ; i++){
          // add the group Name as label and id as value in arr []
          arr.push({ label : response[i].Name , value : response[i].Id })
        }

        //store the arr objects into optionsArray
        this.optionsArray = arr;

      })

  }

  //Get Selected Group recordId
  handleChangedValue(event){

  //Whenever a group is selected in combobox then "cardVisible" will become true and
  //contact data=table will display to user
  this.cardVisible = true;

  //store selected groupId in "value" property
  this.value  = event.detail.value;

  //call apex method to get contacts of selected Group
   getRelatedContacts({ kidGroupId : this.value})  //pass selected Group recordId to apex method to get related contacts
     .then( result =>{
       this.data = result;
     })
     .catch( error =>{
       console.log("error: "+error);
     })
  }

  //Get details of selected rows
  getSelectedRows(event){
  this.selectedRows = event.detail.selectedRows;
  // eslint-disable-next-line no-alert
  //window.alert(JSON.stringify(this.selectedRows));
  }

  createVisit() {
    newVisit({dateValue: this.inputDate, selectedKids: this.selectedRows, allKids: this.data})
      .then(() => {

        this.dispatchEvent(new ShowToastEvent({
          title: "Success",
          message: "New Visit created!",
          variant: "success"
        }));

        this.cardVisible = false;
        /*refreshApex(this.contacts).then(() => {
          // do something with the refreshed data in this.Obj
        });*/
      })
      .catch(error => console.log(error))
  }
}
