tableextension 50755 tableextension50755 extends "Purch. Inv. Line Aggregate"
{
    Caption = 'Purch. Inv. Line Aggregate';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Expected Receipt Date")
        {
            Caption = 'Expected Receipt Date';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Line Discount %")
        {
            Caption = 'Line Discount %';
        }
        modify("Line Discount Amount")
        {
            Caption = 'Line Discount Amount';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Line Amount")
        {
            Caption = 'Line Amount';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Tax Code")
        {
            Caption = 'Tax Code';
        }
        modify("Line Tax Amount")
        {
            Caption = 'Line Tax Amount';
        }
        modify("Line Amount Including Tax")
        {
            Caption = 'Line Amount Including Tax';
        }
        modify("Line Amount Excluding Tax")
        {
            Caption = 'Line Amount Excluding Tax';
        }
    }
}

