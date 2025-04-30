tableextension 50348 tableextension50348 extends "Gen. Journal Batch"
{
    Caption = 'Gen. Journal Batch';
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
        modify("Copy VAT Setup to Jnl. Lines")
        {
            Caption = 'Copy VAT Setup to Jnl. Lines';
        }
        modify("Allow Payment Export")
        {
            Caption = 'Allow Payment Export';
        }
        modify("Bank Statement Import Format")
        {
            Caption = 'Bank Statement Import Format';
        }
        modify(Recurring)
        {
            Caption = 'Recurring';
        }
        modify("Suggest Balancing Amount")
        {
            Caption = 'Suggest Balancing Amount';
        }
        modify("Pending Approval")
        {
            Caption = 'Pending Approval';
        }
        modify("Last Modified DateTime")
        {
            Caption = 'Last Modified DateTime';
        }
        field(50000; Preguntar; Boolean)
        {
        }
        field(50001; "Sección Cobros Cartera"; Boolean)
        {
        }
        field(50002; "Sección Pagos Cartera"; Boolean)
        {
        }
        field(50003; "No pide confirmación"; Boolean)
        {
        }
        field(50005; "Ocultar ventanas"; Boolean)
        {
        }
        field(50006; "No. Series Application"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";

            trigger OnValidate()
            var
                GenJnlTemplate: Record "Gen. Journal Template";
                Text000: TextConst ESP = 'Sólo se debe completar el campo %1 en los diarios periódicos.';
                Text001: TextConst ESP = 'No puede ser %1.';
            begin
                if "No. Series" <> '' then begin
                    GenJnlTemplate.Get("Journal Template Name");
                    if GenJnlTemplate.Recurring then
                        Error(
                          Text000,
                          FieldCaption("Posting No. Series"));
                    if "No. Series" = "Posting No. Series" then
                        Validate("Posting No. Series", '');
                end;
            end;
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


    //Unsupported feature: Property Modification (TextConstString) on "BankStmtImpFormatBalAccErr(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //BankStmtImpFormatBalAccErr : @@@="FIELDERROR ex: Bank Statement Import Format must be blank. When Bal. Account Type = Bank Account, then Bank Statement Import Format on the Bank Account card will be used in Gen. Journal Batch Journal Template Name='GENERAL',Name='CASH'.";ENU="must be blank. When Bal. Account Type = Bank Account, then Bank Statement Import Format on the Bank Account card will be used";ESP="debe estar en blanco. Cuando Tipo contrapartida = Cuenta bancaria, se utilizará el Formato de importación de extractos bancarios en la Ficha Banco.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BankStmtImpFormatBalAccErr : @@@="FIELDERROR ex: Bank Statement Import Format must be blank. When Bal. Account Type = Bank Account, then Bank Statement Import Format on the Bank Account card will be used in Gen. Journal Batch Journal Template Name='GENERAL',Name='CASH'.";ENU="must be blank. When Bal. Account Type = Bank Account, then Bank Statement Import Format on the Bank Account card will be used";ESP="debe estar en blanco. Cuando Tipo contrapartida = Cuenta bancaria, se utilizar? el Formato de importación de extractos bancarios en la Ficha Banco.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotBeSpecifiedForRecurrJnlErr(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotBeSpecifiedForRecurrJnlErr : ENU=cannot be specified when using recurring journals;ESP=no se puede utilizar en diarios periódicos;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotBeSpecifiedForRecurrJnlErr : ENU=cannot be specified when using recurring journals;ESP=no se puede utilizar en diarios periódicos;
    //Variable type has not been exported.

    var
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
}

