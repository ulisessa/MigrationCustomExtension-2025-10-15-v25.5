tableextension 39 "Purchase Line Extension" extends "Purchase Line" //OriginalId
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(50005; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Concepto proyecto";
            //This property is currently not supported
            //TestTableRelation = true;
            ValidateTableRelation = true;
        }
        field(50006; "No. Cab. Solicitud"; Code[30])
        {
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
            TableRelation = "Lín. solicitud"."No. linea" WHERE("No. Documento" = FIELD("No. Cab. Solicitud"),
                                                                Aprobado = CONST(true),
                                                                Revertido = CONST(false));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

        }
        field(50008; "No. Documento Compra"; Code[10])
        {
            Editable = false;


        }
        field(50009; "Purch. doc. line no."; Integer)
        {
            Caption = 'No. línea Documento Compra';
            Editable = false;
        }
        field(50010; "Plazo a Transferir"; Integer)
        {

        }
        field(50011; "No. Oferta"; Code[10])
        {
            Editable = false;

        }
        field(50012; "No. Ln. Oferta"; Integer)
        {
            Editable = false;

        }
        field(50013; "Tariff code"; Code[20])
        {
            Caption = 'Cód. arancelario';
            TableRelation = "Tariff Number";

        }
        field(50014; Usuario; Code[20])
        {
            TableRelation = User;
        }
        field(50015; "Gross kilos"; Decimal)
        {
            Caption = 'Kilos brutos';

        }
        field(50016; "Net kilos"; Decimal)
        {
            Caption = 'Kilos netos';

        }
        field(50017; "Gross kilos to receive"; Decimal)
        {
            Caption = 'Kilos brutos a recibir';
        }
        field(50018; "Net kilos to receive"; Decimal)
        {
            Caption = 'Kilos netos a recibir';
        }
        field(50019; "Gross kilos received"; Decimal)
        {
            Caption = 'Kilos brutos recibidos';
        }
        field(50020; "Net kilos received"; Decimal)
        {
            Caption = 'Kilos netos recibidos';
        }
        field(50021; "Carpeta de Importacion"; Code[20])
        {

        }
        field(50022; "Outstanding net kilos"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos pendientes';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50023; "Net kilos to invoice"; Decimal)
        {
            Caption = 'Kilos netos a facturar';
            DecimalPlaces = 0 : 5;

        }
        field(50025; "Net kilos to receive (b)"; Decimal)
        {
            Caption = 'Kilos netos a recibir (base)';
            DecimalPlaces = 0 : 5;

        }
        field(50026; "Outstanding gross kilos"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos pendientes';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50027; "Gross kilos to invoice"; Decimal)
        {
            Caption = 'Kilos brutos a facturar';
            DecimalPlaces = 0 : 5;

        }
        field(50028; "Gross kilos to receive (b)"; Decimal)
        {
            Caption = 'Kilos brutos a recibir (base)';
            DecimalPlaces = 0 : 5;

        }
        field(50029; "Net kilos (Base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos (base)';
            DecimalPlaces = 0 : 5;
        }
        field(50030; "Outstanding net kilos (base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos pendientes (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50031; "Net kilos to invoice (base)"; Decimal)
        {
            Caption = 'Kilos netos a facturar (base)';
            DecimalPlaces = 0 : 5;
        }
        field(50033; "NK received not invoiced (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos recibidos no facturados (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50034; "Net kilos received (b)"; Decimal)
        {
            Caption = 'Kilos netos recibidos (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50035; "Net kilos invoiced (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos facturados (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50036; "Reserved net kilos (B)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos reservados (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50037; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Kilos brutos (base)';
            DecimalPlaces = 0 : 5;
        }
        field(50038; "Outstanding gross kilos (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos pendientes (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50039; "Gross kilos to invoice (base)"; Decimal)
        {
            BlankZero = false;
            Caption = 'Kilos brutos a facturar (base)';
            DecimalPlaces = 0 : 5;
        }
        field(50041; "GK received not invoiced (b)"; Decimal)
        {
            Caption = 'Kilos brutos recibidos no facturados (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(50042; "Gross kilos received (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos recibidos (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50043; "Gross kilos invoiced (b)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos facturados (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50044; "Reserved gross kilos (base)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos reservados (base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50045; "NK received not invoiced"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos recibidos no facturados';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50047; "Net kilos invoiced"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos netos facturados';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50048; "GK received not invoiced"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos recibidos no facturados';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50049; "Gross kilos invoiced"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kilos brutos facturados';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50050; "Cdad k.b. facturada"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50051; "Cdad k.n. rec. no fact. (base)"; Decimal)
        {
        }
        field(50052; "Cdad k.b. rec. no fact. (base)"; Decimal)
        {
        }
        field(50061; "Lote origen"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50069; "Importe DA"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50070; "Importe DL"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50404; "Nombre proveedor"; Text[100])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Buy-from Vendor No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50405; "No. remito proveedor"; Code[30])
        {

        }
        field(50501; Flete; Decimal)
        {
        }
        field(50502; "Fecha recepcin proveedor"; Date)
        {
        }
        field(50503; "Posting date"; Date)
        {
            Caption = 'Posting date';
        }
        field(50506; "Fecha a revisar"; Date)
        {
        }
        field(50507; "Actividad AFIP"; Code[10])
        {
            TableRelation = "Actividad proveedor"."No. actividad" WHERE("No. proveedor" = FIELD("Pay-to Vendor No."),
                                                                         "Tipo actividad" = FILTER(Actividad));

        }
        field(50508; Region; Option)
        {
            Caption = 'Regin';
            DataClassification = ToBeClassified;
            OptionMembers = "901 - CABA","902 - Buenos Aires","903 - Catamarca","904 - Córdoba","905 - Corrientes","906 - Chaco","907 - Chubut","908 - Entre Ríos","909 - Formosa","910 - Jujuy","911 - La Pampa","912 - La Rioja","913 - Mendoza","914 - Misiones","915 - Neuquén","916 - Río Negro","917 - Salta","918 - San Juan","919 - San Luis","920 - Santa Cruz","921 - Santa Fe","922 - Santiago del Estero","923 - Tierra del Fuego","924 -Tucumán";
        }
        field(50510; "Tariff code description"; Text[250])
        {
            CalcFormula = Lookup("Tariff Number".Description WHERE("No." = FIELD("Tariff code")));
            Caption = 'Descripción Cód. arancelario';
            FieldClass = FlowField;
        }
        field(50511; "Consumir automáticamente"; Boolean)
        {

        }
        field(50512; "Net kilos per UOM"; Decimal)
        {
            Caption = 'Net kilos per UOM';
        }
        field(50513; "Gross kilos per UOM"; Decimal)
        {
            Caption = 'Gross kilos per UOM';
        }
        field(50530; "Return nk to Ship"; Decimal)
        {
            Caption = 'Return nk to Ship';
            DecimalPlaces = 0 : 5;

        }
        field(50531; "Return nk to Ship (Base)"; Decimal)
        {
            Caption = 'Return nk to Ship (Base)';
            DecimalPlaces = 0 : 5;

        }
        field(50532; "Return nk Shipped Not Invd."; Decimal)
        {
            Caption = 'Return nk Shipped Not Invd.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50533; "Ret. nk Shpd Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. nk Shpd Not Invd.(Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50536; "Return nk Shipped"; Decimal)
        {
            Caption = 'Return nk Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50537; "Return nk Shipped (Base)"; Decimal)
        {
            Caption = 'Return nk Shipped (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50539; "Return gk to Ship"; Decimal)
        {
            Caption = 'Return gk to Ship';
            DecimalPlaces = 0 : 5;

        }
        field(50540; "Return gk to Ship (Base)"; Decimal)
        {
            Caption = 'Return gk to Ship (Base)';
            DecimalPlaces = 0 : 5;

        }
        field(50541; "Return gk Shipped Not Invd."; Decimal)
        {
            Caption = 'Return gk Shipped Not Invd.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50542; "Ret. gk Shpd Not Invd.(Base)"; Decimal)
        {
            Caption = 'Ret. gk Shpd Not Invd.(Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50543; "Return gk Shipped"; Decimal)
        {
            Caption = 'Return gk Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50544; "Return gk Shipped (Base)"; Decimal)
        {
            Caption = 'Return gk Shipped (Base)';
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
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50547; "Completely Invoiced"; Boolean)
        {
            Caption = 'Completely Invoiced';
            Editable = false;
        }
        field(50598; "Usuario Anulacin"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {
        }
        field(50700; "VAT withholding code"; Code[20])
        {
            Caption = 'Cód. retención IVA';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));

        }
        field(50701; "SS withholding code"; Code[20])
        {
            Caption = 'Cód. retención SS';
            InitValue = 'SS';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Seguridad Social"));

        }
        field(50702; "Winnings withholding code"; Code[20])
        {
            Caption = 'Cód. retención ganancias';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));

        }
        field(50703; Provincia; Code[10])
        {
            TableRelation = Area;

        }
        field(50704; "No. Despacho"; Code[20])
        {

        }
        field(50706; "Old job no."; Code[20])
        {
            TableRelation = Job;
        }
        field(50707; "Gross winnings with. code"; Code[20])
        {
            Caption = 'Cód. retención IIBB';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));

        }
        field(50708; "External Document No."; Code[35])
        {
            CalcFormula = Lookup("Purchase Header"."Vendor Invoice No." WHERE("No." = FIELD("Document No.")));
            Caption = 'No. Documento Proveedor';
            FieldClass = FlowField;
        }
        field(60001; Familia; Code[3])
        {
            Editable = false;
            TableRelation = "Familia producto";

        }
        field(60002; Subfamilia; Code[20])
        {
            Editable = false;
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));

        }
        field(60006; "Pendiente no entregable"; Boolean)
        {

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