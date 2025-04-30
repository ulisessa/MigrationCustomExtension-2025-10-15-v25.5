page 50630 "Lista campos"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Field";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(TableName; TableName)
                {
                }
                field(FieldName; FieldName)
                {
                }
                field(Type; Type)
                {
                }
                field(Len; Len)
                {
                }
                field(Class; Class)
                {
                }
                field(Enabled; Enabled)
                {
                }
                field("Type Name"; "Type Name")
                {
                }
                field("Field Caption"; "Field Caption")
                {
                }
                field(RelationTableNo; RelationTableNo)
                {
                }
                field(RelationFieldNo; RelationFieldNo)
                {
                }
                field(SQLDataType; SQLDataType)
                {
                }
            }
        }
    }

    actions
    {
    }
}

