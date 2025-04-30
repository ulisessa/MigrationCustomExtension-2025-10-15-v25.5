tableextension 51190 tableextension51190 extends "Acc. Schedule Line"
{
    Caption = 'Acc. Schedule Line';
    fields
    {
        modify("Schedule Name")
        {
            Caption = 'Schedule Name';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Row No.")
        {
            Caption = 'Row No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("New Page")
        {
            Caption = 'New Page';
        }
        modify("Dimension 1 Filter")
        {
            Caption = 'Dimension 1 Filter';
        }
        modify("Dimension 2 Filter")
        {
            Caption = 'Dimension 2 Filter';
        }
        modify("Dimension 3 Filter")
        {
            Caption = 'Dimension 3 Filter';
        }
        modify("Dimension 4 Filter")
        {
            Caption = 'Dimension 4 Filter';
        }
        modify("Dimension 1 Totaling")
        {
            Caption = 'Dimension 1 Totaling';
        }
        modify("Dimension 2 Totaling")
        {
            Caption = 'Dimension 2 Totaling';
        }
        modify("Dimension 3 Totaling")
        {
            Caption = 'Dimension 3 Totaling';
        }
        modify("Dimension 4 Totaling")
        {
            Caption = 'Dimension 4 Totaling';
        }
        modify(Italic)
        {
            Caption = 'Italic';
        }
        modify("Cash Flow Forecast Filter")
        {
            Caption = 'Cash Flow Forecast Filter';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "ForceUnderLineMsg(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //ForceUnderLineMsg : @@@="%1= Field underline ";ENU=%1 will be set to false.;ESP=%1 se establecerá en False.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ForceUnderLineMsg : @@@="%1= Field underline ";ENU=%1 will be set to false.;ESP=%1 se establecer? en False.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Default Schedule;ESP=Previsión genér.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Default Schedule;ESP=Previsión genér.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The parenthesis at position %1 is misplaced.;ESP=El paréntesis en la posición %1 es incorrecto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The parenthesis at position %1 is misplaced.;ESP=El paréntesis en la posición %1 es incorrecto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot have two consecutive operators. The error occurred at position %1.;ESP=No se puede tener dos operaciones consecutivas. Revise la posición %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot have two consecutive operators. The error occurred at position %1.;ESP=No se puede tener dos operaciones consecutivas. Revise la posición %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=There is an operand missing after position %1.;ESP=Falta un operando después de la posición %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=There is an operand missing after position %1.;ESP=Falta un operando después de la posición %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=There are more left parentheses than right parentheses.;ESP=Hay más paréntesis de apertura que de cierre.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=There are more left parentheses than right parentheses.;ESP=Hay más paréntesis de apertura que de cierre.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=There are more right parentheses than left parentheses.;ESP=Hay más paréntesis de cierre que de apertura.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=There are more right parentheses than left parentheses.;ESP=Hay más paréntesis de cierre que de apertura.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=1,6,,Dimension 1 Filter;ESP=1,6,,Filtro dimensión 1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=1,6,,Dimension 1 Filter;ESP=1,6,,Filtro dimensión 1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=1,6,,Dimension 2 Filter;ESP=1,6,,Filtro dimensión 2;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=1,6,,Dimension 2 Filter;ESP=1,6,,Filtro dimensión 2;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=1,6,,Dimension 3 Filter;ESP=1,6,,Filtro dimensión 3;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=1,6,,Dimension 3 Filter;ESP=1,6,,Filtro dimensión 3;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=1,6,,Dimension 4 Filter;ESP=1,6,,Filtro dimensión 4;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=1,6,,Dimension 4 Filter;ESP=1,6,,Filtro dimensión 4;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=1,5,,Dimension 1 Totaling;ESP=1,5,,Total dimensión 1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=1,5,,Dimension 1 Totaling;ESP=1,5,,Total dimensión 1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text012(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text012 : ENU=1,5,,Dimension 2 Totaling;ESP=1,5,,Total dimensión 2;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text012 : ENU=1,5,,Dimension 2 Totaling;ESP=1,5,,Total dimensión 2;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU=1,5,,Dimension 3 Totaling;ESP=1,5,,Total dimensión 3;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU=1,5,,Dimension 3 Totaling;ESP=1,5,,Total dimensión 3;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text014(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text014 : ENU=1,5,,Dimension 4 Totaling;ESP=1,5,,Total dimensión 4;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text014 : ENU=1,5,,Dimension 4 Totaling;ESP=1,5,,Total dimensión 4;
    //Variable type has not been exported.
}

