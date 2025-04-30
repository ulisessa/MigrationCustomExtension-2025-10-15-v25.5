tableextension 339 "Item Application Entry" extends "Item Application Entry" //OriginalId
{
    fields
    {
        field(50000; "No. producto"; Code[30])
        {
            TableRelation = Item."No.";
        }
        field(50001; "Location code inbound"; Code[10])
        {
            CalcFormula = Lookup("Item Ledger Entry"."Location Code" WHERE("Entry No." = FIELD("Inbound Item Entry No.")));
            FieldClass = FlowField;
        }
        field(50002; "Location code outbound"; Code[10])
        {
            CalcFormula = Lookup("Item Ledger Entry"."Location Code" WHERE("Entry No." = FIELD("Outbound Item Entry No.")));
            FieldClass = FlowField;
        }
        field(50500; "Kilos brutos"; Decimal)
        {
        }
        field(50501; "Kilos netos"; Decimal)
        {
        }
        field(50502; "No. lote"; Code[30])
        {
        }
        field(50503; "Lote origen"; Code[20])
        {
        }
        field(50504; "Cantidad recuperada"; Decimal)
        {
        }
        field(50505; "Fecha recupero"; Date)
        {
        }
        field(50506; Familia; Code[20])
        {
        }
        field(50507; Subfamilia; Code[20])
        {
        }
        field(50508; "Factura No."; Code[20])
        {
        }
        field(50509; "No. Pallet"; Code[10])
        {
        }
        field(50510; Proveedor; Text[50])
        {
        }
        field(50511; "Factura proveedor"; Code[20])
        {
        }
        field(50512; "Factura interna"; Code[20])
        {
        }
        field(50513; "Fecha factura"; Date)
        {
        }
        field(50514; "Fecha registro factura"; Date)
        {
        }
        field(50515; "Importe registrado"; Decimal)
        {
        }
        field(50516; "Cantidad registrada"; Decimal)
        {
        }
        field(50517; "No. Proyecto"; Code[20])
        {
            TableRelation = Job;
        }
        field(50518; "Entry date"; Date)
        {
            CalcFormula = Lookup("Item Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("Inbound Item Entry No.")));
            FieldClass = FlowField;
        }
        field(50597; "Fecha anulación"; Date)
        {
        }
        field(50598; "Usuario anulación"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {
        }
        field(50600; "Exit date"; Date)
        {
            CalcFormula = Lookup("Item Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("Outbound Item Entry No.")));
            FieldClass = FlowField;
        }
    }
}