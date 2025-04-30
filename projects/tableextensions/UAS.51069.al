tableextension 51069 tableextension51069 extends "Warehouse Journal Template"
{
    Caption = 'Warehouse Journal Template';
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Test Report ID")
        {
            Caption = 'Test Report ID';
        }
        modify("Page ID")
        {
            Caption = 'Page ID';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Test Report Caption")
        {
            Caption = 'Test Report Caption';
        }
        modify("Page Caption")
        {
            Caption = 'Page Caption';
        }
        modify("Registering Report Caption")
        {
            Caption = 'Registering Report Caption';
        }
        modify("Registering No. Series")
        {
            Caption = 'Registering No. Series';
        }
    }
}

