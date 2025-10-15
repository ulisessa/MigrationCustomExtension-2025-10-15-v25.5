tableextension 50275 "Approval Workflow Wizard Ext." extends "Approval Workflow Wizard"
{
    Caption = 'Approval Workflow Wizard';
    fields
    {
        modify("Sales Invoice App. Workflow")
        {
            Caption = 'Sales Invoice App. Workflow';
        }
        modify("Sales Amount Approval Limit")
        {
            Caption = 'Sales Amount Approval Limit';
        }
        modify("Purch Invoice App. Workflow")
        {
            Caption = 'Purch Invoice App. Workflow';
        }
        modify("Purch Amount Approval Limit")
        {
            Caption = 'Purch Amount Approval Limit';
        }
        modify("Use Exist. Approval User Setup")
        {
            Caption = 'Use Exist. Approval User Setup';
        }
        modify(TableNo)
        {
            Caption = 'TableNo';
        }
        modify("Field Caption")
        {
            Caption = 'Field Caption';
        }
        modify("App. Trigger")
        {
            Caption = 'App. Trigger';
            OptionCaption = 'The user sends an approval requests manually,The user changes a specific field';
        }
        modify("Field Operator")
        {
            OptionCaption = 'Increased,Decreased,Changed';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
    }
}

