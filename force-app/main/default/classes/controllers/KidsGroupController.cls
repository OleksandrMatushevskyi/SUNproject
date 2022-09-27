public with sharing class KidsGroupController {
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getRelatedContacts(Id kidGroupId) {
        return [
                SELECT Name
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

    /*@AuraEnabled
    public static void newContact(Id accountId, String lastName) {
        insert new Contact(AccountId = accountId, LastName = lastName);
    }*/
}