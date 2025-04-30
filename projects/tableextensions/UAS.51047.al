tableextension 51047 tableextension51047 extends "Analysis Column"
{
    Caption = 'Analysis Column';
    fields
    {
        modify("Analysis Area")
        {
            Caption = 'Analysis Area';
        }
        modify("Analysis Column Template")
        {
            Caption = 'Analysis Column Template';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Column No.")
        {
            Caption = 'Column No.';
        }
        modify(Formula)
        {
            Caption = 'Formula';
        }
        modify("Comparison Date Formula")
        {
            Caption = 'Comparison Date Formula';
        }
        modify("Comparison Period Formula")
        {
            Caption = 'Comparison Period Formula';
        }
        modify("Analysis Type Code")
        {
            Caption = 'Analysis Type Code';
        }
        modify("Comparison Period Formula LCID")
        {
            Caption = 'Comparison Period Formula LCID';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "PeriodFormulaErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //PeriodFormulaErr : @@@=%1 - value of Comparison Period Formula field;ENU=%1 is not a valid Period Formula.;ESP=%1 no es una fórmula periodo válida.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PeriodFormulaErr : @@@=%1 - value of Comparison Period Formula field;ENU=%1 is not a valid Period Formula.;ESP=%1 no es una Fórmula periodo válida.;
    //Variable type has not been exported.
}

