/**
 * Created by Sanchez on 02.10.2022.
 */

trigger KidsTrigger on Contact (after insert, after delete) {
   KidsHandler.handler(Trigger.old, Trigger.new, Trigger.operationType);
}