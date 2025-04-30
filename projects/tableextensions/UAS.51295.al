tableextension 51295 tableextension51295 extends "XML Schema"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (Subtype) on "LoadSchema(PROCEDURE 4).XSDParser(Variable 1005)".


    //Unsupported feature: Property Modification (TextConstString) on "ReplaceQst(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //ReplaceQst : ENU=Do you want to replace the existing definition?;ESP=¿Confirma que desea sustituir la definición existente?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReplaceQst : ENU=Do you want to replace the existing definition?;ESP=?Confirma que desea sustituir la definición existente?;
    //Variable type has not been exported.
}

