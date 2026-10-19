table 50556 "Cab. remito ventas"
{

    fields
    {
        field(2; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(3; "Cód. concepto ajuste"; Code[10])
        {
            Caption = 'Cód. concepto ajuste';
            ToolTip = 'Specifies the value of the Cód. concepto ajuste field.';
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
            Caption = 'Sell-to Customer No.';
            ToolTip = 'Specifies the value of the Sell-to Customer No field.';
            TableRelation = Customer;
        }
        field(5; "Nombre cliente"; Text[50])
        {
            Caption = 'Nombre cliente';
            ToolTip = 'Specifies the value of the Nombre cliente field.';
        }
        field(6; "Fecha de remito"; Date)
        {
            Caption = 'Fecha de remito';
            ToolTip = 'Specifies the value of the Fecha de remito field.';
        }
        field(7; "No. remito"; Code[250])
        {
            Caption = 'No. remito';
            ToolTip = 'Specifies the value of the No. remito field.';
        }
        field(8; "Global Dimension 6"; Code[20])
        {
            Caption = 'Global Dimension 6';
            ToolTip = 'Specifies the value of the Global Dimension 6 field.';
            CaptionClass = '1,2,6';

        }
        field(9; "Carpeta de Exportación"; Text[10])
        {
            Caption = 'Carpeta de Exportación';
            ToolTip = 'Specifies the value of the Carpeta de Exportación field.';
        }
        field(10; "Permiso de embarque"; Code[30])
        {
            Caption = 'Boarding permission';
            ToolTip = 'Specifies the value of the Boarding permission field.';
            TableRelation = "Permisos Embarque";
            ValidateTableRelation = false;
        }
        field(11; "Puerto embarque"; Code[30])
        {
            Caption = 'Puerto embarque';
            ToolTip = 'Specifies the value of the Puerto embarque field.';
            TableRelation = "Entry/Exit Point";
        }
        field(12; "Puerto destino"; Code[30])
        {
            Caption = 'Puerto destino';
            ToolTip = 'Specifies the value of the Puerto destino field.';
            TableRelation = "Entry/Exit Point";
            ValidateTableRelation = false;
        }
        field(13; "Cód. Contenedor"; Code[20])
        {
            Caption = 'Cód. Contenedor';
            ToolTip = 'Specifies the value of the Cód. Contenedor field.';
        }
        field(14; "Tipo de Contenedor"; Option)
        {
            Caption = 'Tipo de Contenedor';
            ToolTip = 'Specifies the value of the Tipo de Contenedor field.';
            OptionMembers = " ","REEFER 20","REEFER 40",BODEGA,CAMION,OTRO,"DRY VAN 20","DRY VAN 40";
        }
        field(15; "Precinto DGA"; Code[20])
        {
            Caption = 'Precinto DGA';
            ToolTip = 'Specifies the value of the Precinto DGA field.';
        }
        field(16; Precinto; Code[20])
        {
            Caption = 'Precinto';
            ToolTip = 'Specifies the value of the Precinto field.';
        }
        field(17; "Modo transporte"; Code[10])
        {
            Caption = 'Modo transporte';
            ToolTip = 'Specifies the value of the Modo transporte field.';
            TableRelation = "Transport Method";
        }
        field(18; "Cód. transportista"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            ToolTip = 'Specifies the value of the Shipping Agent Code field.';
            TableRelation = "Shipping Agent";
        }
        field(19; "Transport registration-chassis"; Code[10])
        {
            Caption = 'Transporte matrícula - chasis';
            ToolTip = 'Specifies the value of the Transporte matrícula - chasis field.';
        }
        field(20; Temperatura; Decimal)
        {
            Caption = 'Temperature';
            ToolTip = 'Specifies the value of the Temperature field.';
        }
        field(21; Hora; Time)
        {
            Caption = 'Time';
            ToolTip = 'Specifies the value of the Time field.';
        }
        field(22; "Tipo de amparo sanitario"; Option)
        {
            Caption = 'Sanitary protection type';
            ToolTip = 'Specifies the value of the Sanitary protection type field.';
            BlankZero = true;
            OptionMembers = ,"P.T.","P.T.R.","C.S.E.P.","Guía de tránsito";
        }
        field(23; "No. amparo sanitario"; Code[30])
        {
            Caption = 'Sanitary protection no.';
            ToolTip = 'Specifies the value of the Sanitary protection no field.';
        }
        field(24; Destino; Code[30])
        {
            Caption = 'Destination';
            ToolTip = 'Specifies the value of the Destination field.';
        }
        field(25; Conductor; Text[50])
        {
            Caption = 'Conductor';
            ToolTip = 'Specifies the value of the Conductor field.';
        }
        field(26; "Fecha oficializacion"; Date)
        {
            Caption = 'Fecha oficializacion';
            ToolTip = 'Specifies the value of the Fecha oficializacion field.';
            DataClassification = ToBeClassified;
        }
        field(27; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            ToolTip = 'Specifies the value of the Currency Code field.';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;

        }
        field(28; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            ToolTip = 'Specifies the value of the Currency Factor field.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(29; "Shipping agent"; Code[10])
        {
            Caption = 'Agente marítimo';
            ToolTip = 'Specifies the value of the Agente marítimo field.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No." WHERE(Blocked = FILTER(" "));
        }
        field(30; "Transport registration - semi"; Code[10])
        {
            Caption = 'Transporte matrícula - semi';
            ToolTip = 'Specifies the value of the Transporte matrícula - semi field.';
            DataClassification = ToBeClassified;
        }
        field(31; "Driver ID"; Code[20])
        {
            Caption = 'DNI conductor';
            ToolTip = 'Specifies the value of the DNI conductor field.';
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
            ToolTip = 'Specifies the value of the Cód. depósito field.';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(41; "Scale code"; Code[10])
        {
            Caption = 'Cód. balanza';
            ToolTip = 'Specifies the value of the Cód. balanza field.';
            DataClassification = ToBeClassified;
            TableRelation = "Weighing Scale Parameters"."Scale code";
        }
        field(42; "Entry date"; Date)
        {
            Caption = 'Fecha entrada';
            ToolTip = 'Specifies the value of the Fecha entrada field.';
            DataClassification = ToBeClassified;
        }
        field(43; "Exit date"; Date)
        {
            Caption = 'Fecha salida';
            ToolTip = 'Specifies the value of the Fecha salida field.';
            DataClassification = ToBeClassified;
        }
        field(100; "Kilos netos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
            CalcFormula = Sum("Lín. ajuste ventas"."Kilos Netos a enviar" WHERE("No. documento" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(101; "Kilos brutos"; Decimal)
        {
            Caption = 'Kilos brutos';
            ToolTip = 'Specifies the value of the Kilos brutos field.';
            CalcFormula = Sum("Lín. ajuste ventas"."Kilos Brutos a enviar" WHERE("No. documento" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(102; "Tipo documento"; Option)
        {
            Caption = 'Document Type';
            ToolTip = 'Specifies the value of the Document Type field.';
            OptionMembers = Oferta,Pedido,Factura,"Nota d/c","Pedido abierto","Nota Débito";
        }
        field(103; "Documento venta"; Code[20])
        {
            Caption = 'Documento venta';
            ToolTip = 'Specifies the value of the Documento venta field.';
        }
        field(104; "No. reparto"; Code[20])
        {
            Caption = 'No. reparto';
            ToolTip = 'Specifies the value of the No. reparto field.';
            DataClassification = ToBeClassified;
        }
        field(105; "Customs code"; Code[10])
        {
            Caption = 'Cód. aduana';
            ToolTip = 'Specifies the value of the Cód. aduana field.';
            DataClassification = ToBeClassified;
            TableRelation = "Entry/Exit Point".Code WHERE("No. aduana" = FILTER(<> ''));
        }
        field(106; "Weighing Ticket No."; Code[20])
        {
            Caption = 'Weighing Ticket No.';
            ToolTip = 'Specifies the value of the Weighing Ticket No field.';
            DataClassification = ToBeClassified;
        }
        field(107; "Container tare"; Decimal)
        {
            Caption = 'Tara contenedor';
            ToolTip = 'Specifies the value of the Tara contenedor field.';
            DataClassification = ToBeClassified;
        }
        field(108; "Weighing posted"; Boolean)
        {
            Caption = 'Pesada registrada';
            ToolTip = 'Specifies the value of the Pesada registrada field.';
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

