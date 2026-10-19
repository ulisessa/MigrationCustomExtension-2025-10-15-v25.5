tableextension 39 "Purchase Line Extension" extends "Purchase Line" //OriginalId
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(50005; "Concepto proyecto"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
            //This property is currently not supported
            //TestTableRelation = true;
            ValidateTableRelation = true;
        }
        field(50006; "No. Cab. Solicitud"; Code[30])
        {
            Caption = 'Request header no.';
            ToolTip = 'Specifies the value of the Request header no field.';
            TableRelation = Solicitud."No. documento" WHERE(Aprobado = CONST(true));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                PurchHeader: Record "Purchase Header";
                ConfUsu: Record "User Setup";
                ConfUsuar: Record "User Setup";
                rstSeguridadUsuario: Record "Seguridad por usuario";
            begin
                //IBdos Argentina - USS - 240603 - Inicio Modificacin Arbumasa
                //Slo puede modificar un usuario del mismo grupo de seguridad

                if "No. Cab. Solicitud" <> '' then begin

                    PurchHeader.Reset;
                    PurchHeader.Get("Document Type", "Document No.");
                    if "Document Type" = "Document Type"::Order then begin

                        if ConfUsu.Get(UserId) then;
                        if Usuario <> '' then begin

                            if ConfUsuar.Get(Usuario) then;
                            if not rstSeguridadUsuario.fntSeguridadComparada(UserId, Usuario) then
                                Error('Usted debe pertenecer al Grupo de Seguridad %1 para modificar este pedido', ConfUsuar.Grupo);

                        end;

                        if (PurchHeader."Solicitud vinculada" <> '') and ("No. Cab. Solicitud" <> '') then
                            TestField("No. Cab. Solicitud", PurchHeader."Solicitud vinculada");

                    end;

                end;

                //IBdos Argentina - USS - 240603 - Fin Modificacin Arbumasa

            end;
        }
        field(50007; "No. Linea Solicitud"; Integer)
        {
            Caption = 'No. Linea Solicitud';
            ToolTip = 'Specifies the value of the No. Linea Solicitud field.';
            TableRelation = "Lín. solicitud"."No. linea" WHERE("No. Documento" = FIELD("No. Cab. Solicitud"),
                                                                Aprobado = CONST(true),
                                                                Revertido = CONST(false));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

        }
        field(50008; "No. Documento Compra"; Code[10])
        {
            Caption = 'No. Documento Compra';
            ToolTip = 'Specifies the value of the No. Documento Compra field.';
            Editable = false;


        }
        field(50009; "Purch. doc. line no."; Integer)
        {
            Caption = 'No. línea Documento Compra';
            ToolTip = 'Specifies the value of the No. línea Documento Compra field.';
            Editable = false;
        }
        field(50010; "Plazo a Transferir"; Integer)
        {
            Caption = 'Plazo a Transferir';
            ToolTip = 'Specifies the value of the Plazo a Transferir field.';

        }
        field(50011; "No. Oferta"; Code[10])
        {
            Caption = 'No. Oferta';
            ToolTip = 'Specifies the value of the No. Oferta field.';
            Editable = false;

        }
        field(50012; "No. Ln. Oferta"; Integer)
        {
            Caption = 'No. Ln. Oferta';
            ToolTip = 'Specifies the value of the No. Ln. Oferta field.';
            Editable = false;

        }
        field(50013; "Tariff code"; Code[20])
        {
            Caption = 'Tariff No.';
            ToolTip = 'Specifies the value of the Tariff No field.';
            TableRelation = "Tariff Number";

        }
        field(50014; Usuario; Code[20])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User;
        }
        field(50015; "Gross kilos"; Decimal)
        {
            Caption = 'Kilos brutos';
            ToolTip = 'Specifies the value of the Kilos brutos field.';

        }
        field(50016; "Net kilos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';

        }
        field(50017; "Gross kilos to receive"; Decimal)
        {
            Caption = 'Gross kilos to Receive';
            ToolTip = 'Specifies the value of the Gross kilos to Receive field.';
        }
        field(50018; "Net kilos to receive"; Decimal)
        {
            Caption = 'Net kilos to Receive';
            ToolTip = 'Specifies the value of the Net kilos to Receive field.';
        }
        field(50019; "Gross kilos received"; Decimal)
        {
            Caption = 'Gross kilos Received';
            ToolTip = 'Specifies the value of the Gross kilos Received field.';
        }
        field(50020; "Net kilos received"; Decimal)
        {
            Caption = 'Net kilos Received';
            ToolTip = 'Specifies the value of the Net kilos Received field.';
        }
        field(50021; "Carpeta de Importacion"; Code[20])
        {
            Caption = 'Carpeta de Importacion';
            ToolTip = 'Specifies the value of the Carpeta de Importacion field.';

        }
        field(50022; "Outstanding net kilos"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos pendientes';
            ToolTip = 'Specifies the value of the Kilos netos pendientes field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50023; "Net kilos to invoice"; Decimal)
        {
            Caption = 'Kilos netos a facturar';
            ToolTip = 'Specifies the value of the Kilos netos a facturar field.';
            DecimalPlaces = 0 : 5;

        }
        field(50025; "Net kilos to receive (b)"; Decimal)
        {
            Caption = 'Net kilos to Receive (Base)';
            ToolTip = 'Specifies the value of the Net kilos to Receive (Base) field.';
            DecimalPlaces = 0 : 5;

        }
        field(50026; "Outstanding gross kilos"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos pendientes';
            ToolTip = 'Specifies the value of the Kilos brutos pendientes field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50027; "Gross kilos to invoice"; Decimal)
        {
            Caption = 'Kilos brutos a facturar';
            ToolTip = 'Specifies the value of the Kilos brutos a facturar field.';
            DecimalPlaces = 0 : 5;

        }
        field(50028; "Gross kilos to receive (b)"; Decimal)
        {
            Caption = 'Gross kilos to Receive (Base)';
            ToolTip = 'Specifies the value of the Gross kilos to Receive (Base) field.';
            DecimalPlaces = 0 : 5;

        }
        field(50029; "Net kilos (Base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Net kilos (Base)';
            ToolTip = 'Specifies the value of the Net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50030; "Outstanding net kilos (base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos pendientes (base)';
            ToolTip = 'Specifies the value of the Kilos netos pendientes (base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50031; "Net kilos to invoice (base)"; Decimal)
        {
            Caption = 'Kilos netos a facturar (base)';
            ToolTip = 'Specifies the value of the Kilos netos a facturar (base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50033; "NK received not invoiced (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos recibidos no facturados (base)';
            ToolTip = 'Specifies the value of the Kilos netos recibidos no facturados (base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50034; "Net kilos received (b)"; Decimal)
        {
            Caption = 'Net kilos Received (Base)';
            ToolTip = 'Specifies the value of the Net kilos Received (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50035; "Net kilos invoiced (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos facturados (base)';
            ToolTip = 'Specifies the value of the Kilos netos facturados (base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50036; "Reserved net kilos (B)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos reservados (base)';
            ToolTip = 'Specifies the value of the Kilos netos reservados (base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50037; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Kilos brutos (base)';
            ToolTip = 'Specifies the value of the Kilos brutos (base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50038; "Outstanding gross kilos (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos pendientes (base)';
            ToolTip = 'Specifies the value of the Kilos brutos pendientes (base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50039; "Gross kilos to invoice (base)"; Decimal)
        {
            BlankZero = false;
            Caption = 'Kilos brutos a facturar (base)';
            ToolTip = 'Specifies the value of the Kilos brutos a facturar (base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50041; "GK received not invoiced (b)"; Decimal)
        {
            Caption = 'Kilos brutos recibidos no facturados (base)';
            ToolTip = 'Specifies the value of the Kilos brutos recibidos no facturados (base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(50042; "Gross kilos received (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Gross kilos Received (Base)';
            ToolTip = 'Specifies the value of the Gross kilos Received (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50043; "Gross kilos invoiced (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos facturados (base)';
            ToolTip = 'Specifies the value of the Kilos brutos facturados (base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50044; "Reserved gross kilos (base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos reservados (base)';
            ToolTip = 'Specifies the value of the Kilos brutos reservados (base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50045; "NK received not invoiced"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos recibidos no facturados';
            ToolTip = 'Specifies the value of the Kilos netos recibidos no facturados field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50047; "Net kilos invoiced"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos facturados';
            ToolTip = 'Specifies the value of the Kilos netos facturados field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50048; "GK received not invoiced"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos recibidos no facturados';
            ToolTip = 'Specifies the value of the Kilos brutos recibidos no facturados field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50049; "Gross kilos invoiced"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos facturados';
            ToolTip = 'Specifies the value of the Kilos brutos facturados field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50050; "Cdad k.b. facturada"; Decimal)
        {
            Caption = 'Cdad k.b. facturada';
            ToolTip = 'Specifies the value of the Cdad k.b. facturada field.';
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50051; "Cdad k.n. rec. no fact. (base)"; Decimal)
        {
            Caption = 'Cdad k.n. rec. no fact. (base)';
            ToolTip = 'Specifies the value of the Cdad k.n. rec. no fact. (base) field.';
        }
        field(50052; "Cdad k.b. rec. no fact. (base)"; Decimal)
        {
            Caption = 'Cdad k.b. rec. no fact. (base)';
            ToolTip = 'Specifies the value of the Cdad k.b. rec. no fact. (base) field.';
        }
        field(50061; "Lote origen"; Code[20])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
            DataClassification = ToBeClassified;
        }
        field(50069; "Importe DA"; Decimal)
        {
            Caption = 'Importe DA';
            ToolTip = 'Specifies the value of the Importe DA field.';
            DataClassification = ToBeClassified;
        }
        field(50070; "Importe DL"; Decimal)
        {
            Caption = 'Importe DL';
            ToolTip = 'Specifies the value of the Importe DL field.';
            DataClassification = ToBeClassified;
        }
        field(50404; "Nombre proveedor"; Text[100])
        {
            Caption = 'Nombre proveedor';
            ToolTip = 'Specifies the value of the Nombre proveedor field.';
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Buy-from Vendor No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50405; "No. remito proveedor"; Code[30])
        {
            Caption = 'No. remito proveedor';
            ToolTip = 'Specifies the value of the No. remito proveedor field.';

        }
        field(50501; Flete; Decimal)
        {
            Caption = 'Flete';
            ToolTip = 'Specifies the value of the Flete field.';
        }
        field(50502; "Fecha recepcin proveedor"; Date)
        {
            Caption = 'Fecha recepcin proveedor';
            ToolTip = 'Specifies the value of the Fecha recepcin proveedor field.';
        }
        field(50503; "Posting date"; Date)
        {
            Caption = 'Posting date';
            ToolTip = 'Specifies the value of the Posting date field.';
        }
        field(50506; "Fecha a revisar"; Date)
        {
            Caption = 'Fecha a revisar';
            ToolTip = 'Specifies the value of the Fecha a revisar field.';
        }
        field(50507; "Actividad AFIP"; Code[10])
        {
            Caption = 'Actividad AFIP';
            ToolTip = 'Specifies the value of the Actividad AFIP field.';
            TableRelation = "Actividad proveedor"."No. actividad" WHERE("No. proveedor" = FIELD("Pay-to Vendor No."),
                                                                         "Tipo actividad" = FILTER(Actividad));

        }
        field(50508; Region; Option)
        {
            Caption = 'Regin';
            ToolTip = 'Specifies the value of the Regin field.';
            DataClassification = ToBeClassified;
            OptionMembers = "901 - CABA","902 - Buenos Aires","903 - Catamarca","904 - Córdoba","905 - Corrientes","906 - Chaco","907 - Chubut","908 - Entre Ríos","909 - Formosa","910 - Jujuy","911 - La Pampa","912 - La Rioja","913 - Mendoza","914 - Misiones","915 - Neuquén","916 - Río Negro","917 - Salta","918 - San Juan","919 - San Luis","920 - Santa Cruz","921 - Santa Fe","922 - Santiago del Estero","923 - Tierra del Fuego","924 -Tucumán";
        }
        field(50510; "Tariff code description"; Text[250])
        {
            CalcFormula = Lookup("Tariff Number".Description WHERE("No." = FIELD("Tariff code")));
            Caption = 'Descripción Cód. arancelario';
            ToolTip = 'Specifies the value of the Descripción Cód. arancelario field.';
            FieldClass = FlowField;
        }
        field(50511; "Consumir automáticamente"; Boolean)
        {
            Caption = 'Consumir automáticamente';
            ToolTip = 'Specifies the value of the Consumir automáticamente field.';

        }
        field(50512; "Net kilos per UOM"; Decimal)
        {
            Caption = 'Net kilos per UOM';
            ToolTip = 'Specifies the value of the Net kilos per UOM field.';
        }
        field(50513; "Gross kilos per UOM"; Decimal)
        {
            Caption = 'Gross kilos per UOM';
            ToolTip = 'Specifies the value of the Gross kilos per UOM field.';
        }
        field(50530; "Return nk to Ship"; Decimal)
        {
            Caption = 'Return nk to Ship';
            ToolTip = 'Specifies the value of the Return nk to Ship field.';
            DecimalPlaces = 0 : 5;

        }
        field(50531; "Return nk to Ship (Base)"; Decimal)
        {
            Caption = 'Return nk to Ship (Base)';
            ToolTip = 'Specifies the value of the Return nk to Ship (Base) field.';
            DecimalPlaces = 0 : 5;

        }
        field(50532; "Return nk Shipped Not Invd."; Decimal)
        {
            Caption = 'Return nk Shipped Not Invd.';
            ToolTip = 'Specifies the value of the Return nk Shipped Not Invd field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50533; "Ret. nk Shpd Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. nk Shpd Not Invd.(Base)';
            ToolTip = 'Specifies the value of the Ret. nk Shpd Not Invd.(Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50536; "Return nk Shipped"; Decimal)
        {
            Caption = 'Return nk Shipped';
            ToolTip = 'Specifies the value of the Return nk Shipped field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50537; "Return nk Shipped (Base)"; Decimal)
        {
            Caption = 'Return nk Shipped (Base)';
            ToolTip = 'Specifies the value of the Return nk Shipped (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50539; "Return gk to Ship"; Decimal)
        {
            Caption = 'Return gk to Ship';
            ToolTip = 'Specifies the value of the Return gk to Ship field.';
            DecimalPlaces = 0 : 5;

        }
        field(50540; "Return gk to Ship (Base)"; Decimal)
        {
            Caption = 'Return gk to Ship (Base)';
            ToolTip = 'Specifies the value of the Return gk to Ship (Base) field.';
            DecimalPlaces = 0 : 5;

        }
        field(50541; "Return gk Shipped Not Invd."; Decimal)
        {
            Caption = 'Return gk Shipped Not Invd.';
            ToolTip = 'Specifies the value of the Return gk Shipped Not Invd field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50542; "Ret. gk Shpd Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. gk Shpd Not Invd.(Base)';
            ToolTip = 'Specifies the value of the Ret. gk Shpd Not Invd.(Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50543; "Return gk Shipped"; Decimal)
        {
            Caption = 'Return gk Shipped';
            ToolTip = 'Specifies the value of the Return gk Shipped field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50544; "Return gk Shipped (Base)"; Decimal)
        {
            Caption = 'Return gk Shipped (Base)';
            ToolTip = 'Specifies the value of the Return gk Shipped (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50545; "Reserved net kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Net kilos (Base)" WHERE("Source Type" = CONST(39),
                                                                            "Source ID" = FIELD("Document No."),
                                                                            "Source Ref. No." = FIELD("Line No."),
                                                                            "Reservation Status" = CONST(Reservation)));
            Caption = 'Reserved net kilos (Base)';
            ToolTip = 'Specifies the value of the Reserved net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50547; "Completely Invoiced"; Boolean)
        {
            Caption = 'Completely Invoiced';
            ToolTip = 'Specifies the value of the Completely Invoiced field.';
            Editable = false;
        }
        field(50598; "Usuario Anulacin"; Code[20])
        {
            Caption = 'Usuario Anulacin';
            ToolTip = 'Specifies the value of the Usuario Anulacin field.';
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';
        }
        field(50700; "VAT withholding code"; Code[20])
        {
            Caption = 'Cód. retención IVA';
            ToolTip = 'Specifies the value of the Cód. retención IVA field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));

        }
        field(50701; "SS withholding code"; Code[20])
        {
            Caption = 'Cód. retención SS';
            ToolTip = 'Specifies the value of the Cód. retención SS field.';
            InitValue = 'SS';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Seguridad Social"));

        }
        field(50702; "Winnings withholding code"; Code[20])
        {
            Caption = 'Cód. retención ganancias';
            ToolTip = 'Specifies the value of the Cód. retención ganancias field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));

        }
        field(50703; Provincia; Code[10])
        {
            Caption = 'Provincia';
            ToolTip = 'Specifies the value of the Provincia field.';
            TableRelation = Area;

        }
        field(50704; "No. Despacho"; Code[20])
        {
            Caption = 'No. Despacho';
            ToolTip = 'Specifies the value of the No. Despacho field.';

        }
        field(50706; "Old job no."; Code[20])
        {
            Caption = 'Old job no.';
            ToolTip = 'Specifies the value of the Old job no field.';
            TableRelation = Job;
        }
        field(50707; "Gross winnings with. code"; Code[20])
        {
            Caption = 'Cód. retención IIBB';
            ToolTip = 'Specifies the value of the Cód. retención IIBB field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));

        }
        field(50708; "External Document No."; Code[35])
        {
            CalcFormula = Lookup("Purchase Header"."Vendor Invoice No." WHERE("No." = FIELD("Document No.")));
            Caption = 'No. Documento Proveedor';
            ToolTip = 'Specifies the value of the No. Documento Proveedor field.';
            FieldClass = FlowField;
        }
        field(60001; Familia; Code[3])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            Editable = false;
            TableRelation = "Familia producto";

        }
        field(60002; Subfamilia; Code[20])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
            Editable = false;
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));

        }
        field(60006; "Pendiente no entregable"; Boolean)
        {
            Caption = 'Pendiente no entregable';
            ToolTip = 'Specifies the value of the Pendiente no entregable field.';

        }
    }

    procedure ImporteenUSD()
    var
        varConfigCont: Record "General Ledger Setup";
        rstTipoCambio: Record "Currency Exchange Rate";
        PurchHeader: Record "Purchase Header";
    begin
        //US.ARBU - 2007-11-29 - Inicio modificación
        //Calculo el importe de la línea en dólares

        Clear(varConfigCont);
        varConfigCont.Get();

        PurchHeader := GetPurchHeader;
        if "Unit Cost" * Quantity <> 0 then begin

            if PurchHeader."Currency Code" = varConfigCont."Additional Reporting Currency" then
                "Importe DA" := "Unit Cost" * Quantity
            else begin

                if PurchHeader."Currency Code" = '' then begin

                    Clear(rstTipoCambio);
                    "Importe DA" := rstTipoCambio.ExchangeAmtLCYToFCY(PurchHeader."Posting Date",
                                                              varConfigCont."Additional Reporting Currency",
                                                              Quantity * "Unit Cost",
                                                              rstTipoCambio.ExchangeRate(PurchHeader."Posting Date",
                                                              varConfigCont."Additional Reporting Currency"));

                end
                else begin

                    Clear(rstTipoCambio);
                    "Importe DA" := rstTipoCambio.ExchangeAmtFCYToFCY(PurchHeader."Posting Date",
                                                              PurchHeader."Currency Code",
                                                              varConfigCont."Additional Reporting Currency",
                                                              Quantity * "Unit Cost");
                end;
            end;
            "Importe DA" := Round("Importe DA", 0.01);
            "Importe DL" := Round("Unit Cost (LCY)" * Quantity, 0.01);
        end;


        //US.ARBU - 2007-11-29 - Fin modificación
    end;

}