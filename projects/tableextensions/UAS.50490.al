tableextension 50490 tableextension50490 extends "G/L Acc. Budget Buffer"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("G/L Account Filter")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Global Dimension 1 Filter")
        {
            Caption = 'Global Dimension 1 Filter';
        }
        modify("Global Dimension 2 Filter")
        {
            Caption = 'Global Dimension 2 Filter';
        }
        modify("Account Category")
        {
            Caption = 'Account Category';
        }
        field(50000; "Global Dimension 3 Filter"; Code[20])
        {
            CaptionClass = '1,3,3';
            Caption = 'Global Dimension 3 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; "Global Dimension 4 Filter"; Code[20])
        {
            CaptionClass = '1,3,4';
            Caption = 'Global Dimension 4 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Global Dimension 5 Filter"; Code[20])
        {
            CaptionClass = '1,3,5';
            Caption = 'Global Dimension 5 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Global Dimension 6 Filter"; Code[20])
        {
            CaptionClass = '1,3,6';
            Caption = 'Global Dimension 6 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Global Dimension 7 Filter"; Code[20])
        {
            CaptionClass = '1,3,7';
            Caption = 'Global Dimension 7 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=1,6,,Budget Dimension 1 Filter;ESP=1,6,,Filtro dimensión presupuesto 1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=1,6,,Budget Dimension 1 Filter;ESP=1,6,,Filtro dimensión presupuesto 1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=1,6,,Budget Dimension 2 Filter;ESP=1,6,,Filtro dimensión presupuesto 2;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=1,6,,Budget Dimension 2 Filter;ESP=1,6,,Filtro dimensión presupuesto 2;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=1,6,,Budget Dimension 3 Filter;ESP=1,6,,Filtro dimensión presupuesto 3;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=1,6,,Budget Dimension 3 Filter;ESP=1,6,,Filtro dimensión presupuesto 3;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=1,6,,Budget Dimension 4 Filter;ESP=1,6,,Filtro dimensión presupuesto 4;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=1,6,,Budget Dimension 4 Filter;ESP=1,6,,Filtro dimensión presupuesto 4;
    //Variable type has not been exported.
}

