public with sharing class KidsGroupController {
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getRelatedContacts(Id kidGroupId) {
        return [
                SELECT Name, Birthdate, Age__c
                FROM Contact
                WHERE Kids_Group_FK__c = :kidGroupId
                WITH SECURITY_ENFORCED
        ];
    }
    @AuraEnabled
    public static List<Kids_Group__c> getGroupsForCombobox(){
        List<Kids_Group__c> groupsList = [SELECT Id, Name FROM Kids_Group__c];
        return groupsList;
    }

    @AuraEnabled
    public static void newVisit(Date dateValue, List<Contact> selectedKids) {
        List<Visit__c> listVisitsForInsert = new List<Visit__c>();

        for(Contact cnt : selectedKids) {
            listVisitsForInsert.add(new Visit__c(Date_Visit__c = dateValue, Kid__c = cnt.Id, Present__c = true));
        }

        insert listVisitsForInsert;
    }
}