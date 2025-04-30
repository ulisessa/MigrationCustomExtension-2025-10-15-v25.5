tableextension 51093 tableextension51093 extends "Bin Creation Wksh. Template"
{
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Page ID")
        {
            Caption = 'Page ID';
        }
        modify(Type)
        {
            OptionCaption = 'Bin,Bin Content';
        }
        modify("Page Caption")
        {
            Caption = 'Page Caption';
        }
    }
}

