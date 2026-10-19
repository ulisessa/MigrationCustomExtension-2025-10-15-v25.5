tableextension 50305 tableextension50305 extends "Job Journal Template"
{
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Test Report ID")
        {
            Caption = 'Test Report ID';
        }
        modify("Page ID")
        {
            Caption = 'Page ID';
        }
        modify("Posting Report ID")
        {
            Caption = 'Posting Report ID';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify(Recurring)
        {
            Caption = 'Recurring';
        }
        modify("Test Report Caption")
        {
            Caption = 'Test Report Caption';
        }
        modify("Page Caption")
        {
            Caption = 'Page Caption';
        }
        modify("Posting Report Caption")
        {
            Caption = 'Posting Report Caption';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify("Increment Batch Name")
        {
            Caption = 'Increment Batch Name';
        }
        field(50500; Confirmar; Boolean)
        {
            Caption = 'Confirmar';
            ToolTip = 'Specifies the value of the Confirmar field.';
        }
        field(50502; "Fecha registro desde"; Date)
        {
            Caption = 'Fecha registro desde';
            ToolTip = 'Specifies the value of the Fecha registro desde field.';

            trigger OnValidate()
            begin

                Clear(rstSeguridad);
                Clear(rstSeguridadUsuario);

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar rango registro")) then
                    Error('Usted no está habilitado para modificar rangos de fecha');
            end;
        }
        field(50503; "Fecha registro hasta"; Date)
        {
            Caption = 'Fecha registro hasta';
            ToolTip = 'Specifies the value of the Fecha registro hasta field.';

            trigger OnValidate()
            begin

                Clear(rstSeguridad);
                Clear(rstSeguridadUsuario);

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar rango registro")) then
                    Error('Usted no está habilitado para modificar rangos de fecha');
            end;
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Only the %1 field can be filled in on recurring journals.;ESP=Solo se debe completar el campo %1 en los diarios periódicos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Only the %1 field can be filled in on recurring journals.;ESP=Solo se debe completar el campo %1 en los diarios periódicos.;
    //Variable type has not been exported.

    var
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
}

