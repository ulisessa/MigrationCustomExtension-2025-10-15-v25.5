report 50022 "Vale de consumo"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Existencias.ValesConsumo/reports/Valedeconsumo.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = SORTING ("Job No.", "Document No.", "Location Code") WHERE ("Entry Type" = CONST ("Negative Adjmt."), "Document Type" = FILTER (" "), "Source Type" = FILTER (" "), "Document No." = FILTER ('VC*'));
            RequestFilterFields = "Job No.", "Posting Date", "Document No.";
            column(JobNo_ItemLedgerEntry; "Item Ledger Entry"."Job No.")
            {
            }
            column(PostingDate_ItemLedgerEntry; "Item Ledger Entry"."Posting Date")
            {
            }
            column(Description_ItemLedgerEntry; "Item Ledger Entry".Description)
            {
            }
            column(DocumentNo_ItemLedgerEntry; "Item Ledger Entry"."Document No.")
            {
            }
            column(LocationCode_ItemLedgerEntry; "Item Ledger Entry"."Location Code")
            {
            }
            column(ItemNo_ItemLedgerEntry; "Item Ledger Entry"."Item No.")
            {
            }
            column(Quantity_ItemLedgerEntry; "Item Ledger Entry".Quantity)
            {
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Primero: Boolean;
        empres: Record "Company Information";
        Valor: Decimal;
        MovProd: Record "Item Ledger Entry";
        Vale_de_consumoCaptionLbl: Label 'Vale de consumo';
        Impreso_CaptionLbl: Label 'Impreso:';
        Usuario_CaptionLbl: Label 'Usuario:';
        "Página_CaptionLbl": Label 'Página:';
        N__CaptionLbl: Label 'Nº:';
        Fecha_registroCaptionLbl: Label 'Fecha registro';
        Fecha_registroCaption_Control6Lbl: Label 'Fecha registro';
        Costo_Total__CaptionLbl: Label 'Costo Total $';
}

