tableextension 51094 tableextension51094 extends "Bin Creation Wksh. Name"
{
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Template Type")
        {
            OptionCaption = 'Put-away,Pick,Movement';
        }
    }
}

