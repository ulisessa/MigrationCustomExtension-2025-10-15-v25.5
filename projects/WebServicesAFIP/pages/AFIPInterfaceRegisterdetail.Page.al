page 50507 "AFIP Interface Register detail"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "AFIP Interface Register detail";
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
                    Editable = false;
                }
                field("Date and Time"; "Date and Time")
                {
                    Editable = false;
                }
                field(Time; Time)
                {
                    Editable = false;
                }
                field("User ID"; "User ID")
                {
                    Editable = false;
                }
                field("Table No."; "Table No.")
                {
                    Editable = false;
                }
                field("Table Caption"; "Table Caption")
                {
                    Editable = false;
                }
                field("Field No."; "Field No.")
                {
                    Editable = false;
                }
                field("Field Caption"; "Field Caption")
                {
                    Editable = false;
                }
                field("Type of Change"; "Type of Change")
                {
                    Editable = false;
                }
                field("Old Value"; "Old Value")
                {
                    Editable = false;
                }
                field("New Value"; "New Value")
                {
                    Editable = false;
                }
                field(Ommit; Ommit)
                {
                    Editable = true;
                }
                field("Clave registro"; "Clave registro")
                {
                    Editable = false;
                }
                field("Register entry no."; "Register entry no.")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

