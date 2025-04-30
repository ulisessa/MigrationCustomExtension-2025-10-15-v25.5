page 50063 "Reparto por producto"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = ListPart;
    ShowFilter = false;
    SourceTable = Item;
    SourceTableView = WHERE(Blocked = CONST(false),
                            "Cantidad línea reparto venta" = FILTER(<> 0),
                            "Item Category Code" = CONST('PESCA'));

    layout
    {
        area(content)
        {
            repeater(Total)
            {
                Caption = 'Total';
                Editable = true;
                field(Description; Description)
                {
                    Caption = 'Clasificación';
                    Editable = false;
                    QuickEntry = false;
                }
                field("Cantidad línea reparto venta"; "Cantidad línea reparto venta")
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

    [Scope('OnPrem')]
    procedure UpdateSalesLine()
    var
        l_rstLV: Record "Sales Line";
        cduUsrInv: Codeunit InvoiceTemp;
        dlgDial: Dialog;
        i: Integer;
        decDiferencia: Decimal;
    begin
        decDiferencia := 0;
        Clear(l_rstLV);
        Clear(cduUsrInv);
        l_rstLV.SetFilter("Document Type", '%1|%2', l_rstLV."Document Type"::Invoice, l_rstLV."Document Type"::"Credit Memo");
        l_rstLV.SetFilter("Document No.", cduUsrInv.fntUsrInv(UserId, ''));
        l_rstLV.SetRange(Type, l_rstLV.Type::Item);
        l_rstLV.SetRange("No.", "No.");
        if l_rstLV.Find('-') then begin

            dlgDial.Open('Actualizando precio:  #1########### de #2###########\' +
                         '                      @3@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
            dlgDial.Update(1, 1);
            dlgDial.Update(2, l_rstLV.Count);

            repeat

                i += 1;
                dlgDial.Update(1, i);
                dlgDial.Update(3, Round(i / l_rstLV.Count * 10000, 1));
                l_rstLV.Validate("Unit Price", decPV * Round((l_rstLV."Net kilos" / l_rstLV.Quantity), 0.00001));
                decDiferencia += l_rstLV.Amount - (l_rstLV."Net kilos" * decPV);
                l_rstLV.Modify;

            until l_rstLV.Next = 0;

            //l_rstLV.VALIDATE("Unit Price",(l_rstLV.Amount/l_rstLV.Quantity)-decDiferencia);
            l_rstLV.Validate("Unit Price", Round((decPV * (l_rstLV."Net kilos") - decDiferencia) / l_rstLV.Quantity, 0.00001));
            l_rstLV.Modify;

        end;

        CalcFields("Importe factura", "KN línea factura venta", "Cantidad línea factura venta");
        decPV := "Importe factura" / "KN línea factura venta";
        if "KN línea factura venta" <> 0 then
            decImporte := decPV * "KN línea factura venta";


        dlgDial.Close;
    end;
}

