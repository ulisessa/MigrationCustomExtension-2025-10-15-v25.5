tableextension 50217 "Workflow Rule Ext." extends "Workflow Rule"
{
    fields
    {
        modify("Field No.")
        {
            Caption = 'Field No.';
        }
        modify(Operator)
        {
            OptionCaption = 'Increased,Decreased,Changed';
        }
        modify("Workflow Code")
        {
            Caption = 'Workflow Code';
        }
        modify("Field Caption")
        {
            Caption = 'Field Caption';
        }
    }
}

