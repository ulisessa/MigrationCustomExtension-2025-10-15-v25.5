tableextension 50792 tableextension50792 extends "FA Depreciation Book"
{
    Caption = 'FA Depreciation Book';
    fields
    {
        modify("FA No.")
        {
            Caption = 'FA No.';
        }
        modify("Depreciation Book Code")
        {
            Caption = 'Depreciation Book Code';
        }
        modify("Depreciation Method")
        {
            Caption = 'Depreciation Method';
        }
        modify("Depreciation Starting Date")
        {
            Caption = 'Depreciation Starting Date';
        }
        modify("No. of Depreciation Years")
        {
            Caption = 'No. of Depreciation Years';
        }
        modify("No. of Depreciation Months")
        {
            Caption = 'No. of Depreciation Months';
        }
        modify("Declining-Balance %")
        {
            Caption = 'Declining-Balance %';
        }
        modify("Depreciation Table Code")
        {
            Caption = 'Depreciation Table Code';
        }
        modify("Depreciation Ending Date")
        {
            Caption = 'Depreciation Ending Date';
        }
        modify(Depreciation)
        {
            Caption = 'Depreciation';
        }
        modify("Gain/Loss")
        {
            Caption = 'Gain/Loss';
        }
        modify("Write-Down")
        {
            Caption = 'Write-Down';
        }
        modify(Appreciation)
        {
            Caption = 'Appreciation';
        }
        modify("Custom 2")
        {
            Caption = 'Custom 2';
        }
        modify("Maintenance Code Filter")
        {
            Caption = 'Maintenance Code Filter';
        }
        modify("Acquisition Date")
        {
            Caption = 'Acquisition Date';
        }
        modify("Last Acquisition Cost Date")
        {
            Caption = 'Last Acquisition Cost Date';
        }
        modify("Last Depreciation Date")
        {
            Caption = 'Last Depreciation Date';
        }
        modify("Last Write-Down Date")
        {
            Caption = 'Last Write-Down Date';
        }
        modify("Last Appreciation Date")
        {
            Caption = 'Last Appreciation Date';
        }
        modify("Last Custom 1 Date")
        {
            Caption = 'Last Custom 1 Date';
        }
        modify("Last Custom 2 Date")
        {
            Caption = 'Last Custom 2 Date';
        }
        modify("Last Salvage Value Date")
        {
            Caption = 'Last Salvage Value Date';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("First User-Defined Depr. Date")
        {
            Caption = 'First User-Defined Depr. Date';
        }
        modify("Last Maintenance Date")
        {
            Caption = 'Last Maintenance Date';
        }
        modify("Depr. This Year % (Custom 1)")
        {
            Caption = 'Depr. This Year % (Custom 1)';
        }
        modify("Property Class (Custom 1)")
        {
            OptionCaption = ' ,Personal Property,Real Property';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Use Half-Year Convention")
        {
            Caption = 'Use Half-Year Convention';
        }
        modify("Ignore Def. Ending Book Value")
        {
            Caption = 'Ignore Def. Ending Book Value';
        }
        modify("Default FA Depreciation Book")
        {
            Caption = 'Default FA Depreciation Book';
        }
        field(50000; "Global Dimension 1 filter"; Code[10])
        {
            Caption = 'Filtro Cód. dim. global 1';
            ToolTip = 'Specifies the value of the Filtro Cód. dim. global 1 field.';
            FieldClass = FlowFilter;
        }
    }


    //Unsupported feature: Code Modification on "ShowBookValueAfterDisposal(PROCEDURE 12)".

    //procedure ShowBookValueAfterDisposal();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Disposal Date" > 0D then begin
      Clear(TempFALedgEntry);
      TempFALedgEntry.DeleteAll;
      TempFALedgEntry.SetCurrentKey("FA No.","Depreciation Book Code","FA Posting Date");
      DepreciationCalc.SetFAFilter(FALedgEntry,"FA No.","Depreciation Book Code",false);
      SetBookValueAfterDisposalFiltersOnFALedgerEntry(FALedgEntry);
      PAGE.Run(0,FALedgEntry);
    end else begin
      SetBookValueFiltersOnFALedgerEntry(FALedgEntry);
      PAGE.Run(0,FALedgEntry);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
      //++Arbu
      //DepreciationCalc.SetFAFilter(FALedgEntry,"FA No.","Depreciation Book Code",FALSE);
      DepreciationCalc.SetFAFilter(FALedgEntry,"FA No.","Depreciation Book Code",false,GetFilter("Global Dimension 1 filter"));
      //--Arbu
    #6..11
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=untitled;ESP=SinTítulo;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=untitled;ESP=SinT?tulo;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "OnlyOneDefaultDeprBookErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //OnlyOneDefaultDeprBookErr : ENU=Only one fixed asset depreciation book can be marked as the default book;ESP=Se puede marcar como predeterminado un solo libro de amortización de activos fijos;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnlyOneDefaultDeprBookErr : ENU=Only one fixed asset depreciation book can be marked as the default book;ESP=Se puede marcar como predeterminado un solo libro de amortización de activos fijos;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "FiscalYear365Err(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //FiscalYear365Err : ENU=An ending date for depreciation cannot be calculated automatically when the Fiscal Year 365 Days option is chosen. You must manually enter the ending date.;ESP=No se puede calcular automáticamente una fecha final de amortización cuando se elige la opción Ejercicio 365 días. Debe introducir manualmente la fecha final.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FiscalYear365Err : ENU=An ending date for depreciation cannot be calculated automatically when the Fiscal Year 365 Days option is chosen. You must manually enter the ending date.;ESP=No se puede calcular automáticamente una fecha final de amortización cuando se elige la opción Ejercicio 365 días. Debe introducir manualmente la fecha final.;
    //Variable type has not been exported.
}

