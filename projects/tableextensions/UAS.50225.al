tableextension 50225 "Flow Service Conf. Ext." extends "Flow Service Configuration"
{
    Caption = 'Flow Service Configuration';
    fields
    {
        modify("Flow Service")
        {
            OptionCaption = 'Production Service,Testing Service (TIP 1),Testing Service (TIP 2)';
        }
    }
}

