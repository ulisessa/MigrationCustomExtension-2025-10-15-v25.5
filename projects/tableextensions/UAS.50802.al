tableextension 50802 tableextension50802 extends "FA Reclass. Journal Line"
{
    Caption = 'FA Reclass. Journal Line';
    fields
    {
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("FA No.")
        {
            Caption = 'FA No.';
        }
        modify("New FA No.")
        {
            Caption = 'New FA No.';
        }
        modify("Depreciation Book Code")
        {
            Caption = 'Depreciation Book Code';
        }
        modify("Reclassify Depreciation")
        {
            Caption = 'Reclassify Depreciation';
        }
        modify("Reclassify Write-Down")
        {
            Caption = 'Reclassify Write-Down';
        }
        modify("Reclassify Appreciation")
        {
            Caption = 'Reclassify Appreciation';
        }
        modify("Reclassify Custom 2")
        {
            Caption = 'Reclassify Custom 2';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
    }
}

