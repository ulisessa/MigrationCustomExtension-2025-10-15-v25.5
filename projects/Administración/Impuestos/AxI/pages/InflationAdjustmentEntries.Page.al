page 50053 "Inflation Adjustment Entries"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Inflation Adjustment Entry";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; "Entry No.")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("User ID"; "User ID")
                {
                }
                field("Document No."; "Document No.")
                {
                }
                field("Account No."; "Account No.")
                {
                }
                field("Adjustment Origin Account No."; "Adjustment Origin Account No.")
                {
                }
                field("Adjustment Dest. Account No."; "Adjustment Dest. Account No.")
                {
                }
                field(Amount; Amount)
                {
                }
                field("Job No."; "Job No.")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                }
                field("Shortcut Dimension 6 Code"; "Shortcut Dimension 6 Code")
                {
                }
                field("Shortcut Dimension 7 Code"; "Shortcut Dimension 7 Code")
                {
                }
                field("Dimension Set ID"; "Dimension Set ID")
                {
                }
                field("Starting Inflation Index"; "Starting Inflation Index")
                {
                }
                field("Ending Inflation Index"; "Ending Inflation Index")
                {
                }
                field("Inflation Amount"; "Inflation Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

