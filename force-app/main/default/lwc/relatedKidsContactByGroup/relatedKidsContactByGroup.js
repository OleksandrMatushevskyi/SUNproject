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
  //temp solution
  @wire(getRelatedContacts, { kidGroupId: 'a0D7R00002R1oXDUAZ' })
  contacts;

}