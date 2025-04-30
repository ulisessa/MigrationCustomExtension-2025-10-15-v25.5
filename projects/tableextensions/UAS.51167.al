tableextension 51167 tableextension51167 extends "Gen. Journal Template"
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
        modify("Force Doc. Balance")
        {
            Caption = 'Force Doc. Balance';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify("Copy VAT Setup to Jnl. Lines")
        {
            Caption = 'Copy VAT Setup to Jnl. Lines';
        }
        modify("Cust. Receipt Report ID")
        {
            Caption = 'Cust. Receipt Report ID';
        }
        modify("Cust. Receipt Report Caption")
        {
            Caption = 'Cust. Receipt Report Caption';
        }
        modify("Vendor Receipt Report ID")
        {
            Caption = 'Vendor Receipt Report ID';
        }
        modify("Vendor Receipt Report Caption")
        {
            Caption = 'Vendor Receipt Report Caption';
        }
        modify("Increment Batch Name")
        {
            Caption = 'Increment Batch Name';
        }
        field(50001; "Anula desde Reg. Movimientos"; Boolean)
        {
        }
        field(50003; "xBorrar al contab."; Boolean)
        {
            BlankZero = true;
            InitValue = true;
        }
        field(50004; "Diario corrección"; Boolean)
        {
        }
        field(50005; "Test Report ID 2"; Integer)
        {
            Caption = 'Test Report ID 2';
            TableRelation = Object.ID WHERE(Type = CONST(Report));
        }
        field(50006; "Test Report Caption 2"; Text[250])
        {
            CalcFormula = Lookup(AllObjWithCaption."Object Caption" WHERE("Object Type" = CONST(Report),
                                                                           "Object ID" = FIELD("Test Report ID 2")));
            Caption = 'Test Report Caption 2';
            Editable = false;
            FieldClass = FlowField;
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

