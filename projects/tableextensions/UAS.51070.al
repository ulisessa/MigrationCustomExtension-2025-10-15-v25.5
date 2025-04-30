tableextension 51070 tableextension51070 extends "Warehouse Journal Batch"
{
    Caption = 'Warehouse Journal Batch';
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Registering No. Series")
        {
            Caption = 'Registering No. Series';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
    }
}

