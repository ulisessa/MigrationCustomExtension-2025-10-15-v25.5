tableextension 51232 tableextension51232 extends "Permission Set Buffer"
{
    fields
    {
        modify(Scope)
        {
            Caption = 'Scope';
        }
        modify("App ID")
        {
            Caption = 'App ID';
        }
        modify("App Name")
        {
            Caption = 'App Name';
        }
        modify(Type)
        {
            OptionCaption = 'User-Defined,Extension,System';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CannotRenameTenantPermissionSetHavingUsageErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotRenameTenantPermissionSetHavingUsageErr : ENU=You cannot rename a tenant permission set until it is used elsewhere, for example, in permission settings for a user or user group.;ESP=No se puede cambiar el nombre de un conjunto de permisos de suscriptor hasta que no se use en otro lugar, por ejemplo, en la configuración de permisos para un usuario o un grupo de usuarios.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotRenameTenantPermissionSetHavingUsageErr : ENU=You cannot rename a tenant permission set until it is used elsewhere, for example, in permission settings for a user or user group.;ESP=No se puede cambiar el nombre de un conjunto de permisos de suscriptor hasta que no se use en otro lugar, por ejemplo, en la configuración de permisos para un usuario o un grupo de usuarios.;
    //Variable type has not been exported.
}

