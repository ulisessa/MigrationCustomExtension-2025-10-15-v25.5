tableextension 50622 tableextension50622 extends "Marketing Setup"
{
    Caption = 'Marketing Setup';
    fields
    {
        modify("Contact Nos.")
        {
            Caption = 'Contact Nos.';
        }
        modify("Campaign Nos.")
        {
            Caption = 'Campaign Nos.';
        }
        modify("Segment Nos.")
        {
            Caption = 'Segment Nos.';
        }
        modify("Opportunity Nos.")
        {
            Caption = 'Opportunity Nos.';
        }
        modify("Bus. Rel. Code for Customers")
        {
            Caption = 'Bus. Rel. Code for Customers';
        }
        modify("Bus. Rel. Code for Vendors")
        {
            Caption = 'Bus. Rel. Code for Vendors';
        }
        modify("Bus. Rel. Code for Bank Accs.")
        {
            Caption = 'Bus. Rel. Code for Bank Accs.';
        }
        modify("Inherit Salesperson Code")
        {
            Caption = 'Inherit Salesperson Code';
        }
        modify("Inherit Territory Code")
        {
            Caption = 'Inherit Territory Code';
        }
        modify("Inherit Country/Region Code")
        {
            Caption = 'Inherit Country/Region Code';
        }
        modify("Inherit Language Code")
        {
            Caption = 'Inherit Language Code';
        }
        modify("Inherit Address Details")
        {
            Caption = 'Inherit Address Details';
        }
        modify("Inherit Communication Details")
        {
            Caption = 'Inherit Communication Details';
        }
        modify("Default Salesperson Code")
        {
            Caption = 'Default Salesperson Code';
        }
        modify("Default Territory Code")
        {
            Caption = 'Default Territory Code';
        }
        modify("Default Country/Region Code")
        {
            Caption = 'Default Country/Region Code';
        }
        modify("Default Language Code")
        {
            Caption = 'Default Language Code';
        }
        modify("Default Sales Cycle Code")
        {
            Caption = 'Default Sales Cycle Code';
        }
        modify("Autosearch for Duplicates")
        {
            Caption = 'Autosearch for Duplicates';
        }
        modify("Search Hit %")
        {
            Caption = 'Search Hit %';
        }
        modify("Maintain Dupl. Search Strings")
        {
            Caption = 'Maintain Dupl. Search Strings';
        }
        modify("Def. Company Salutation Code")
        {
            Caption = 'Def. Company Salutation Code';
        }
        modify("Default Person Salutation Code")
        {
            Caption = 'Default Person Salutation Code';
        }
        modify("Default Correspondence Type")
        {
            Caption = 'Default Correspondence Type';
        }
        modify("Default To-do Date Calculation")
        {
            Caption = 'Default Task Date Calculation';
        }
        modify("Exchange Account Password Key")
        {
            Caption = 'Exchange Account Password Key';
        }
        modify("WebHook Run Notification As")
        {
            Caption = 'WebHook Run Notification As';
        }
        modify("Cust. Template Company Code")
        {
            Caption = 'Cust. Template Company Code';
        }
        modify("Cust. Template Person Code")
        {
            Caption = 'Cust. Template Person Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "ExchangeAccountNotConfiguredErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //ExchangeAccountNotConfiguredErr : ENU=You must set up an Exchange account for email logging.;ESP=Debe configurar una cuenta de Exchange para el registro de correo electrónico.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ExchangeAccountNotConfiguredErr : ENU=You must set up an Exchange account for email logging.;ESP=Debe configurar una cuenta de Exchange para el registro de correo electrónico.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DuplicateSearchQst(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //DuplicateSearchQst : ENU=Do you want to generate duplicate search strings?;ESP=¿Desea generar cadenas de búsqueda duplicadas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DuplicateSearchQst : ENU=Do you want to generate duplicate search strings?;ESP=?Desea generar cadenas de búsqueda duplicadas?;
    //Variable type has not been exported.
}

