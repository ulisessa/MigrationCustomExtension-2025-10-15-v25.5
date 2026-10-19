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
            Caption = 'Grupo';
            ToolTip = 'Specifies the value of the Grupo field.';
            TableRelation = Seguridad.Grupo;
        }
        field(50201; "Solo visualizar cta. anticipos"; Boolean)
        {
            Caption = 'Solo visualizar cta. anticipos';
            ToolTip = 'Specifies the value of the Solo visualizar cta. anticipos field.';
        }
        field(50202; "e-mail 2"; Text[100])
        {
            Caption = 'e-mail 2';
            ToolTip = 'Specifies the value of the e-mail 2 field.';
        }
        field(50203; "Grupo envío"; Code[10])
        {
            Caption = 'Grupo envío';
            ToolTip = 'Specifies the value of the Grupo envío field.';
        }
        field(50204; "No. Ln. conf."; Integer)
        {
            Caption = 'No. Ln. conf.';
            ToolTip = 'Specifies the value of the No. Ln. conf field.';
        }
        field(50205; Imagen; BLOB)
        {
            Caption = 'Imagen';
            ToolTip = 'Specifies the value of the Imagen field.';
        }
        field(50206; "Libro solicitud"; Code[20])
        {
            Caption = 'Libro solicitud';
            ToolTip = 'Specifies the value of the Libro solicitud field.';
            TableRelation = Seguridad;
        }
        field(50207; "Acción estándar al digitalizar"; Option)
        {
            Caption = 'Acción estándar al digitalizar';
            ToolTip = 'Specifies the value of the Acción estándar al digitalizar field.';
            OptionMembers = "Escanear y previsualizar",Escanear,"Importar desde archivo","Renombrar archivo";
        }
        field(50208; "Global Dimension 4 Code"; Code[20])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50209; "Show PDF previsualization"; Boolean)
        {
            Caption = 'Mostrar previsualización de PDF';
            ToolTip = 'Specifies the value of the Mostrar previsualización de PDF field.';
        }
        field(50210; Ciudad; Code[10])
        {
            Caption = 'Ciudad';
            ToolTip = 'Specifies the value of the Ciudad field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('LUGAR PAGO'));
        }
        field(50211; "Calcular campos Item"; Boolean)
        {
            Caption = 'Calcular campos Item';
            ToolTip = 'Specifies the value of the Calcular campos Item field.';
        }
        field(50212; "Registro test"; Boolean)
        {
            Caption = 'Registro test';
            ToolTip = 'Specifies the value of the Registro test field.';
        }
        field(50213; "Last recorded logon date"; Date)
        {
            Caption = 'Last recorded logon date';
            ToolTip = 'Specifies the value of the Last recorded logon date field.';
            CalcFormula = Max("User Time Register".Date WHERE("User ID" = FIELD(UPPERLIMIT("User ID"))));
            FieldClass = FlowField;
        }
        field(50214; "Usar flatbed"; Boolean)
        {
            Caption = 'Usar flatbed';
            ToolTip = 'Specifies the value of the Usar flatbed field.';
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

