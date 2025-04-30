tableextension 51247 tableextension51247 extends "User Security Status"
{
    fields
    {
        modify("CDS Integration Errors")
        {
            Caption = 'CDS Integration Errors';
        }
        modify("Coupled Data Synch Errors")
        {
            Caption = 'Coupled Data Synch Errors';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "SecurityActivityTok(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //SecurityActivityTok : ENU=User review;ESP=Revisión de usuario;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SecurityActivityTok : ENU=User review;ESP=Revisión de usuario;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SecurityContextTok(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //SecurityContextTok : ENU=Security administration;ESP=Administración de seguridad;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SecurityContextTok : ENU=Security administration;ESP=Administración de seguridad;
    //Variable type has not been exported.
}

