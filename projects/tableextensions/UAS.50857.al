tableextension 50857 tableextension50857 extends "Value Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Item Ledger Entry No.")
        {
            Caption = 'Item Ledger Entry No.';
        }
        modify("Salespers./Purch. Code")
        {
            Caption = 'Salespers./Purch. Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Applies-to Entry")
        {
            Caption = 'Applies-to Entry';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Drop Shipment")
        {
            Caption = 'Drop Shipment';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Document Line No.")
        {
            Caption = 'Document Line No.';
        }
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("Order Line No.")
        {
            Caption = 'Order Line No.';
        }
        modify("Item Charge No.")
        {
            Caption = 'Item Charge No.';
        }
        modify("Partial Revaluation")
        {
            Caption = 'Partial Revaluation';
        }
        modify("Valuation Date")
        {
            Caption = 'Valuation Date';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Job Ledger Entry No.")
        {
            Caption = 'Job Ledger Entry No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Average Cost Exception")
        {
            Caption = 'Average Cost Exception';
        }
        modify("Capacity Ledger Entry No.")
        {
            Caption = 'Capacity Ledger Entry No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[20])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 240603 - Inicio Modificación Arbumasa
                //Sólo puede modificar un usuario del mismo grupo de seguridad
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50005; "Valued Net Kilos"; Decimal)
        {
            Caption = 'Valued Net Kilos';
            ToolTip = 'Specifies the value of the Valued Net Kilos field.';
            DecimalPlaces = 0 : 5;
        }
        field(50006; "Item Ledger Entry Net Kilos"; Decimal)
        {
            Caption = 'Item Ledger Entry Net Kilos';
            ToolTip = 'Specifies the value of the Item Ledger Entry Net Kilos field.';
            DecimalPlaces = 0 : 5;
        }
        field(50007; "Invoiced Net Kilos"; Decimal)
        {
            Caption = 'Invoiced Net Kilos';
            ToolTip = 'Specifies the value of the Invoiced Net Kilos field.';
            DecimalPlaces = 0 : 5;
        }
        field(50008; "Valued Gross Kilos"; Decimal)
        {
            Caption = 'Valued Gross kilos';
            ToolTip = 'Specifies the value of the Valued Gross kilos field.';
            DecimalPlaces = 0 : 5;
        }
        field(50009; "Item Ledger Entry Gross Kilos"; Decimal)
        {
            Caption = 'Item Ledger Entry Gross kilos';
            ToolTip = 'Specifies the value of the Item Ledger Entry Gross kilos field.';
            DecimalPlaces = 0 : 5;
        }
        field(50010; "Invoiced Gross Kilos"; Decimal)
        {
            Caption = 'Invoiced Gross kilos';
            ToolTip = 'Specifies the value of the Invoiced Gross kilos field.';
            DecimalPlaces = 0 : 5;
        }
        field(50011; "Cost Amount (Expected) Back"; Decimal)
        {
            Caption = 'Importe coste (Esperado) Back';
            ToolTip = 'Specifies the value of the Importe coste (Esperado) Back field.';
            DataClassification = ToBeClassified;
        }
        field(50012; "Cost Amount (Expected) (ACY) B"; Decimal)
        {
            Caption = 'Importe coste (Esperado) (DA) Back';
            ToolTip = 'Specifies the value of the Importe coste (Esperado) (DA) Back field.';
            DataClassification = ToBeClassified;
        }
        field(50013; "Exp. Cost Posted to G/L (ACY)B"; Decimal)
        {
            Caption = 'Coste esperado reg. cont. (DA) Back';
            ToolTip = 'Specifies the value of the Coste esperado reg. cont. (DA) Back field.';
            DataClassification = ToBeClassified;
        }
        field(50014; "Item ledger entry date"; Date)
        {
            Caption = 'Item ledger entry date';
            ToolTip = 'Specifies the value of the Item ledger entry date field.';
            CalcFormula = Lookup("Item Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("Item Ledger Entry No.")));
            FieldClass = FlowField;
        }
        field(50542; "Additional-Currency Posting"; Option)
        {
            Caption = 'Additional-Currency Posting';
            ToolTip = 'Specifies the value of the Additional-Currency Posting field.';
            DataClassification = ToBeClassified;
            OptionCaption = 'None,Amount Only,Additional-Currency Amount Only';
            OptionMembers = "None","Amount Only","Additional-Currency Amount Only";
        }
    }
}

