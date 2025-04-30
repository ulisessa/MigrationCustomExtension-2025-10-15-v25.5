tableextension 51165 tableextension51165 extends "Company Information"
{
    Caption = 'Company Information';
    fields
    {
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Phone No. 2")
        {
            Caption = 'Phone No. 2';
        }
        modify("Telex No.")
        {
            Caption = 'Telex No.';
        }
        modify("Fax No.")
        {
            Caption = 'Fax No.';
        }
        modify("Giro No.")
        {
            Caption = 'Giro No.';
        }
        modify("Bank Branch No.")
        {
            Caption = 'Bank Branch No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Payment Routing No.")
        {
            Caption = 'Payment Routing No.';
        }
        modify("Customs Permit No.")
        {
            Caption = 'Customs Permit No.';
        }
        modify("Registration No.")
        {
            Caption = 'Registration No.';
        }
        modify("Telex Answer Back")
        {
            Caption = 'Telex Answer Back';
        }
        modify("Ship-to Name")
        {
            Caption = 'Ship-to Name';
        }
        modify("Ship-to Name 2")
        {
            Caption = 'Ship-to Name 2';
        }
        modify("Ship-to Address")
        {
            Caption = 'Ship-to Address';
        }
        modify("Ship-to Address 2")
        {
            Caption = 'Ship-to Address 2';
        }
        modify("Ship-to City")
        {
            Caption = 'Ship-to City';
        }
        modify("Ship-to Contact")
        {
            Caption = 'Ship-to Contact';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code';
        }
        modify("Ship-to County")
        {
            Caption = 'Ship-to County';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Ship-to Country/Region Code")
        {
            Caption = 'Ship-to Country/Region Code';
        }
        modify("SWIFT Code")
        {
            Caption = 'SWIFT Code';
        }
        modify("Industrial Classification")
        {
            Caption = 'Industrial Classification';
        }
        modify("System Indicator")
        {
            OptionCaption = 'None,Custom Text,Company Information,Company,Database,Company+Database';
        }
        modify("System Indicator Style")
        {
            OptionCaption = 'Standard,Accent1,Accent2,Accent3,Accent4,Accent5,Accent6,Accent7,Accent8,Accent9';
        }
        modify("Allow Blank Payment Info.")
        {
            Caption = 'Allow Blank Payment Info.';
        }
        modify("EORI Number")
        {
            Caption = 'EORI Number';
        }
        modify("Use GLN in Electronic Document")
        {
            Caption = 'Use GLN in Electronic Documents';
        }
        modify("Picture - Last Mod. Date Time")
        {
            Caption = 'Picture - Last Mod. Date Time';
        }
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
        modify("Created DateTime")
        {
            Caption = 'Created DateTime';
        }
        modify("Demo Company")
        {
            Caption = 'Demo Company';
        }
        modify("Alternative Language Code")
        {
            Caption = 'Alternative Language Code';
        }
        modify("Brand Color Code")
        {
            Caption = 'Brand Color Code';
        }
        modify("Check-Avail. Period Calc.")
        {
            Caption = 'Check-Avail. Period Calc.';
        }
        modify("Base Calendar Code")
        {
            Caption = 'Base Calendar Code';
        }
        modify("CNAE Description")
        {
            Caption = 'CNAE Description';
        }
        modify("Payment Days Code")
        {
            Caption = 'Payment Days Code';
        }
        modify("Non-Paymt. Periods Code")
        {
            Caption = 'Non-Paymt. Periods Code';
        }
        modify("CCC Bank No.")
        {
            Caption = 'CCC Bank No.';
        }
        modify("CCC Bank Branch No.")
        {
            Caption = 'CCC Bank Branch No.';
        }
        modify("CCC Control Digits")
        {
            Caption = 'CCC Control Digits';
        }
        modify("CCC Bank Account No.")
        {
            Caption = 'CCC Bank Account No.';
        }
        modify("CCC No.")
        {
            Caption = 'CCC No.';
        }
        field(50000; "Mod."; Text[30])
        {
        }
        field(50001; "Capital social"; Decimal)
        {
        }
        field(50002; "Empresa Krustamoz"; Boolean)
        {
        }
        field(50003; "Activar mensajeria"; Boolean)
        {

            trigger OnValidate()
            begin
                if "Activar mensajeria" then
                    PAGE.Run(50530);
            end;
        }
        field(50004; "Almacen general informacion"; Text[10])
        {
        }
        field(50005; "GS1 Country Code"; Code[3])
        {
            Caption = 'Cód. país GS1';
        }
        field(50006; "GS1 Company Code"; Code[6])
        {
            Caption = 'Cód. empresa GS1';
        }
        field(50007; "GS1 main GLN Code"; Code[13])
        {
            Caption = 'Cód. GS1 GLN principal';
        }
        field(50008; "Cost Group Dimension"; Code[20])
        {
            Caption = 'Dimensión Grupo Costo';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50500; "No. serie mensajería"; Code[20])
        {
        }
        field(50501; "Ruta de digitalizacion"; Text[250])
        {

            trigger OnValidate()
            begin
                if CopyStr("Ruta de digitalizacion", StrLen("Ruta de digitalizacion"), 1) <> '\' then
                    "Ruta de digitalizacion" := "Ruta de digitalizacion" + '\';
            end;
        }
        field(50502; "No. Serie digitalizacion"; Code[30])
        {
        }
        field(50503; "Ruta Intranet"; Text[100])
        {

            trigger OnValidate()
            begin
                if CopyStr("Ruta Intranet", StrLen("Ruta Intranet"), 1) <> '/' then
                    "Ruta Intranet" := "Ruta Intranet" + '/';
            end;
        }
        field(50504; "Ruta NavXtender"; Text[100])
        {

            trigger OnValidate()
            begin
                if CopyStr("Ruta NavXtender", StrLen("Ruta NavXtender"), 1) <> '\' then
                    "Ruta NavXtender" := "Ruta NavXtender" + '\';
            end;
        }
        field(50505; "Ruta cabecera digitalizacion"; Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if CopyStr("Ruta cabecera digitalizacion", StrLen("Ruta cabecera digitalizacion"), 1) <> '\' then
                    "Ruta cabecera digitalizacion" := "Ruta cabecera digitalizacion" + '\';
            end;
        }
        field(50506; "Ruta ejecutable digitalizacion"; Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if CopyStr("Ruta ejecutable digitalizacion", StrLen("Ruta ejecutable digitalizacion"), 1) <> '\' then
                    "Ruta ejecutable digitalizacion" := "Ruta ejecutable digitalizacion" + '\';
            end;
        }
        field(50700; "Cód. área impuesto"; Code[20])
        {
            TableRelation = Area;
        }
        field(50701; "Sujeto a impuesto"; Boolean)
        {
        }
        field(50702; DigitoDeControl; Integer)
        {
        }
        field(50703; "Ag. Retencion IVA"; Boolean)
        {
        }
        field(50704; "Ag. Retencion Ingreso Brutos"; Boolean)
        {
        }
        field(50705; "Ag. Retencion Ganancias"; Boolean)
        {
        }
        field(50706; "No agente retención"; Code[20])
        {
        }
        field(50707; Province; Code[20])
        {
            TableRelation = Area;
        }
        field(50708; "No. ingresos brutos"; Code[20])
        {
        }
        field(50709; Paralelo; Boolean)
        {
        }
        field(50711; "Omitir control factura directa"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50712; "Logo path"; Text[250])
        {
            Caption = 'Ruta a logotipo';
            DataClassification = ToBeClassified;
        }
        field(50713; "Omitir controles impositivos"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50714; "GI agent type"; Text[30])
        {
            Caption = 'Tipo agente IIBB';
            DataClassification = ToBeClassified;
        }
        field(50715; "GI agent no."; Code[10])
        {
            Caption = 'No. agente IIBB';
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=The number that you entered may not be a valid International Bank Account Number (IBAN). Do you want to continue?;ESP=Es posible que el número que ha introducido no sea un número de cuenta bancaria internacional (IBAN) válido. ¿Confirma que desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=The number that you entered may not be a valid International Bank Account Number (IBAN). Do you want to continue?;ESP=Es posible que el número que ha introducido no sea un número de cuenta bancaria internacional (IBAN) válido. ?Confirma que desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=File Location for IC files;ESP=Ubicación de los archivos IC;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=File Location for IC files;ESP=Ubicación de los archivos IC;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoPaymentInfoQst(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoPaymentInfoQst : @@@="%1 = Company Information";ENU=No payment information is provided in %1. Do you want to update it now?;ESP=No se ha proporcionado ninguna información de pago en %1. ¿Desea actualizar ahora?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoPaymentInfoQst : @@@="%1 = Company Information";ENU=No payment information is provided in %1. Do you want to update it now?;ESP=No se ha proporcionado ninguna información de pago en %1. ?Desea actualizar ahora?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoPaymentInfoMsg(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoPaymentInfoMsg : ENU=No payment information is provided in %1. Review the report.;ESP=No se proporciona ninguna información de pago en %1. Revise el informe.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoPaymentInfoMsg : ENU=No payment information is provided in %1. Review the report.;ESP=No se proporciona ninguna información de pago en %1. Revise el informe.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "GLNCheckDigitErr(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //GLNCheckDigitErr : ENU=The %1 is not valid.;ESP=%1 no es válido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GLNCheckDigitErr : ENU=The %1 is not valid.;ESP=%1 no es válido.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SyncAlreadyEnabledErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //SyncAlreadyEnabledErr : ENU=Office 365 Business profile synchronization is already enabled for another company in the system.;ESP=La sincronización del perfil de Office 365 Empresa ya está habilitada para otra empresa en el sistema.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SyncAlreadyEnabledErr : ENU=Office 365 Business profile synchronization is already enabled for another company in the system.;ESP=La sincronización del perfil de Office 365 Empresa ya está habilitada para otra empresa en el sistema.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ContactUsFullTxt(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //ContactUsFullTxt : @@@="%1 = phone number, %2 = email";ENU=Questions? Contact us at %1 or %2.;ESP=Si tiene alguna pregunta, póngase en contacto con nosotros en %1 o %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ContactUsFullTxt : @@@="%1 = phone number, %2 = email";ENU=Questions? Contact us at %1 or %2.;ESP=Si tiene alguna pregunta, póngase en contacto con nosotros en %1 o %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ContactUsShortTxt(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //ContactUsShortTxt : @@@="%1 = phone number or email";ENU=Questions? Contact us at %1.;ESP=Si tiene alguna pregunta, póngase en contacto con nosotros en %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ContactUsShortTxt : @@@="%1 = phone number or email";ENU=Questions? Contact us at %1.;ESP=Si tiene alguna pregunta, póngase en contacto con nosotros en %1.;
    //Variable type has not been exported.
}

