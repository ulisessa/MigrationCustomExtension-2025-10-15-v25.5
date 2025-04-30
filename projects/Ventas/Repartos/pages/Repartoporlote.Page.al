page 50067 "Reparto por lote"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = ListPart;
    ShowFilter = false;
    SourceTable = Job;
    SourceTableView = WHERE("Cantidad línea reparto venta" = FILTER(<> 0));

    layout
    {
        area(content)
        {
            repeater(Total)
            {
                Caption = 'Total';
                Editable = true;
                field(Buque; "Global Dimension 1 Code")
                {
                    Caption = 'Buque';
                    Editable = false;
                    QuickEntry = false;
                }
                field(Marea; "Global Dimension 3 Code")
                {
                    Caption = 'Marea';
                }
                field(Cantidad; "Cantidad línea reparto venta")
                {
                    Caption = 'Cantidad';
                    Editable = false;
                    QuickEntry = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    var
        l_decQ: Decimal;
        l_decP: Decimal;
    begin
        CalcFields("Cantidad línea reparto venta");
    end;

    var
        decImporte: Decimal;
        decPV: Decimal;
        strDoc: Code[30];
        decKN: Decimal;
}

