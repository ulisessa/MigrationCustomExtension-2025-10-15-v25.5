tableextension 50715 tableextension50715 extends "Integration Field Mapping"
{
    Caption = 'Integration Field Mapping';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Integration Table Mapping Name")
        {
            Caption = 'Integration Table Mapping Name';
        }
        modify("Field No.")
        {
            Caption = 'Field No.';
        }
        modify("Integration Table Field No.")
        {
            Caption = 'Integration Table Field No.';
        }
        modify(Direction)
        {
            Caption = 'Direction';
            OptionCaption = 'Bidirectional,ToIntegrationTable,FromIntegrationTable';
        }
        modify("Validate Integration Table Fld")
        {
            Caption = 'Validate Integration Table Fld';
        }
        modify("Clear Value on Failed Sync")
        {
            Caption = 'Clear Value on Failed Sync';
        }
    }
}

