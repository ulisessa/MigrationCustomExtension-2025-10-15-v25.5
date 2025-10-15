tableextension 50248 "G/L Entry Ext." extends "G/L Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("G/L Account No.")
        {
            Caption = 'G/L Account No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Business Unit Code")
        {
            Caption = 'Business Unit Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Use Tax")
        {
            Caption = 'Use Tax';
        }
        modify("Close Income Statement Dim. ID")
        {
            Caption = 'Close Income Statement Dim. ID';
        }
        modify("IC Partner Code")
        {
            Caption = 'IC Partner Code';
        }
        modify("Reversed by Entry No.")
        {
            Caption = 'Reversed by Entry No.';
        }
        modify("Reversed Entry No.")
        {
            Caption = 'Reversed Entry No.';
        }
        modify("Prod. Order No.")
        {
            Caption = 'Prod. Order No.';
        }
        modify("FA Entry No.")
        {
            Caption = 'FA Entry No.';
        }
        modify("Last Modified DateTime")
        {
            Caption = 'Last Modified DateTime';
        }
        modify("Period Trans. No.")
        {
            Caption = 'Period Trans. No.';
        }
        modify("Bill No.")
        {
            Caption = 'Bill No.';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';

        }
        field(50005; "Imp. Acumulado"; Decimal)
        {
            Description = 'Para utilizar en drilldown';
            Editable = false;
        }
        field(50006; "Concepto proyecto en compras"; Code[10])
        {
            Caption = 'Concepto proyecto en compras';
            TableRelation = "Concepto proyecto";
        }
        field(50008; "Lugar de pago"; Option)
        {
            OptionMembers = " ",BUE,CRV,PD,MDQ;
        }
        field(50009; "Permiso de embarque"; Code[30])
        {
        }
        field(50010; "Carpeta importación"; Code[20])
        {
        }
        field(50012; "Descripción 2"; Text[250])
        {
        }
        field(50013; "Concepto general"; Text[50])
        {
        }
        field(50017; "No. liquidación"; Code[20])
        {
        }
        field(50018; "No. documento preasignado"; Code[20])
        {
        }

        field(50500; "Saldo a la fecha (DL)"; Decimal)
        {

            trigger OnValidate()
            begin
                Clear(rstCuenta);
            end;
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
        }
        field(50506; "No. documento relacionado"; Code[20])
        {
        }
        field(50507; "No. línea doc. relacionado"; Integer)
        {
        }
        field(50597; "Fecha anulación"; Date)
        {
        }
        field(50598; "Usuario anulación"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {
        }
        field(50700; "No. cheque"; Code[10])
        {

            trigger OnValidate()
            begin
                //ArgV01-1 Permitimos modificar el No. de cheque una vez registrado el movimiento

                Modify;

                //Fin ArgV01-1 }
            end;
        }
        field(50701; "Retención"; Boolean)
        {
        }
        field(50800; "Balance Texto"; Text[20])
        {
        }
        field(51000; Expediente; Text[30])
        {
            Description = 'CON';
        }
        field(51001; "Fecha valor"; Date)
        {
            Description = 'CON';
        }
        field(51002; "Id. conciliación"; Integer)
        {
            Description = 'CON';
        }
        field(51003; Conciliado; Boolean)
        {
            Description = 'CON';
        }
        field(51004; Zona; Code[1])
        {
            Description = 'CON';
        }
        field(51005; "Aplicación Origen"; Code[15])
        {
            Description = 'CON';
        }
        field(66000; "No. mov. origen"; Integer)
        {
        }
    }


    //Unsupported feature: Code Modification on "CopyFromGenJnlLine(PROCEDURE 4)".

    //procedure CopyFromGenJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Posting Date" := GenJnlLine."Posting Date";
    "Document Date" := GenJnlLine."Document Date";
    "Document Type" := GenJnlLine."Document Type";
    #4..6
    "Business Unit Code" := GenJnlLine."Business Unit Code";
    "Global Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
    "Global Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";
    "Dimension Set ID" := GenJnlLine."Dimension Set ID";
    "Source Code" := GenJnlLine."Source Code";
    if GenJnlLine."Account Type" = GenJnlLine."Account Type"::"G/L Account" then begin
    #13..36
    "Bill No." := GenJnlLine."Bill No.";

    OnAfterCopyGLEntryFromGenJnlLine(Rec,GenJnlLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    //++Arbu
    "Global Dimension 3 Code" := GenJnlLine."Shortcut Dimension 3 Code";
    "Global Dimension 4 Code" := GenJnlLine."Shortcut Dimension 4 Code";
    "Global Dimension 5 Code" := GenJnlLine."Shortcut Dimension 5 Code";
    "Global Dimension 6 Code" := GenJnlLine."Shortcut Dimension 6 Code";
    "Global Dimension 7 Code" := GenJnlLine."Shortcut Dimension 7 Code";
    //--Arbu
    #10..39
    */
    //end;

    var
        rstCuenta: Record "G/L Account";
}

