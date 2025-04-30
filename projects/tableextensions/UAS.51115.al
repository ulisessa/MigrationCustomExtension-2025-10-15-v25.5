tableextension 51115 tableextension51115 extends "VAT Report Setup"
{
    Caption = 'VAT Report Setup';
    fields
    {
        modify("Modify Submitted Reports")
        {
            Caption = 'Allow Modification';
        }
        modify("VAT Return No. Series")
        {
            Caption = 'VAT Return No. Series';
        }
        modify("VAT Return Period No. Series")
        {
            Caption = 'VAT Return Period No. Series';
        }
        modify("Report Version")
        {
            Caption = 'Report Version';
        }
        modify("Manual Receive Period CU ID")
        {
            Caption = 'Manual Receive Period CU ID';
        }
        modify("Manual Receive Period CU Cap")
        {
            Caption = 'Manual Receive Period CU Cap';
        }
        modify("Auto Receive Period CU ID")
        {
            Caption = 'Auto Receive Period CU ID';
        }
        modify("Auto Receive Period CU Cap")
        {
            Caption = 'Auto Receive Period CU Cap';
        }
        modify("Receive Submitted Return CU ID")
        {
            Caption = 'Receive Submitted Return CU ID';
        }
        modify("Receive Submitted Return CUCap")
        {
            Caption = 'Receive Submitted Return CUCap';
        }
        modify("Period Reminder Calculation")
        {
            Caption = 'Period Reminder Calculation';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "PositivePeriodReminderCalcErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //PositivePeriodReminderCalcErr : ENU=The Period Reminder Calculation should be a positive formula. For example, "1M" should be used instead of "-1M".;ESP=El Cálculo de recordatorio de período debe ser una fórmula positiva, por ejemplo, "1M" se debe usar en lugar de "-1 M".;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PositivePeriodReminderCalcErr : ENU=The Period Reminder Calculation should be a positive formula. For example, "1M" should be used instead of "-1M".;ESP=El Cálculo de recordatorio de período debe ser una Fórmula positiva, por ejemplo, "1M" se debe usar en lugar de "-1 M".;
    //Variable type has not been exported.
}

