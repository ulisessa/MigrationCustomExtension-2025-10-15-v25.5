tableextension 50782 tableextension50782 extends "FA Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("G/L Entry No.")
        {
            Caption = 'G/L Entry No.';
        }
        modify("FA No.")
        {
            Caption = 'FA No.';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Depreciation Book Code")
        {
            Caption = 'Depreciation Book Code';
        }
        modify("FA Posting Category")
        {
            Caption = 'FA Posting Category';
        }
        modify("Reclassification Entry")
        {
            Caption = 'Reclassification Entry';
        }
        modify("Part of Depreciable Basis")
        {
            Caption = 'Part of Depreciable Basis';
        }
        modify("Disposal Calculation Method")
        {
            Caption = 'Disposal Calculation Method';
        }
        modify("Disposal Entry No.")
        {
            Caption = 'Disposal Entry No.';
        }
        modify("No. of Depreciation Days")
        {
            Caption = 'No. of Depreciation Days';
        }
        modify("FA No./Budgeted FA No.")
        {
            Caption = 'FA No./Budgeted FA No.';
        }
        modify("FA Subclass Code")
        {
            Caption = 'FA Subclass Code';
        }
        modify("FA Location Code")
        {
            Caption = 'FA Location Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Depreciation Method")
        {
            Caption = 'Depreciation Method';
        }
        modify("Depreciation Starting Date")
        {
            Caption = 'Depreciation Starting Date';
        }
        modify("No. of Depreciation Years")
        {
            Caption = 'No. of Depreciation Years';
        }
        modify("Declining-Balance %")
        {
            Caption = 'Declining-Balance %';
        }
        modify("Depreciation Table Code")
        {
            Caption = 'Depreciation Table Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("FA Class Code")
        {
            Caption = 'FA Class Code';
        }
        modify("Result on Disposal")
        {
            OptionCaption = ' ,Gain,Loss';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Canceled from FA No.")
        {
            Caption = 'Canceled from FA No.';
        }
        modify("Depreciation Ending Date")
        {
            Caption = 'Depreciation Ending Date';
        }
        modify("Automatic Entry")
        {
            Caption = 'Automatic Entry';
        }
        modify("Depr. % this year (Custom 1)")
        {
            Caption = 'Depr. % this year (Custom 1)';
        }
        modify("Property Class (Custom 1)")
        {
            OptionCaption = ' ,Personal Property,Real Property';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Use Tax")
        {
            Caption = 'Use Tax';
        }
        modify("Reversed by Entry No.")
        {
            Caption = 'Reversed by Entry No.';
        }
        modify("Reversed Entry No.")
        {
            Caption = 'Reversed Entry No.';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
    }
}

