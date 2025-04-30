tableextension 50791 tableextension50791 extends "Depreciation Book"
{
    Caption = 'Depreciation Book';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("G/L Integration - Depreciation")
        {
            Caption = 'G/L Integration - Depreciation';
        }
        modify("G/L Integration - Write-Down")
        {
            Caption = 'G/L Integration - Write-Down';
        }
        modify("G/L Integration - Appreciation")
        {
            Caption = 'G/L Integration - Appreciation';
        }
        modify("Disposal Calculation Method")
        {
            Caption = 'Disposal Calculation Method';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Default Exchange Rate")
        {
            Caption = 'Default Exchange Rate';
        }
        modify("Use Rounding in Periodic Depr.")
        {
            Caption = 'Use Rounding in Periodic Depr.';
        }
        modify("No. of Days in Fiscal Year")
        {
            Caption = 'No. of Days in Fiscal Year';
        }
        modify("Default Ending Book Value")
        {
            Caption = 'Default Ending Book Value';
        }
        modify("Periodic Depr. Date Calc.")
        {
            Caption = 'Periodic Depr. Date Calc.';
            OptionCaption = 'Last Entry,Last Depr. Entry';
        }
        modify("Mark Errors as Corrections")
        {
            Caption = 'Mark Errors as Corrections';
        }
        modify("Use Default Dimension")
        {
            Caption = 'Use Default Dimension';
        }
        modify("Allow Correction of Disposal")
        {
            Caption = 'Allow Correction of Disposal';
        }
        modify("Allow more than 360/365 Days")
        {
            Caption = 'Allow more than 360/365 Days';
        }
        modify("Allow Identical Document No.")
        {
            Caption = 'Allow Identical Document No.';
        }
        modify("Fiscal Year 365 Days")
        {
            Caption = 'Fiscal Year 365 Days';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=The book cannot be deleted because it is in use.;ESP=No se puede eliminar este libro ya que se está usando.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=The book cannot be deleted because it is in use.;ESP=No se puede eliminar este libro ya que se está usando.;
    //Variable type has not been exported.
}

