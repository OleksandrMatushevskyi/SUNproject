/**
 * Created by Sanchez on 02.10.2022.
 */

public with sharing class ContactService {

    public static void autoCompleteAccountField(List<Contact> listKidOrTeacher) {
        try {
            for (Contact cnt : listKidOrTeacher) {
                if (cnt.RecordType.Name == 'Kid' || cnt.RecordType.Name == 'Teacher') {
                    cnt.AccountId = (Id) ContactSelector.getIdKinderGarden().get(0).Id;
                }
            }
        }catch (Exception e){
            throw e;
        }
    }

    public static void updateAmountOfKidsOnGroup(List<Contact> kids) {
        Set<Id> kidGroupIds = new Set<Id>();

        for (Contact c : kids) {
            kidGroupIds.add(c.Kids_Group_FK__c);
        }

        List<Kids_Group__c> updatedGroups = KidsGroupSelector.getAmountKidsByGroup(kidGroupIds);

        for (Kids_Group__c gr : updatedGroups) {
            gr.Kid_Group_Amount__c = gr.Contacts__r.size();
        }

        update updatedGroups;
    }
}