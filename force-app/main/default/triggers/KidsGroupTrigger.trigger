/**
 * Created by Sanchez on 25.09.2022.
 */

trigger KidsGroupTrigger on Kids_Group__c (after insert, after update) {
    KidsGroupHandler.handler(Trigger.newMap, Trigger.operationType);
}