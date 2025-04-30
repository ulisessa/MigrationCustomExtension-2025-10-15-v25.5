page 50089 "General Translations"
{
    Caption = 'Item Translations';
    DataCaptionFields = "Name/Desciption";
    PageType = List;
    SourceTable = "General Translation";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Language ID"; "Language ID")
                {
                }
                field("Name/Desciption"; "Name/Desciption")
                {
                }
            }
        }
    }

    actions
    {
    }
}

