/**
 * Created by Sanchez on 04.10.2022.
 */

public with sharing class VisitSelector {
    public static List<Visit__c> getListKidsByDate(Date currentDate) {
        return [SELECT Kid__c FROM Visit__c WHERE Date_Visit__c = : currentDate];
    }
}