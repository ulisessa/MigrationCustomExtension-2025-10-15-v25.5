tableextension 50654 tableextension50654 extends Rating
{
    Caption = 'Rating';
    fields
    {
        modify("Profile Questionnaire Code")
        {
            Caption = 'Profile Questionnaire Code';
        }
        modify("Profile Questionnaire Line No.")
        {
            Caption = 'Profile Questionnaire Line No.';
        }
        modify("Rating Profile Quest. Code")
        {
            Caption = 'Rating Profile Quest. Code';
        }
        modify("Rating Profile Quest. Line No.")
        {
            Caption = 'Rating Profile Quest. Line No.';
        }
        modify("Profile Question Description")
        {
            Caption = 'Profile Question Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Rating deadlock involving question %1 - insert aborted.\;ESP=Bloqueo clasificación para la pregunta %1 - inserción anulada.\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Rating deadlock involving question %1 - insert aborted.\;ESP=Bloqueo clasificación para la pregunta %1 - inserción anulada.\;
    //Variable type has not been exported.
}

