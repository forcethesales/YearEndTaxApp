//Code by Jessie Rymph
//January 12, 2023
//used with YearEndGiftBatchTest and YearEndCampaignTest
//https://wp.me/p9qPLI-1q8

@isTest 
public class yearEndtestDataFactory {
    
    public static Id devRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Donation').getRecordTypeId();
    
    //gifts last year
    public static List<Contact> giftsLastYear(Integer numCts, Integer numOppsPerCt){
        //create Test Data
        Campaign camp = new Campaign (Name = 'Annual Fund');
        insert camp;
        
        List<Contact> cons = new List<Contact>();
        
        for(Integer i=0;i<numCts;i++) {
            Contact a = new Contact(LastName='Test'+i,Email='basket@gmail.com',npo02__OppAmountLastYear__c=40);
            Cons.add(a);
        }
        insert Cons;
        system.debug('insert' + cons);
        
        List<Opportunity> opps = new List<Opportunity>();
        
        for (Integer j=0;j<numCts;j++) {
            Contact connie = Cons[j];
            //get the year of last year. start by getting today's date.
            Date myDate = system.today();
            //get the year from the date
            Integer thisYear = myDate.year();
            //subtract one to make it last year
            Integer lastYear = thisYear - 1;
            //set a date variable for January 1 of last year. This will be the first gift date.
            Date janDate = Date.newInstance(lastyear, 1, 1);
            // For each contact just inserted, add opportunities
            for (Integer k=0;k<numOppsPerCt;k++) {
                opps.add(new Opportunity(Name=connie.Name + ' Opportunity ' + k,
                                         recordTypeid= devRecordTypeId,
                                         AccountId=connie.AccountId,
                                         StageName='Closed Won',
                                         CampaignId = camp.Id,
                                         //for each opp created use the JanDate variable, one month later
                                         CloseDate=janDate.addmonths(k),
                                         Amount=k+990,
                                         npsp__Primary_Contact__c=connie.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        system.debug('all Test Opps created');
        return cons;
        
    }
    public static List<Contact> giftsThisYear(Integer numCts, Integer numOppsPerCt){
        //create Test Data with gifts that are this year
        Campaign camp = new Campaign (Name = 'Annual Fund');
        insert camp;
        
        List<Contact> cons = new List<Contact>();
        for(Integer i=0;i<numCts;i++) {
            Contact a = new Contact(LastName='Test'+i,Email='basket@gmail.com',npo02__OppAmountLastYear__c=0);
            Cons.add(a);
        }
        insert Cons;
        system.debug('insert' + cons);
        
        List<Opportunity> opps = new List<Opportunity>();
        
        for (Integer j=0;j<numCts;j++) {
            Contact connie = Cons[j];
            //get today's date
            Date myDate = system.today();
            //get the year from the date
            Integer thisYear = myDate.year();
            //set a date variable for January 1 of this year. This will be the first gift date.
            Date janDate = Date.newInstance(thisyear, 1, 1);
            // For each contact just inserted, add opportunities
            for (Integer k=0;k<numOppsPerCt;k++) {
                opps.add(new Opportunity(Name=connie.Name + ' Opportunity ' + k,
                                         recordTypeid=devRecordTypeId,
                                         AccountId=connie.AccountId,
                                         StageName='Closed Won',
                                         CampaignId = camp.id,
                                         //for each opp created use the JanDate variable and add one year
                                         CloseDate=janDate.addyears(k),
                                         Amount=k+990,
                                         npsp__Primary_Contact__c=connie.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        system.debug('all Test Opps created');
        return cons;
        
    }
    
    //gifts two years ago
    public static List<Contact> gifts2YearsAgo(Integer numCts, Integer numOppsPerCt){
        //create Test Data
        Campaign camp = new Campaign (Name = 'Annual Fund');
        insert camp;
        
        List<Contact> cons = new List<Contact>();
        
        for(Integer i=0;i<numCts;i++) {
            Contact a = new Contact(LastName='Test'+i,Email='basket@gmail.com',npo02__OppAmountLastYear__c=40);
            Cons.add(a);
        }
        insert Cons;
        system.debug('insert' + cons);
        
        List<Opportunity> opps = new List<Opportunity>();
        
        for (Integer j=0;j<numCts;j++) {
            Contact connie = Cons[j];
            //get the year of last year. start by getting today's date.
            Date myDate = system.today();
            //get the year from the date
            Integer thisYear = myDate.year();
            //subtract one to make it last year
            Integer twoYears = thisYear - 2;
            //set a date variable for January 1 of 2 years ago. This will be the first gift date.
            Date janDate = Date.newInstance(twoYears, 1, 1);
            // For each contact just inserted, add opportunities
            for (Integer k=0;k<numOppsPerCt;k++) {
                opps.add(new Opportunity(Name=connie.Name + ' Opportunity ' + k,
                                         recordTypeid= devRecordTypeId,
                                         AccountId=connie.AccountId,
                                         StageName='Closed Won',
                                         CampaignId = camp.Id,
                                         //for each opp created use the JanDate variable, one month later
                                         CloseDate=janDate.addmonths(k),
                                         Amount=k+990,
                                         npsp__Primary_Contact__c=connie.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        system.debug('all Test Opps created');
        return cons;
        
    }
}