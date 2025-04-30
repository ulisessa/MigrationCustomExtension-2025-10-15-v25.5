tableextension 50414 tableextension50414 extends "Reminder Line"
{
    Caption = 'Reminder Line';
    fields
    {
        modify("Reminder No.")
        {
            Caption = 'Reminder No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Attached to Line No.")
        {
            Caption = 'Attached to Line No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("No. of Reminders")
        {
            Caption = 'No. of Reminders';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Interest Rate")
        {
            Caption = 'Interest Rate';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Line Type")
        {
            Caption = 'Line Type';
        }
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
        }
        modify("Applies-to Document No.")
        {
            Caption = 'Applies-to Document No.';
        }
        modify("Detailed Interest Rates Entry")
        {
            Caption = 'Detailed Interest Rates Entry';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }

        //Unsupported feature: Code Modification on "Amount(Field 16).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if Type = Type::" " then begin
          ReminderLine.Type := ReminderLine.Type::"G/L Account";
          ReminderLine2.Type := ReminderLine.Type::"Customer Ledger Entry";
        #4..19
              "VAT Amount" :=
                SalesTaxCalculate.CalculateTax(
                  ReminderHeader."Tax Area Code","Tax Group Code",ReminderHeader."Tax Liable",
                  ReminderHeader."Posting Date",Amount,0,0);
              if Amount - "VAT Amount" <> 0 then
                "VAT %" := Round(100 * "VAT Amount" / Amount,0.00001)
              else
        #27..32
            end;
        end;
        "VAT Amount" := Round("VAT Amount",Currency."Amount Rounding Precision");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..22
                  ReminderHeader."Posting Date",Amount,0,0,
                  //++Arbu
                  '',0,'',0);
                  //--Arbu
        #24..35
        */
        //end;


        //Unsupported feature: Code Modification on ""VAT Prod. Posting Group"(Field 23).OnValidate".

        //trigger  Posting Group"(Field 23)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetReminderHeader;
        VATPostingSetup.Get(ReminderHeader."VAT Bus. Posting Group","VAT Prod. Posting Group");
        OnValidateVATProdPostingGroupOnAfterVATPostingSetupGet(VATPostingSetup);
        #4..17
              "VAT Amount" :=
                SalesTaxCalculate.CalculateTax(
                  ReminderHeader."Tax Area Code","Tax Group Code",ReminderHeader."Tax Liable",
                  ReminderHeader."Posting Date",Amount,0,0);
              if Amount - "VAT Amount" <> 0 then
                "VAT %" := Round(100 * "VAT Amount" / Amount,0.00001)
              else
                "VAT %" := 0;
              "VAT Amount" := Round("VAT Amount",Currency."Amount Rounding Precision");
            end;
        end;
        Validate(Amount);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..20
                  ReminderHeader."Posting Date",Amount,0,0,
                  //++Arbu
                  '',0,'',0);
                  //--Arbu
        #22..29
        */
        //end;
    }


    //Unsupported feature: Property Modification (TextConstString) on "EntryNotOverdueErr(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //EntryNotOverdueErr : @@@="%1 = Document Type, %2 = Document No., %3 = Table name";ENU=%1 %2 in %3 is not overdue.;ESP=%1 %2 en %3 no ha vencido todavía.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EntryNotOverdueErr : @@@="%1 = Document Type, %2 = Document No., %3 = Table name";ENU=%1 %2 in %3 is not overdue.;ESP=%1 %2 en %3 no ha vencido todavía.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "LineFeeAlreadyIssuedErr(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //LineFeeAlreadyIssuedErr : @@@="%1 = Document TYpe, %2 = Document No, %3 = Level number";ENU=The line fee for %1 %2 on reminder level %3 has already been issued.;ESP=El recargo de línea para %1 %2 en el nivel de recordatorio %3 ya se emitió.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LineFeeAlreadyIssuedErr : @@@="%1 = Document TYpe, %2 = Document No, %3 = Level number";ENU=The line fee for %1 %2 on reminder level %3 has already been issued.;ESP=El recargo de línea para %1 %2 en el nivel de recordatorio %3 ya se emiti?.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NotEnoughSpaceToInsertErr(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //NotEnoughSpaceToInsertErr : ENU=There is not enough space to insert lines with additional interest rates.;ESP=No hay espacio suficiente para insertar líneas con tipos de interés adicionales.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NotEnoughSpaceToInsertErr : ENU=There is not enough space to insert lines with additional interest rates.;ESP=No hay espacio suficiente para insertar líneas con tipos de interés adicionales.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "InvalidInterestRateDateErr(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvalidInterestRateDateErr : @@@=%1 - date;ENU=Create interest rate with start date prior to %1.;ESP=Permite crear tipo interés con fecha de inicio anterior a %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvalidInterestRateDateErr : @@@=%1 - date;ENU=Create interest rate with start date prior to %1.;ESP=Permite crear tipo interés con fecha de inicio anterior a %1.;
    //Variable type has not been exported.
}

