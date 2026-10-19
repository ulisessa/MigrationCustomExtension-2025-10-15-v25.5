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
            Caption = 'Requiere hora inicio/fin';
            ToolTip = 'Specifies the value of the Requiere hora inicio/fin field.';
        }
        field(50003; "No pide confirmación"; Boolean)
        {
            Caption = 'No pide confirmación';
            ToolTip = 'Specifies the value of the No pide confirmación field.';
        }
        field(50100; "Entry/Exit Point"; Code[20])
        {
            Caption = 'Entry/Exit Point';
            ToolTip = 'Specifies the value of the Entry/Exit Point field.';
            TableRelation = "Entry/Exit Point".Code;
        }
        field(50500; "Fecha registro desde"; Date)
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
        field(50501; "Fecha registro hasta"; Date)
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

