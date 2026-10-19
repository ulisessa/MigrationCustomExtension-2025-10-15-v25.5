table 50567 "xCost Object"
{
    Caption = 'Cost Object';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the value of the Code field.';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
        }
        field(701; "Cost Type Filter"; Text[20])
        {
            Caption = 'Cost Type Filter';
            ToolTip = 'Specifies the value of the Cost Type Filter field.';
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
            CalcFormula = Sum("Cost Entry".Amount WHERE("Cost Object Code" = FIELD(Code),
                                                         "Cost Object Code" = FIELD(FILTER("Total From/To")),
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
            CalcFormula = Sum("Cost Entry".Amount WHERE("Cost Object Code" = FIELD(Code),
                                                         "Cost Object Code" = FIELD(FILTER("Total From/To")),
                                                         "Cost Type No." = FIELD("Cost Type Filter"),
                                                         "Posting Date" = FIELD(UPPERLIMIT("Date Filter"))));
            Caption = 'Balance at Date';
            ToolTip = 'Specifies the value of the Balance at Date field.';
            Editable = false;
            FieldClass = FlowField;
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
            OptionCaption = 'Cost Object,Heading,Total,Begin-Total,End-Total';
            OptionMembers = "Cost Object",Heading,Total,"Begin-Total","End-Total";
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
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Name, "Line Type")
        {
        }
    }
}

