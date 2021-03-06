global with sharing class SobjectInformationController {
    String textValue; 
    public String sobjName {get; set; }
    public static List<SObject> objectDetail {get; set; }
    public String inputText1 {get; set; }
    public String inputText2 {get; set; }
    public String inputText3 {get; set; }

    public SobjectInformationController() {
        inputText1 = ApexPages.currentPage().getParameters().get('parameter1');
        inputText2 = ApexPages.currentPage().getParameters().get('parameter2');
        inputText3 = ApexPages.currentPage().getParameters().get('parameter3');
    }


    @RemoteAction
    global static List<SObject> getSObjectInformation(String sobjName) {
        objectDetail = Database.query('SELECT Id, Name, CreatedDate FROM ' +  sobjName + ' LIMIT 5');
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

    public Pagereference setParams() {
        Pagereference page = Page.SObjectInformation;
        if (String.isNotEmpty(inputText1)) {
            page.getParameters().put('parameter1', inputText1);
        }

        if (String.isNotEmpty(inputText2)) {
            page.getParameters().put('parameter2', inputText2);
        }

        if (String.isNotEmpty(inputText3)) {
            page.getParameters().put('parameter3', inputText3);
        }

        page.setRedirect(true);
        return page;
    }

    public PageReference redirectToShowContact() {
        Pagereference page = Page.ShowContact;
        page.setRedirect(true);
        return page;
    }

    public PageReference redirectToShowDataTableContacts() {
        Pagereference page = Page.ShowDataTableContacts;
        page.setRedirect(true);
        return page;
    }

    public PageReference redirectToContactDescription() {
        Pagereference page = Page.ContactDescription;
        page.setRedirect(true);
        return page;
    }

    public PageReference redirectToPogodaBy() {
        String url = 'https://pogoda.by/';
        Pagereference page = new Pagereference(url);
        page.setRedirect(true);
        return page;
    }

    public PageReference redirectToWorkbench() {
        String url = 'https://workbench.developerforce.com/login.php';
        Pagereference page = new Pagereference(url);
        page.setRedirect(true);
        return page;
    }

    public PageReference redirectToSalesforceCom() {
        String url = 'https://www.salesforce.com/';
        Pagereference page = new Pagereference(url);
        page.setRedirect(true);
        return page;
    }
}
