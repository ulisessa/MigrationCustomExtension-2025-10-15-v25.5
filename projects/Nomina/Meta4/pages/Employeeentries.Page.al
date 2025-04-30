page 50080 "Employee entries"
{
    Caption = 'Movimientos de emplado';
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Employee entry";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry no."; "Entry no.")
                {
                }
                field("Company no."; "Company no.")
                {
                }
                field("File no."; "File no.")
                {
                }
                field("Hiring date"; "Hiring date")
                {
                }
                field("Event code"; "Event code")
                {
                }
                field("Start date and time"; "Start date and time")
                {
                }
                field("Finish date and time"; "Finish date and time")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Import date"; "Import date")
                {
                }
                field("User ID"; "User ID")
                {
                }
                field(Records; Records)
                {
                }
                field(Name; Name)
                {
                }
                field("Application date"; "Application date")
                {
                }
                field("Workday code"; "Workday code")
                {
                }
                field("% time"; "% time")
                {
                }
                field(Exported; Exported)
                {
                }
                field("News code"; "News code")
                {
                }
                field("Quantity to distribute"; "Quantity to distribute")
                {
                }
                field("Start record"; "Start record")
                {
                }
                field("Finish record"; "Finish record")
                {
                }
                field("Applied quantity"; "Applied quantity")
                {
                }
                field(Difference; Difference)
                {
                }
            }
        }
    }

    actions
    {
    }
}

