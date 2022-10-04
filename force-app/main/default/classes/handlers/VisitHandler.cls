/**
 * Created by Sanchez on 04.10.2022.
 */

public with sharing class VisitHandler {
    public static void handler(List<Visit__c> newListVisits, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when BEFORE_INSERT {
                VisitService.checkVisitContactDuplicateRecord(newListVisits);
            }
        }
    }
}