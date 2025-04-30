tableextension 50775 tableextension50775 extends "Manufacturing User Template"
{
    Caption = 'Manufacturing User Template';
    fields
    {
        modify("Create Production Order")
        {
            Caption = 'Create Production Order';
        }
        modify("Purchase Req. Wksh. Template")
        {
            Caption = 'Purchase Req. Wksh. Template';
        }
        modify("Prod. Req. Wksh. Template")
        {
            Caption = 'Prod. Req. Wksh. Template';
        }
        modify("Prod. Wksh. Name")
        {
            Caption = 'Prod. Wksh. Name';
        }
        modify("Make Orders")
        {
            OptionCaption = 'The Active Line,The Active Order,All Lines';
        }
    }
}

