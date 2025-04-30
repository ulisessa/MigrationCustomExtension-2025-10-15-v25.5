tableextension 51294 tableextension51294 extends "G/L Budget Entry"
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
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Business Unit Code")
        {
            Caption = 'Business Unit Code';
        }
        modify("Budget Dimension 1 Code")
        {
            Caption = 'Budget Dimension 1 Code';
        }
        modify("Budget Dimension 2 Code")
        {
            Caption = 'Budget Dimension 2 Code';
        }
        modify("Budget Dimension 3 Code")
        {
            Caption = 'Budget Dimension 3 Code';
        }
        modify("Budget Dimension 4 Code")
        {
            Caption = 'Budget Dimension 4 Code';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Old G/L Account No.")
        {
            Caption = 'Old G/L Account No.';
        }
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
        field(50003; "Global dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

        }
        field(50505; "Nombre libro diario"; Code[10])
        {
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=The dimension value %1 has not been set up for dimension %2.;ESP=El valor dimensión %1 no ha sido config. para la dimensión %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=The dimension value %1 has not been set up for dimension %2.;ESP=El valor dimensión %1 no ha sido config. para la dimensión %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=1,5,,Budget Dimension 1 Code;ESP=1,5,,Código Dimensión Presupuesto 1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=1,5,,Budget Dimension 1 Code;ESP=1,5,,Código Dimensión Presupuesto 1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=1,5,,Budget Dimension 2 Code;ESP=1,5,,Código Dimensión Presupuesto 2;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=1,5,,Budget Dimension 2 Code;ESP=1,5,,Código Dimensión Presupuesto 2;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=1,5,,Budget Dimension 3 Code;ESP=1,5,,Código Dimensión Presupuesto 3;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=1,5,,Budget Dimension 3 Code;ESP=1,5,,Código Dimensión Presupuesto 3;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=1,5,,Budget Dimension 4 Code;ESP=1,5,,Código Dimensión Presupuesto 4;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=1,5,,Budget Dimension 4 Code;ESP=1,5,,Código Dimensión Presupuesto 4;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AnalysisViewBudgetEntryExistsErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //AnalysisViewBudgetEntryExistsErr : ENU=You cannot change the amount on this G/L budget entry because one or more related analysis view budget entries exist.\\You must make the change on the related entry in the G/L Budget window.;ESP=No puede cambiar el importe de este movimiento de presupuesto de Contabilidad porque existen uno o más movimientos de presupuesto de vista de análisis relacionados.\\Debe definirse el cambio en el movimiento relacionado en la ventana Ppto. contable.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AnalysisViewBudgetEntryExistsErr : ENU=You cannot change the amount on this G/L budget entry because one or more related analysis view budget entries exist.\\You must make the change on the related entry in the G/L Budget window.;ESP=No puede cambiar el importe de este movimiento de presupuesto de Contabilidad porque existen uno o más movimientos de presupuesto de vista de análisis relacionados.\\Debe definirse el cambio en el movimiento relacionado en la ventana Ppto. contable.;
    //Variable type has not been exported.
}

