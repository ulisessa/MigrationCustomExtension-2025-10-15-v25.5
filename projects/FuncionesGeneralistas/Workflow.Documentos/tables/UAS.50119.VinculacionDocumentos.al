table 50119 "Vinculación documentos"
{

    fields
    {
        field(1; "No. linea mensajeria"; Integer)
        {
            Caption = 'No. linea mensajeria';
            ToolTip = 'Specifies the value of the No. linea mensajeria field.';
            NotBlank = true;
        }
        field(2; "Tipo documento vinculado"; Option)
        {
            Caption = 'Tipo documento vinculado';
            ToolTip = 'Specifies the value of the Tipo documento vinculado field.';
            NotBlank = true;
            OptionMembers = " ","Orden de compra","Parte de entrada","Recibo de compras","Nota de Crédito";
        }
        field(3; "No. documento vinculado"; Code[30])
        {
            Caption = 'No. documento vinculado';
            ToolTip = 'Specifies the value of the No. documento vinculado field.';
            NotBlank = true;
        }
        field(4; Hipervinculo; Text[250])
        {
            Caption = 'Hipervinculo';
            ToolTip = 'Specifies the value of the Hipervinculo field.';
            CalcFormula = Lookup("Documentos digitalizados".Archivo WHERE("Nivel 8" = FIELD(UPPERLIMIT("No. documento vinculado"))));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                Clear(rstInfoempresa);
                rstInfoempresa.Get();
                HyperLink(rstInfoempresa."Ruta Intranet" + (ConvertStr(CopyStr(Hipervinculo, 4, 250), '\', '/')));
            end;
        }
        field(5; "No. mensaje"; Code[30])
        {
            Caption = 'No. mensaje';
            ToolTip = 'Specifies the value of the No. mensaje field.';
        }
    }

    keys
    {
        key(Key1; "No. mensaje", "Tipo documento vinculado", "No. documento vinculado")
        {
            Clustered = true;
        }
        key(Key2; "No. linea mensajeria", "Tipo documento vinculado", "No. documento vinculado")
        {
        }
    }

    fieldgroups
    {
    }

    var
        rstInfoempresa: Record "Company Information";
}

