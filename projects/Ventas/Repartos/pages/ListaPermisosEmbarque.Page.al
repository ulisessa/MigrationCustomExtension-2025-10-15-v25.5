page 50536 "Lista Permisos Embarque"
{
    // IBdos Argentina - USS - 250203 - Adición Arbumasa

    Editable = false;
    PageType = List;
    SourceTable = "Permisos Embarque";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Permiso embarque"; "Permiso embarque")
                {
                }
            }
        }
    }

    actions
    {
    }
}

