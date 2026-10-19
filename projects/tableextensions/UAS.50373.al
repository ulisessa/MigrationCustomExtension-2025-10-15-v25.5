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
            CalcFormula = Lookup("Tariff Number Details"."Exchange type" WHERE("No." = FIELD(UPPERLIMIT("No."))));
            Caption = 'Tipo diferencia de cambio';
            ToolTip = 'Specifies the value of the Tipo diferencia de cambio field.';
            FieldClass = FlowField;
            InitValue = Factura;
            OptionMembers = " ",Factura,"Oficialización";
        }
    }
}

