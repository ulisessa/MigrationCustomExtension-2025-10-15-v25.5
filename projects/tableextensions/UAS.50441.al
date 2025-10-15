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
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50003; "Global dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';

        }
        field(50005; "Job concept"; Code[10])
        {
            Caption = 'Job concept';
            TableRelation = "Concepto proyecto";
        }
        field(50010; "Pallet no."; Code[20])
        {
            Caption = 'Pallet no.';
        }
        field(50011; "No. proyecto"; Code[20])
        {
            Caption = 'Job no.';
            TableRelation = Job."No.";
        }
        field(50012; "No. proyecto destino"; Code[20])
        {
            Caption = 'Destination job no.';
            TableRelation = Job."No.";
        }
        field(50013; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
        }
        field(50014; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
        }
        field(50015; "% price per kilo"; Decimal)
        {
            Caption = '% price per kilo';
        }
        field(50018; "Remaining gross kilos"; Decimal)
        {
            Caption = 'Remaining gross kilos';
        }
        field(50019; "Remaining net kilos"; Decimal)
        {
            Caption = 'Remaining net kilos';
        }
        field(50021; "Item type"; Option)
        {
            Caption = 'Item type';
            OptionCaption = 'Consumption,Fishing';
            OptionMembers = Consumo,Pesca;
        }
        field(50022; "Request header no."; Code[30])
        {
            Caption = 'Request header no.';
        }
        field(50023; "Request line no."; Integer)
        {
            Caption = 'Request line no.';
        }
        field(50024; "Invoiced net kilos"; Decimal)
        {
            Caption = 'Invoiced net kilos';
            DecimalPlaces = 0 : 5;
        }
        field(50025; "Invoiced gross kilos"; Decimal)
        {
            Caption = 'Invoiced gross kilos';
        }
        field(50026; Family; Code[3])
        {
            Caption = 'Family';
            TableRelation = "Familia producto";
        }
        field(50027; Subfamily; Code[20])
        {
            Caption = 'Subfamily';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50028; "Production date"; Date)
        {
            Caption = 'Production date';
        }
        field(50029; "Quantity in shipments"; Decimal)
        {
            Caption = 'Quantity in shipments';
        }
        field(50030; "Shipped nk Not Returned"; Decimal)
        {
            Caption = 'Shipped nk Not Returned';
            DecimalPlaces = 0 : 5;
        }
        field(50031; "Shipped gk Not Returned"; Decimal)
        {
            Caption = 'Shipped gk Not Returned';
            DecimalPlaces = 0 : 5;
        }
        field(50033; "Transport registration"; Code[10])
        {
            Caption = 'Transport registration';
        }
        field(50034; Temperature; Decimal)
        {
            Caption = 'Temperature';
        }
        field(50035; "Time of arrival"; Time)
        {
            Caption = 'Time of arrival';
        }
        field(50036; "Sanitary protection type"; Option)
        {
            BlankZero = true;
            Caption = 'Sanitary protection type';
            OptionCaption = ',P.T.,P.T.R.,C.S.E.P.,Transit guide';
            OptionMembers = ,"P.T.","P.T.R.","C.S.E.P.","Guía de tránsito";
        }
        field(50037; "Sanitary protection no."; Code[30])
        {
            Caption = 'Sanitary protection no.';
        }
        field(50038; Destination; Code[30])
        {
            Caption = 'Destination';
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
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50077; "Seguimiento para trazabilidad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(50079; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            DataClassification = ToBeClassified;
        }
        field(50140; "No. reparto"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50141; "Linea reparto"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50142; "Ommit position validation"; Boolean)
        {
            Caption = 'Omitir validación de posición';
            DataClassification = ToBeClassified;
        }
        field(50500; "Resultado x tenencia"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(50501; "Liq. x Mov. Cont"; Text[30])
        {

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
            TableRelation = "AFIP Interface Register";
        }
        field(50503; "% Ajuste KN"; Decimal)
        {
        }
        field(50504; "% Ajuste KB"; Decimal)
        {
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
        }
        field(50506; "Nombre seccion diario"; Code[10])
        {
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro diario"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(50510; "Buque Tercero"; Code[3])
        {
        }
        field(50511; "Marea Tercero"; Code[7])
        {
            Editable = true;
        }
        field(50521; "Importe IVA Recuperado"; Decimal)
        {
        }
        field(50522; Recuperable; Boolean)
        {
        }
        field(50523; "Lote origen"; Code[20])
        {
        }
        field(50525; "Filtro fecha"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50526; "% IVA"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50527; "Cód. área impuesto"; Code[20])
        {
            TableRelation = Area;
        }
        field(50528; "Cód. grupo impuesto"; Code[10])
        {
            TableRelation = Area;
        }
        field(50529; "Cód. retención IVA"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));
        }
        field(50530; "Cód. retención SS"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50531; "Cód. retención ganancias"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50532; Factura; Boolean)
        {
        }
        field(50533; "Fecha recupero"; Date)
        {
        }
        field(50534; "Revisión manual"; Boolean)
        {
        }
        field(50535; "Fecha creación"; Date)
        {
        }
        field(50536; "Document filter"; Code[20])
        {
            Caption = 'Filtro documento';
            FieldClass = FlowFilter;
        }
        field(50539; GS1; Text[250])
        {
        }
        field(50540; "Ubicación"; Code[10])
        {
        }
        field(50541; "Importe div. adic."; Decimal)
        {
            AutoFormatType = 1;
        }
        field(50542; "Consumir automáticamente"; Boolean)
        {
        }
        field(50543; Marcado; Boolean)
        {
        }
        field(50544; "Valor FIFO"; Decimal)
        {
        }
        field(50545; Pendiente; Decimal)
        {
        }
        field(50546; "FIFO Acumulado"; Decimal)
        {
        }
        field(50547; "Valued quantity"; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Item Ledger Entry Quantity" WHERE("Item Ledger Entry No." = FIELD("Entry No."),
                                                                                "Posting Date" = FIELD("Filtro fecha")));
            Caption = 'Cantidad valorada';
            FieldClass = FlowField;
        }
        field(50548; "Applied quantity"; Decimal)
        {
            CalcFormula = Sum("Item Application Entry".Quantity WHERE("Inbound Item Entry No." = FIELD("Entry No."),
                                                                       "Posting Date" = FIELD("Filtro fecha")));
            Caption = 'Cantidad aplicada';
            FieldClass = FlowField;
        }
        field(50596; Regenerado; Boolean)
        {
        }
        field(50597; "Fecha reversión"; Date)
        {
        }
        field(50598; "Usuario reversión"; Code[20])
        {
        }
        field(50599; Revertido; Boolean)
        {
        }
        field(50700; "No. Remito"; Code[30])
        {
        }
        field(50701; "No. Despacho"; Code[20])
        {
        }
        field(50702; "Cust. post. group"; Code[20])
        {
        }
        field(50703; "Bin code"; Code[20])
        {
            Caption = 'Cód. caja';
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

