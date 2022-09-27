/**
 * Created by Sanchez on 27.09.2022.
 */

import { LightningElement, api, wire } from 'lwc';
import getRelatedContacts from '@salesforce/apex/KidsGroupController.getRelatedContacts';
/*import newContact from '@salesforce/apex/AccountController.newContact';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';*/

export default class RelatedContacts extends LightningElement {
  @api recordId;
  showForm = false;
  //@wire(getRelatedContacts, { kidGroupId: '$recordId' })
  @wire(getRelatedContacts, { kidGroupId: 'a0D7R00002R1oXDUAZ' })
  contacts;

  addContact() {
    this.showForm = true;
  }

  handleLastNameChange(event) {
    this.lastName = event.target.value;
  }

 /* createContact() {
    newContact({accountId: this.recordId, lastName: this.lastName})
      .then(() => {
        this.showForm = false;
        this.dispatchEvent(new ShowToastEvent({
          title: "Success",
          message: "New Contact created!",
          variant: "success"
        }));
        refreshApex(this.contacts).then(() => {
          // do something with the refreshed data in this.Obj
        });
      })
      .catch(error => console.log(error))
  }*/
}