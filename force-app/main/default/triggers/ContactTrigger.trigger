/**
 * Created by Sanchez on 02.10.2022.
 */

trigger ContactTrigger on Contact (before insert, after insert, after delete) {
   ContactHandler.handler(Trigger.old, Trigger.new, Trigger.operationType);
}