page 50634 "Actividades vs impuestos"
{
    PageType = List;
    SourceTable = "Actividades vs impuestos";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. actividad"; Rec."No. actividad")
                {
                }
                field("Nombre actividad"; Rec."Nombre actividad")
                {
                }
                field("Cod. area impuesto"; Rec."Cod. area impuesto")
                {
                }
                field("Nombre area impuesto"; Rec."Nombre area impuesto")
                {
                }
                field(Accion; Rec.Accion)
                {
                }
            }
        }
    }

    actions
    {
    }
}

