tableextension 50874 tableextension50874 extends "Standard Cost Worksheet"
{
    Caption = 'Standard Cost Worksheet';
    fields
    {
        modify("Standard Cost Worksheet Name")
        {
            Caption = 'Standard Cost Worksheet Name';
        }
        modify(Type)
        {
            OptionCaption = 'Item,Work Center,Machine Center,Resource';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Replenishment System")
        {
            Caption = 'Replenishment System';
        }
        modify("Standard Cost")
        {
            Caption = 'Standard Cost';
        }
        modify("New Standard Cost")
        {
            Caption = 'New Standard Cost';
        }
    }
}

