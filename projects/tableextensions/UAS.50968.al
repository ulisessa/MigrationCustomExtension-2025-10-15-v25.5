tableextension 50968 tableextension50968 extends "Service Line Price Adjmt."
{
    Caption = 'Service Line Price Adjmt.';
    fields
    {
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Service Line No.")
        {
            Caption = 'Service Line No.';
        }
        modify("Service Item Line No.")
        {
            Caption = 'Service Item Line No.';
        }
        modify("Service Item No.")
        {
            Caption = 'Service Item No.';
        }
        modify("Serv. Price Adjmt. Gr. Code")
        {
            Caption = 'Serv. Price Adjmt. Gr. Code';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 9)".

            Caption = 'Description';
        }
        modify("Adjustment Type")
        {
            OptionCaption = 'Fixed,Maximum,Minimum';
        }
        modify("Service Price Group Code")
        {
            Caption = 'Service Price Group Code';
        }
    }
}

