tableextension 50373 tableextension50373 extends "Tariff Number"
{
    Caption = 'Tariff Number';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        field(50011; "Exchange type"; Option)
        {
            CalcFormula = Lookup("Tariff Number"."Exchange type" WHERE("No." = FIELD(UPPERLIMIT("No."))));
            Caption = 'Tipo diferencia de cambio';
            FieldClass = FlowField;
            InitValue = Factura;
            OptionMembers = " ",Factura,"Oficialización";
        }
    }
}

