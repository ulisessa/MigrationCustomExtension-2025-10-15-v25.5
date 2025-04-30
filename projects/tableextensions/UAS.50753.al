tableextension 50753 tableextension50753 extends "Sales Invoice Line Aggregate"
{
    Caption = 'Sales Invoice Line Aggregate';
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
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
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
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
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
        modify("Line Discount Calculation")
        {
            Caption = 'Line Discount Calculation';
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
        modify("Line Discount Value")
        {
            Caption = 'Line Discount Value';
        }
    }
}

