tableextension 50406 tableextension50406 extends "Vendor Bank Account"
{
    fields
    {
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Telex No.")
        {
            Caption = 'Telex No.';
        }
        modify("Bank Branch No.")
        {
            Caption = 'Bank Branch No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Transit No.")
        {
            Caption = 'Transit No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Fax No.")
        {
            Caption = 'Fax No.';
        }
        modify("Telex Answer Back")
        {
            Caption = 'Telex Answer Back';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        modify("SWIFT Code")
        {
            Caption = 'SWIFT Code';
        }
        modify("Bank Clearing Code")
        {
            Caption = 'Bank Clearing Code';
        }
        modify("Bank Clearing Standard")
        {
            Caption = 'Bank Clearing Standard';
        }
        modify("CCC Bank No.")
        {
            Caption = 'CCC Bank No.';
        }
        modify("CCC Bank Branch No.")
        {
            Caption = 'CCC Bank Branch No.';
        }
        modify("CCC Control Digits")
        {
            Caption = 'CCC Control Digits';
        }
        modify("CCC Bank Account No.")
        {
            Caption = 'CCC Bank Account No.';
        }
        modify("CCC No.")
        {
            Caption = 'CCC No.';
        }
        modify("Use For Electronic Payments")
        {
            Caption = 'Use For Electronic Payments';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on ""Use For Electronic Payments"(Field 10705).OnValidate.Text1100000(Variable 1100000)".

    //var
    //>>>> ORIGINAL VALUE:
    //"Use For Electronic Payments" : ENU="Use for Electronic Payments can  be checked for only one of the Vendor's Bank Accounts. ";ESP="Usar para pagos electrónicos solo puede activarse para una de las cuentas del proveedor. ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Use For Electronic Payments" : ENU="Use for Electronic Payments can  be checked for only one of the Vendor's Bank Accounts. ";ESP="Usar para pagos electrónicos solo puede activarse para una de las cuentas del proveedor. ";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BankAccIdentifierIsEmptyErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //BankAccIdentifierIsEmptyErr : ENU=You must specify either a Bank Account No. or an IBAN.;ESP=Debe especificar un n.º de cuenta bancaria o un IBAN.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BankAccIdentifierIsEmptyErr : ENU=You must specify either a Bank Account No. or an IBAN.;ESP=Debe especificar un no. de cuenta bancaria o un IBAN.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BankAccDeleteErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //BankAccDeleteErr : ENU=You cannot delete this bank account because it is associated with one or more open ledger entries.;ESP=No se puede eliminar esta cuenta bancaria porque está asociada a uno o varios movimientos abiertos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BankAccDeleteErr : ENU=You cannot delete this bank account because it is associated with one or more open ledger entries.;ESP=No se puede eliminar esta cuenta bancaria porque está asociada a uno o varios movimientos abiertos.;
    //Variable type has not been exported.
}

