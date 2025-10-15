table 50542 "Cab. Reparto"
{

    fields
    {
        field(1; "No. Documento"; Code[20])
        {
        }
        field(2; "Fecha reparto"; Date)
        {
        }
        field(3; "Fecha registro"; Date)
        {
        }
        field(4; Usuario; Code[20])
        {
            TableRelation = User."User Name";
        }
        field(5; Cliente; Code[10])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                Clear(rstCli);
                if rstCli.Get(Cliente) then begin

                    Transportista := rstCli."Shipment Method Code";

                end;
            end;
        }
        field(6; "Nombre cliente"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD(Cliente)));
            FieldClass = FlowField;
        }
        field(7; "Container type"; Option)
        {
            Caption = 'Tipo de contenedor';
            OptionMembers = " ","20","40",BODEGA,CAMION,OTRO;
        }
        field(8; "Loading port"; Code[10])
        {
            Caption = 'PORT OF LOADING';
            TableRelation = "Entry/Exit Point".Code;
        }
        field(9; Transportista; Code[10])
        {
            TableRelation = "Shipping Agent";
        }
        field(10; "Destination port"; Code[10])
        {
            Caption = 'PORT OF DESTINATION';
            TableRelation = "Entry/Exit Point".Code;
        }
        field(11; Observaciones; Text[250])
        {
        }
        field(12; Actividad; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(13; "Emitir Excel"; Boolean)
        {
        }
        field(14; Buque; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(15; "Cliente factura"; Code[10])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                Clear(rstCli);
                if rstCli.Get(Cliente) then begin

                    "Payment terms" := rstCli."Payment Terms Code";
                    "Sales conditions" := rstCli."Shipment Method Code";

                end;
            end;
        }
        field(16; "Nombre cliente factura"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Cliente factura")));
            FieldClass = FlowField;
        }
        field(17; "Fecha oficializacion"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Fecha oficializacion" = 0D then begin
                    "Officialization Curr. Code" := '';
                    "Officialization Curr. Factor" := 0;
                end;
            end;
        }
        field(20; "Sales conditions"; Code[10])
        {
            Caption = 'Sales conditions';
            TableRelation = "Shipment Method";
        }
        field(21; "Exit port"; Code[10])
        {
            Caption = 'PORT OF EXIT';
            DataClassification = ToBeClassified;
            TableRelation = "Entry/Exit Point".Code;
        }
        field(22; "Shipment address"; Code[10])
        {
            Caption = 'Dirección envío';
            DataClassification = ToBeClassified;
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD(Cliente));
        }
        field(23; "Quantity of containers"; Integer)
        {
            Caption = 'Cantidad de contenedores';
            DataClassification = ToBeClassified;
            InitValue = 1;
        }
        field(24; "Invoice address"; Code[10])
        {
            Caption = 'Dirección de factura';
            DataClassification = ToBeClassified;
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("Cliente factura"));
        }
        field(25; "Payment terms"; Code[10])
        {
            Caption = 'Payment terms';
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms";
        }
        field(26; "Beneficiary bank"; Code[10])
        {
            Caption = 'Beneficiary bank';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(27; "Corresponsal bank"; Code[10])
        {
            Caption = 'Corresponsal bank';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(28; Folder; Code[10])
        {
            Caption = 'Carpeta';
            DataClassification = ToBeClassified;
        }
        field(29; "Permiso de Embarque"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Permisos Embarque"."Permiso embarque";
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                PunPermisos: Record "Permisos Embarque";
            begin
                PunPermisos."Permiso embarque" := "Permiso de Embarque";
                if not PunPermisos.Insert then
                    PunPermisos.Modify;
            end;
        }
        field(1000; "No. Pedido"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(1010; Anulado; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(1011; "Usuario anulación"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(1012; "Fecha anulación"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50000; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. Documento"),
                                                          "Tipo Documento" = CONST('Reparto (ventas)')));
            FieldClass = FlowField;
        }
        field(50001; "Fecha cumplido"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Fecha cumplido" = 0D then begin
                    "Currency Code" := '';
                    "Currency Factor" := 0;
                end
                else begin
                    if "Fecha oficializacion" = 0D then
                        "Fecha oficializacion" := "Fecha cumplido";
                end;
            end;
        }
        field(50002; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Description = 'TC Vendedor';
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                if (CurrFieldNo <> FieldNo("Currency Code")) and ("Currency Code" = xRec."Currency Code") then
                    UpdateCurrencyFactor
                else begin
                    if "Currency Code" <> xRec."Currency Code" then begin
                        UpdateCurrencyFactor;
                    end else
                        if "Currency Code" <> '' then begin
                            UpdateCurrencyFactor;
                        end;
                end;
                "Recovery Currency Code" := "Currency Code";
                "Recovery Currency Factor" := "Currency Factor";
                "Officialization Curr. Code" := "Currency Code";
                "Officialization Curr. Factor" := "Currency Factor";
            end;
        }
        field(50003; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Description = 'TC Vendedor';
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Recovery Currency Code" := "Currency Code";
                "Recovery Currency Factor" := "Currency Factor";
                "Officialization Curr. Code" := "Currency Code";
                "Officialization Curr. Factor" := "Currency Factor";
            end;
        }
        field(50004; "Recovery Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            Description = 'TC Comprador';
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                if "Recovery Currency Code" = '' then
                    "Recovery Currency Factor" := 0;
                if (CurrFieldNo <> FieldNo("Recovery Currency Code")) and ("Recovery Currency Code" = xRec."Recovery Currency Code") then
                    UpdateRecoveryCurrencyFactor
                else begin
                    if "Recovery Currency Code" <> xRec."Recovery Currency Code" then begin
                        UpdateRecoveryCurrencyFactor;
                    end else
                        if "Recovery Currency Code" <> '' then begin
                            UpdateRecoveryCurrencyFactor;
                        end;
                end;
            end;
        }
        field(50005; "Recovery Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            Description = 'TC Comprador';
            Editable = false;
            MinValue = 0;
        }
        field(50006; "Officialization Curr. Code"; Code[10])
        {
            Caption = 'Cód. divisa oficialización';
            DataClassification = ToBeClassified;
            Description = 'TC Oficialización';

            trigger OnValidate()
            begin
                if (CurrFieldNo <> FieldNo("Officialization Curr. Code")) and ("Officialization Curr. Code" = xRec."Officialization Curr. Code") then
                    UpdateRecoveryCurrencyFactor
                else begin
                    if "Officialization Curr. Code" <> xRec."Officialization Curr. Code" then begin
                        UpdateOfficializationCurrencyFactor;
                    end else
                        if "Officialization Curr. Code" <> '' then begin
                            UpdateOfficializationCurrencyFactor;
                        end;
                end;
            end;
        }
        field(50007; "Officialization Curr. Factor"; Decimal)
        {
            Caption = 'Factor divisa oficialización';
            DataClassification = ToBeClassified;
            Description = 'TC Oficialización';
        }
    }

    keys
    {
        key(Key1; "No. Documento")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Clear(rstLínReparto);
        rstLínReparto.SetRange(rstLínReparto."No. Documento", "No. Documento");
        rstLínReparto.DeleteAll;

        Clear(rstProdLote);
        rstProdLote.SetRange(rstProdLote."No. documento", "No. Documento");
        rstProdLote.DeleteAll;

    end;

    trigger OnModify()
    var
        l_rstD: Record Dimension;
        l_rstDV: Record "Dimension Value";
        l_rstSS: Record "Sales & Receivables Setup";
        i: Integer;
        l_rstGLS: Record "General Ledger Setup";
    begin
        Clear(l_rstSS);
        l_rstSS.Get();

        if l_rstSS."Dimension for sales" <> '' then begin

            Clear(l_rstD);
            l_rstD.Get(l_rstSS."Dimension for sales");

            i += 1;
            Clear(l_rstDV);
            l_rstDV.Get(l_rstD.Code, "No. Documento");
            l_rstDV.Name := Format("Fecha reparto") + ' - ' + Format(Transportista) + ' - ' + Format(Cliente);
            l_rstDV.Modify(true);

        end;
    end;

    var
        "rstLínReparto": Record "Lín. reparto";

        rstConfUsu: Record "User Setup";
        rstMensajeria: Record Mensajeria;
        rstProdLote: Record "Productos por lote";
        CurrExchRate: Record "Currency Exchange Rate";
        CurrencyDate: Date;
        rstCli: Record Customer;

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        FormNavegar.SetDoc(0D, "No. Documento");
        FormNavegar.Run;
    end;

    local procedure UpdateCurrencyFactor()
    begin
        if "Currency Code" <> '' then begin
            if "Fecha cumplido" <> 0D then
                CurrencyDate := "Fecha cumplido"
            else
                TestField("Fecha cumplido");

            "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
        end else begin
            "Currency Factor" := 0;
        end;

        if "Recovery Currency Code" <> '' then begin
            if "Fecha cumplido" <> 0D then
                CurrencyDate := "Fecha cumplido"
            else
                TestField("Fecha cumplido");

            "Recovery Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Recovery Currency Code");
        end else begin
            "Recovery Currency Factor" := 0;
        end;

        if "Officialization Curr. Code" <> '' then begin
            if "Fecha oficializacion" <> 0D then
                CurrencyDate := "Fecha oficializacion"
            else
                TestField("Fecha oficializacion");

            "Officialization Curr. Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Officialization Curr. Code");
        end else begin
            "Officialization Curr. Factor" := 0;
        end;
    end;

    local procedure UpdateRecoveryCurrencyFactor()
    begin
        if "Recovery Currency Code" <> '' then begin
            if "Fecha cumplido" <> 0D then
                CurrencyDate := "Fecha cumplido"
            else
                TestField("Fecha cumplido");

            "Recovery Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Recovery Currency Code");
        end else begin
            "Recovery Currency Factor" := 0;
        end;

        if "Recovery Currency Code" <> '' then begin
            if "Fecha cumplido" <> 0D then
                CurrencyDate := "Fecha cumplido"
            else
                TestField("Fecha cumplido");

            "Recovery Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Recovery Currency Code");
        end else begin
            "Recovery Currency Factor" := 0;
        end;
    end;

    local procedure UpdateOfficializationCurrencyFactor()
    begin
        if "Officialization Curr. Code" <> '' then begin
            if "Fecha oficializacion" <> 0D then
                CurrencyDate := "Fecha oficializacion"
            else
                TestField("Fecha oficializacion");

            "Officialization Curr. Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Officialization Curr. Code");
        end else begin
            "Officialization Curr. Factor" := 0;
        end;

        if "Officialization Curr. Code" <> '' then begin
            if "Fecha oficializacion" <> 0D then
                CurrencyDate := "Fecha oficializacion"
            else
                TestField("Fecha oficializacion");

            "Officialization Curr. Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Officialization Curr. Code");
        end else begin
            "Officialization Curr. Factor" := 0;
        end;
    end;
}

