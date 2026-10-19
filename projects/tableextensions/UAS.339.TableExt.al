tableextension 339 "Item Application Entry" extends "Item Application Entry" //OriginalId
{
    fields
    {
        field(50000; "No. producto"; Code[30])
        {
            Caption = 'Item No.';
            ToolTip = 'Specifies the value of the Item No field.';
            TableRelation = Item."No.";
        }
        field(50001; "Location code inbound"; Code[10])
        {
            Caption = 'Location code inbound';
            ToolTip = 'Specifies the value of the Location code inbound field.';
            CalcFormula = Lookup("Item Ledger Entry"."Location Code" WHERE("Entry No." = FIELD("Inbound Item Entry No.")));
            FieldClass = FlowField;
        }
        field(50002; "Location code outbound"; Code[10])
        {
            Caption = 'Location code outbound';
            ToolTip = 'Specifies the value of the Location code outbound field.';
            CalcFormula = Lookup("Item Ledger Entry"."Location Code" WHERE("Entry No." = FIELD("Outbound Item Entry No.")));
            FieldClass = FlowField;
        }
        field(50500; "Kilos brutos"; Decimal)
        {
            Caption = 'Kilos brutos';
            ToolTip = 'Specifies the value of the Kilos brutos field.';
        }
        field(50501; "Kilos netos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
        }
        field(50502; "No. lote"; Code[30])
        {
            Caption = 'No. lote';
            ToolTip = 'Specifies the value of the No. lote field.';
        }
        field(50503; "Lote origen"; Code[20])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
        }
        field(50504; "Cantidad recuperada"; Decimal)
        {
            Caption = 'Cantidad recuperada';
            ToolTip = 'Specifies the value of the Cantidad recuperada field.';
        }
        field(50505; "Fecha recupero"; Date)
        {
            Caption = 'Fecha recupero';
            ToolTip = 'Specifies the value of the Fecha recupero field.';
        }
        field(50506; Familia; Code[20])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
        }
        field(50507; Subfamilia; Code[20])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
        }
        field(50508; "Factura No."; Code[20])
        {
            Caption = 'Factura No.';
            ToolTip = 'Specifies the value of the Factura No field.';
        }
        field(50509; "No. Pallet"; Code[10])
        {
            Caption = 'Pallet no.';
            ToolTip = 'Specifies the value of the Pallet no field.';
        }
        field(50510; Proveedor; Text[50])
        {
            Caption = 'Proveedor';
            ToolTip = 'Specifies the value of the Proveedor field.';
        }
        field(50511; "Factura proveedor"; Code[20])
        {
            Caption = 'Factura proveedor';
            ToolTip = 'Specifies the value of the Factura proveedor field.';
        }
        field(50512; "Factura interna"; Code[20])
        {
            Caption = 'Factura interna';
            ToolTip = 'Specifies the value of the Factura interna field.';
        }
        field(50513; "Fecha factura"; Date)
        {
            Caption = 'Fecha factura';
            ToolTip = 'Specifies the value of the Fecha factura field.';
        }
        field(50514; "Fecha registro factura"; Date)
        {
            Caption = 'Fecha registro factura';
            ToolTip = 'Specifies the value of the Fecha registro factura field.';
        }
        field(50515; "Importe registrado"; Decimal)
        {
            Caption = 'Importe registrado';
            ToolTip = 'Specifies the value of the Importe registrado field.';
        }
        field(50516; "Cantidad registrada"; Decimal)
        {
            Caption = 'Cantidad registrada';
            ToolTip = 'Specifies the value of the Cantidad registrada field.';
        }
        field(50517; "No. Proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;
        }
        field(50518; "Entry date"; Date)
        {
            Caption = 'Entry date';
            ToolTip = 'Specifies the value of the Entry date field.';
            CalcFormula = Lookup("Item Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("Inbound Item Entry No.")));
            FieldClass = FlowField;
        }
        field(50597; "Fecha anulación"; Date)
        {
            Caption = 'Fecha anulación';
            ToolTip = 'Specifies the value of the Fecha anulación field.';
        }
        field(50598; "Usuario anulación"; Code[20])
        {
            Caption = 'Usuario anulación';
            ToolTip = 'Specifies the value of the Usuario anulación field.';
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';
        }
        field(50600; "Exit date"; Date)
        {
            Caption = 'Exit date';
            ToolTip = 'Specifies the value of the Exit date field.';
            CalcFormula = Lookup("Item Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("Outbound Item Entry No.")));
            FieldClass = FlowField;
        }
    }
}