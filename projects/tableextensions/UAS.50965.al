tableextension 50965 tableextension50965 extends "Serv. Price Group Setup"
{
    fields
    {
        modify("Service Price Group Code")
        {
            Caption = 'Service Price Group Code';
        }
        modify("Fault Area Code")
        {
            Caption = 'Fault Area Code';
        }
        modify("Cust. Price Group Code")
        {
            Caption = 'Cust. Price Group Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Serv. Price Adjmt. Gr. Code")
        {
            Caption = 'Serv. Price Adjmt. Gr. Code';
        }
        modify("Adjustment Type")
        {
            OptionCaption = 'Fixed,Maximum,Minimum';
        }
    }
}

