table 50556 "Cab. remito ventas"
{

    fields
    {
        field(2; "No. documento"; Code[30])
        {
        }
        field(3; "Cód. concepto ajuste"; Code[10])
        {
            TableRelation = "AFIP Interface Register";

            trigger OnValidate()
            begin
                Clear(rstLinAjuste);
                rstLinAjuste.SetRange(rstLinAjuste."No. documento", "No. documento");
                rstLinAjuste.ModifyAll(rstLinAjuste."Cód. concepto ajuste", "Cód. concepto ajuste");
            end;
        }
        field(4; "Venta a-No. cliente"; Code[20])
        {
            TableRelation = Customer;
        }
        field(5; "Nombre cliente"; Text[50])
        {
        }
        field(6; "Fecha de remito"; Date)
        {
        }
        field(7; "No. remito"; Code[250])
        {
        }
        field(8; "Global Dimension 6"; Code[20])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(9; "Carpeta de Exportación"; Text[10])
        {
        }
        field(10; "Permiso de embarque"; Code[30])
        {
            TableRelation = "Permisos Embarque";
            ValidateTableRelation = false;
        }
        field(11; "Puerto embarque"; Code[30])
        {
            TableRelation = "Entry/Exit Point";
        }
        field(12; "Puerto destino"; Code[30])
        {
            TableRelation = "Entry/Exit Point";
            ValidateTableRelation = false;
        }
        field(13; "Cód. Contenedor"; Code[20])
        {
        }
        field(14; "Tipo de Contenedor"; Option)
        {
            OptionMembers = " ","REEFER 20","REEFER 40",BODEGA,CAMION,OTRO,"DRY VAN 20","DRY VAN 40";
        }
        field(15; "Precinto DGA"; Code[20])
        {
        }
        field(16; Precinto; Code[20])
        {
        }
        field(17; "Modo transporte"; Code[10])
        {
            TableRelation = "Transport Method";
        }
        field(18; "Cód. transportista"; Code[10])
        {
            TableRelation = "Shipping Agent";
        }
        field(19; "Transport registration-chassis"; Code[10])
        {
            Caption = 'Transporte matrícula - chasis';
        }
        field(20; Temperatura; Decimal)
        {
        }
        field(21; Hora; Time)
        {
        }
        field(22; "Tipo de amparo sanitario"; Option)
        {
            BlankZero = true;
            OptionMembers = ,"P.T.","P.T.R.","C.S.E.P.","Guía de tránsito";
        }
        field(23; "No. amparo sanitario"; Code[30])
        {
        }
        field(24; Destino; Code[30])
        {
        }
        field(25; Conductor; Text[50])
        {
        }
        field(26; "Fecha oficializacion"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;

        }
        field(28; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(29; "Shipping agent"; Code[10])
        {
            Caption = 'Agente marítimo';
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No." WHERE(Blocked = FILTER(" "));
        }
        field(30; "Transport registration - semi"; Code[10])
        {
            Caption = 'Transporte matrícula - semi';
            DataClassification = ToBeClassified;
        }
        field(31; "Driver ID"; Code[20])
        {
            Caption = 'DNI conductor';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                l_rstEmployee: Record Employee;
            begin
            end;
        }
        field(40; "Location code"; Code[10])
        {
            Caption = 'Cód. depósito';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(41; "Scale code"; Code[10])
        {
            Caption = 'Cód. balanza';
            DataClassification = ToBeClassified;
            TableRelation = "Weighing Scale Parameters"."Scale code";
        }
        field(42; "Entry date"; Date)
        {
            Caption = 'Fecha entrada';
            DataClassification = ToBeClassified;
        }
        field(43; "Exit date"; Date)
        {
            Caption = 'Fecha salida';
            DataClassification = ToBeClassified;
        }
        field(100; "Kilos netos"; Decimal)
        {
            CalcFormula = Sum("Lín. ajuste ventas"."Kilos Netos a enviar" WHERE("No. documento" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(101; "Kilos brutos"; Decimal)
        {
            CalcFormula = Sum("Lín. ajuste ventas"."Kilos Brutos a enviar" WHERE("No. documento" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(102; "Tipo documento"; Option)
        {
            OptionMembers = Oferta,Pedido,Factura,"Nota d/c","Pedido abierto","Nota Débito";
        }
        field(103; "Documento venta"; Code[20])
        {
        }
        field(104; "No. reparto"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(105; "Customs code"; Code[10])
        {
            Caption = 'Cód. aduana';
            DataClassification = ToBeClassified;
            TableRelation = "Entry/Exit Point".Code WHERE("No. aduana" = FILTER(<> ''));
        }
        field(106; "Weighing Ticket No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(107; "Container tare"; Decimal)
        {
            Caption = 'Tara contenedor';
            DataClassification = ToBeClassified;
        }
        field(108; "Weighing posted"; Boolean)
        {
            Caption = 'Pesada registrada';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. documento")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        rstSL: Record "Sales Line";
    begin
        Clear(rstSL);
        rstSL.SetRange(rstSL."Document No.", "Documento venta");
        rstSL.SetRange("No. remito oficial", "No. documento");
        rstSL.SetFilter("Quantity Shipped", '<>%1', 0);
        if rstSL.FindSet then
            Error('Existe un remito registrado con este número. Antes de eliminar este documento, revierta el remito.');

        Clear(rstLinAjuste);
        rstLinAjuste.SetRange(rstLinAjuste."No. documento", "No. documento");
        rstLinAjuste.DeleteAll;

        Clear(rstMovsRemito);
        rstMovsRemito.SetRange(rstMovsRemito."No. documento", "No. documento");
        rstMovsRemito.DeleteAll;
    end;

    var
        rstLinAjuste: Record "Lín. ajuste ventas";
        rstMovsRemito: Record "Mov. remitos";
        CurrExchRate: Record "Currency Exchange Rate";
        CurrencyDate: Date;

    local procedure UpdateCurrencyFactor()
    begin
        if "Currency Code" <> '' then begin
            if "Fecha oficializacion" <> 0D then
                CurrencyDate := "Fecha oficializacion"
            else
                TestField("Fecha oficializacion");

            "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
        end else
            "Currency Factor" := 0;
    end;
}

