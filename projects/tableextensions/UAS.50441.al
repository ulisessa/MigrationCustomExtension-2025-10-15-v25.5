tableextension 50441 tableextension50441 extends "Item Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Item No.")
        {
            TableRelation = Item."No.";
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
        modify("Shpt. Method Code")
        {
            Caption = 'Shpt. Method Code';
        }
        modify("Drop Shipment")
        {
            Caption = 'Drop Shipment';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
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
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Originally Ordered No.")
        {
            Caption = 'Originally Ordered No.';
        }
        modify("Originally Ordered Var. Code")
        {
            Caption = 'Originally Ordered Var. Code';
        }
        modify("Item Category Code")
        {
            Caption = 'Item Category Code';
        }
        modify(Nonstock)
        {
            Caption = 'Catalog';
        }
        modify("Purchasing Code")
        {
            Caption = 'Purchasing Code';
        }
        modify("Last Invoice Date")
        {
            Caption = 'Last Invoice Date';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Prod. Order Comp. Line No.")
        {
            Caption = 'Prod. Order Comp. Line No.';
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
        modify("Return Reason Code")
        {
            Caption = 'Return Reason Code';
        }
        field(50000; "Global dimension 3 Code"; Code[10])
        {
            Caption = 'Global dimension 3 Code';
            ToolTip = 'Specifies the value of the Global dimension 3 Code field.';
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
        field(50003; "Global dimension 6 Code"; Code[20])
        {
            Caption = 'Global dimension 6 Code';
            ToolTip = 'Specifies the value of the Global dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50005; "Job concept"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
        }
        field(50010; "Pallet no."; Code[20])
        {
            Caption = 'Pallet no.';
            ToolTip = 'Specifies the value of the Pallet no field.';
        }
        field(50011; "No. proyecto"; Code[20])
        {
            Caption = 'Job no.';
            ToolTip = 'Specifies the value of the Job no field.';
            TableRelation = Job."No.";
        }
        field(50012; "No. proyecto destino"; Code[20])
        {
            Caption = 'Destination job no.';
            ToolTip = 'Specifies the value of the Destination job no field.';
            TableRelation = Job."No.";
        }
        field(50013; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            ToolTip = 'Specifies the value of the Gross kilos field.';
        }
        field(50014; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            ToolTip = 'Specifies the value of the Net kilos field.';
        }
        field(50015; "% price per kilo"; Decimal)
        {
            Caption = '% price per kilo';
            ToolTip = 'Specifies the value of the % price per kilo field.';
        }
        field(50018; "Remaining gross kilos"; Decimal)
        {
            Caption = 'Remaining gross kilos';
            ToolTip = 'Specifies the value of the Remaining gross kilos field.';
            ObsoleteTag = '10/2026';
            ObsoleteState = Pending;
            ObsoleteReason = 'Ya no se mantiene. Kilos pendientes = Remaining Quantity x Gross kilos / Quantity; el stock en kilos es la suma con signo de Gross kilos.';
        }
        field(50019; "Remaining net kilos"; Decimal)
        {
            Caption = 'Remaining net kilos';
            ToolTip = 'Specifies the value of the Remaining net kilos field.';
            ObsoleteTag = '10/2026';
            ObsoleteState = Pending;
            ObsoleteReason = 'Ya no se mantiene. Kilos pendientes = Remaining Quantity x Net kilos / Quantity; el stock en kilos es la suma con signo de Net kilos.';
        }
        field(50021; "Item type"; Option)
        {
            Caption = 'Item type';
            ToolTip = 'Specifies the value of the Item type field.';
            OptionCaption = 'Consumption,Fishing';
            OptionMembers = Consumo,Pesca;
        }
        field(50022; "Request header no."; Code[30])
        {
            Caption = 'Request header no.';
            ToolTip = 'Specifies the value of the Request header no field.';
        }
        field(50023; "Request line no."; Integer)
        {
            Caption = 'Request line no.';
            ToolTip = 'Specifies the value of the Request line no field.';
        }
        field(50024; "Invoiced net kilos"; Decimal)
        {
            Caption = 'Invoiced net kilos';
            ToolTip = 'Specifies the value of the Invoiced net kilos field.';
            DecimalPlaces = 0 : 5;
        }
        field(50025; "Invoiced gross kilos"; Decimal)
        {
            Caption = 'Invoiced gross kilos';
            ToolTip = 'Specifies the value of the Invoiced gross kilos field.';
        }
        field(50026; Family; Code[3])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            TableRelation = "Familia producto";
        }
        field(50027; Subfamily; Code[20])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50028; "Production date"; Date)
        {
            Caption = 'Production date';
            ToolTip = 'Specifies the value of the Production date field.';
        }
        field(50029; "Quantity in shipments"; Decimal)
        {
            Caption = 'Quantity in shipments';
            ToolTip = 'Specifies the value of the Quantity in shipments field.';
        }
        field(50030; "Shipped nk Not Returned"; Decimal)
        {
            Caption = 'Shipped nk Not Returned';
            ToolTip = 'Specifies the value of the Shipped nk Not Returned field.';
            DecimalPlaces = 0 : 5;
        }
        field(50031; "Shipped gk Not Returned"; Decimal)
        {
            Caption = 'Shipped gk Not Returned';
            ToolTip = 'Specifies the value of the Shipped gk Not Returned field.';
            DecimalPlaces = 0 : 5;
        }
        field(50033; "Transport registration"; Code[10])
        {
            Caption = 'Transport registration';
            ToolTip = 'Specifies the value of the Transport registration field.';
        }
        field(50034; Temperature; Decimal)
        {
            Caption = 'Temperature';
            ToolTip = 'Specifies the value of the Temperature field.';
        }
        field(50035; "Time of arrival"; Time)
        {
            Caption = 'Time of arrival';
            ToolTip = 'Specifies the value of the Time of arrival field.';
        }
        field(50036; "Sanitary protection type"; Option)
        {
            BlankZero = true;
            Caption = 'Sanitary protection type';
            ToolTip = 'Specifies the value of the Sanitary protection type field.';
            OptionCaption = ',P.T.,P.T.R.,C.S.E.P.,Transit guide';
            OptionMembers = ,"P.T.","P.T.R.","C.S.E.P.","Guía de tránsito";
        }
        field(50037; "Sanitary protection no."; Code[30])
        {
            Caption = 'Sanitary protection no.';
            ToolTip = 'Specifies the value of the Sanitary protection no field.';
        }
        field(50038; Destination; Code[30])
        {
            Caption = 'Destination';
            ToolTip = 'Specifies the value of the Destination field.';
        }
        field(50039; "Reserved net kilos"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos (Base)" WHERE("Source ID" = CONST(''),
                                                                            "Source Ref. No." = FIELD("Entry No."),
                                                                            "Source Type" = CONST(32),
                                                                            "Source Subtype" = CONST("0"),
                                                                            "Source Batch Name" = CONST(''),
                                                                            "Source Prod. Order Line" = CONST(0),
                                                                            "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos';
            ToolTip = 'Specifies the value of the Reserved net kilos field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50040; "Reserved gross kilos"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Gross kilos (Base)" WHERE("Source ID" = CONST(''),
                                                                              "Source Ref. No." = FIELD("Entry No."),
                                                                              "Source Type" = CONST(32),
                                                                              "Source Subtype" = CONST("0"),
                                                                              "Source Batch Name" = CONST(''),
                                                                              "Source Prod. Order Line" = CONST(0),
                                                                              "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved gross kilos';
            ToolTip = 'Specifies the value of the Reserved gross kilos field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50077; "Seguimiento para trazabilidad"; Option)
        {
            Caption = 'Seguimiento para trazabilidad';
            ToolTip = 'Specifies the value of the Seguimiento para trazabilidad field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50079; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            ToolTip = 'Specifies the value of the Fórmula de aplicación de fechas de DCL field.';
            DataClassification = ToBeClassified;
        }
        field(50082; "MSC"; Boolean)
        {
            Caption = 'MSC';
            ToolTip = 'Specifies the value of the MSC field.';
            DataClassification = ToBeClassified;
        }
        field(50140; "No. reparto"; Code[20])
        {
            Caption = 'No. reparto';
            ToolTip = 'Specifies the value of the No. reparto field.';
            DataClassification = ToBeClassified;
        }
        field(50141; "Linea reparto"; Integer)
        {
            Caption = 'Linea reparto';
            ToolTip = 'Specifies the value of the Linea reparto field.';
            DataClassification = ToBeClassified;
        }
        field(50142; "Ommit position validation"; Boolean)
        {
            Caption = 'Omitir validación de posición';
            ToolTip = 'Specifies the value of the Omitir validación de posición field.';
            DataClassification = ToBeClassified;
        }
        field(50500; "Resultado x tenencia"; Decimal)
        {
            Caption = 'Resultado x tenencia';
            ToolTip = 'Specifies the value of the Resultado x tenencia field.';
            DecimalPlaces = 2 : 2;
        }
        field(50501; "Liq. x Mov. Cont"; Text[30])
        {
            Caption = 'Liq. x Mov. Cont';
            ToolTip = 'Specifies the value of the Liq. x Mov. Cont field.';

            trigger OnLookup()
            var
                rstMovCont: Record "G/L Entry";
                frmMovCont: Page "General Ledger Entries";
            begin
                Clear(rstMovCont);
                Clear(frmMovCont);
                rstMovCont.SetFilter(rstMovCont."Entry No.", "Liq. x Mov. Cont");
                frmMovCont.SetTableView(rstMovCont);
                frmMovCont.RunModal;
            end;
        }
        field(50502; "Concepto ajuste"; Code[20])
        {
            Caption = 'Concepto ajuste';
            ToolTip = 'Specifies the value of the Concepto ajuste field.';
            TableRelation = "AFIP Interface Register";
        }
        field(50503; "% Ajuste KN"; Decimal)
        {
            Caption = '% Ajuste KN';
            ToolTip = 'Specifies the value of the % Ajuste KN field.';
        }
        field(50504; "% Ajuste KB"; Decimal)
        {
            Caption = '% Ajuste KB';
            ToolTip = 'Specifies the value of the % Ajuste KB field.';
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            Caption = 'Nombre libro diario';
            ToolTip = 'Specifies the value of the Nombre libro diario field.';
        }
        field(50506; "Nombre seccion diario"; Code[10])
        {
            Caption = 'Nombre seccion diario';
            ToolTip = 'Specifies the value of the Nombre seccion diario field.';
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro diario"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(50510; "Buque Tercero"; Code[3])
        {
            Caption = 'Buque Tercero';
            ToolTip = 'Specifies the value of the Buque Tercero field.';
        }
        field(50511; "Marea Tercero"; Code[7])
        {
            Caption = 'Marea Tercero';
            ToolTip = 'Specifies the value of the Marea Tercero field.';
            Editable = true;
        }
        field(50521; "Importe IVA Recuperado"; Decimal)
        {
            Caption = 'Importe IVA Recuperado';
            ToolTip = 'Specifies the value of the Importe IVA Recuperado field.';
        }
        field(50522; Recuperable; Boolean)
        {
            Caption = 'Recuperable';
            ToolTip = 'Specifies the value of the Recuperable field.';
        }
        field(50523; "Lote origen"; Code[20])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
        }
        field(50525; "Filtro fecha"; Date)
        {
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
            FieldClass = FlowFilter;
        }
        field(50526; "% IVA"; Decimal)
        {
            Caption = '% IVA';
            ToolTip = 'Specifies the value of the % IVA field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50527; "Cód. área impuesto"; Code[20])
        {
            Caption = 'Tax Area Code';
            ToolTip = 'Specifies the value of the Tax Area Code field.';
            TableRelation = Area;
        }
        field(50528; "Cód. grupo impuesto"; Code[10])
        {
            Caption = 'Tax Group Code';
            ToolTip = 'Specifies the value of the Tax Group Code field.';
            TableRelation = Area;
        }
        field(50529; "Cód. retención IVA"; Code[20])
        {
            Caption = 'Cód. retención IVA';
            ToolTip = 'Specifies the value of the Cód. retención IVA field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));
        }
        field(50530; "Cód. retención SS"; Code[20])
        {
            Caption = 'Cód. retención SS';
            ToolTip = 'Specifies the value of the Cód. retención SS field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50531; "Cód. retención ganancias"; Code[20])
        {
            Caption = 'Cód. retención ganancias';
            ToolTip = 'Specifies the value of the Cód. retención ganancias field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50532; Factura; Boolean)
        {
            Caption = 'Factura';
            ToolTip = 'Specifies the value of the Factura field.';
        }
        field(50533; "Fecha recupero"; Date)
        {
            Caption = 'Fecha recupero';
            ToolTip = 'Specifies the value of the Fecha recupero field.';
        }
        field(50534; "Revisión manual"; Boolean)
        {
            Caption = 'Revisión manual';
            ToolTip = 'Specifies the value of the Revisión manual field.';
        }
        field(50535; "Fecha creación"; Date)
        {
            Caption = 'Creation Date';
            ToolTip = 'Specifies the value of the Creation Date field.';
        }
        field(50536; "Document filter"; Code[20])
        {
            Caption = 'Filtro documento';
            ToolTip = 'Specifies the value of the Filtro documento field.';
            FieldClass = FlowFilter;
        }
        field(50539; GS1; Text[250])
        {
            Caption = 'GS1';
            ToolTip = 'Specifies the value of the GS1 field.';
        }
        field(50540; "Ubicación"; Code[10])
        {
            Caption = 'Ubicación';
            ToolTip = 'Specifies the value of the Ubicación field.';
        }
        field(50541; "Importe div. adic."; Decimal)
        {
            Caption = 'Importe div. adic.';
            ToolTip = 'Specifies the value of the Importe div. adic field.';
            AutoFormatType = 1;
        }
        field(50542; "Consumir automáticamente"; Boolean)
        {
            Caption = 'Consumir automáticamente';
            ToolTip = 'Specifies the value of the Consumir automáticamente field.';
        }
        field(50543; Marcado; Boolean)
        {
            Caption = 'Marcado';
            ToolTip = 'Specifies the value of the Marcado field.';
        }
        field(50544; "Valor FIFO"; Decimal)
        {
            Caption = 'Valor FIFO';
            ToolTip = 'Specifies the value of the Valor FIFO field.';
        }
        field(50545; Pendiente; Decimal)
        {
            Caption = 'Pendiente';
            ToolTip = 'Specifies the value of the Pendiente field.';
        }
        field(50546; "FIFO Acumulado"; Decimal)
        {
            Caption = 'FIFO Acumulado';
            ToolTip = 'Specifies the value of the FIFO Acumulado field.';
        }
        field(50547; "Valued quantity"; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Item Ledger Entry Quantity" WHERE("Item Ledger Entry No." = FIELD("Entry No."),
                                                                                "Posting Date" = FIELD("Filtro fecha")));
            Caption = 'Cantidad valorada';
            ToolTip = 'Specifies the value of the Cantidad valorada field.';
            FieldClass = FlowField;
        }
        field(50548; "Applied quantity"; Decimal)
        {
            CalcFormula = Sum("Item Application Entry".Quantity WHERE("Inbound Item Entry No." = FIELD("Entry No."),
                                                                       "Posting Date" = FIELD("Filtro fecha")));
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            FieldClass = FlowField;
        }
        field(50596; Regenerado; Boolean)
        {
            Caption = 'Regenerado';
            ToolTip = 'Specifies the value of the Regenerado field.';
        }
        field(50597; "Fecha reversión"; Date)
        {
            Caption = 'Reverse Date';
            ToolTip = 'Specifies the value of the Reverse Date field.';
        }
        field(50598; "Usuario reversión"; Code[20])
        {
            Caption = 'Usuario reversión';
            ToolTip = 'Specifies the value of the Usuario reversión field.';
        }
        field(50599; Revertido; Boolean)
        {
            Caption = 'Reversed';
            ToolTip = 'Specifies the value of the Reversed field.';
        }
        field(50700; "No. Remito"; Code[30])
        {
            Caption = 'No. Remito';
            ToolTip = 'Specifies the value of the No. Remito field.';
        }
        field(50701; "No. Despacho"; Code[20])
        {
            Caption = 'No. Despacho';
            ToolTip = 'Specifies the value of the No. Despacho field.';
        }
        field(50702; "Cust. post. group"; Code[20])
        {
            Caption = 'Cust. post. group';
            ToolTip = 'Specifies the value of the Cust. post. group field.';
        }
        field(50703; "Bin code"; Code[20])
        {
            Caption = 'Cód. caja';
            ToolTip = 'Specifies the value of the Cód. caja field.';
            DataClassification = ToBeClassified;
            TableRelation = Bin.Code;
        }
    }

    keys
    {
        key(Key50001; "Job No.", "Document No.", "Location Code")
        {
        }
        key(Key50002; "Item No.", Open, Positive, "Location Code", "Posting Date", "Entry/Exit Point")
        {
        }
        key(Key50003; "Global Dimension 1 Code", "Item No.", "Global Dimension 2 Code", "Location Code", "Lot No.", "Entry/Exit Point", "Posting Date", Open)
        {
        }
        key(Key50004; "Global dimension 3 Code")
        {

        }
        key(Key50005; "Location Code", "Entry/Exit Point", "Item No.", Open, "Posting Date")
        {

        }
        key(Key50006; "Lote Origen", "Item type")
        {

        }
        key(Key50007; "Nombre libro diario", "Lote origen")
        {

        }
    }
    procedure ObtenerFactorLoteKN(codProducto: Code[50]; codLote: Code[50]; decCantidadaEnviar: Decimal): Decimal
    var
        rstProducto: Record Item;
        rstMovProducto: Record "Item Ledger Entry";
        rstConfExistencias: Record "Inventory Setup";
        decCantidad: Decimal;
        decKilosNetos: Decimal;
    begin
        Clear(rstProducto);
        rstProducto.Get(codProducto);
        Clear(rstMovProducto);
        Clear(rstConfExistencias);
        decCantidad := 0;
        decKilosNetos := 0;

        rstConfExistencias.Get();

        rstMovProducto.SetCurrentKey("Nombre libro diario", "Global Dimension 1 Code",
                                     "Global dimension 2 Code", "Lote origen", "Lot No.", "Item No.", "Item type");
        rstMovProducto.SetRange("Nombre libro diario", rstConfExistencias."Diario Descarga");
        rstMovProducto.SetRange("Item No.", codProducto);
        rstMovProducto.SetRange("Lot No.", codLote);
        if rstMovProducto.Find('-') then
            repeat

                decCantidad += rstMovProducto.Quantity;
                decKilosNetos += rstMovProducto."Net kilos";

            until rstMovProducto.Next = 0
        else begin

            decKilosNetos := rstProducto."Net Weight";
            exit(decCantidadaEnviar * decKilosNetos);

        end;

        if (decKilosNetos <> 0) and (decCantidad <> 0) then
            exit((decKilosNetos / decCantidad))
        else
            exit(0);
    end;

    procedure ObtenerFactorLoteKB(codProducto: Code[50]; codLote: Code[50]; decCantidadaEnviar: Decimal): Decimal
    var
        rstProducto: Record Item;
        rstMovProducto: Record "Item Ledger Entry";
        rstConfExistencias: Record "Inventory Setup";
        decCantidad: Decimal;
        decKilosBrutos: Decimal;
    begin
        Clear(rstProducto);
        rstProducto.Get(codProducto);
        Clear(rstMovProducto);
        Clear(rstConfExistencias);
        decCantidad := 0;
        decKilosBrutos := 0;

        rstConfExistencias.Get();

        rstMovProducto.SetCurrentKey("Nombre libro diario", "Global Dimension 1 Code",
                                     "Global dimension 2 Code", "Lote origen", "Lot No.", "Item No.", "Item type");
        rstMovProducto.SetRange("Nombre libro diario", rstConfExistencias."Diario Descarga");
        rstMovProducto.SetRange("Item No.", codProducto);
        rstMovProducto.SetRange("Lot No.", codLote);
        if rstMovProducto.Find('-') then
            repeat

                decCantidad += rstMovProducto.Quantity;
                decKilosBrutos += rstMovProducto."Gross kilos";

            until rstMovProducto.Next = 0
        else begin

            decKilosBrutos := rstProducto."Gross Weight";
            exit(decCantidadaEnviar * decKilosBrutos);

        end;

        if (decKilosBrutos <> 0) and (decCantidad <> 0) then
            exit((decKilosBrutos / decCantidad))
        else
            exit(0);

    end;

    procedure ObtenerFactorLoteOrigenKN(codProducto: Code[50]; codLote: Code[50]; decCantidadaEnviar: Decimal): Decimal
    var
        rstProducto: Record Item;
        rstMovProducto: Record "Item Ledger Entry";
        rstConfExistencias: Record "Inventory Setup";
        decCantidad: Decimal;
        decKilosNetos: Decimal;
    begin
        Clear(rstProducto);
        rstProducto.Get(codProducto);
        Clear(rstMovProducto);
        Clear(rstConfExistencias);
        decCantidad := 0;
        decKilosNetos := 0;

        rstConfExistencias.Get();

        rstMovProducto.SetCurrentKey("Nombre libro diario", "Global Dimension 1 Code", "Lote origen", "Lot No.", "Item No.", "Item type");
        rstMovProducto.SetFilter("Nombre libro diario", '%1|%2', rstConfExistencias."Diario Descarga", '');
        rstMovProducto.SetFilter("Entry Type", '%1|%2|%3', rstMovProducto."Entry Type"::Purchase,
                                                             rstMovProducto."Entry Type"::"Positive Adjmt.",
                                                             rstMovProducto."Entry Type"::"Negative Adjmt.");
        rstMovProducto.SetRange("Item No.", codProducto);
        rstMovProducto.SetRange("Lote origen", codLote);

        if rstMovProducto.Find('-') then
            repeat

                decCantidad += rstMovProducto.Quantity;
                decKilosNetos += rstMovProducto."Net kilos";

            until rstMovProducto.Next = 0
        else begin

            decKilosNetos := rstProducto."Net Weight";
            exit(decCantidadaEnviar * decKilosNetos);

        end;

        if (decKilosNetos <> 0) and (decCantidad <> 0) then
            exit((decKilosNetos / decCantidad))
        else
            exit(0);

    end;

    procedure ObtenerFactorLoteOrigenKB(codProducto: Code[50]; codLote: Code[50]; decCantidadaEnviar: Decimal): Decimal
    var
        rstProducto: Record Item;
        rstMovProducto: Record "Item Ledger Entry";
        rstConfExistencias: Record "Inventory Setup";
        decCantidad: Decimal;
        decKilosBrutos: Decimal;
    begin
        Clear(rstProducto);
        rstProducto.Get(codProducto);
        Clear(rstMovProducto);
        Clear(rstConfExistencias);
        decCantidad := 0;
        decKilosBrutos := 0;

        rstConfExistencias.Get();

        rstMovProducto.SetCurrentKey("Nombre libro diario", "Global Dimension 1 Code", "Lote origen", "Lot No.", "Item No.", "Item type");

        rstMovProducto.SetFilter("Nombre libro diario", '%1|%2', rstConfExistencias."Diario Descarga", '');
        rstMovProducto.SetFilter("Entry Type", '%1|%2|%3', rstMovProducto."Entry Type"::Purchase,
                                                             rstMovProducto."Entry Type"::"Positive Adjmt.",
                                                             rstMovProducto."Entry Type"::"Negative Adjmt.");
        rstMovProducto.SetRange("Item No.", codProducto);
        rstMovProducto.SetRange("Lote origen", codLote);
        if rstMovProducto.Find('-') then
            repeat

                decCantidad += rstMovProducto.Quantity;
                decKilosBrutos += rstMovProducto."Gross kilos";

            until rstMovProducto.Next = 0
        else begin

            decKilosBrutos := rstProducto."Gross Weight";
            exit(decCantidadaEnviar * decKilosBrutos);

        end;

        if (decKilosBrutos <> 0) and (decCantidad <> 0) then
            exit((decKilosBrutos / decCantidad))
        else
            exit(0);

        /*ELSE
        BEGIN
        
          decKilosBrutos := rstProducto."Peso bruto";
          EXIT(1);
        
        END;
        
        IF (decKilosBrutos <> 0) AND (decCantidad <> 0) THEN
          EXIT((decKilosBrutos/decCantidad))
        ELSE
          EXIT(0);
         */

    end;


    //Unsupported feature: Deletion (VariableCollection) on "CalculateRemQuantity(PROCEDURE 10).RemQty(Variable 1003)".



    //Unsupported feature: Property Modification (TextConstString) on "IsNotOnInventoryErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //IsNotOnInventoryErr : ENU=You have insufficient quantity of Item %1 on inventory.;ESP=Dispone de una cantidad insuficiente del producto %1 en stock.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsNotOnInventoryErr : ENU=You have insufficient quantity of Item %1 on inventory.;ESP=Dispone de una cantidad insuficiente del producto %1 en stock. Referencias: Depósito %2, Lote %3., Proyecto %4, Ln. proyecto %5;
    //Variable type has not been exported.

    var
        rstMovCont: Record "G/L Entry";
}

