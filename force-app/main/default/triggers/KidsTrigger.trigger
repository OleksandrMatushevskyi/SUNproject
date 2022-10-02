/**
 * Created by Sanchez on 02.10.2022.
 */

trigger KidsTrigger on Contact (before insert, before update) {
    KidsHandler.handler(Trigger.new, Trigger.operationType);
}