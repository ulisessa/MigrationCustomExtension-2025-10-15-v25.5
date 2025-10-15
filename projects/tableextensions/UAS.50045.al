tableextension 50045 "No Taxable Entry Ext." extends "No Taxable Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Reversed by Entry No.")
        {
            Caption = 'Reversed by Entry No.';
        }
        modify("Reversed Entry No.")
        {
            Caption = 'Reversed Entry No.';
        }
        modify("Delivery Operation Code")
        {
            Caption = 'Delivery Operation Code';
        }
        modify("No Taxable Type")
        {
            OptionCaption = ' ,Non Taxable Art 7-14 and others,Non Taxable Due To Localization Rules';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
    }
}

