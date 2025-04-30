page 50068 "Lista flia. rec. por proveedor"
{
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Familia recursos por proveedor";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No. familia recurso"; "No. familia recurso")
                {
                }
                field("Nombre familia recurso"; "Nombre familia recurso")
                {
                }
                field("No. Subfamilia recurso"; "No. Subfamilia recurso")
                {
                }
                field("Nombre Subfamilia recurso"; "Nombre Subfamilia recurso")
                {
                }
                field("No. proveedor"; "No. proveedor")
                {
                }
                field("Nombre proveedor"; "Nombre proveedor")
                {
                }
            }
        }
    }

    actions
    {
    }
}

