public with sharing class KidsGroupHandler {
    public static void handler(List<Kids_Group__c> newListKidsGroup, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when BEFORE_INSERT {
                KidsGroupService.validateAmountKidsByGroup(newListKidsGroup);
            }
        }
    }
}