/**
 * Created by Sanchez on 02.10.2022.
 */

public with sharing class KidsHandler {
    public static void handler(List<Contact> oldListKids, List<Contact> newListKids, System.TriggerOperation triggerOperation) {
        //Id kidRecordTypeId = [SELECT Id, Name FROM RecordType WHERE Name = 'Kid' LIMIT 1].Id;

        switch on triggerOperation {
            when AFTER_INSERT {
                KidsService.updateAmountOfKidsOnGroup(newListKids);
            }
            when AFTER_DELETE {
                KidsService.updateAmountOfKidsOnGroup(oldListKids);
            }
        }
    }
}