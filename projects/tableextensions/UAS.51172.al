tableextension 51172 tableextension51172 extends "Item Journal Template"
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
        modify("Whse. Register Report Caption")
        {
            Caption = 'Whse. Register Report Caption';
        }
        modify("Increment Batch Name")
        {
            Caption = 'Increment Batch Name';
        }
        field(50000; "Proyecto Obligatorio"; Boolean)
        {
            Caption = 'Proyecto Obligatorio';
            ToolTip = 'Specifies the value of the Proyecto Obligatorio field.';
        }
        field(50003; "xBorrar al contab."; Boolean)
        {
            Caption = 'xBorrar al contab.';
            ToolTip = 'Specifies the value of the xBorrar al contab field.';
            BlankZero = true;
            InitValue = true;
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
        field(50502; Planta; Boolean)
        {
            Caption = 'Planta';
            ToolTip = 'Specifies the value of the Planta field.';
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

