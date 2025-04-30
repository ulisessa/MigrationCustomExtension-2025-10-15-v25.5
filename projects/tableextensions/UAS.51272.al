tableextension 51272 tableextension51272 extends "Generic Chart Query Column"
{
    Caption = 'Generic Chart Query Column';
    fields
    {
        modify("Query No.")
        {
            Caption = 'Query No.';
        }
        modify("Query Column No.")
        {
            Caption = 'Query Column No.';
        }
        modify("Column Data Type")
        {
            OptionCaption = 'Date,Time,DateFormula,Decimal,Text,Code,Binary,Boolean,Integer,Option,BigInteger,DateTime';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Aggregation Type")
        {
            Caption = 'Aggregation Type';
            OptionCaption = 'None,Count,Sum,Min,Max,Avg';
        }
    }
}

