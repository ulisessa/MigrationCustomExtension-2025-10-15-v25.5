tableextension 50349 tableextension50349 extends "Item Journal Batch"
{
    Caption = 'Item Journal Batch';
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify(Recurring)
        {
            Caption = 'Recurring';
        }
        field(50000; "Requiere hora inicio/fin"; Boolean)
        {
        }
        field(50003; "No pide confirmación"; Boolean)
        {
        }
        field(50500; "Fecha registro desde"; Date)
        {

            trigger OnValidate()
            begin

                Clear(rstSeguridad);
                Clear(rstSeguridadUsuario);

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar rango registro")) then
                    Error('Usted no está habilitado para modificar rangos de fecha');
            end;
        }
        field(50501; "Fecha registro hasta"; Date)
        {

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

