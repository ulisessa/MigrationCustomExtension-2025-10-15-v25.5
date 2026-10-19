table 50514 "Hist. Lín. solicitud"
{
    // IBdos Argentina - USS - 111102 - Adición Arbumasa
    // 
    // IBdos Argentina - USS - 020303 - Modificación Arbumasa
    //  a) Adición de función Navegar

    DataCaptionFields = "Nombre libro Solicitud", "No. línea";

    fields
    {
        field(1; "Nombre libro Solicitud"; Code[10])
        {
            Caption = 'Nombre libro Solicitud';
            ToolTip = 'Specifies the value of the Nombre libro Solicitud field.';
            TableRelation = "Req. Wksh. Template";
        }
        field(2; "Tipo documento"; Text[50])
        {
            Caption = 'Document Type';
            ToolTip = 'Specifies the value of the Document Type field.';
            TableRelation = "Tipos documento";
        }
        field(3; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(4; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
            Editable = true;
            InitValue = Producto;
            OptionMembers = " ",Cuenta,Producto,Recurso;
        }
        field(5; "No."; Code[30])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            TableRelation = IF (Tipo = CONST(Cuenta)) "G/L Account"
            ELSE
            IF (Tipo = CONST(Producto)) Item
            ELSE
            IF (Tipo = CONST(Recurso)) Resource;

            trigger OnValidate()
            begin
                if "No." = '' then
                    exit;

                TestField(Tipo);
                case Tipo of
                    Tipo::Cuenta:
                        begin
                            CGCta.Get("No.");
                            CGCta.CheckGLAcc;
                            CGCta.TestField("Direct Posting", true);
                            Descripción := CGCta.Name;
                        end;
                    Tipo::Producto:
                        begin
                            TraeProd;
                            Producto.TestField(Blocked, false);
                            Validate("Cód. unidad medida", Producto."Purch. Unit of Measure");
                            Descripción := Producto.Description;
                        end;
                    Tipo::Recurso:
                        Error('No se pueden comprar recursos.');
                end;
            end;
        }
        field(6; "Descripción"; Text[199])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(7; "Descripción 2"; Text[60])
        {
            Caption = 'Description 2';
            ToolTip = 'Specifies the value of the Description 2 field.';
        }
        field(8; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            DecimalPlaces = 0 : 5;
        }
        field(12; "Fecha recepción esperada"; Date)
        {
            Caption = 'Expected Receipt Date';
            ToolTip = 'Specifies the value of the Expected Receipt Date field.';

            trigger OnValidate()
            var
                ComproConfliFecha: Codeunit "Reservation-Check Date Confl.";
            begin
            end;
        }
        field(13; "Id. solicitante"; Code[50])
        {
            Caption = 'Id. solicitante';
            ToolTip = 'Specifies the value of the Id. solicitante field.';
            TableRelation = User."User Name";
        }
        field(15; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(16; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(17; "Cód. Depósito"; Code[10])
        {
            Caption = 'Cód. Depósito';
            ToolTip = 'Specifies the value of the Cód. Depósito field.';
            TableRelation = Location;
        }
        field(21; "Fecha pedido"; Date)
        {
            Caption = 'Fecha pedido';
            ToolTip = 'Specifies the value of the Fecha pedido field.';
        }
        field(23; "No documento compras"; Code[30])
        {
            Caption = 'No documento compras';
            ToolTip = 'Specifies the value of the No documento compras field.';
            Editable = true;
        }
        field(24; "No línea documento compras"; Integer)
        {
            Caption = 'No línea documento compras';
            ToolTip = 'Specifies the value of the No línea documento compras field.';
            Editable = true;
        }
        field(5404; "Cdad. por unidad medida"; Decimal)
        {
            Caption = 'Cdad. por unidad medida';
            ToolTip = 'Specifies the value of the Cdad. por unidad medida field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(5407; "Cód. unidad medida"; Code[10])
        {
            Caption = 'Cód. unidad medida';
            ToolTip = 'Specifies the value of the Cód. unidad medida field.';
            TableRelation = IF (Tipo = CONST(Producto)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."))
            ELSE
            "Unit of Measure";
        }
        field(50000; "Global Dimension 3"; Code[10])
        {
            Caption = 'Global Dimension 3';
            ToolTip = 'Specifies the value of the Global Dimension 3 field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cód. 3oNivel"));
            end;
        }
        field(50001; "Global Dimension 4"; Code[10])
        {
            Caption = 'Global Dimension 4';
            ToolTip = 'Specifies the value of the Global Dimension 4 field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5"; Code[20])
        {
            Caption = 'Global Dimension 5';
            ToolTip = 'Specifies the value of the Global Dimension 5 field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6"; Code[20])
        {
            Caption = 'Global Dimension 6';
            ToolTip = 'Specifies the value of the Global Dimension 6 field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7"; Code[20])
        {
            Caption = 'Global Dimension 7';
            ToolTip = 'Specifies the value of the Global Dimension 7 field.';
            CaptionClass = '1,2,7';

        }
        field(50005; "No. Documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';

            trigger OnLookup()
            begin
                Clear(PunCabSolicitud);
                PunCabSolicitud.SetRange(PunCabSolicitud."Nombre libro Solicitud", "Nombre libro Solicitud");
                PunCabSolicitud.SetRange("No. Documento", "No. Documento");
                PAGE.Run(50514, PunCabSolicitud);
            end;
        }
        field(50006; Aprobado; Boolean)
        {
            Caption = 'Aprobado';
            ToolTip = 'Specifies the value of the Aprobado field.';
        }
        field(50007; "Usuario Aprobación"; Code[20])
        {
            Caption = 'Usuario Aprobación';
            ToolTip = 'Specifies the value of the Usuario Aprobación field.';
        }
        field(50008; Registrado; Boolean)
        {
            Caption = 'Registrado';
            ToolTip = 'Specifies the value of the Registrado field.';
        }
        field(50009; Proveedor; Code[20])
        {
            Caption = 'Proveedor';
            ToolTip = 'Specifies the value of the Proveedor field.';
            CalcFormula = Lookup(Item."Vendor No." WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50010; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            TableRelation = Estados;
        }
        field(50011; "Objeto adjunto"; Text[250])
        {
            Caption = 'Objeto adjunto';
            ToolTip = 'Specifies the value of the Objeto adjunto field.';
        }
        field(50012; "Cantidad pendiente recibir"; Decimal)
        {
            Caption = 'Cantidad pendiente recibir';
            ToolTip = 'Specifies the value of the Cantidad pendiente recibir field.';
        }
        field(50013; "Cantidad pendiente facturar"; Decimal)
        {
            Caption = 'Cantidad pendiente facturar';
            ToolTip = 'Specifies the value of the Cantidad pendiente facturar field.';
        }
        field(50014; "Capturado por Usuario"; Code[20])
        {
            Caption = 'Capturado por Usuario';
            ToolTip = 'Specifies the value of the Capturado por Usuario field.';
            TableRelation = User;
        }
        field(50015; "Cancelado por motivo"; Text[250])
        {
            Caption = 'Cancelado por motivo';
            ToolTip = 'Specifies the value of the Cancelado por motivo field.';

            trigger OnValidate()
            begin
                TestField(Aprobado, false);
            end;
        }
        field(50016; "Compra a No proveedor"; Code[20])
        {
            Caption = 'Compra a No proveedor';
            ToolTip = 'Specifies the value of the Compra a No proveedor field.';
            TableRelation = Vendor;
        }
        field(50017; "Compra a Nombre proveedor"; Text[250])
        {
            Caption = 'Compra a Nombre proveedor';
            ToolTip = 'Specifies the value of the Compra a Nombre proveedor field.';
        }
        field(50018; "Factura a No proveedor"; Code[20])
        {
            Caption = 'Factura a No proveedor';
            ToolTip = 'Specifies the value of the Factura a No proveedor field.';
            TableRelation = Vendor;
        }
        field(50019; "Factura a Nombre proveedor"; Text[250])
        {
            Caption = 'Factura a Nombre proveedor';
            ToolTip = 'Specifies the value of the Factura a Nombre proveedor field.';
        }
        field(50020; "Ultima Cotización"; Code[20])
        {
            Caption = 'Ultima Cotización';
            ToolTip = 'Specifies the value of the Ultima Cotización field.';
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Quote));
        }
        field(50021; "No línea cotización"; Integer)
        {
            Caption = 'No línea cotización';
            ToolTip = 'Specifies the value of the No línea cotización field.';
        }
        field(50022; "Ultimo Pedido"; Code[20])
        {
            Caption = 'Ultimo Pedido';
            ToolTip = 'Specifies the value of the Ultimo Pedido field.';
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(50023; "No línea pedido"; Integer)
        {
            Caption = 'No línea pedido';
            ToolTip = 'Specifies the value of the No línea pedido field.';
        }
        field(50024; "Ultima Factura"; Code[20])
        {
            Caption = 'Ultima Factura';
            ToolTip = 'Specifies the value of the Ultima Factura field.';
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Invoice));
        }
        field(50025; "No línea factura"; Integer)
        {
            Caption = 'No línea factura';
            ToolTip = 'Specifies the value of the No línea factura field.';
        }
        field(50026; "Pedidos involucrados"; Code[250])
        {
            Caption = 'Pedidos involucrados';
            ToolTip = 'Specifies the value of the Pedidos involucrados field.';
        }
        field(50027; "Remitos involucrados"; Code[250])
        {
            Caption = 'Remitos involucrados';
            ToolTip = 'Specifies the value of the Remitos involucrados field.';
        }
        field(50028; Consumida; Option)
        {
            Caption = 'Consumida';
            ToolTip = 'Specifies the value of the Consumida field.';
            OptionMembers = Consumida,"No consumida";
        }
        field(50029; "Fecha consumo"; Date)
        {
            Caption = 'Fecha consumo';
            ToolTip = 'Specifies the value of the Fecha consumo field.';
        }
        field(50030; "Carpeta importación"; Code[200])
        {
            Caption = 'Carpeta importación';
            ToolTip = 'Specifies the value of the Carpeta importación field.';
        }
        field(50032; "Fecha aprobación"; Date)
        {
            Caption = 'Approval Date';
            ToolTip = 'Specifies the value of the Approval Date field.';
        }
        field(50033; "Cant. Recibida"; Decimal)
        {
            Caption = 'Cant. Recibida';
            ToolTip = 'Specifies the value of the Cant. Recibida field.';
            CalcFormula = Sum("Purch. Rcpt. Line".Quantity WHERE("No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                  "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50034; "Cant. Facturada"; Decimal)
        {
            Caption = 'Cant. Facturada';
            ToolTip = 'Specifies the value of the Cant. Facturada field.';
            CalcFormula = Sum("Purch. Inv. Line".Quantity WHERE("No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                 "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50035; Remitos; Integer)
        {
            Caption = 'Remitos';
            ToolTip = 'Specifies the value of the Remitos field.';
            CalcFormula = Count("Item Ledger Entry" WHERE("Request header no." = FIELD("No. Documento"),
                                                           "Request line no." = FIELD("No. línea"),
                                                           Quantity = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50036; Facturas; Integer)
        {
            Caption = 'Facturas';
            ToolTip = 'Specifies the value of the Facturas field.';
            CalcFormula = Count("Item Ledger Entry" WHERE("Request header no." = FIELD("No. Documento"),
                                                           "Request line no." = FIELD("No. línea"),
                                                           "Invoiced Quantity" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50037; "Cantidad pendiente cotización"; Decimal)
        {
            Caption = 'Cantidad pendiente cotización';
            ToolTip = 'Specifies the value of the Cantidad pendiente cotización field.';
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = CONST(Quote),
                                                              "No. Cab. Solicitud" = FIELD("No. Documento"),
                                                              "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50038; "Cantidad pendiente en OC"; Decimal)
        {
            Caption = 'Cantidad pendiente en OC';
            ToolTip = 'Specifies the value of the Cantidad pendiente en OC field.';
            CalcFormula = Sum("Purchase Line"."Outstanding Quantity" WHERE("Document Type" = CONST(Order),
                                                                            "No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                            "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50039; "Cantidad pendiente en Factura"; Decimal)
        {
            Caption = 'Cantidad pendiente en Factura';
            ToolTip = 'Specifies the value of the Cantidad pendiente en Factura field.';
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = CONST(Invoice),
                                                              "No. Cab. Solicitud" = FIELD("No. Documento"),
                                                              "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50040; "Filtro OC"; Code[20])
        {
            Caption = 'Filtro OC';
            ToolTip = 'Specifies the value of the Filtro OC field.';
        }
        field(50041; "Fecha entrega solicitada"; Date)
        {
            Caption = 'Fecha entrega solicitada';
            ToolTip = 'Specifies the value of the Fecha entrega solicitada field.';
            CalcFormula = Lookup("Hist. Cab. solicitud"."Fecha Entrega" WHERE("Nombre libro Solicitud" = FIELD("Nombre libro Solicitud"),
                                                                               "No. Documento" = FIELD("No. Documento")));
            FieldClass = FlowField;
        }
        field(50042; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            ToolTip = 'Specifies the value of the Fecha registro field.';
            CalcFormula = Lookup("Hist. Cab. solicitud"."Fecha registro" WHERE("Nombre libro Solicitud" = FIELD("Nombre libro Solicitud"),
                                                                                "No. Documento" = FIELD("No. Documento")));
            FieldClass = FlowField;
        }
        field(50043; "Concepto proyecto"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
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
    }

    keys
    {
        key(Key1; "Nombre libro Solicitud", "No. Documento", "No. línea")
        {
            Clustered = true;
            SQLIndex = "Nombre libro Solicitud", "No. Documento", "No. línea";
        }
        key(Key2; "No.")
        {
        }
        key(Key3; Tipo, "No.", Estado)
        {
            SumIndexFields = Cantidad, "Cantidad pendiente recibir";
        }
        key(Key4; "No.", Estado)
        {
            SumIndexFields = Cantidad;
        }
        key(Key5; "No. Documento", "No. línea")
        {
        }
        key(Key6; "No. Documento", Estado)
        {
        }
        key(Key7; "No documento compras", "No línea documento compras")
        {
        }
        key(Key8; Aprobado, Registrado, "No documento compras")
        {
        }
        key(Key9; Aprobado, Registrado, "Nombre libro Solicitud", "No. Documento", "No. línea")
        {
        }
        key(Key10; "Fecha aprobación")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Producto: Record Item;
        CGCta: Record "G/L Account";
        PunCabSolicitud: Record "Hist. Cab. solicitud";

    local procedure TraeProd()
    begin
        TestField("No.");
        if "No." <> Producto."No." then
            Producto.Get("No.");
    end;

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        //IBdos Argentina - USS - 020303 - Inicio Modificación Arbumasa
        //Adición de función Navegar

        FormNavegar.SetDoc("Fecha pedido", "No documento compras");
        FormNavegar.Run;

        //IBdos Argentina - USS - 020303 - Fin Modificación Arbumasa
    end;
}

