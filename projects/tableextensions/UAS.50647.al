tableextension 50647 tableextension50647 extends "Interaction Tmpl. Language"
{
    Caption = 'Interaction Tmpl. Language';
    fields
    {
        modify("Interaction Template Code")
        {
            Caption = 'Interaction Template Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Attachment No.")
        {
            Caption = 'Attachment No.';
        }
        modify("Custom Layout Code")
        {
            Caption = 'Custom Layout Code';
        }
        modify("Custom Layout Description")
        {
            Caption = 'Custom Layout Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Replace existing attachment?;ESP=¿Sustituir el anexo actual?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Replace existing attachment?;ESP=?Sustituir el anexo actual?;
    //Variable type has not been exported.
}

