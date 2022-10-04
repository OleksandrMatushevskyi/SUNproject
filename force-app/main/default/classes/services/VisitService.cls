/**
 * Created by Sanchez on 04.10.2022.
 */

public with sharing class VisitService {
    public static void checkVisitContactDuplicateRecord(List<Visit__c> visits) {
        try {
            for (Visit__c v : visits) {
                //refactor code later, query don't use in loop
                List<Visit__c> checkVisits = VisitSelector.getListKidsByDate(v.Date_Visit__c);
                if(!checkVisits.isEmpty()) {
                    Set<Id> kidIds = new Set<Id>();
                    for (Visit__c cv : checkVisits) {
                        kidIds.add(cv.Kid__c);
                    }
                    if (kidIds.contains(v.Kid__c)) {
                        v.addError('The child visit is already marked in the table !');
                    }
                }
            }
        }catch (Exception e){
            throw e;
        }
    }
}