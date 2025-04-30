table 50104 "Tariff Number Details"
{
    Caption = 'Tariff Number';
    LookupPageID = "Tariff Numbers";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            TableRelation = "Tariff Number"."No." WHERE ("No." = FIELD ("No."));
        }
        field(2; "Starting date"; Date)
        {
            Caption = 'Fecha inicio';
            DataClassification = ToBeClassified;
        }
        field(3; "Ending date"; Date)
        {
            Caption = 'Fecha fin';
            DataClassification = ToBeClassified;
        }
        field(50000; "Tipo producto"; Option)
        {
            OptionMembers = Consumo,Pesca;
        }
        field(50004; "Anticipo ganancias"; Decimal)
        {
        }
        field(50005; Derechos; Decimal)
        {
        }
        field(50006; "Plazo a Transferir"; Integer)
        {
        }
        field(50007; Reembolsos; Decimal)
        {
        }
        field(50008; Reintegros; Decimal)
        {
        }
        field(50009; "Coeficiente imp. expo"; Decimal)
        {
            DecimalPlaces = 7 : 7;
        }
        field(50010; Procedencia; Option)
        {
            OptionMembers = " ","Procesado abordo","Procesado en tierra";
        }
        field(50011; "Exchange type"; Option)
        {
            Caption = 'Tipo diferencia de cambio';
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

