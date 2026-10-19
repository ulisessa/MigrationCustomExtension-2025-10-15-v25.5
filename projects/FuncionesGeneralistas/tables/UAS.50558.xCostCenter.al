table 50558 "xCost Center"
{
    Caption = 'Cost Center';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the value of the Code field.';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
        }
        field(700; "Cost Subtype"; Option)
        {
            Caption = 'Cost Subtype';
            ToolTip = 'Specifies the value of the Cost Subtype field.';
            OptionCaption = ' ,Service Cost Center,Aux. Cost Center,Main Cost Center';
            OptionMembers = " ","Service Cost Center","Aux. Cost Center","Main Cost Center";
        }
        field(701; "Cost Type Filter"; Text[20])
        {
            Caption = 'Cost Type Filter';
            ToolTip = 'Specifies the value of the Cost Type Filter field.';
            FieldClass = FlowFilter;
        }
        field(702; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
            FieldClass = FlowFilter;
        }
        field(704; "Net Change"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Cost Entry".Amount WHERE("Cost Center Code" = FIELD(Code),
                                                         "Cost Center Code" = FIELD(FILTER("Total From/To")),
                                                         "Cost Type No." = FIELD("Cost Type Filter"),
                                                         "Posting Date" = FIELD("Date Filter")));
            Caption = 'Net Change';
            ToolTip = 'Specifies the value of the Net Change field.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(705; "Balance at Date"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Cost Entry".Amount WHERE("Cost Center Code" = FIELD(Code),
                                                         "Cost Center Code" = FIELD(FILTER("Total From/To")),
                                                         "Cost Type No." = FIELD("Cost Type Filter"),
                                                         "Posting Date" = FIELD(UPPERLIMIT("Date Filter"))));
            Caption = 'Balance at Date';
            ToolTip = 'Specifies the value of the Balance at Date field.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(707; "Balance to Allocate"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Cost Entry".Amount WHERE("Cost Center Code" = FIELD(Code),
                                                         "Cost Center Code" = FIELD(FILTER("Total From/To")),
                                                         "Cost Type No." = FIELD("Cost Type Filter"),
                                                         "Posting Date" = FIELD("Date Filter"),
                                                         Allocated = CONST(false)));
            Caption = 'Balance to Allocate';
            ToolTip = 'Specifies the value of the Balance to Allocate field.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(708; "Responsible Person"; Code[10])
        {
            Caption = 'Responsible Person';
            ToolTip = 'Specifies the value of the Responsible Person field.';
            TableRelation = User;
        }
        field(710; "Sorting Order"; Code[10])
        {
            Caption = 'Sorting Order';
            ToolTip = 'Specifies the value of the Sorting Order field.';
        }
        field(711; Comment; Text[50])
        {
            Caption = 'Comment';
            ToolTip = 'Specifies the value of the Comment field.';
        }
        field(720; "Line Type"; Option)
        {
            Caption = 'Line Type';
            ToolTip = 'Specifies the value of the Line Type field.';
            OptionCaption = 'Cost Center,Heading,Total,Begin-Total,End-Total';
            OptionMembers = "Cost Center",Heading,Total,"Begin-Total","End-Total";
        }
        field(721; Blocked; Boolean)
        {
            Caption = 'Blocked';
            ToolTip = 'Specifies the value of the Blocked field.';
        }
        field(722; "New Page"; Boolean)
        {
            Caption = 'New Page';
            ToolTip = 'Specifies the value of the New Page field.';
        }
        field(723; "Blank Line"; Boolean)
        {
            Caption = 'Blank Line';
            ToolTip = 'Specifies the value of the Blank Line field.';
            MinValue = false;
        }
        field(724; Indentation; Integer)
        {
            Caption = 'Indentation';
            ToolTip = 'Specifies the value of the Indentation field.';
            Editable = false;
            MinValue = 0;
        }
        field(725; "Total From/To"; Text[250])
        {
            Caption = 'Total From/To';
            ToolTip = 'Specifies the value of the Total From/To field.';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Sorting Order")
        {
        }
        key(Key3; "Cost Subtype")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Name, "Line Type")
        {
        }
    }
}

