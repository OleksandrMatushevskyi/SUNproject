/**
 * Created by Sanchez on 03.10.2022.
 */

public with sharing class KidsGroupSelector {
    public static List<Kids_Group__c> getAmountKidsByGroup(Set<Id> gIds) {
        return [SELECT Id, Kid_Group_Amount__c, (SELECT Id FROM Contacts__r) FROM Kids_Group__c WHERE Id IN : gIds];
    }
}