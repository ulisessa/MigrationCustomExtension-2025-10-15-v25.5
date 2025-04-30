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
            TableRelation = "Req. Wksh. Template";
        }
        field(2; "Tipo documento"; Text[50])
        {
            TableRelation = "Tipos documento";
        }
        field(3; "No. línea"; Integer)
        {
        }
        field(4; Tipo; Option)
        {
            Editable = true;
            InitValue = Producto;
            OptionMembers = " ",Cuenta,Producto,Recurso;
        }
        field(5; "No."; Code[30])
        {
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
        }
        field(7; "Descripción 2"; Text[60])
        {
        }
        field(8; Cantidad; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(12; "Fecha recepción esperada"; Date)
        {

            trigger OnValidate()
            var
                ComproConfliFecha: Codeunit "Reservation-Check Date Confl.";
            begin
            end;
        }
        field(13; "Id. solicitante"; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(15; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(16; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(17; "Cód. Depósito"; Code[10])
        {
            TableRelation = Location;
        }
        field(21; "Fecha pedido"; Date)
        {
        }
        field(23; "No documento compras"; Code[30])
        {
            Editable = true;
        }
        field(24; "No línea documento compras"; Integer)
        {
            Editable = true;
        }
        field(5404; "Cdad. por unidad medida"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;
        }
        field(5407; "Cód. unidad medida"; Code[10])
        {
            TableRelation = IF (Tipo = CONST(Producto)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."))
            ELSE
            "Unit of Measure";
        }
        field(50000; "Global Dimension 3"; Code[10])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cód. 3oNivel"));
            end;
        }
        field(50001; "Global Dimension 4"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Global Dimension 5"; Code[20])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Global Dimension 6"; Code[20])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Global Dimension 7"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50005; "No. Documento"; Code[30])
        {

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
        }
        field(50007; "Usuario Aprobación"; Code[20])
        {
        }
        field(50008; Registrado; Boolean)
        {
        }
        field(50009; Proveedor; Code[20])
        {
            CalcFormula = Lookup(Item."Vendor No." WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50010; Estado; Text[50])
        {
            TableRelation = Estados;
        }
        field(50011; "Objeto adjunto"; Text[250])
        {
        }
        field(50012; "Cantidad pendiente recibir"; Decimal)
        {
        }
        field(50013; "Cantidad pendiente facturar"; Decimal)
        {
        }
        field(50014; "Capturado por Usuario"; Code[20])
        {
            TableRelation = User;
        }
        field(50015; "Cancelado por motivo"; Text[250])
        {

            trigger OnValidate()
            begin
                TestField(Aprobado, false);
            end;
        }
        field(50016; "Compra a No proveedor"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50017; "Compra a Nombre proveedor"; Text[250])
        {
        }
        field(50018; "Factura a No proveedor"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50019; "Factura a Nombre proveedor"; Text[250])
        {
        }
        field(50020; "Ultima Cotización"; Code[20])
        {
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Quote));
        }
        field(50021; "No línea cotización"; Integer)
        {
        }
        field(50022; "Ultimo Pedido"; Code[20])
        {
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(50023; "No línea pedido"; Integer)
        {
        }
        field(50024; "Ultima Factura"; Code[20])
        {
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Invoice));
        }
        field(50025; "No línea factura"; Integer)
        {
        }
        field(50026; "Pedidos involucrados"; Code[250])
        {
        }
        field(50027; "Remitos involucrados"; Code[250])
        {
        }
        field(50028; Consumida; Option)
        {
            OptionMembers = Consumida,"No consumida";
        }
        field(50029; "Fecha consumo"; Date)
        {
        }
        field(50030; "Carpeta importación"; Code[200])
        {
        }
        field(50032; "Fecha aprobación"; Date)
        {
        }
        field(50033; "Cant. Recibida"; Decimal)
        {
            CalcFormula = Sum("Purch. Rcpt. Line".Quantity WHERE("No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                  "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50034; "Cant. Facturada"; Decimal)
        {
            CalcFormula = Sum("Purch. Inv. Line".Quantity WHERE("No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                 "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50035; Remitos; Integer)
        {
            CalcFormula = Count("Item Ledger Entry" WHERE("Request header no." = FIELD("No. Documento"),
                                                           "Request line no." = FIELD("No. línea"),
                                                           Quantity = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50036; Facturas; Integer)
        {
            CalcFormula = Count("Item Ledger Entry" WHERE("Request header no." = FIELD("No. Documento"),
                                                           "Request line no." = FIELD("No. línea"),
                                                           "Invoiced Quantity" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50037; "Cantidad pendiente cotización"; Decimal)
        {
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = CONST(Quote),
                                                              "No. Cab. Solicitud" = FIELD("No. Documento"),
                                                              "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50038; "Cantidad pendiente en OC"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Outstanding Quantity" WHERE("Document Type" = CONST(Order),
                                                                            "No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                            "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50039; "Cantidad pendiente en Factura"; Decimal)
        {
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = CONST(Invoice),
                                                              "No. Cab. Solicitud" = FIELD("No. Documento"),
                                                              "No. Linea Solicitud" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(50040; "Filtro OC"; Code[20])
        {
        }
        field(50041; "Fecha entrega solicitada"; Date)
        {
            CalcFormula = Lookup("Hist. Cab. solicitud"."Fecha Entrega" WHERE("Nombre libro Solicitud" = FIELD("Nombre libro Solicitud"),
                                                                               "No. Documento" = FIELD("No. Documento")));
            FieldClass = FlowField;
        }
        field(50042; "Fecha registro"; Date)
        {
            CalcFormula = Lookup("Hist. Cab. solicitud"."Fecha registro" WHERE("Nombre libro Solicitud" = FIELD("Nombre libro Solicitud"),
                                                                                "No. Documento" = FIELD("No. Documento")));
            FieldClass = FlowField;
        }
        field(50043; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Concepto proyecto";
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

