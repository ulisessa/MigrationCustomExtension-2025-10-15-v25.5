tableextension 50302 tableextension50302 extends "Res. Journal Template"
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
        field(50000; "Cód. procedencia mov."; Code[20])
        {
            Caption = 'Source No.';
            ToolTip = 'Specifies the value of the Source No field.';
            TableRelation = IF ("Tipo procedencia mov." = CONST(Cliente)) Customer
            ELSE
            IF ("Tipo procedencia mov." = CONST(Proveedor)) Vendor;
        }
        field(50001; "Grupo contable origen"; Code[10])
        {
            Caption = 'Grupo contable origen';
            ToolTip = 'Specifies the value of the Grupo contable origen field.';
            TableRelation = IF ("Tipo procedencia mov." = CONST(Cliente)) Customer
            ELSE
            IF ("Tipo procedencia mov." = CONST(Proveedor)) Vendor;
        }
        field(50002; "Tipo procedencia mov."; Option)
        {
            Caption = 'Tipo procedencia mov.';
            ToolTip = 'Specifies the value of the Tipo procedencia mov field.';
            OptionMembers = " ",Cliente,Proveedor;
        }
        field(50003; "xBorrar al contab."; Boolean)
        {
            Caption = 'xBorrar al contab.';
            ToolTip = 'Specifies the value of the xBorrar al contab field.';
            BlankZero = true;
            InitValue = true;
        }
        field(50004; "Marea/Mes/Ciudad"; Code[10])
        {
            Caption = 'Marea/Mes/Ciudad';
            ToolTip = 'Specifies the value of the Marea/Mes/Ciudad field.';
        }
        field(50005; "Subdepartamento tierra"; Code[10])
        {
            Caption = 'Subdepartamento tierra';
            ToolTip = 'Specifies the value of the Subdepartamento tierra field.';
        }
        field(50006; "Concepto imputación"; Code[10])
        {
            Caption = 'Concepto imputación';
            ToolTip = 'Specifies the value of the Concepto imputación field.';
        }
        field(50007; "Item Presupuestario"; Code[10])
        {
            Caption = 'Item Presupuestario';
            ToolTip = 'Specifies the value of the Item Presupuestario field.';
        }
        field(50008; "Mes costo/Tramo"; Code[20])
        {
            Caption = 'Mes costo/Tramo';
            ToolTip = 'Specifies the value of the Mes costo/Tramo field.';
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

