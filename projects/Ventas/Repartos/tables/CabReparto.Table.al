table 50542 "Cab. Reparto"
{

    fields
    {
        field(1; "No. Documento"; Code[20])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
            DataClassification = ToBeClassified;
        }
        field(2; "Fecha reparto"; Date)
        {
            Caption = 'Shipment date';
            ToolTip = 'Specifies the value of the Shipment date field.';
            DataClassification = ToBeClassified;
        }
        field(3; "Fecha registro"; Date)
        {
            Caption = 'Posting date';
            ToolTip = 'Specifies the value of the Posting date field.';
            DataClassification = ToBeClassified;
        }
        field(4; Usuario; Code[50])
        {
            Caption = 'User';
            ToolTip = 'Specifies the value of the User field.';
            TableRelation = User."User Name";
            DataClassification = ToBeClassified;
        }
        field(5; Cliente; Code[10])
        {
            Caption = 'Customer';
            ToolTip = 'Specifies the value of the Customer field.';
            TableRelation = Customer;
            DataClassification = ToBeClassified;

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
            Caption = 'Customer name';
            ToolTip = 'Specifies the value of the Customer name field.';
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD(Cliente)));
            FieldClass = FlowField;
        }
        field(7; "Container type"; Option)
        {
            Caption = 'Container type';
            ToolTip = 'Specifies the value of the Container type field.';
            OptionMembers = " ","20","40",BODEGA,CAMION,OTRO;
            DataClassification = ToBeClassified;
        }
        field(8; "Loading port"; Code[10])
        {
            Caption = 'Loading port';
            ToolTip = 'Specifies the value of the Loading port field.';
            TableRelation = "Entry/Exit Point".Code;
            DataClassification = ToBeClassified;
        }
        field(9; Transportista; Code[10])
        {
            Caption = 'Shipping Agent';
            ToolTip = 'Specifies the value of the Shipping Agent field.';
            TableRelation = "Shipping Agent";
            DataClassification = ToBeClassified;
        }
        field(10; "Destination port"; Code[10])
        {
            Caption = 'Destination port';
            ToolTip = 'Specifies the value of the Destination port field.';
            TableRelation = "Entry/Exit Point".Code;
            DataClassification = ToBeClassified;
        }
        field(11; Observaciones; Text[250])
        {
            Caption = 'Comments';
            ToolTip = 'Specifies the value of the Comments field.';
            DataClassification = ToBeClassified;
        }
        field(12; Actividad; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Activity';
            ToolTip = 'Specifies the value of the Activity field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, Actividad);
            end;

            trigger OnLookup()
            begin
                DimMgt.LookupDimValueCode(3, Actividad);
                ValidateShortcutDimCode(3, Actividad);
            end;
        }
        field(13; "Emitir Excel"; Boolean)
        {
            Caption = 'Generate Excel';
            ToolTip = 'Specifies the value of the Generate Excel field.';
            DataClassification = ToBeClassified;
        }
        field(14; Buque; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Vessel';
            ToolTip = 'Specifies the value of the Vessel field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, Buque);
            end;
        }
        field(18; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            ToolTip = 'Specifies the value of the Dimension Set ID field.';
            DataClassification = SystemMetadata;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions();
            end;
        }
        field(15; "Cliente factura"; Code[10])
        {
            Caption = 'Invoice customer';
            ToolTip = 'Specifies the value of the Invoice customer field.';
            TableRelation = Customer;
            DataClassification = ToBeClassified;

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
            Caption = 'Invoice customer name';
            ToolTip = 'Specifies the value of the Invoice customer name field.';
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Cliente factura")));
            FieldClass = FlowField;
        }
        field(17; "Fecha oficializacion"; Date)
        {
            Caption = 'Officialization date';
            ToolTip = 'Specifies the value of the Officialization date field.';
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
            ToolTip = 'Specifies the value of the Sales conditions field.';
            TableRelation = "Shipment Method";
        }
        field(21; "Exit port"; Code[10])
        {
            Caption = 'Exit port';
            ToolTip = 'Specifies the value of the Exit port field.';
            DataClassification = ToBeClassified;
            TableRelation = "Entry/Exit Point".Code;
        }
        field(22; "Shipment address"; Code[10])
        {
            Caption = 'Shipping address';
            ToolTip = 'Specifies the value of the Shipping address field.';
            DataClassification = ToBeClassified;
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD(Cliente));
        }
        field(23; "Quantity of containers"; Integer)
        {
            Caption = 'Quantity of containers';
            ToolTip = 'Specifies the value of the Quantity of containers field.';
            DataClassification = ToBeClassified;
            InitValue = 1;
        }
        field(24; "Invoice address"; Code[10])
        {
            Caption = 'Invoice address';
            ToolTip = 'Specifies the value of the Invoice address field.';
            DataClassification = ToBeClassified;
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("Cliente factura"));
        }
        field(25; "Payment terms"; Code[10])
        {
            Caption = 'Payment terms';
            ToolTip = 'Specifies the value of the Payment terms field.';
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms";
        }
        field(26; "Beneficiary bank"; Code[10])
        {
            Caption = 'Beneficiary bank';
            ToolTip = 'Specifies the value of the Beneficiary bank field.';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(27; "Corresponsal bank"; Code[10])
        {
            Caption = 'Correspondent bank';
            ToolTip = 'Specifies the value of the Correspondent bank field.';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(28; Folder; Code[10])
        {
            Caption = 'Folder';
            ToolTip = 'Specifies the value of the Folder field.';
            DataClassification = ToBeClassified;
        }
        field(29; "Permiso de Embarque"; Code[30])
        {
            Caption = 'Shipping permit';
            ToolTip = 'Specifies the value of the Shipping permit field.';
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
        field(30; Booking; Blob)
        {
            Caption = 'Booking';
            ToolTip = 'Specifies the value of the Booking field.';
            DataClassification = ToBeClassified;
        }
        field(31; "Booking Status"; Enum "Booking Status")
        {
            Caption = 'Booking Status';
            ToolTip = 'Specifies the value of the Booking Status field.';
            DataClassification = ToBeClassified;
        }
        field(32; "Shipper"; Text[250])
        {
            Caption = 'Shipper';
            ToolTip = 'Specifies the value of the Shipper field.';
            DataClassification = ToBeClassified;
        }
        field(33; Consignee; Text[250])
        {
            Caption = 'Consignee';
            ToolTip = 'Specifies the value of the Consignee field.';
            DataClassification = ToBeClassified;
        }
        field(34; "Place of Receipt"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Place of Receipt';
            ToolTip = 'Specifies the value of the Place of Receipt field.';
        }
        field(35; "Port of Loading"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Port of Loading';
            ToolTip = 'Specifies the value of the Port of Loading field.';
        }
        field(36; "Port of Discharge"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Port of Discharge';
            ToolTip = 'Specifies the value of the Port of Discharge field.';
        }
        field(37; "Place of Delivery"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Place of Delivery';
            ToolTip = 'Specifies the value of the Place of Delivery field.';
        }
        field(38; Vessel; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vessel';
            ToolTip = 'Specifies the value of the Vessel field.';
            TableRelation = "Entities"."Entity Code" WHERE("Entity Code" = FIELD(Buque));
        }
        field(39; Voyage; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Voyage';
            ToolTip = 'Specifies the value of the Voyage field.';
        }
        field(40; Service; Code[1])
        {
            Caption = 'Service';
            ToolTip = 'Specifies the value of the Service field.';
            DataClassification = ToBeClassified;
        }
        field(50; "Total Reservar KN"; Decimal)
        {
            Caption = 'Total Reserve KN';
            ToolTip = 'Specifies the value of the Total Reserve KN field.';
            FieldClass = FlowField;
            CalcFormula = Sum("Lín. reparto"."Reservar - KN" WHERE("No. Documento" = FIELD("No. Documento")));
            Editable = false;
        }
        field(51; "Total Reservar UMB"; Decimal)
        {
            Caption = 'Total Reserve UOM';
            ToolTip = 'Specifies the value of the Total Reserve UOM field.';
            FieldClass = FlowField;
            CalcFormula = Sum("Lín. reparto"."Reservar - UMB" WHERE("No. Documento" = FIELD("No. Documento")));
            Editable = false;
        }
        field(52; "Total Importe USD"; Decimal)
        {
            Caption = 'Total Amount USD';
            ToolTip = 'Specifies the value of the Total Amount USD field.';
            FieldClass = FlowField;
            CalcFormula = Sum("Lín. reparto"."Importe USD x KN" WHERE("No. Documento" = FIELD("No. Documento")));
            Editable = false;
        }
        field(53; "Total Tons"; Decimal)
        {
            Caption = 'Total Tons';
            ToolTip = 'Specifies the value of the Total Tons field.';
            FieldClass = FlowField;
            CalcFormula = Sum("Lín. reparto".Tons WHERE("No. Documento" = FIELD("No. Documento")));
            Editable = false;
            DecimalPlaces = 3 : 3;
        }
        field(1000; "No. Pedido"; Code[30])
        {
            Caption = 'No. Pedido';
            ToolTip = 'Specifies the value of the No. Pedido field.';
            DataClassification = ToBeClassified;
        }
        field(1010; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';
            DataClassification = ToBeClassified;
        }
        field(1011; "Usuario anulación"; Code[20])
        {
            Caption = 'Usuario anulación';
            ToolTip = 'Specifies the value of the Usuario anulación field.';
            DataClassification = ToBeClassified;
        }
        field(1012; "Fecha anulación"; Date)
        {
            Caption = 'Fecha anulación';
            ToolTip = 'Specifies the value of the Fecha anulación field.';
            DataClassification = ToBeClassified;
        }
        field(50000; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. Documento"),
                                                          "Tipo Documento" = CONST('Reparto (ventas)')));
            FieldClass = FlowField;
        }
        field(50001; "Fecha cumplido"; Date)
        {
            Caption = 'Fecha cumplido';
            ToolTip = 'Specifies the value of the Fecha cumplido field.';
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
            ToolTip = 'Specifies the value of the Currency Code field.';
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
            ToolTip = 'Specifies the value of the Currency Factor field.';
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
            ToolTip = 'Specifies the value of the Currency Code field.';
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
            ToolTip = 'Specifies the value of the Currency Factor field.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            Description = 'TC Comprador';
            Editable = false;
            MinValue = 0;
        }
        field(50006; "Officialization Curr. Code"; Code[10])
        {
            Caption = 'Cód. divisa oficialización';
            ToolTip = 'Specifies the value of the Cód. divisa oficialización field.';
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
            Caption = 'Currency Factor';
            ToolTip = 'Specifies the value of the Currency Factor field.';
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

        Clear(rstConfUsu);
        Clear(rstMensajeria);
    end;

    trigger OnInsert()
    var
        l_rstD: Record Dimension;
        l_rstDV: Record "Dimension Value";
        l_rstSS: Record "Sales & Receivables Setup";
        i: Integer;
        l_rstGLS: Record "General Ledger Setup";
    begin

        Clear(rstConfUsu);
        Clear(rstMensajeria);

        Clear(l_rstSS);
        l_rstSS.Get();

        if l_rstSS."Dimension for sales" <> '' then begin

            Clear(l_rstD);
            l_rstD.Get(l_rstSS."Dimension for sales");

            i += 1;
            Clear(l_rstDV);
            l_rstDV."Dimension Code" := l_rstD.Code;
            l_rstDV.Code := "No. Documento";
            l_rstDV.Name := Format("Fecha reparto") + ' - ' + Format(Transportista) + ' - ' + Format(Cliente);
            l_rstDV."Dimension Value Type" := l_rstDV."Dimension Value Type"::Standard;

            Clear(l_rstGLS);
            case l_rstD.Code of
                l_rstGLS."Global Dimension 1 Code":
                    l_rstDV."Global Dimension No." := 1;
                l_rstGLS."Global Dimension 2 Code":
                    l_rstDV."Global Dimension No." := 2;
                l_rstGLS."Global Dimension 3 Code":
                    l_rstDV."Global Dimension No." := 3;
                l_rstGLS."Global Dimension 4 Code":
                    l_rstDV."Global Dimension No." := 4;
                l_rstGLS."Global Dimension 5 Code":
                    l_rstDV."Global Dimension No." := 5;
                l_rstGLS."Global Dimension 6 Code":
                    l_rstDV."Global Dimension No." := 6;
                l_rstGLS."Global Dimension 7 Code":
                    l_rstDV."Global Dimension No." := 7;
            end;
            if not l_rstDV.Insert(true) then;

        end;

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

    local procedure UpdateCurrencyFactor()
    begin
        if "Currency Code" <> '' then begin
            if "Fecha cumplido" <> 0D then
                CurrencyDate := "Fecha cumplido"
            else
                testfield("Fecha cumplido");

            "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
        end else begin
            "Currency Factor" := 0;
        end;

        if "Recovery Currency Code" <> '' then begin
            if "Fecha cumplido" <> 0D then
                CurrencyDate := "Fecha cumplido"
            else
                testfield("Fecha cumplido");

            "Recovery Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Recovery Currency Code");
        end else begin
            "Recovery Currency Factor" := 0;
        end;

        if "Officialization Curr. Code" <> '' then begin
            if "Fecha oficializacion" <> 0D then
                CurrencyDate := "Fecha oficializacion"
            else
                testfield("Fecha oficializacion");

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
                testfield("Fecha cumplido");

            "Recovery Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Recovery Currency Code");
        end else begin
            "Recovery Currency Factor" := 0;
        end;

        if "Recovery Currency Code" <> '' then begin
            if "Fecha cumplido" <> 0D then
                CurrencyDate := "Fecha cumplido"
            else
                testfield("Fecha cumplido");

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
                testfield("Fecha oficializacion");

            "Officialization Curr. Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Officialization Curr. Code");
        end else begin
            "Officialization Curr. Factor" := 0;
        end;

        if "Officialization Curr. Code" <> '' then begin
            if "Fecha oficializacion" <> 0D then
                CurrencyDate := "Fecha oficializacion"
            else
                testfield("Fecha oficializacion");

            "Officialization Curr. Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Officialization Curr. Code");
        end else begin
            "Officialization Curr. Factor" := 0;
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
        DimMgt: Codeunit DimensionManagement;

    procedure ShowDimensions()
    var
        OldDimSetID: Integer;
        Dim2: Code[20];
    begin
        // El reparto no lleva marea; Dim2 es un descarte y el valor real queda en el conjunto.
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            Rec, "Dimension Set ID", StrSubstNo('%1 %2', TableCaption(), "No. Documento"), Buque, Dim2);

        if OldDimSetID <> "Dimension Set ID" then begin
            UpdateShortcutDimsFromDimSet();
            ModifyIfInserted();
        end;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        // A diferencia de Descargas y DCL, acá sólo se escribe hacia el conjunto y no se
        // releen los demás campos: las páginas de Ventas asignan Buque y Marea directamente
        // con ':=', y una relectura los borraría al validar cualquier otro campo.
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        ModifyIfInserted();
    end;

    local procedure UpdateShortcutDimsFromDimSet()
    var
        ShortcutDimCode: array[8] of Code[20];
    begin
        // Sólo se usa desde ShowDimensions, donde el usuario editó el conjunto a propósito.
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
        Buque := ShortcutDimCode[1];
        Actividad := ShortcutDimCode[3];
    end;

    local procedure ModifyIfInserted()
    var
        rstCabRep: Record "Cab. Reparto";
    begin
        if IsTemporary() then
            exit;

        if rstCabRep.Get("No. Documento") then
            Modify();
    end;

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        FormNavegar.SetDoc(0D, "No. Documento");
        FormNavegar.Run;
    end;

}

