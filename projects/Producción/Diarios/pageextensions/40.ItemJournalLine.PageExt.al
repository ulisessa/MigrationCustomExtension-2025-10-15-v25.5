pageextension 40 "Item Journal Line with weight" extends "Item Journal"
{
    layout
    {
        addafter(Quantity)
        {

            field("Net kilos"; Rec."Net kilos")
            {
                CaptionML = ENU = 'Net kilos', ESP = 'Kilos netos';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Net kilos field.', Comment = '%';
            }
            field("Gross kilos"; Rec."Gross kilos")
            {
                CaptionML = ENU = 'Gross kilos', ESP = 'Kilos brutos';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Gross kilos field.', Comment = '%';
            }
        }
    }

    actions
    {
        addafter("&Line")
        {
            group(WorkWithILE)
            {
                CaptionML = ENU = 'ILE management', ESP = 'Gestión movimientos';
                Visible = true;
                action("Traer siguiente pallet")
                {
                    Image = NextSet;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        cduFishing: Codeunit Descargas;
                        rstPP: Record "Produccion Planta";
                    begin
                        Validate("No. Pallet", cduFishing.fntCreatePalletNo("Shortcut Dimension 1 Code", "Posting Date", "No. Pallet", "Item No.", "Location Code"));
                    end;
                }
                action(Digitalizar)
                {
                    Image = Attach;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        frmDigitalizar: Page "Ruta digitalización";
                        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
                        cduDigitalizarOAbrir: Codeunit Escaneado;
                    begin

                        Clear(frmDigitalizar);
                        Clear(rstDigitalizar);
                        //frmDigitalizar.funLlamarCapturador('','',0,"Nº Proyecto");
                        /*
                        rstDigitalizar.SETFILTER(Documento,'%1|%2|%3|%4|%5|%6|%7|%8|%9|%10|%11|%12','Remito.I','Sanitario','Guia.T','RemitoCl','Guia.Cl','Remito.T',
                                                            'Egresos','Ingresos','Transferencias','Acta.Descarga','Parte.Maritimo','Parte.Pesca.Final');
                        */
                        rstDigitalizar.SetRange("Tipo documento", rstDigitalizar."Tipo documento"::" ");
                        if "Shortcut Dimension 4 Code" <> '' then
                            rstDigitalizar.SetRange(rstDigitalizar.Departamento, "Shortcut Dimension 4 Code");
                        frmDigitalizar.LookupMode(true);
                        frmDigitalizar.SetTableView(rstDigitalizar);
                        if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                            frmDigitalizar.GetRecord(rstDigitalizar);
                            cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                            Format(Today), rstDigitalizar.Departamento, "No. Proyecto", UserId, "Document No.", '', '', '', '', '',
                            rstDigitalizar, false, false, true, '', false, false);

                        end;

                    end;
                }
                action("Traer movimientos")
                {
                    Image = ApplyEntries;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        cduGetEntries: Codeunit "Item Jnl.-Apply";
                    begin
                        Clear(cduGetEntries);
                        cduGetEntries.SetJournal("Journal Template Name", "Journal Batch Name", "Document No.", "Item No.", "Entry Type", "Location Code", "New Location Code", "Posting Date");
                        cduGetEntries.Run(Rec);
                    end;
                }
            }
        }
        // Add changes to page actions here
        addfirst(Category_Category13)
        {
            actionref(TraerSigPalletProm; "Traer siguiente pallet")
            {

            }
            actionref(TraerMovimientosProm; "Traer movimientos")
            {

            }
            actionref(DigitalizarProm; Digitalizar)
            {

            }
        }
        modify(Category_Category13)
        {
            CaptionML = ENU = 'ILE management', ESP = 'Gestión movimientos';
        }
    }

}