tableextension 50428 tableextension50428 extends "No. Series"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Default Nos.")
        {
            Caption = 'Default Nos.';
        }
        modify("Manual Nos.")
        {
            Caption = 'Manual Nos.';
        }
        field(50500; "Habilitar para batch"; Boolean)
        {
            Caption = 'Habilitar para batch';
            ToolTip = 'Specifies the value of the Habilitar para batch field.';
        }
    }
}

