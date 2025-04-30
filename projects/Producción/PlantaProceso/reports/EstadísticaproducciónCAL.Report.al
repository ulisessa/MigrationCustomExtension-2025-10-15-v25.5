report 50029 "Estadística producción CAL"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/EstadísticaproducciónCAL.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = SORTING("Nombre libro diario", "Lote origen", "Posting Date") WHERE("Nombre libro diario" = CONST('PLANTA PRO'), "Global Dimension 2 Code" = CONST('CAL'), Revertido = CONST(false));
            RequestFilterFields = "Posting Date";
            column(Logo; rstInfoEmpre."Logo path")
            {
            }
            column(strNombre; strNombre)
            {
            }
            column(GlobalDimension1Code_ItemLedgerEntry; "Item Ledger Entry"."Global Dimension 1 Code")
            {
            }
            column(Globaldimension3Code_ItemLedgerEntry; "Item Ledger Entry"."Global dimension 3 Code")
            {
            }
            column(CALEntradaMP_ProduccionPlanta; decMPKN)
            {
            }
            column(codSubflia; codSubflia)
            {
            }
            column(PostingDate_ItemLedgerEntry; "Item Ledger Entry"."Posting Date")
            {
            }
            column(EntryType_ItemLedgerEntry; strTipoRegistro)
            {
            }
            column(ItemNo_ItemLedgerEntry; "Item Ledger Entry"."Item No.")
            {
            }
            column(Quantity_ItemLedgerEntry; "Item Ledger Entry".Quantity)
            {
            }
            column(Family_ItemLedgerEntry; rstFam.Description)
            {
            }
            column(Subfamily_ItemLedgerEntry; rstSubFam.Description)
            {
            }
            column(Loteorigen_ItemLedgerEntry; "Item Ledger Entry"."Lote origen")
            {
            }
            column(Grosskilos_ItemLedgerEntry; "Item Ledger Entry"."Gross kilos")
            {
            }
            column(Netkilos_ItemLedgerEntry; "Item Ledger Entry"."Net kilos")
            {
            }
            column(TercerosoPropios; strTercerosPropios)
            {
            }

            trigger OnAfterGetRecord()
            var
                rst27: Record Item;
            begin
                Clear(rstGLSetup);
                rstGLSetup.Get();
                Clear(rstDV);
                rstDV.SetRange("Dimension Code", rstGLSetup."Global Dimension 1 Code");
                rstDV.SetRange(Code, "Item Ledger Entry"."Global Dimension 1 Code");
                if rstDV.FindFirst then;

                if "Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::"Positive Adjmt." then
                    strTipoRegistro := 'Entrada';
                if "Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::"Negative Adjmt." then
                    strTipoRegistro := 'Salida';

                Clear(rstFam);
                rstFam.Get(CopyStr("Item Ledger Entry".Family, 1, 2));

                if StrPos("Item Ledger Entry".Family, '3') <> 0 then
                    strTercerosPropios := 'Tercero'
                else
                    strTercerosPropios := 'Propio';

                Clear(rstSubFam);
                rstSubFam.Get(rstFam.Code, "Item Ledger Entry".Subfamily);

                strNombre := '';

                strNombre := "Item Ledger Entry"."Entry/Exit Point" + ' - ' +
                 rstDV.Name + ' - ' + CopyStr("Global dimension 3 Code", 4, 3);

                codSubflia := '';

                Clear(rstLP);
                rstLP.SetRange("Document No.", "Document No.");
                rstLP.SetRange(rstLP."Entry Type", rstLP."Entry Type"::"Negative Adjmt.");
                if rstLP.FindFirst then
                    codSubflia := rstLP.Subfamily;

                decMPKN := 0;
                Clear(rst32);
                rst32.SetCurrentKey("Document No.", "Posting Date", "Entry Type");
                rst32.SetRange("Document No.", "Document No.");
                rst32.SetRange("Posting Date", "Posting Date");
                //rst32.SETRANGE("Entry Type",rst32."Entry Type"::"Negative Adjmt.");
                if rst32.FindSet then
                    repeat

                        Clear(rst27);
                        rst27.Get(rst32."Item No.");
                        if CopyStr(rst32.Family, 1, 2) = 'MP' then
                            decMPKN -= rst32."Net kilos";

                    until rst32.Next = 0;
            end;

            trigger OnPreDataItem()
            var
                TempFile: File;
            begin
                Clear(rstInfoEmpre);
                rstInfoEmpre.Get;
                if blnEmitir then begin

                    TempFile.CreateTempFile;
                    FileName := TempFile.Name + '.xls';
                    TempFile.Close;
                    Upload(Text001, '', Text002, '', FileName);

                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field("Filtro fecha"; strDateFilter)
                {
                    Visible = false;
                }
                field("Emitir estadísticas"; blnEmitir)
                {
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }


    var
        strNombre: Text[250];
        codSubflia: Code[10];
        rstGLSetup: Record "General Ledger Setup";
        rstDV: Record "Dimension Value";
        rstLP: Record "Item Ledger Entry";
        strDateFilter: Text;
        decMPKN: Decimal;
        decMPKB: Decimal;
        rst32: Record "Item Ledger Entry";
        rstInfoEmpre: Record "Company Information";
        blnEmitir: Boolean;
        decSldo: Decimal;
        codEmp: Code[10];
        FileName: Text[250];
        Text001: Label 'Import from XML File';
        Text002: Label 'XML Files (*.xml)|*.xml|All Files (*.*)|*.*';
        rstFam: Record "Familia producto";
        rstSubFam: Record "Subfamilia producto";
        strTipoRegistro: Text;
        strTercerosPropios: Text;

}

