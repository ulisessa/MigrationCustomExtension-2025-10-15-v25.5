page 50700 "Exportar actualizaciones"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(strArchivo; strArchivo)
                {
                    Caption = 'Archivo a exportar';

                    trigger OnDrillDown()
                    begin
                        Clear(cduSelecArchivo);
                        //++Arbu 2020strArchivo := cduSelecArchivo.OpenFile('Seleccione el archivo a importar','',4,'*.txt',0);
                        CurrPage.Update;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Exportar")
            {
                Caption = '&Exportar';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    strNombre := strArchivo;
                    if strNombre <> '' then begin

                        if StrPos(strNombre, '\') <> 0 then
                            repeat

                                strNombre := CopyStr(strNombre, (StrPos(strNombre, '\')) + 1, 1024);

                            until StrPos(strNombre, '\') = 0;

                    end;

                    strNiveles := strNombre;
                    strNombre := CopyStr(strNombre, 1, StrPos(strNombre, '-') - 1);

                    if strNiveles <> '' then begin

                        strNombre := CopyStr(strNiveles, 1, (StrPos(strNiveles, '-') - 1));
                        strNiveles := CopyStr(strNiveles, (StrPos(strNiveles, '-')) + 1, 1024);
                        codBuque := CopyStr(strNiveles, 1, (StrPos(strNiveles, '-') - 1));
                        strNiveles := CopyStr(strNiveles, (StrPos(strNiveles, '-')) + 1, 1024);
                        codMarea := CopyStr(strNiveles, 1, (StrPos(strNiveles, '-') - 1));

                    end;
                    /*
              CLEAR(dptPedido);
              dptPedido.fntTipoPedido(strNombre,codBuque,codMarea,'');
              dptPedido.IMPORT(FALSE);
              dptPedido.FILENAME := strArchivo;
              dptPedido.RUN;
                     */

                end;
            }
        }
    }

    var
        strArchivo: Text[1024];
        cduSelecArchivo: Codeunit Mail;
        strNombre: Text[1024];
        strNiveles: Text[1024];
        rstTDoc: Record "Tipos documento";
        codBuque: Code[10];
        codMarea: Code[10];
}

