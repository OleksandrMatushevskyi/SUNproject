/**
 * Created by Sanchez on 02.10.2022.
 */

trigger KidsTrigger on Contact (after update) {
   /* if(Trigger.isAfter){
        if(Trigger.isUpdate){
            KidsHandler.handler(Trigger.new, Trigger.operationType);
        }else if(Trigger.isDelete){
            KidsHandler.handler(Trigger.old, Trigger.operationType);
        }
    }*/
    KidsHandler.handler(Trigger.new, Trigger.operationType);

}