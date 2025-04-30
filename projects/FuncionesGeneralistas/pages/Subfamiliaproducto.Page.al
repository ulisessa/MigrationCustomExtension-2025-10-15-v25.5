page 60032 "Subfamilia producto"
{
    DataCaptionFields = "Family code", "Code";
    Editable = true;
    PageType = List;
    SourceTable = "Subfamilia producto";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Family code"; "Family code")
                {
                    Visible = false;
                }
                field("Code"; Code)
                {
                }
                field(Description; Description)
                {
                }
                field("Descripción mínima"; "Descripción mínima")
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Kilos netos"; "Kilos netos")
                {
                }
                field("Kilos brutos"; "Kilos brutos")
                {
                }
                field(ID_Rubro_SENASA; ID_Rubro_SENASA)
                {
                }
                field(ID_Producto_SENASA; ID_Producto_SENASA)
                {
                }
            }
        }
    }

    actions
    {
    }
}

