tableextension 50385 tableextension50385 extends "Bank Account Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Our Contact Code")
        {
            Caption = 'Our Contact Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Closed by Entry No.")
        {
            Caption = 'Closed by Entry No.';
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
        modify("Statement Status")
        {
            Caption = 'Statement Status';
        }
        modify("Statement No.")
        {
            Caption = 'Statement No.';

            //Unsupported feature: Property Insertion (ValidateTableRelation) on ""Statement No."(Field 56)".

        }
        modify("Statement Line No.")
        {
            Caption = 'Statement Line No.';

            //Unsupported feature: Property Insertion (ValidateTableRelation) on ""Statement Line No."(Field 57)".

        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Reversed by Entry No.")
        {
            Caption = 'Reversed by Entry No.';
        }
        modify("Reversed Entry No.")
        {
            Caption = 'Reversed Entry No.';
        }
        modify("Bill No.")
        {
            Caption = 'Bill No.';
        }

        //Unsupported feature: Code Insertion on "Open(Field 36)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //var
        //CheckLedgerEntry: Record "Check Ledger Entry";
        //rst272: Record "Check Ledger Entry";
        //begin
        /*
        //++ARbumasa 2009
        Clear(rst272);
        rst272.SetRange("Bank Account Ledger Entry No.","Entry No.");
        if rst272.Find('-') then
        repeat

          rst272.Open := Open;
          rst272.Modify;

        until rst272.Next = 0;
        //--ARbumasa 2009
        */
        //end;


        //Unsupported feature: Code Insertion on ""Statement Status"(Field 55)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //var
        //rst272: Record "Check Ledger Entry";
        //begin
        /*
        //++ARbumasa 2009
        Clear(rst272);
        rst272.SetRange("Bank Account Ledger Entry No.","Entry No.");
        if rst272.Find('-') then
        repeat

          rst272."Statement Status" := "Statement Status";
          rst272.Modify;

        until rst272.Next = 0;
        //--ARbumasa 2009
        */
        //end;


        //Unsupported feature: Code Insertion on ""Statement No."(Field 56)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //var
        //rst272: Record "Check Ledger Entry";
        //begin
        /*
        //++ARbumasa 2009
        Clear(rst272);
        rst272.SetRange("Bank Account Ledger Entry No.","Entry No.");
        if rst272.Find('-') then
        repeat

          rst272."Statement No." := "Statement No.";
          rst272.Modify;

        until rst272.Next = 0;
        //--ARbumasa 2009
        */
        //end;


        //Unsupported feature: Code Insertion on ""Statement Line No."(Field 57)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //var
        //rst272: Record "Check Ledger Entry";
        //begin
        /*
        //++ARbumasa 2009
        Clear(rst272);
        rst272.SetRange("Bank Account Ledger Entry No.","Entry No.");
        if rst272.Find('-') then
        repeat

          rst272."Statement Line No." := "Statement Line No.";
          rst272.Modify;

        until rst272.Next = 0;
        //--ARbumasa 2009
        */
        //end;
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Global Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50012; "Descripción 2"; Text[250])
        {
        }
        field(50013; "Bank Payment Type"; Option)
        {
            Caption = 'Bank Payment Type';
            OptionCaption = ' ,Computer Check,Manual Check,,,,,Electronic Payment';
            OptionMembers = " ","Computer Check","Manual Check",,,,,"Electronic Payment";
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            TableRelation = "Gen. Journal Template";
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
            var
                rst272: Record "Check Ledger Entry";
            begin
                //ArgV01-1 Permitimos modificar el no de cheque una vez registrado el movimiento

                Modify;

                Clear(rst272);
                rst272.SetRange("Bank Account Ledger Entry No.", "Entry No.");
                if rst272.Find('-') then begin

                    rst272."Check No." := "No. cheque";
                    rst272.Modify;

                end;

                //Fin ArgV01-1 }
            end;
        }
        field(50709; "Value Date"; Date)
        {
            Caption = 'Check Date';

            trigger OnValidate()
            var
                rst272: Record "Check Ledger Entry";
            begin
                //++Arbu

                Clear(rst272);
                rst272.SetRange(rst272."Bank Account Ledger Entry No.", "Entry No.");
                if rst272.Find('-') then begin

                    rst272."Check Date" := "Value Date";
                    rst272.Modify;

                end;

                //--Arbu
            end;
        }
        field(51000; Expediente; Text[30])
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
        field(66000; "No. mov. origen"; Integer)
        {
        }
    }
}

