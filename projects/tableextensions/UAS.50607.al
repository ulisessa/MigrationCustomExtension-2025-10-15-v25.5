tableextension 50607 tableextension50607 extends "Interaction Template"
{
    Caption = 'Interaction Template';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Interaction Group Code")
        {
            Caption = 'Interaction Group Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Unit Duration (Min.)")
        {
            Caption = 'Unit Duration (Min.)';
        }
        modify("Information Flow")
        {
            Caption = 'Information Flow';
        }
        modify("Attachment No.")
        {
            Caption = 'Attachment No.';
        }
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify("Campaign Target")
        {
            Caption = 'Campaign Target';
        }
        modify("Campaign Response")
        {
            Caption = 'Campaign Response';
        }
        modify("Correspondence Type (Default)")
        {
            Caption = 'Correspondence Type (Default)';
        }
        modify("No. of Interactions")
        {
            Caption = 'No. of Interactions';
        }
        modify("Duration (Min.)")
        {
            Caption = 'Duration (Min.)';
        }
        modify("Language Code (Default)")
        {
            Caption = 'Language Code (Default)';
        }
        modify("Wizard Action")
        {
            Caption = 'Wizard Action';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=Do you want to create %1 %2?;ESP=¿Confirma que desea crear %1 %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=Do you want to create %1 %2?;ESP=?Confirma que desea crear %1 %2?;
    //Variable type has not been exported.
}

