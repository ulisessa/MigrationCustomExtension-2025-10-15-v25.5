page 50520 "Lista Solicitudes"
{
    CardPageID = Solicitud;
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = Solicitud;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Ver)
            {
                Caption = 'Ver';
                field("No. documento"; Rec."No. documento")
                {
                }
                field("Tipo documento"; Rec."Tipo documento")
                {
                }
                field("Descripción"; Rec.Descripción)
                {
                }
                field(Aprobado; Rec.Aprobado)
                {
                }
                field(Estado; Rec.Estado)
                {
                }
                field("Fecha registro"; Rec."Fecha registro")
                {
                }
                field(Usuario; Rec.Usuario)
                {
                }
                field("Importe Solicitud"; Rec."Importe Solicitud")
                {
                }
                field("Importe OC"; Rec."Importe OC")
                {
                }
                field("Importe FC"; Rec."Importe FC")
                {
                }
                field("Importe NC"; Rec."Importe NC")
                {
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                }
                field("Global Dimension 3"; Rec."Global Dimension 3")
                {
                }
                field("Global Dimension 4"; Rec."Global Dimension 4")
                {
                }
                field("Global Dimension 5"; Rec."Global Dimension 5")
                {
                }
                field("Global Dimension 6"; Rec."Global Dimension 6")
                {
                }
                field("Global Dimension 7"; Rec."Global Dimension 7")
                {
                }
                field("No. Serie"; Rec."No. Serie")
                {
                }
                field("Fecha Entrega"; Rec."Fecha Entrega")
                {
                }
                field(Importancia; Rec.Importancia)
                {
                }
                field(Procedencia; Rec.Procedencia)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Menu")
            {
                Caption = '&Menu';
                action("&Ficha")
                {
                    Caption = '&Ficha';
                    RunObject = Page Solicitud;
                    RunPageLink = "Nombre Libro Solicitud" = FIELD ("Nombre Libro Solicitud"),
                                  "Tipo documento" = FIELD ("Tipo documento"),
                                  "No. documento" = FIELD ("No. documento");
                    RunPageView = SORTING ("Nombre Libro Solicitud", "No. documento");
                    ShortCutKey = 'Shift+F5';
                }
            }
        }
    }

    var
        Cabsol: Record Solicitud;
        blnFiltrarEstados: Boolean;
}

