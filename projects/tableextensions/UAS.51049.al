tableextension 51049 tableextension51049 extends "Item Budget Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Analysis Area")
        {
            Caption = 'Analysis Area';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
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
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

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
}

