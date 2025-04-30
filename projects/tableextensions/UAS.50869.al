tableextension 50869 tableextension50869 extends "Invt. Post to G/L Test Buffer"
{
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 5)".

            Caption = 'Description';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }
        modify("Source Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Source Currency Code';
        }
        modify("Value Entry No.")
        {
            Caption = 'Value Entry No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Invt. Posting Group Code")
        {
            Caption = 'Invt. Posting Group Code';
        }
    }
}

