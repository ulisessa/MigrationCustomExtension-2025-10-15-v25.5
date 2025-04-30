tableextension 51319 tableextension51319 extends "Shop Calendar Holiday"
{
    fields
    {
        modify("Shop Calendar Code")
        {
            Caption = 'Shop Calendar Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        field(50000; "Meta4 code"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Meta4 concept";
        }
    }
}

