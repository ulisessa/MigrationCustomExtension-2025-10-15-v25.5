tableextension 51197 tableextension51197 extends "Config. Question"
{
    Caption = 'Config. Question';
    fields
    {
        modify("Questionnaire Code")
        {
            Caption = 'Questionnaire Code';
        }
        modify("Question Area Code")
        {
            Caption = 'Question Area Code';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Answer Option")
        {
            Caption = 'Answer Option';
        }
        modify("Field Caption")
        {
            Caption = 'Field Caption';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Question no. %1 already exists for the field %2.;ESP=La pregunta n.º %1 ya existe para el campo %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Question no. %1 already exists for the field %2.;ESP=La pregunta no. %1 ya existe para el campo %2.;
    //Variable type has not been exported.
}

