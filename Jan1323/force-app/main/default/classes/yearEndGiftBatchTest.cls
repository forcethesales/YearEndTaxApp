//Code by Jessie Rymph
//January 12, 2023
//Tests the Year End Gift Batch process using the YearEndtestDataFactory class
//https://wp.me/p9qPLI-1q8

@isTest
public class yearEndGiftBatchTest {
    
    @isTest static void positiveTest() {
        // Test data setup 
        // test for Gifts Last Year
        // Create contacts with opps through test utility
        Integer testNumC= 2;
        Integer testNumO = 2;
        contact[] cons = YearEndTestDataFactory.giftsLastYear(testNumC,testNumO);
        
        Test.startTest();
        	yearEndGiftBatch yEGB = new yearEndGiftBatch();
        	Id batchId = Database.executeBatch(yEGB);
        Test.stopTest();        
        List<Contact> contacts = new List<Contact>();

        for(Contact person : [SELECT Id, Gifts_Last_Year__c FROM Contact]) {
            if(person.Gifts_Last_Year__c.contains('Date')) {
                contacts.add(person);
            }
        }
        System.assertEquals(testNumC,contacts.size(),testNumC +' ');
       
    }
    
    @isTest static void negativeTest() {
        // Test data setup
        // Test that this years gifts do not go into Gifts Last Year
        // Create contacts with opps through test utility
        Integer testNumC=10;
        Integer testNumO = 12;
        contact[] cons = YearEndTestDataFactory.GiftsThisYear(testNumC,testNumO);
        
        Test.startTest();
        	yearEndGiftBatch yEGB = new yearEndGiftBatch();
        	Id batchId = Database.executeBatch(yEGB);
        Test.stopTest();        
        List<Contact> contacts = new List<Contact>();

        for(Contact person : [SELECT Id, Gifts_Last_Year__c FROM Contact]) {
           
            IF(person.Gifts_Last_Year__c != null) { 
                contacts.add(person);
            }
            
        }
        System.assertEquals(0,contacts.size(),'Expected none, got' + contacts.size());

    }
    

    @IsTest
    static void testThatEmailWasSent(){
        Integer testNumC= 5;
        Integer testNumO = 5;
        contact[] cons = YearEndTestDataFactory.giftsLastYear(testNumC,testNumO);
        
        Test.startTest();
        yearEndGiftBatch yEGB = new yearEndGiftBatch();  	
        Id batchId = Database.executeBatch(yEGB);
        Test.stopTest();
		System.assertEquals(1,yearendGiftbatch.emaillimits);
    }
}