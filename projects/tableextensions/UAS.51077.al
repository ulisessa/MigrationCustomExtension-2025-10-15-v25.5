tableextension 51077 tableextension51077 extends "Posted Whse. Receipt Line"
{
    Caption = 'Posted Whse. Receipt Line';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Source Line No.")
        {
            Caption = 'Source Line No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Put-away Qty.")
        {
            Caption = 'Put-away Qty.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Qty. Cross-Docked")
        {
            Caption = 'Qty. Cross-Docked';
        }
        modify("Qty. Cross-Docked (Base)")
        {
            Caption = 'Qty. Cross-Docked (Base)';
        }
        modify("Cross-Dock Zone Code")
        {
            Caption = 'Cross-Dock Zone Code';
        }
        modify("Cross-Dock Bin Code")
        {
            Caption = 'Cross-Dock Bin Code';
        }
        modify("Posted Source No.")
        {
            Caption = 'Posted Source No.';
        }
        modify("Vendor Shipment No.")
        {
            Caption = 'Vendor Shipment No.';
        }
        modify("Whse. Receipt No.")
        {
            Caption = 'Whse. Receipt No.';
        }
        modify("Whse Receipt Line No.")
        {
            Caption = 'Whse Receipt Line No.';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
        }
        modify("Warranty Date")
        {
            Caption = 'Warranty Date';
        }
        field(50010; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50011; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50012; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50013; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50014; "Net kilos Put Away"; Decimal)
        {
            Caption = 'Net kilos Put Away';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50015; "Gross kilos Put Away"; Decimal)
        {
            Caption = 'Gross kilos Put Away';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50016; "Net kilos Put Away (Base)"; Decimal)
        {
            Caption = 'Net kilos Put Away (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50017; "Gross kilos Put Away (Base)"; Decimal)
        {
            Caption = 'Gross kilos Put Away (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50018; "Put-away net kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding" WHERE("Activity Type" = CONST("Put-away"),
                                                                                  "Whse. Document Type" = CONST(Receipt),
                                                                                  "Whse. Document No." = FIELD("No."),
                                                                                  "Whse. Document Line No." = FIELD("Line No."),
                                                                                  "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                  "Action Type" = FILTER(" " | Take),
                                                                                  "Original Breakbulk" = CONST(false)));
            Caption = 'Put-away net kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50019; "Put-away gross kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding" WHERE("Activity Type" = CONST("Put-away"),
                                                                                  "Whse. Document Type" = CONST(Receipt),
                                                                                  "Whse. Document No." = FIELD("No."),
                                                                                  "Whse. Document Line No." = FIELD("Line No."),
                                                                                  "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                  "Action Type" = FILTER(" " | Take),
                                                                                  "Original Breakbulk" = CONST(false)));
            Caption = 'Put-away gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50020; "Put-away net kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE("Activity Type" = CONST("Put-away"),
                                                                                         "Whse. Document Type" = CONST(Receipt),
                                                                                         "Whse. Document No." = FIELD("No."),
                                                                                         "Whse. Document Line No." = FIELD("Line No."),
                                                                                         "Action Type" = FILTER(" " | Take),
                                                                                         "Original Breakbulk" = CONST(false)));
            Caption = 'Put-away net kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021; "Put-away gross kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding (Base)" WHERE("Activity Type" = CONST("Put-away"),
                                                                                         "Whse. Document Type" = CONST(Receipt),
                                                                                         "Whse. Document No." = FIELD("No."),
                                                                                         "Whse. Document Line No." = FIELD("Line No."),
                                                                                         "Action Type" = FILTER(" " | Take),
                                                                                         "Original Breakbulk" = CONST(false)));
            Caption = 'Put-away gross kilos (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022; "Net kilos Cross-Docked"; Decimal)
        {
            Caption = 'Net kilos Cross-Docked';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(50023; "Gross kilos Cross-Docked"; Decimal)
        {
            Caption = 'Gross kilos Cross-Docked';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(50024; "Net kilos Cross-Docked (Base)"; Decimal)
        {
            Caption = 'Net kilos Cross-Docked (Base)';
            DecimalPlaces = 0 : 5;
        }
        field(50025; "Gross kilo Cross-Docked (Base)"; Decimal)
        {
            Caption = 'Gross kilo Cross-Docked (Base)';
            DecimalPlaces = 0 : 5;
        }
    }


    //Unsupported feature: Code Modification on "SetSourceFilter(PROCEDURE 42)".

    //procedure SetSourceFilter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WhseManagement.SetSourceFilterForPostedWhseRcptLine(Rec,SourceType,SourceSubType,SourceNo,SourceLineNo,SetKey);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //WhseManagement.SetSourceFilterForPostedWhseRcptLine(Rec,SourceType,SourceSubType,SourceNo,SourceLineNo,SetKey);
    */
    //end;
}

