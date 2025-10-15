tableextension 50285 "VAT Setup Posting Groups Ext." extends "VAT Setup Posting Groups"
{
    Caption = 'VAT Setup Posting Groups';
    fields
    {
        modify("Sales VAT Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purchase VAT Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Reverse Chrg. VAT Acc.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Reverse Chrg. VAT Acc.';
        }
        modify("VAT Clause Desc")
        {
            Caption = 'VAT Clause Desc';
        }
        modify("Application Type")
        {
            Caption = 'Application Type';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "STANDARDTok(Variable 1606)".

    //var
    //>>>> ORIGINAL VALUE:
    //STANDARDTok : @@@=the same as values in Product posting group;ENU=STANDARD;ESP=ESTÁNDAR;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //STANDARDTok : @@@=the same as values in Product posting group;ENU=STANDARD;ESP=estándar;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "FULLNORMTxt(Variable 1608)".

    //var
    //>>>> ORIGINAL VALUE:
    //FULLNORMTxt : ENU=VAT Only Invoices 25%;ESP=Facturas de solo IVA (25 %);
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FULLNORMTxt : ENU=VAT Only Invoices 25%;ESP=Facturas de solo IVA (25?%);
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "FULLREDTxt(Variable 1609)".

    //var
    //>>>> ORIGINAL VALUE:
    //FULLREDTxt : ENU=VAT Only Invoices 10%;ESP=Facturas de solo IVA (10 %);
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FULLREDTxt : ENU=VAT Only Invoices 10%;ESP=Facturas de solo IVA (10?%);
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "REDUCEDTxt(Variable 1610)".

    //var
    //>>>> ORIGINAL VALUE:
    //REDUCEDTxt : ENU=Reduced VAT (10%);ESP=IVA reducido (10 %);
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //REDUCEDTxt : ENU=Reduced VAT (10%);ESP=IVA reducido (10?%);
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SERVNORMTxt(Variable 1611)".

    //var
    //>>>> ORIGINAL VALUE:
    //SERVNORMTxt : ENU=Miscellaneous 25 VAT;ESP=Varios con IVA 25 %;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SERVNORMTxt : ENU=Miscellaneous 25 VAT;ESP=Varios con IVA 25?%;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SERVREDTxt(Variable 1612)".

    //var
    //>>>> ORIGINAL VALUE:
    //SERVREDTxt : ENU=Miscellaneous 10 VAT;ESP=Varios con IVA 10 %;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SERVREDTxt : ENU=Miscellaneous 10 VAT;ESP=Varios con IVA 10?%;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "STANDARDTxt(Variable 1613)".

    //var
    //>>>> ORIGINAL VALUE:
    //STANDARDTxt : ENU=Standard VAT (25%);ESP=IVA estándar (25 %);
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //STANDARDTxt : ENU=Standard VAT (25%);ESP=IVA estándar (25?%);
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ZEROTxt(Variable 1614)".

    //var
    //>>>> ORIGINAL VALUE:
    //ZEROTxt : ENU=No VAT;ESP=N.º IVA;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ZEROTxt : ENU=No VAT;ESP=No. IVA;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "InvalidGLAccountsTxt(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvalidGLAccountsTxt : @@@=%1 is placeholder for the invalid gl account code;ENU=%1 is not valid G/L Account.;ESP=%1 no es una cuenta de C/G válida.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvalidGLAccountsTxt : @@@=%1 is placeholder for the invalid gl account code;ENU=%1 is not valid G/L Account.;ESP=%1 no es una cuenta de C/G válida.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "VATAssistedAccountsMsg(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //VATAssistedAccountsMsg : ENU=You have not assigned general ledger accounts for sales and purchases for all VAT amounts. You won't be able to calculate and post VAT for the missing accounts. If you're skipping this step on purpose, you can manually assign accounts later in the VAT Posting Setup page.;ESP=No ha asignado las cuentas de contabilidad general de ventas y compras a todos los importes de IVA. No podrá calcular ni registrar el IVA de las cuentas que faltan. Si omite este paso a propósito, podrá asignar manualmente las cuentas más adelante en la página de configuración de registro de IVA.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VATAssistedAccountsMsg : ENU=You have not assigned general ledger accounts for sales and purchases for all VAT amounts. You won't be able to calculate and post VAT for the missing accounts. If you're skipping this step on purpose, you can manually assign accounts later in the VAT Posting Setup page.;ESP=No ha asignado las cuentas de contabilidad general de ventas y compras a todos los importes de IVA. No podrá calcular ni registrar el IVA de las cuentas que faltan. Si omite este paso a prop?sito, podrá asignar manualmente las cuentas más adelante en la p?gina de configuración de registro de IVA.;
    //Variable type has not been exported.
}

