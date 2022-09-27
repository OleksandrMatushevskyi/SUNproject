/**
 * Created by Sanchez on 25.09.2022.
 */

public with sharing class KidsGroupHandler {
    public static void handler(Map<Id, Kids_Group__c> idKidsGroupMap, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when AFTER_INSERT {
                //CaseService.updateAmountOfCasesOnCountry(newCases);

            }
            when AFTER_UPDATE {
                //ClassService.updateTeachersForStudents(idKidsGroupMap);
            }
        }
    }
}