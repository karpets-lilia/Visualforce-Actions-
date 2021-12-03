global with sharing class SobjectInformationController {
    String textValue; 
    public String sobjName {get; set; }
    public static List<SObject> objectDetail {get; set; }

    public SobjectInformationController() {}

    @RemoteAction
    global static List<SObject> getAccount(String sobjName) {
        System.debug(sobjName);
        
        objectDetail = Database.query('SELECT Id, Name, CreatedDate FROM ' +  sobjName + ' LIMIT 5');
        System.debug(objectDetail);
        return objectDetail; 
    }

    public String getText() {
        return textValue;
    }

    public PageReference textOutput() {
        String paramFromVF = ApexPages.currentPage().getParameters().get('newParam');
        textValue = paramFromVF;
        return null;
    }
}
