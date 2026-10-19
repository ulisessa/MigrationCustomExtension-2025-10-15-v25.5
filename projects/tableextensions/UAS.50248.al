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
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[20])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50005; "Imp. Acumulado"; Decimal)
        {
            Caption = 'Imp. Acumulado';
            ToolTip = 'Specifies the value of the Imp. Acumulado field.';
            Description = 'Para utilizar en drilldown';
            Editable = false;
        }
        field(50006; "Concepto proyecto en compras"; Code[10])
        {
            Caption = 'Concepto proyecto en compras';
            ToolTip = 'Specifies the value of the Concepto proyecto en compras field.';
            TableRelation = "Concepto proyecto";
        }
        field(50008; "Lugar de pago"; Option)
        {
            Caption = 'Lugar de pago';
            ToolTip = 'Specifies the value of the Lugar de pago field.';
            OptionMembers = " ",BUE,CRV,PD,MDQ;
        }
        field(50009; "Permiso de embarque"; Code[30])
        {
            Caption = 'Boarding permission';
            ToolTip = 'Specifies the value of the Boarding permission field.';
        }
        field(50010; "Carpeta importación"; Code[20])
        {
            Caption = 'Carpeta importación';
            ToolTip = 'Specifies the value of the Carpeta importación field.';
        }
        field(50012; "Descripción 2"; Text[250])
        {
            Caption = 'Description 2';
            ToolTip = 'Specifies the value of the Description 2 field.';
        }
        field(50013; "Concepto general"; Text[50])
        {
            Caption = 'Concepto general';
            ToolTip = 'Specifies the value of the Concepto general field.';
        }
        field(50017; "No. liquidación"; Code[20])
        {
            Caption = 'No. liquidación';
            ToolTip = 'Specifies the value of the No. liquidación field.';
        }
        field(50018; "No. documento preasignado"; Code[20])
        {
            Caption = 'No. documento preasignado';
            ToolTip = 'Specifies the value of the No. documento preasignado field.';
        }

        field(50500; "Saldo a la fecha (DL)"; Decimal)
        {
            Caption = 'Saldo a la fecha (DL)';
            ToolTip = 'Specifies the value of the Saldo a la fecha (DL) field.';

            trigger OnValidate()
            begin
                Clear(rstCuenta);
            end;
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            Caption = 'Nombre libro diario';
            ToolTip = 'Specifies the value of the Nombre libro diario field.';
        }
        field(50506; "No. documento relacionado"; Code[20])
        {
            Caption = 'No. documento relacionado';
            ToolTip = 'Specifies the value of the No. documento relacionado field.';
        }
        field(50507; "No. línea doc. relacionado"; Integer)
        {
            Caption = 'No. línea doc. relacionado';
            ToolTip = 'Specifies the value of the No. línea doc. relacionado field.';
        }
        field(50597; "Fecha anulación"; Date)
        {
            Caption = 'Fecha anulación';
            ToolTip = 'Specifies the value of the Fecha anulación field.';
        }
        field(50598; "Usuario anulación"; Code[20])
        {
            Caption = 'Usuario anulación';
            ToolTip = 'Specifies the value of the Usuario anulación field.';
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';
        }
        field(50700; "No. cheque"; Code[10])
        {
            Caption = 'No. cheque';
            ToolTip = 'Specifies the value of the No. cheque field.';

            trigger OnValidate()
            begin
                //ArgV01-1 Permitimos modificar el No. de cheque una vez registrado el movimiento

                Modify;

                //Fin ArgV01-1 }
            end;
        }
        field(50701; "Retención"; Boolean)
        {
            Caption = 'Retención';
            ToolTip = 'Specifies the value of the Retención field.';
        }
        field(50800; "Balance Texto"; Text[20])
        {
            Caption = 'Balance Texto';
            ToolTip = 'Specifies the value of the Balance Texto field.';
        }
        field(51000; Expediente; Text[30])
        {
            Caption = 'Expediente';
            ToolTip = 'Specifies the value of the Expediente field.';
            Description = 'CON';
        }
        field(51001; "Fecha valor"; Date)
        {
            Caption = 'Check Date';
            ToolTip = 'Specifies the value of the Check Date field.';
            Description = 'CON';
        }
        field(51002; "Id. conciliación"; Integer)
        {
            Caption = 'Id. conciliación';
            ToolTip = 'Specifies the value of the Id. conciliación field.';
            Description = 'CON';
        }
        field(51003; Conciliado; Boolean)
        {
            Caption = 'Conciliado';
            ToolTip = 'Specifies the value of the Conciliado field.';
            Description = 'CON';
        }
        field(51004; Zona; Code[1])
        {
            Caption = 'Zona';
            ToolTip = 'Specifies the value of the Zona field.';
            Description = 'CON';
        }
        field(51005; "Aplicación Origen"; Code[15])
        {
            Caption = 'Aplicación Origen';
            ToolTip = 'Specifies the value of the Aplicación Origen field.';
            Description = 'CON';
        }
        field(66000; "No. mov. origen"; Integer)
        {
            Caption = 'No. mov. origen';
            ToolTip = 'Specifies the value of the No. mov. origen field.';
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

