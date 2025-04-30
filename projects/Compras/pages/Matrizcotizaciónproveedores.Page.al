page 50020 "Matriz cotización proveedores"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    ShowFilter = false;
    SourceTable = "Lín. solicitud";
    SourceTableView = SORTING("No.")
                      WHERE("No." = FILTER(<> ''),
                            Revertido = CONST(false),
                            Aprobado = CONST(true));

    layout
    {
        area(content)
        {
            group(Control1000000009)
            {
                ShowCaption = false;
                field("Total en Solicitud"; decTotalSol)
                {
                }
                field("Total en OC"; decTotalOC)
                {
                }
                field(Diferencia; decDiferencia)
                {
                    Style = AttentionAccent;
                    StyleExpr = TRUE;
                }
            }
            repeater(Control1000000008)
            {
                ShowCaption = false;
                field(Tipo; Tipo)
                {
                }
                field("No."; "No.")
                {
                }
                field(Descripcion; Descripcion)
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Precio unitario neto"; "Precio unitario neto")
                {
                }
                field("Importe neto"; "Importe neto")
                {
                }
                field("Importe neto en OC"; "Importe neto en OC")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        decDiferencia := 0;
        decTotalOC := 0;
        decTotalSol := 0;

        Clear(rst39);
        rst39.SetRange(rst39."No. Cab. Solicitud", "No. Documento");
        rst39.CalcSums(Amount);
        decTotalOC := rst39.Amount;


        Clear(rstSol);
        rstSol.SetRange("No. Documento", "No. Documento");
        rstSol.CalcSums("Importe neto");
        decTotalSol := rstSol."Importe neto";

        decDiferencia := decTotalSol - decTotalOC;
    end;

    var
        codSolicitud: Code[20];
        rstProveedor: Record Vendor;
        codProveedor: array[15, 2] of Code[50];
        i: Integer;
        iMax: Integer;
        decTotalOC: Decimal;
        decTotalSol: Decimal;
        rst39: Record "Purchase Line";
        rstSol: Record "Lín. solicitud";
        decDiferencia: Decimal;

    [Scope('OnPrem')]
    procedure fntPrecioCosteDL(): Decimal
    begin
    end;

    [Scope('OnPrem')]
    procedure fntSetSolicitud(l_codSolicitud: Code[20])
    begin
    end;

    [Scope('OnPrem')]
    procedure fntActualizar()
    begin
    end;
}

