tableextension 51252 tableextension51252 extends "User Setup"
{
    Caption = 'User Setup';
    fields
    {
        modify("Register Time")
        {
            Caption = 'Register Time';
        }
        modify("Salespers./Purch. Code")
        {
            TableRelation = "Salesperson/Purchaser".Code WHERE(Blocked = CONST(false));
            Caption = 'Salespers./Purch. Code';
        }
        modify("Sales Amount Approval Limit")
        {
            Caption = 'Sales Amount Approval Limit';
        }
        modify("Purchase Amount Approval Limit")
        {
            Caption = 'Purchase Amount Approval Limit';
        }
        modify("Unlimited Sales Approval")
        {
            Caption = 'Unlimited Sales Approval';
        }
        modify("Unlimited Purchase Approval")
        {
            Caption = 'Unlimited Purchase Approval';
        }
        modify("E-Mail")
        {
            Caption = 'E-Mail';
        }
        modify("Request Amount Approval Limit")
        {
            Caption = 'Request Amount Approval Limit';
        }
        modify("Approval Administrator")
        {
            Caption = 'Approval Administrator';
        }
        field(50004; Grupo; Code[10])
        {
            TableRelation = Seguridad.Grupo;
        }
        field(50201; "Solo visualizar cta. anticipos"; Boolean)
        {
        }
        field(50202; "e-mail 2"; Text[100])
        {
        }
        field(50203; "Grupo envío"; Code[10])
        {
        }
        field(50204; "No. Ln. conf."; Integer)
        {
        }
        field(50205; Imagen; BLOB)
        {
        }
        field(50206; "Libro solicitud"; Code[20])
        {
            TableRelation = Seguridad;
        }
        field(50207; "Acción estándar al digitalizar"; Option)
        {
            OptionMembers = "Escanear y previsualizar",Escanear,"Importar desde archivo","Renombrar archivo";
        }
        field(50208; "Global Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';

        }
        field(50209; "Show PDF previsualization"; Boolean)
        {
            Caption = 'Mostrar previsualización de PDF';
        }
        field(50210; Ciudad; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('LUGAR PAGO'));
        }
        field(50211; "Calcular campos Item"; Boolean)
        {
        }
        field(50212; "Registro test"; Boolean)
        {
        }
        field(50213; "Last recorded logon date"; Date)
        {
            CalcFormula = Max("User Time Register".Date WHERE("User ID" = FIELD(UPPERLIMIT("User ID"))));
            FieldClass = FlowField;
        }
        field(50214; "Usar flatbed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Modification on "CheckAllowedPostingDates(PROCEDURE 6)".

    //procedure CheckAllowedPostingDates();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UserSetupManagement.CheckAllowedPostingDatesRange(
      "Allow Posting From","Allow Posting To",NotificationType,DATABASE::"User Setup");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {UserSetupManagement.CheckAllowedPostingDatesRange(
      "Allow Posting From","Allow Posting To",NotificationType,DATABASE::"User Setup");
      }
    */
    //end;

    procedure fntGetMinPostDate(): Date
    begin
        Get(UserId);
        exit("Allow Posting From");
    end;

    procedure fntGetMaxPostDate(): Date
    begin
        Get(UserId);
        exit("Allow Posting To");
    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The %1 Salesperson/Purchaser code is already assigned to another User ID %2.;ESP=El código de Vendedor/Comprador %1 ya está asignado a otro id. usuario %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The %1 Salesperson/Purchaser code is already assigned to another User ID %2.;ESP=El código de Vendedor/Comprador %1 ya está asignado a otro id. usuario %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=You cannot have approval limits less than zero.;ESP=No puede tener límites de aprobación inferiores a cero.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=You cannot have approval limits less than zero.;ESP=No puede tener límites de aprobación inferiores a cero.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PrivacyBlockedGenericErr(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //PrivacyBlockedGenericErr : @@@="%1 = salesperson / purchaser code.";ENU=Privacy Blocked must not be true for Salesperson / Purchaser %1.;ESP=La opción Privacidad bloqueada no debe ser verdadera para el Vendedor/Comprador %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PrivacyBlockedGenericErr : @@@="%1 = salesperson / purchaser code.";ENU=Privacy Blocked must not be true for Salesperson / Purchaser %1.;ESP=La opción Privacidad bloqueada no debe ser verdadera para el Vendedor/Comprador %1.;
    //Variable type has not been exported.
}

