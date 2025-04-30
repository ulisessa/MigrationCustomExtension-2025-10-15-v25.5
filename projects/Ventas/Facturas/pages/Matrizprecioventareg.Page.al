page 50056 "Matriz precio venta reg."
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    ShowFilter = false;
    SourceTable = Item;
    SourceTableView = WHERE(Blocked = CONST(false),
                            "Tipo producto" = CONST(Pesca),
                            "Cantidad línea fac. venta reg." = FILTER(<> 0));
    ApplicationArea = All;
    UsageCategory = Administration;

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
                field("Cantidad línea fac. venta reg."; "Cantidad línea fac. venta reg.")
                {
                    Caption = 'Cantidad';
                    Editable = false;
                    QuickEntry = false;
                }
                field("KN línea factura venta reg."; "KN línea factura venta reg.")
                {
                }
                field(decPV; decPV)
                {
                    Caption = 'Precio venta KN';
                    Editable = true;

                    trigger OnValidate()
                    begin
                        decImporte := decPV * "KN línea factura venta reg.";
                        UpdateSalesLine;
                        CurrPage.Update(false);
                    end;
                }
                field(decImporte; decImporte)
                {
                    Caption = 'Importe';
                    QuickEntry = false;

                    trigger OnValidate()
                    begin
                        if decPV = 0 then begin

                            if "KN línea factura venta reg." <> 0 then
                                decPV := decImporte / "KN línea factura venta reg.";

                        end;

                        UpdateSalesLine;
                        CurrPage.Update(false);
                    end;
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
        CalcFields("Importe factura reg.", "KN línea factura venta reg.", "Cantidad línea fac. venta reg.");
        if "KN línea factura venta reg." <> 0 then
            decPV := "Importe factura reg." / "KN línea factura venta reg.";
        if "KN línea factura venta reg." <> 0 then
            decImporte := decPV * "KN línea factura venta reg.";
    end;

    var
        decImporte: Decimal;
        decPV: Decimal;
        strDoc: Code[30];
        decKN: Decimal;

    [Scope('OnPrem')]
    procedure UpdateSalesLine()
    var
        l_rstLV: Record "Sales Invoice Line";
        l_rstLC: Record "Sales Cr.Memo Line";
        cduUsrInv: Codeunit InvoiceTemp;
        dlgDial: Dialog;
        i: Integer;
        decDiferencia: Decimal;
    begin
        decDiferencia := 0;
        Clear(l_rstLV);
        Clear(cduUsrInv);
        //l_rstLV.SETFILTER("Document Type",'%1|%2',l_rstLV."Document Type"::Invoice,l_rstLV."Document Type"::"Credit Memo");
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
                if l_rstLV.Quantity <> 0 then
                    l_rstLV.Validate("Unit Price", decPV * Round((l_rstLV."Net kilos" / l_rstLV.Quantity), 0.00001));
                decDiferencia += l_rstLV.Amount - (l_rstLV."Net kilos" * decPV);
                l_rstLV.Modify;

            until l_rstLV.Next = 0;

            if l_rstLV.Quantity <> 0 then
                l_rstLV.Validate("Unit Price", (l_rstLV.Amount / l_rstLV.Quantity) - decDiferencia);
            l_rstLV.Modify;

            dlgDial.Close;

        end;

        CalcFields("Importe factura reg.", "KN línea factura venta reg.", "Cantidad línea fac. venta reg.");
        if "KN línea factura venta reg." <> 0 then
            decPV := "Importe factura reg." / "KN línea factura venta reg.";
        if "KN línea factura venta reg." <> 0 then
            decImporte := decPV * "KN línea factura venta reg.";
    end;
}

