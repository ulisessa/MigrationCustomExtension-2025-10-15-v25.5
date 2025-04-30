tableextension 51168 tableextension51168 extends "Online Map Setup"
{
    Caption = 'Online Map Setup';
    fields
    {
        modify("Map Parameter Setup Code")
        {
            Caption = 'Map Parameter Setup Code';
        }
        modify("Distance In")
        {
            OptionCaption = 'Miles,Kilometers';
        }
        modify(Route)
        {
            OptionCaption = 'Quickest,Shortest';
        }
    }
}

