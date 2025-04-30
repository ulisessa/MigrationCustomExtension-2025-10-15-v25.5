page 60007 "Lista Personal Embarcado"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Personal embarcado";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Id. Sociedad"; "Id. Sociedad")
                {
                }
                field("Id. Empleado"; "Id. Empleado")
                {
                }
                field(Proyecto; Proyecto)
                {
                }
                field("Id. Empresa"; "Id. Empresa")
                {
                }
                field("Id. categoría"; "Id. categoría")
                {
                }
                field("Nombre categoría"; "Nombre categoría")
                {
                }
                field("Id. puesto"; "Id. puesto")
                {
                }
                field("Nombre puesto"; "Nombre puesto")
                {
                }
                field("Id. nacionalidad"; "Id. nacionalidad")
                {
                }
                field(Importe; Importe)
                {
                }
                field("Fecha de importación"; "Fecha de importación")
                {
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field(Costo; Costo)
                {
                }
            }
        }
    }

    actions
    {
    }
}

