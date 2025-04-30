tableextension 50709 tableextension50709 extends "CRM Connection Setup"
{
    Caption = 'Microsoft Dynamics 365 Connection Setup';
    fields
    {
        modify("Server Address")
        {
            Caption = 'Dynamics 365 for Sales URL';
        }
        modify("User Password Key")
        {
            Caption = 'User Password Key';
        }
        modify("Restore Connection")
        {
            Caption = 'Restore Connection';
        }
        modify("Is Enabled")
        {
            Caption = 'Is Enabled';
        }
        modify("CRM Version")
        {
            Caption = 'CRM Version';
        }
        modify("Use Newest UI")
        {
            Caption = 'Use Newest UI';
        }
        modify("Newest UI AppModuleId")
        {
            Caption = 'Newest UI AppModuleId';
        }
        modify("Is S.Order Integration Enabled")
        {
            Caption = 'Is S.Order Integration Enabled';
        }
        modify("Is CRM Solution Installed")
        {
            Caption = 'Is CRM Solution Installed';
        }
        modify("Proxy Version")
        {
            Caption = 'Proxy Version';
        }
        modify("Auto Create Sales Orders")
        {
            Caption = 'Automatically Create Sales Orders';
        }
        modify("Auto Process Sales Quotes")
        {
            Caption = 'Automatically Process Sales Quotes';
        }
        modify(CurrencyDecimalPrecision)
        {
            Caption = 'Currency Decimal Precision';
        }
        modify(BaseCurrencyPrecision)
        {
            Caption = 'Base Currency Precision';
        }
        modify(BaseCurrencySymbol)
        {
            Caption = 'Base Currency Symbol';
        }
        modify("Authentication Type")
        {
            Caption = 'Authentication Type';
        }
        modify("Connection String")
        {
            Caption = 'Connection String';
        }
        modify("Server Connection String")
        {
            Caption = 'Server Connection String';
        }
        modify("Disable Reason")
        {
            Caption = 'Disable Reason';
        }

        //Unsupported feature: Code Modification on ""Is Enabled"(Field 60).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        EnableCRMConnection;
        UpdateIsEnabledState;
        RefreshDataFromCRM;
        if "Is Enabled" then begin
          TestIntegrationUserRequirements;
          CRMSetupDefaults.ResetSalesOrderMappingConfiguration(Rec);
          SetUseNewestUI
        end else
          CRMIntegrationTelemetry.LogTelemetryWhenConnectionDisabled;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..5
        //++Arbu  CRMSetupDefaults.ResetSalesOrderMappingConfiguration(Rec);
        #7..9
        */
        //end;


        //Unsupported feature: Code Modification on ""Auto Create Sales Orders"(Field 80).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Auto Create Sales Orders" then
          CRMSetupDefaults.RecreateAutoCreateSalesOrdersJobQueueEntry(DoReadCRMData)
        else
          CRMSetupDefaults.DeleteAutoCreateSalesOrdersJobQueueEntry;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //++Arbu
        {
        IF "Auto Create Sales Orders" THEN
          CRMSetupDefaults.RecreateAutoCreateSalesOrdersJobQueueEntry(DoReadCRMData)
        ELSE
          CRMSetupDefaults.DeleteAutoCreateSalesOrdersJobQueueEntry;
        }
        //--Arbu
        */
        //end;


        //Unsupported feature: Code Modification on ""Auto Process Sales Quotes"(Field 81).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Auto Process Sales Quotes" then
          CRMSetupDefaults.RecreateAutoProcessSalesQuotesJobQueueEntry(DoReadCRMData)
        else
          CRMSetupDefaults.DeleteAutoProcessSalesQuotesJobQueueEntry;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //++Arbu
        {IF "Auto Process Sales Quotes" THEN
          CRMSetupDefaults.RecreateAutoProcessSalesQuotesJobQueueEntry(DoReadCRMData)
        ELSE
          CRMSetupDefaults.DeleteAutoProcessSalesQuotesJobQueueEntry;

        }
        //--Arbu
        */
        //end;
    }


    //Unsupported feature: Property Modification (TextConstString) on "CantRegisterDisabledConnectionErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CantRegisterDisabledConnectionErr : ENU=A disabled connection cannot be registered.;ESP=Una conexión deshabilitada no se puede registrar.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CantRegisterDisabledConnectionErr : ENU=A disabled connection cannot be registered.;ESP=Una conexión deshabilitada no se puede registrar.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConnectionErr(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConnectionErr : @@@=%1 Error message from the provider (.NET exception message);ENU=The connection setup cannot be validated. Verify the settings and try again.\Detailed error description: %1.;ESP=No se puede validar la configuración de la conexión. Compruebe la configuración e inténtelo de nuevo.\Descripción del error detallada: %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConnectionErr : @@@=%1 Error message from the provider (.NET exception message);ENU=The connection setup cannot be validated. Verify the settings and try again.\Detailed error description: %1.;ESP=No se puede validar la configuración de la conexión. Compruebe la configuración e inténtelo de nuevo.\Descripción del error detallada: %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConnectionSuccessMsg(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConnectionSuccessMsg : ENU=The connection test was successful. The settings are valid.;ESP=La prueba de conexión se realizó correctamente. La configuración es válida.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConnectionSuccessMsg : ENU=The connection test was successful. The settings are valid.;ESP=La prueba de conexión se realizó correctamente. La configuración es válida.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConnectionSuccessNotEnabledForCurrentUserMsg(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConnectionSuccessNotEnabledForCurrentUserMsg : @@@="%1 = Current User ID, %2 - product name, %3 = CRM product name";ENU=The connection test was successful. The settings are valid.\\However, because the %2 Users Must Map to %3 Users field is set, %3 integration is not enabled for %1.;ESP=La prueba de conexión se realizó correctamente. La configuración es válida.\\No obstante, dado que el campo "Los usuarios de %2 deben asignar a los usuarios de %3" está seleccionado, la integración de %3 no está habilitada para %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConnectionSuccessNotEnabledForCurrentUserMsg : @@@="%1 = Current User ID, %2 - product name, %3 = CRM product name";ENU=The connection test was successful. The settings are valid.\\However, because the %2 Users Must Map to %3 Users field is set, %3 integration is not enabled for %1.;ESP=La prueba de conexión se realizó correctamente. La configuración es válida.\\No obstante, dado que el campo "Los usuarios de %2 deben asignar a los usuarios de %3" está seleccionado, la integración de %3 no está habilitada para %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotResolveUserFromConnectionSetupErr(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotResolveUserFromConnectionSetupErr : @@@="%1 = CRM product name";ENU=The %1 user that is specified in the CRM connection setup does not exist.;ESP=El usuario de %1 que está especificado en la configuración de conexión de CRM no existe.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotResolveUserFromConnectionSetupErr : @@@="%1 = CRM product name";ENU=The %1 user that is specified in the CRM connection setup does not exist.;ESP=El usuario de %1 que está especificado en la configuración de conexión de CRM no existe.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DetailsMissingErr(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //DetailsMissingErr : @@@="%1 = CRM product name";ENU=A %1 URL, user name and password are required to enable a connection.;ESP=Para habilitar una conexión, se requieren una dirección URL de %1, un nombre de usuario y un contraseña.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DetailsMissingErr : @@@="%1 = CRM product name";ENU=A %1 URL, user name and password are required to enable a connection.;ESP=Para habilitar una conexión, se requieren una dirección URL de %1, un nombre de usuario y un contraseña.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UserCRMSetupTxt(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //UserCRMSetupTxt : ENU=User CRM Setup;ESP=Configuración CRM usuario;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserCRMSetupTxt : ENU=User CRM Setup;ESP=Configuración CRM usuario;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotConnectCRMErr(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotConnectCRMErr : @@@="%1 - email of the user, %2 = CRM product name";ENU=The system is unable to connect to %2, and the connection has been disabled. Verify the credentials of the user account %1, and then enable the connection again in the Microsoft Dynamics 365 Connection Setup window.;ESP=El sistema no puede conectarse a %2 y la conexión se ha deshabilitado. Compruebe las credenciales de la cuenta de usuario %1 y, a continuación, vuelva a habilitar la conexión en la ventana de configuración de conexión de Microsoft Dynamics 365.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotConnectCRMErr : @@@="%1 - email of the user, %2 = CRM product name";ENU=The system is unable to connect to %2, and the connection has been disabled. Verify the credentials of the user account %1, and then enable the connection again in the Microsoft Dynamics 365 Connection Setup window.;ESP=El sistema no puede conectarse a %2 y la conexión se ha deshabilitado. Compruebe las credenciales de la cuenta de usuario %1 y, a continuación, vuelva a habilitar la conexión en la ventana de configuración de conexión de Microsoft Dynamics 365.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "LCYMustMatchBaseCurrencyErr(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //LCYMustMatchBaseCurrencyErr : @@@=%1,%2 - ISO currency codes;ENU=LCY Code %1 does not match ISO Currency Code %2 of the CRM base currency.;ESP=El código de divisa local %1 no coincide con el código de divisa ISO %2 de la divisa base de CRM.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LCYMustMatchBaseCurrencyErr : @@@=%1,%2 - ISO currency codes;ENU=LCY Code %1 does not match ISO Currency Code %2 of the CRM base currency.;ESP=El código de divisa local %1 no coincide con el código de divisa ISO %2 de la divisa base de CRM.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UserNameMustIncludeDomainErr(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //UserNameMustIncludeDomainErr : ENU=The user name must include the domain when the authentication type is set to Active Directory.;ESP=El nombre de usuario debe incluir el dominio si el tipo de autenticación se establece en Active Directory.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserNameMustIncludeDomainErr : ENU=The user name must include the domain when the authentication type is set to Active Directory.;ESP=El nombre de usuario debe incluir el dominio si el tipo de autenticación se establece en Active Directory.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UserNameMustBeEmailErr(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //UserNameMustBeEmailErr : ENU=The user name must be a valid email address when the authentication type is set to Office 365.;ESP=El nombre de usuario debe ser una dirección de correo electrónico válida si el tipo de autenticación se establece en Office 365.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserNameMustBeEmailErr : ENU=The user name must be a valid email address when the authentication type is set to Office 365.;ESP=El nombre de usuario debe ser una dirección de correo electrónico válida si el tipo de autenticación se establece en Office 365.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConnectionStringPwdPlaceHolderMissingErr(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConnectionStringPwdPlaceHolderMissingErr : ENU=The connection string must include the password placeholder {PASSWORD}.;ESP=La cadena de conexión debe incluir el marcador de posición de contraseña {CONTRASEÑA}.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConnectionStringPwdPlaceHolderMissingErr : ENU=The connection string must include the password placeholder {PASSWORD}.;ESP=La cadena de conexión debe incluir el marcador de posición de contraseña {CONTRASE?A}.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotDisableSalesOrderIntErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDisableSalesOrderIntErr : ENU=You cannot disable CRM sales order integration when a CRM sales order has the Submitted status.;ESP=No puede deshabilitar la integración de pedidos de venta de CRM si un pedido de venta de CRM tiene el estado Enviado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDisableSalesOrderIntErr : ENU=You cannot disable CRM sales order integration when a CRM sales order has the Submitted status.;ESP=No puede deshabilitar la integración de pedidos de venta de CRM si un pedido de venta de CRM tiene el estado Enviado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SetCRMSOPEnableQst(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //SetCRMSOPEnableQst : @@@=%1 - product name;ENU=Enabling Sales Order Integration will allow you to create %1 Sales Orders from Dynamics CRM.\\Do you want to continue?;ESP=Al habilitar la integración de pedidos de venta podrá crear pedidos de venta de %1 desde Dynamics CRM.\\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetCRMSOPEnableQst : @@@=%1 - product name;ENU=Enabling Sales Order Integration will allow you to create %1 Sales Orders from Dynamics CRM.\\Do you want to continue?;ESP=Al habilitar la integración de pedidos de venta podrá crear pedidos de venta de %1 desde Dynamics CRM.\\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SetCRMSOPEnableConfirmMsg(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //SetCRMSOPEnableConfirmMsg : @@@="%1 = CRM product name";ENU=Sales Order Integration with %1 is enabled.;ESP=La integración de pedidos de venta con %1 está habilitada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetCRMSOPEnableConfirmMsg : @@@="%1 = CRM product name";ENU=Sales Order Integration with %1 is enabled.;ESP=La integración de pedidos de venta con %1 está habilitada.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SetCRMSOPDisableConfirmMsg(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //SetCRMSOPDisableConfirmMsg : @@@="%1 = CRM product name";ENU=Sales Order Integration with %1 is disabled.;ESP=La integración de pedidos de venta con %1 está deshabilitada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SetCRMSOPDisableConfirmMsg : @@@="%1 = CRM product name";ENU=Sales Order Integration with %1 is disabled.;ESP=La integración de pedidos de venta con %1 está deshabilitada.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UserNotActiveErr(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //UserNotActiveErr : @@@=%1 user name, %2 - server address;ENU=User %1 is disabled on server %2.;ESP=El usuario %1 está deshabilitado en el servidor %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserNotActiveErr : @@@=%1 user name, %2 - server address;ENU=User %1 is disabled on server %2.;ESP=El usuario %1 está deshabilitado en el servidor %2.;
    //Variable type has not been exported.
}

