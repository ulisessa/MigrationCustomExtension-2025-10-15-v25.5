table 50512 "Lín. solicitud"
{
    // IBdos Argentina - USS - 111102 - Adicion Arbumasa
    // 
    // IBdos Argentina - USS - 070103 - Modificacion Arbumasa
    //  a) Copio valores de la cabecera
    // 
    // IBdos Argentina - USS - 090503 - Modificacion Arbumasa
    //  a) Para adjuntar archivos
    // 
    // IBdos Argentina - USS - 060603 - Modificacion Arbumasa
    //  a) Debe traer la fecha de recepcion esperada de la cabecera

    DataCaptionFields = "Nombre libro Solicitud", "No. linea";

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
        field(3; "No. linea"; Integer)
        {
            Caption = 'No. linea';
            ToolTip = 'Specifies the value of the No. linea field.';
        }
        field(4; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
            Editable = true;
            InitValue = Producto;
            OptionMembers = " ",Cuenta,Producto,Recurso;

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(5; "No."; Code[30])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            NotBlank = true;
            TableRelation = IF (Tipo = CONST(Cuenta)) "G/L Account" WHERE(Blocked = FILTER(false))
            ELSE
            IF (Tipo = CONST(Producto)) Item WHERE(Blocked = FILTER(false))
            ELSE
            IF (Tipo = CONST(Recurso)) Resource WHERE(Type = CONST(Expense),
                                                                          Blocked = FILTER(false));

            trigger OnValidate()
            begin
                fntSeguridad;
                if "No." = '' then
                    exit;

                TestField(Tipo);
                case Tipo of
                    Tipo::Cuenta:
                        begin
                            CGCta.Get("No.");
                            CGCta.CheckGLAcc;
                            CGCta.TestField("Direct Posting", true);
                            Descripcion := CGCta.Name;
                        end;
                    Tipo::Producto:
                        begin
                            TraeProd;
                            Producto.TestField(Blocked, false);
                            Validate("Cod. unidad medida", Producto."Purch. Unit of Measure");
                            Descripcion := Producto.Description;

                            //IBdos Argentina - USS - 070103 - Inicio Modificacion Arbumasa
                            //Copio valores de la cabecera

                            "Cod. unidad medida" := Producto."Base Unit of Measure";
                            PunCabSol.Reset;
                            PunCabSol.Get("Nombre libro Solicitud", "No. Documento");
                            if PunCabSol."Global Dimension 1" <> '' then
                                "Global Dimension 1" := PunCabSol."Global Dimension 1";
                            if PunCabSol."Global Dimension 2" <> '' then
                                "Global Dimension 2" := PunCabSol."Global Dimension 2";
                            if PunCabSol."Global Dimension 3" <> '' then
                                "Global Dimension 3" := PunCabSol."Global Dimension 3";
                            if PunCabSol."Global Dimension 4" <> '' then
                                "Global Dimension 4" := PunCabSol."Global Dimension 4";
                            if PunCabSol."Global Dimension 5" <> '' then
                                "Global Dimension 5" := PunCabSol."Global Dimension 5";
                            if PunCabSol."Global Dimension 6" <> '' then
                                "Global Dimension 6" := PunCabSol."Global Dimension 6";
                            if PunCabSol."Global Dimension 7" <> '' then
                                "Global Dimension 7" := PunCabSol."Global Dimension 7";

                            //IBdos Argentina - USS - 070103 - Fin Modificacion Arbumasa

                        end;
                    Tipo::Recurso:
                        begin

                            Clear(rstRecurso);
                            rstRecurso.Get("No.");
                            rstRecurso.TestField(rstRecurso.Blocked, false);
                            Validate("Cod. unidad medida", rstRecurso."Base Unit of Measure");
                            Descripcion := rstRecurso.Name;
                            PunCabSol.Reset;
                            PunCabSol.Get("Nombre libro Solicitud", "No. Documento");
                            if PunCabSol."Global Dimension 1" <> '' then
                                "Global Dimension 1" := PunCabSol."Global Dimension 1";
                            if PunCabSol."Global Dimension 2" <> '' then
                                "Global Dimension 2" := PunCabSol."Global Dimension 2";
                            if PunCabSol."Global Dimension 3" <> '' then
                                "Global Dimension 3" := PunCabSol."Global Dimension 3";
                            if PunCabSol."Global Dimension 4" <> '' then
                                "Global Dimension 4" := PunCabSol."Global Dimension 4";
                            if PunCabSol."Global Dimension 5" <> '' then
                                "Global Dimension 5" := PunCabSol."Global Dimension 5";
                            if PunCabSol."Global Dimension 6" <> '' then
                                "Global Dimension 6" := PunCabSol."Global Dimension 6";
                            if PunCabSol."Global Dimension 7" <> '' then
                                "Global Dimension 7" := PunCabSol."Global Dimension 7";

                        end;
                end;
            end;
        }
        field(6; Descripcion; Text[199])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(7; "Descripcion 2"; Text[60])
        {
            Caption = 'Descripcion 2';
            ToolTip = 'Specifies the value of the Descripcion 2 field.';

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(8; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                fntSeguridad;
                "Cantidad pendiente facturar" := Cantidad;
                "Cantidad pendiente recibir" := Cantidad;
                Validate("Precio unitario neto");
            end;
        }
        field(12; "Fecha recepcion esperada"; Date)
        {
            Caption = 'Fecha recepcion esperada';
            ToolTip = 'Specifies the value of the Fecha recepcion esperada field.';

            trigger OnValidate()
            var
                ComproConfliFecha: Codeunit "Reservation-Check Date Confl.";
            begin
                fntSeguridad;
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
        field(17; "Cod. Deposito"; Code[10])
        {
            Caption = 'Cod. Deposito';
            ToolTip = 'Specifies the value of the Cod. Deposito field.';
            TableRelation = Location;

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(21; "Fecha pedido"; Date)
        {
            Caption = 'Fecha pedido';
            ToolTip = 'Specifies the value of the Fecha pedido field.';

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(23; "No. documento compras"; Code[30])
        {
            Caption = 'No. documento compras';
            ToolTip = 'Specifies the value of the No. documento compras field.';
            Editable = true;
        }
        field(24; "No. linea documento compras"; Integer)
        {
            Caption = 'No. linea documento compras';
            ToolTip = 'Specifies the value of the No. linea documento compras field.';
            Editable = true;
        }
        field(100; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            ToolTip = 'Specifies the value of the Currency Code field.';
            TableRelation = Currency.Code;
        }
        field(101; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            ToolTip = 'Specifies the value of the Currency Factor field.';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(102; "Precio unitario neto"; Decimal)
        {
            Caption = 'Precio unitario neto';
            ToolTip = 'Specifies the value of the Precio unitario neto field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Importe neto" := Cantidad * "Precio unitario neto";
            end;
        }
        field(103; "Importe neto"; Decimal)
        {
            Caption = 'Importe neto';
            ToolTip = 'Specifies the value of the Importe neto field.';
            DataClassification = ToBeClassified;
        }
        field(104; "Importe neto en OC"; Decimal)
        {
            Caption = 'Importe neto en OC';
            ToolTip = 'Specifies the value of the Importe neto en OC field.';
            CalcFormula = Sum("Purchase Line"."Line Amount" WHERE("No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                   "No. Linea Solicitud" = FIELD("No. linea"),
                                                                   "Document Type" = CONST(Order)));
            FieldClass = FlowField;
        }
        field(105; "Importe neto en Factura"; Decimal)
        {
            Caption = 'Importe neto en Factura';
            ToolTip = 'Specifies the value of the Importe neto en Factura field.';
            CalcFormula = Sum("Purchase Line"."Line Amount" WHERE("No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                   "No. Linea Solicitud" = FIELD("No. linea"),
                                                                   "Document Type" = FILTER(Invoice | "Credit Memo")));
            FieldClass = FlowField;
        }
        field(5404; "Cdad. por unidad medida"; Decimal)
        {
            Caption = 'Cdad. por unidad medida';
            ToolTip = 'Specifies the value of the Cdad. por unidad medida field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            InitValue = 1;

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(5407; "Cod. unidad medida"; Code[10])
        {
            Caption = 'Cod. unidad medida';
            ToolTip = 'Specifies the value of the Cod. unidad medida field.';
            TableRelation = IF (Tipo = CONST(Producto)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."))
            ELSE
            IF (Tipo = CONST(Recurso)) "Resource Unit of Measure".Code WHERE("Resource No." = FIELD("No."))
            ELSE
            "Unit of Measure";

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(50000; "Global Dimension 3"; Code[10])
        {
            Caption = 'Global Dimension 3';
            ToolTip = 'Specifies the value of the Global Dimension 3 field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cod. 3oNivel"));
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
        }
        field(50006; Aprobado; Boolean)
        {
            Caption = 'Aprobado';
            ToolTip = 'Specifies the value of the Aprobado field.';
        }
        field(50007; "Usuario Aprobacion"; Code[20])
        {
            Caption = 'Usuario Aprobacion';
            ToolTip = 'Specifies the value of the Usuario Aprobacion field.';
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

            trigger OnLookup()
            begin
                //IBdos Argentina - USS - 090503 - Inicio Modificacion Arbumasa
                //Para adjuntar archivos

                Clear(cmdLG);
                /*"Objeto adjunto" := cmdLG.OpenFile('Seleccione el archivo','',0,'',1);
                Ruta := '';
                Ruta :="Objeto adjunto";
                
                WHILE STRPOS(Ruta, '\') <> 0 DO
                   Ruta := COPYSTR(Ruta, STRPOS(Ruta, '\') + 1);
                
                infoempresa.GET();
                FILE.COPY("Objeto adjunto",infoempresa."Almacén general informacion"+Ruta);
                "Objeto adjunto" :=infoempresa."Almacén general informacion"+Ruta;
                */
                //IBdos Argentina - USS - 090503 - Fin Modificacion Arbumasa

            end;

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
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
        field(50016; "Compra a No. proveedor"; Code[20])
        {
            Caption = 'Buy-from Vendor No.';
            ToolTip = 'Specifies the value of the Buy-from Vendor No field.';
            TableRelation = Vendor;
        }
        field(50017; "Compra a Nombre proveedor"; Text[250])
        {
            Caption = 'Compra a Nombre proveedor';
            ToolTip = 'Specifies the value of the Compra a Nombre proveedor field.';
        }
        field(50018; "Factura a No. proveedor"; Code[20])
        {
            Caption = 'Factura a No. proveedor';
            ToolTip = 'Specifies the value of the Factura a No. proveedor field.';
            TableRelation = Vendor;
        }
        field(50019; "Factura a Nombre proveedor"; Text[250])
        {
            Caption = 'Factura a Nombre proveedor';
            ToolTip = 'Specifies the value of the Factura a Nombre proveedor field.';
        }
        field(50020; "Ultima Cotizacion"; Code[20])
        {
            Caption = 'Ultima Cotizacion';
            ToolTip = 'Specifies the value of the Ultima Cotizacion field.';
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Quote));
        }
        field(50021; "No. linea cotizacion"; Integer)
        {
            Caption = 'No. linea cotizacion';
            ToolTip = 'Specifies the value of the No. linea cotizacion field.';
        }
        field(50022; "Ultimo Pedido"; Code[20])
        {
            Caption = 'Ultimo Pedido';
            ToolTip = 'Specifies the value of the Ultimo Pedido field.';
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(50023; "No. linea pedido"; Integer)
        {
            Caption = 'No. linea pedido';
            ToolTip = 'Specifies the value of the No. linea pedido field.';
        }
        field(50024; "Ultima Factura"; Code[20])
        {
            Caption = 'Ultima Factura';
            ToolTip = 'Specifies the value of the Ultima Factura field.';
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Invoice));
        }
        field(50025; "No. linea factura"; Integer)
        {
            Caption = 'No. linea factura';
            ToolTip = 'Specifies the value of the No. linea factura field.';
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
        field(50030; "Carpeta importacion"; Code[200])
        {
            Caption = 'Carpeta importacion';
            ToolTip = 'Specifies the value of the Carpeta importacion field.';
        }
        field(50032; "Fecha aprobacion"; Date)
        {
            Caption = 'Fecha aprobacion';
            ToolTip = 'Specifies the value of the Fecha aprobacion field.';
        }
        field(50033; "Cant. Recibida"; Decimal)
        {
            Caption = 'Cant. Recibida';
            ToolTip = 'Specifies the value of the Cant. Recibida field.';
            CalcFormula = Sum("Purch. Rcpt. Line".Quantity WHERE("No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                  "No. Linea Solicitud" = FIELD("No. linea"),
                                                                  Quantity = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50034; "Cant. Facturada"; Decimal)
        {
            Caption = 'Cant. Facturada';
            ToolTip = 'Specifies the value of the Cant. Facturada field.';
            CalcFormula = Sum("Purch. Inv. Line".Quantity WHERE("No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                 "No. Linea Solicitud" = FIELD("No. linea"),
                                                                 Quantity = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50035; Remitos; Integer)
        {
            Caption = 'Remitos';
            ToolTip = 'Specifies the value of the Remitos field.';
            CalcFormula = Count("Item Ledger Entry" WHERE("Request header no." = FIELD("No. Documento"),
                                                           "Request line no." = FIELD("No. linea documento compras"),
                                                           Quantity = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50036; Facturas; Integer)
        {
            Caption = 'Facturas';
            ToolTip = 'Specifies the value of the Facturas field.';
            CalcFormula = Count("Item Ledger Entry" WHERE("Request header no." = FIELD("No. Documento"),
                                                           "Request line no." = FIELD("No. linea documento compras"),
                                                           "Invoiced Quantity" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50037; "Solicitud pendiente cotizacion"; Decimal)
        {
            Caption = 'Solicitud pendiente cotizacion';
            ToolTip = 'Specifies the value of the Solicitud pendiente cotizacion field.';
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = CONST(Quote),
                                                              "No. Cab. Solicitud" = FIELD("No. Documento"),
                                                              "No. Linea Solicitud" = FIELD("No. linea"),
                                                              Quantity = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50038; "Solicitud pendiente en OC"; Decimal)
        {
            Caption = 'Solicitud pendiente en OC';
            ToolTip = 'Specifies the value of the Solicitud pendiente en OC field.';
            CalcFormula = Sum("Purchase Line"."Outstanding Quantity" WHERE("Document Type" = CONST(Order),
                                                                            "No. Cab. Solicitud" = FIELD("No. Documento"),
                                                                            "No. Linea Solicitud" = FIELD("No. linea"),
                                                                            "Pendiente no entregable" = CONST(false),
                                                                            "Outstanding Quantity" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50039; "Solicitud pendiente en Factura"; Decimal)
        {
            Caption = 'Solicitud pendiente en Factura';
            ToolTip = 'Specifies the value of the Solicitud pendiente en Factura field.';
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = CONST(Invoice),
                                                              "No. Cab. Solicitud" = FIELD("No. Documento"),
                                                              "No. Linea Solicitud" = FIELD("No. linea"),
                                                              Quantity = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(50040; "Filtro OC"; Code[20])
        {
            Caption = 'Filtro OC';
            ToolTip = 'Specifies the value of the Filtro OC field.';
            DataClassification = ToBeClassified;
        }
        field(50041; "Fecha entrega solicitada"; Date)
        {
            Caption = 'Fecha entrega solicitada';
            ToolTip = 'Specifies the value of the Fecha entrega solicitada field.';
            CalcFormula = Lookup(Solicitud."Fecha Entrega" WHERE("Nombre Libro Solicitud" = FIELD("Nombre libro Solicitud"),
                                                                  "No. documento" = FIELD("No. Documento")));
            FieldClass = FlowField;
        }
        field(50042; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            ToolTip = 'Specifies the value of the Fecha registro field.';
            CalcFormula = Lookup(Solicitud."Fecha registro" WHERE("Nombre Libro Solicitud" = FIELD("Nombre libro Solicitud"),
                                                                   "No. documento" = FIELD("No. Documento")));
            FieldClass = FlowField;
        }
        field(50043; "Concepto proyecto"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
        }
        field(50044; "Pendientes todas solicitudes"; Decimal)
        {
            Caption = 'Pendientes todas solicitudes';
            ToolTip = 'Specifies the value of the Pendientes todas solicitudes field.';
            CalcFormula = Sum("Lín. solicitud"."Cantidad pendiente recibir" WHERE(Tipo = CONST(Producto),
                                                                                   "No." = FIELD("No."),
                                                                                   Revertido = CONST(false),
                                                                                   "Cantidad pendiente recibir" = FILTER(<> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50045; "Cantidad en pedido"; Decimal)
        {
            Caption = 'Cantidad en pedido';
            ToolTip = 'Specifies the value of the Cantidad en pedido field.';
            CalcFormula = Sum("Purchase Line"."Outstanding Quantity" WHERE("Document Type" = CONST(Order),

                                                                            "No." = FIELD("No."),
                                                                            "Pendiente no entregable" = CONST(false),
                                                                            "Outstanding Quantity" = FILTER(<> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50046; Aplicado; Boolean)
        {
            Caption = 'Applied';
            ToolTip = 'Specifies the value of the Applied field.';
            DataClassification = ToBeClassified;
        }
        field(50047; "Ultimo precio compra ($)"; Decimal)
        {
            Caption = 'Ultimo precio compra ($)';
            ToolTip = 'Specifies the value of the Ultimo precio compra ($) field.';
            CalcFormula = Lookup(Item."Last Direct Cost" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50048; "Ultima fecha compra ($)"; Date)
        {
            Caption = 'Ultima fecha compra ($)';
            ToolTip = 'Specifies the value of the Ultima fecha compra ($) field.';
            CalcFormula = Lookup(Item."Date of LDC" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(50597; "Fecha reversion"; Date)
        {
            Caption = 'Fecha reversion';
            ToolTip = 'Specifies the value of the Fecha reversion field.';
            DataClassification = ToBeClassified;
        }
        field(50598; "Usuario reversion"; Code[20])
        {
            Caption = 'Usuario reversion';
            ToolTip = 'Specifies the value of the Usuario reversion field.';
            DataClassification = ToBeClassified;
        }
        field(50599; Revertido; Boolean)
        {
            Caption = 'Reversed';
            ToolTip = 'Specifies the value of the Reversed field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Nombre libro Solicitud", "No. Documento", "No. linea")
        {
            Clustered = true;
        }
        key(Key2; Tipo, "No.", "No. Documento")
        {
            SumIndexFields = Cantidad;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        fntVerificarEstado
    end;

    trigger OnInsert()
    begin
        "Id. solicitante" := UserId;

        fntVerificarEstado;
        //IBdos Argentina - USS - 060603 - Inicio Modificacion Arbumasa
        //Debe traer la fecha de recepcion esperada de la cabecera

        PunCabSol.Reset;
        if PunCabSol.Get("Nombre libro Solicitud", "No. Documento") then
            "Fecha recepcion esperada" := PunCabSol."Fecha Entrega";
        //IBdos Argentina - USS - 060603 - Fin Modificacion Arbumasa
    end;

    trigger OnModify()
    begin
        fntVerificarEstado
    end;

    trigger OnRename()
    begin
        fntVerificarEstado
    end;

    var
        Producto: Record Item;
        CGCta: Record "G/L Account";
        PunCabSol: Record Solicitud;
        Ruta: Text[250];
        infoempresa: Record "Company Information";
        rstRecurso: Record Resource;
        cmdLG: Codeunit "File Management";

    local procedure TraeProd()
    begin
        TestField("No.");
        if "No." <> Producto."No." then
            Producto.Get("No.");
    end;

    [Scope('OnPrem')]
    procedure fntSeguridad()
    var
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
    begin

        //IBdos Argentina - USS - 240603 - Inicio Modificacion Arbumasa
        //Solo puede modificar la solicitud un usuario del mismo grupo de seguridad

        if "Id. solicitante" <> '' then begin

            if not rstSeguridadUsuario.fntSeguridadComparada(UserId, "Id. solicitante") then begin

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar solicitudes ajenas")) or
                   (rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar solicitudes ajenas")) and
                   rstSeguridadUsuario.fntSeguridadPermiso("Id. solicitante", rstSeguridad.FieldNo(rstSeguridad."Aprobar Pedidos"))) then
                    Error('Usted no posee permisos para realizar esta operacion');

            end;

        end;

        //IBdos Argentina - USS - 240603 - Fin Modificacion Arbumasa
    end;

    local procedure fntVerificarEstado()
    var
        l_rstEstado: Record Estados;
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
    begin
        if (Registrado or Revertido) and not (rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo("Imputar a Proyectos Cerrados"))) then
            Error('No se puede alterar una línea en estado Registrado o Revertido.');

        PunCabSol.Reset;
        if PunCabSol.Get("Nombre libro Solicitud", "No. Documento") then begin

            PunCabSol.CalcFields(Estado);
            Clear(l_rstEstado);
            l_rstEstado.Get(PunCabSol.Estado);
            if l_rstEstado."No editable" then
                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo("Imputar a Proyectos Cerrados")) then
                    Error('No se puede alterar una solicitud en estado ' + l_rstEstado.Estados);

        end;
    end;
}

