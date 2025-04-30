tableextension 51169 tableextension51169 extends "Online Map Parameter Setup"
{
    Caption = 'Online Map Parameter Setup';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("URL Encode Non-ASCII Chars")
        {
            Caption = 'URL Encode Non-ASCII Chars';
        }
        modify("Miles/Kilometers Option List")
        {
            Caption = 'Miles/Kilometers Option List';
        }
        modify("Quickest/Shortest Option List")
        {
            Caption = 'Quickest/Shortest Option List';
        }
        modify("Directions from Location Serv.")
        {
            Caption = 'Directions from Location Serv.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Inserting default values will delete your current setup.\Do you wish to continue?;ESP=Al insertar los valores predeterminados se eliminará la configuración actual.\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Inserting default values will delete your current setup.\Do you wish to continue?;ESP=Al insertar los valores predeterminados se eliminará la configuración actual.\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Address parameters must only occur twice in the Directions URL. Validate the use of {%1}.;ESP=Los parámetros de dirección deben producirse solo dos veces en la dirección URL de direcciones. Valide el uso de {%1}.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Address parameters must only occur twice in the Directions URL. Validate the use of {%1}.;ESP=Los parámetros de dirección deben producirse solo dos veces en la dirección URL de direcciones. Valide el uso de {%1}.;
    //Variable type has not been exported.
}

