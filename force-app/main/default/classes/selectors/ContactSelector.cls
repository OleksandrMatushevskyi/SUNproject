/**
 * Created by Sanchez on 02.10.2022.
 */

public with sharing class ContactSelector {
    //bad solution, just for test version
    public static List<Account> getIdKinderGarden() {
        return [SELECT Id, Name FROM Account WHERE Name LIKE 'KinderGarden%' LIMIT 1];
    }
}