table 50119 "Vinculación documentos"
{

    fields
    {
        field(1; "No. linea mensajeria"; Integer)
        {
            NotBlank = true;
        }
        field(2; "Tipo documento vinculado"; Option)
        {
            NotBlank = true;
            OptionMembers = " ","Orden de compra","Parte de entrada","Recibo de compras","Nota de Crédito";
        }
        field(3; "No. documento vinculado"; Code[30])
        {
            NotBlank = true;
        }
        field(4; Hipervinculo; Text[250])
        {
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

