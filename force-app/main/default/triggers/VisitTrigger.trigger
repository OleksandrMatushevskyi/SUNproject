/**
 * Created by Sanchez on 04.10.2022.
 */

trigger VisitTrigger on Visit__c (before insert) {
    VisitHandler.handler(Trigger.new, Trigger.operationType);
}