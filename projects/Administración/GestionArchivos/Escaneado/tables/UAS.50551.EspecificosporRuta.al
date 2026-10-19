table 50551 "Específicos por ruta"
{

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
        }
        field(2; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(3; Nivel; Code[3])
        {
            Caption = 'Nivel';
            ToolTip = 'Specifies the value of the Nivel field.';
            NotBlank = true;
            TableRelation = "Niveles de archivo"."Cód. Nivel";
        }
        field(4; "Descripción nivel"; Text[200])
        {
            Caption = 'Descripción nivel';
            ToolTip = 'Specifies the value of the Descripción nivel field.';
            TableRelation = "Niveles de archivo"."Descripción Nivel";
        }
        field(5; "Automático"; Boolean)
        {
            Caption = 'Automático';
            ToolTip = 'Specifies the value of the Automático field.';
        }
    }

    keys
    {
        key(Key1; "No.", "No. línea")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        /*CLEAR(rstNiveles);
        IF rstNiveles.GET(Nivel,"Descripción nivel") THEN
        BEGIN
        
          IF rstNiveles.Requerido THEN
            ERROR('No está permitido eliminar niveles predeterminados');
        
        END;
         */

    end;

    trigger OnInsert()
    begin
        //funCrearEspecificoCompletoIn;
    end;

    trigger OnModify()
    begin
        Clear(rstNiveles);
        if rstNiveles.Get(Nivel, "Descripción nivel") then begin

            if rstNiveles.Requerido then
                Error('No está permitido modificar niveles predeterminados');

        end;
    end;

    trigger OnRename()
    begin
        Clear(rstNiveles);
        if rstNiveles.Get(Nivel, "Descripción nivel") then begin

            if rstNiveles.Requerido then
                Error('No está permitido modificar niveles predeterminados');

        end;
    end;

    var
        rstEspecificoRuta: Record "Específicos por ruta";
        rstEspecificoRuta2: Record "Específicos por ruta";
        strEspecificoCompleto: Code[250];
        rstRutaDigitalizacion: Record File;
        rstInfoEmpresa: Record "Company Information";
        f: File;
        rstNiveles: Record "Niveles de archivo";


}

