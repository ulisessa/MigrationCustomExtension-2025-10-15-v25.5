tableextension 51068 tableextension51068 extends "Put-away Template Line"
{
    Caption = 'Put-away Template Line';
    fields
    {
        modify("Put-away Template Code")
        {
            Caption = 'Put-away Template Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Find Fixed Bin")
        {
            Caption = 'Find Fixed Bin';
        }
        modify("Find Floating Bin")
        {
            Caption = 'Find Floating Bin';
        }
        modify("Find Bin w. Less than Min. Qty")
        {
            Caption = 'Find Bin w. Less than Min. Qty';
        }
        modify("Find Empty Bin")
        {
            Caption = 'Find Empty Bin';
        }
    }
}

