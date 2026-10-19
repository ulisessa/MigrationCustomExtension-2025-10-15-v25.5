table 50104 "Tariff Number Details"
{
    Caption = 'Tariff Number';
    LookupPageID = "Tariff Numbers";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            NotBlank = true;
            TableRelation = "Tariff Number"."No." WHERE("No." = FIELD("No."));
        }
        field(2; "Starting date"; Date)
        {
            Caption = 'Fecha inicio';
            ToolTip = 'Specifies the value of the Fecha inicio field.';
            DataClassification = ToBeClassified;
        }
        field(3; "Ending date"; Date)
        {
            Caption = 'Fecha fin';
            ToolTip = 'Specifies the value of the Fecha fin field.';
            DataClassification = ToBeClassified;
        }
        field(50000; "Tipo producto"; Option)
        {
            Caption = 'Item type';
            ToolTip = 'Specifies the value of the Item type field.';
            OptionMembers = Consumo,Pesca;
        }
        field(50003; "Reintegro Sello Argentino"; Decimal)
        {
            Caption = 'Reintegro Sello Argentino';
            ToolTip = 'Specifies the value of the Reintegro Sello Argentino field.';
            DataClassification = ToBeClassified;
        }
        field(50004; "Anticipo ganancias"; Decimal)
        {
            Caption = 'Anticipo ganancias';
            ToolTip = 'Specifies the value of the Anticipo ganancias field.';
        }
        field(50005; Derechos; Decimal)
        {
            Caption = 'Derechos';
            ToolTip = 'Specifies the value of the Derechos field.';
        }
        field(50006; "Plazo a Transferir"; Integer)
        {
            Caption = 'Plazo a Transferir';
            ToolTip = 'Specifies the value of the Plazo a Transferir field.';
        }
        field(50007; Reembolsos; Decimal)
        {
            Caption = 'Reembolsos';
            ToolTip = 'Specifies the value of the Reembolsos field.';
        }
        field(50008; Reintegros; Decimal)
        {
            Caption = 'Reintegros';
            ToolTip = 'Specifies the value of the Reintegros field.';
        }
        field(50009; "Coeficiente imp. expo"; Decimal)
        {
            Caption = 'Coeficiente imp. expo';
            ToolTip = 'Specifies the value of the Coeficiente imp. expo field.';
            DecimalPlaces = 7 : 7;
        }
        field(50010; Procedencia; Option)
        {
            Caption = 'Procedencia';
            ToolTip = 'Specifies the value of the Procedencia field.';
            OptionMembers = " ","Procesado abordo","Procesado en tierra";
        }
        field(50011; "Exchange type"; Option)
        {
            Caption = 'Tipo diferencia de cambio';
            ToolTip = 'Specifies the value of the Tipo diferencia de cambio field.';
            DataClassification = ToBeClassified;
            InitValue = Factura;
            OptionMembers = " ",Factura,"Oficialización";
        }
    }

    keys
    {
        key(Key1; "No.", "Starting date", "Ending date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        fntVerificarFechas
    end;

    local procedure fntVerificarFechas()
    var
        rstTN: Record "Tariff Number Details";
    begin
        Clear(rstTN);
        rstTN.SetRange("No.", "No.");
        if "Starting date" <> 0D then
            rstTN.SetFilter("Ending date", '>=%1|%2', "Starting date", 0D);
        /*IF "Ending date" <> 0d THEN
          rstTN.SETFILTER("Ending date",'<=%1|%2',"Ending date",0d);*/
        //rstTN.SETFILTER("Starting date",'%1',0d);
        if rstTN.Count > 1 then
            Error('Existe otra combinación para este código arancelario en ese rango de fechas.');

    end;
}

