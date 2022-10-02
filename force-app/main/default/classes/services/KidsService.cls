/**
 * Created by Sanchez on 02.10.2022.
 */

public with sharing class KidsService {
    public static void updateAmountOfKidsOnGroup(List<Contact> kids) {
        Set<Id> groupIds = new Set<Id>();

        for (Contact c : kids) {
            groupIds.add(c.Kids_Group_FK__c);
        }

        List<AggregateResult> aggregateResults = KidsSelector.getAmountOfKidsForEachGroup();
        System.debug(aggregateResults);
        List<Kids_Group__c> groups = new List<Kids_Group__c>();

        for (AggregateResult ar : aggregateResults) {
            groups.add(new Kids_Group__c(Id = (Id) ar.get('Kids_Group__c'), Kid_Group_Amount__c = (Integer) ar.get('amount')));
        }

        update groups;
    }
}