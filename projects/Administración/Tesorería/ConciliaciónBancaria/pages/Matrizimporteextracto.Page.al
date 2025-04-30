page 50035 "Matriz importe extracto"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = ListPart;
    ShowFilter = false;
    SourceTable = "Transaction Specification";
    SourceTableView = SORTING(Text)
                      WHERE(Diferencia = FILTER(<> 0));

    layout
    {
        area(content)
        {
            repeater(Total)
            {
                Caption = 'Total';
                Editable = true;
                field(Text; Text)
                {
                    Caption = 'Clasificación';
                    Editable = false;
                    QuickEntry = false;
                }
                field(Diferencia; Diferencia)
                {
                    Caption = 'Importe';
                    Editable = false;
                    QuickEntry = false;
                }
                field(Cuenta; Cuenta)
                {

                    trigger OnValidate()
                    begin
                        Modify;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Dimensiones)
            {
                Caption = 'Dimensions';
                Image = Dimensions;
                action(Action1000000005)
                {
                    Caption = 'Dimensions-Single';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(285),
                                  "No." = FIELD(Code);
                    Scope = Page;
                    ShortCutKey = 'Shift+Ctrl+D';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        l_decQ: Decimal;
        l_decP: Decimal;
    begin
        CalcFields(Diferencia);
    end;

    var
        decImporte: Decimal;
        decPV: Decimal;
        strDoc: Code[30];
        decKN: Decimal;
        codCta: Code[10];

    [Scope('OnPrem')]
    procedure UpdateSalesLine()
    var
        l_rstLV: Record "Sales Line";
        cduUsrInv: Codeunit InvoiceTemp;
        dlgDial: Dialog;
        i: Integer;
        decDiferencia: Decimal;
    begin
        /*
        decDiferencia := 0;
        CLEAR(l_rstLV);
        CLEAR(cduUsrInv);
        l_rstLV.SETFILTER("Document Type",'%1|%2',l_rstLV."Document Type"::Invoice,l_rstLV."Document Type"::"Credit Memo");
        l_rstLV.SETFILTER("Document No.",cduUsrInv.fntUsrInv(USERID,''));
        l_rstLV.SETRANGE(Type,l_rstLV.Type::Item);
        l_rstLV.SETRANGE("No.","No.");
        IF l_rstLV.FIND('-') THEN
        BEGIN
        
          dlgDial.OPEN('Actualizando precio:  #1########### de #2###########\'+
                       '                      @3@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
          dlgDial.UPDATE(1,1);
          dlgDial.UPDATE(2,l_rstLV.COUNT);
        
          REPEAT
        
            i+=1;
            dlgDial.UPDATE(1,i);
            dlgDial.UPDATE(3,ROUND(i/l_rstLV.COUNT*10000,1));
            l_rstLV.VALIDATE("Unit Price",decPV*ROUND((l_rstLV."Net kilos"/l_rstLV.Quantity),0.00001));
            decDiferencia += l_rstLV.Amount-(l_rstLV."Net kilos"*decPV);
            l_rstLV.MODIFY;
        
          UNTIL l_rstLV.NEXT = 0;
        
          //l_rstLV.VALIDATE("Unit Price",(l_rstLV.Amount/l_rstLV.Quantity)-decDiferencia);
          l_rstLV.VALIDATE("Unit Price",ROUND((decPV*(l_rstLV."Net kilos")-decDiferencia)/l_rstLV.Quantity,0.00001));
          l_rstLV.MODIFY;
        
        END;
        
        CALCFIELDS("Importe factura","KN línea factura venta","Cantidad línea factura venta");
        decPV := "Importe factura"/"KN línea factura venta";
        IF "KN línea factura venta"  <> 0 THEN
          decImporte := decPV*"KN línea factura venta";
        
        
        dlgDial.CLOSE;
        */

    end;
}

