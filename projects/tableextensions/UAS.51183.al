tableextension 51183 tableextension51183 extends "Cash Flow Setup"
{
    Caption = 'Cash Flow Setup';
    fields
    {
        modify("Cash Flow Forecast No. Series")
        {
            Caption = 'Cash Flow Forecast No. Series';
        }
        modify("Receivables CF Account No.")
        {
            Caption = 'Receivables CF Account No.';
        }
        modify("Payables CF Account No.")
        {
            Caption = 'Payables CF Account No.';
        }
        modify("Sales Order CF Account No.")
        {
            Caption = 'Sales Order CF Account No.';
        }
        modify("Purch. Order CF Account No.")
        {
            Caption = 'Purch. Order CF Account No.';
        }
        modify("FA Budget CF Account No.")
        {
            Caption = 'FA Budget CF Account No.';
        }
        modify("FA Disposal CF Account No.")
        {
            Caption = 'FA Disposal CF Account No.';
        }
        modify("Service CF Account No.")
        {
            Caption = 'Service CF Account No.';
        }
        modify("CF No. on Chart in Role Center")
        {
            Caption = 'CF No. on Chart in Role Center';
        }
        modify("Job CF Account No.")
        {
            Caption = 'Job CF Account No.';
        }
        modify("Automatic Update Frequency")
        {
            Caption = 'Automatic Update Frequency';
        }
        modify("Tax CF Account No.")
        {
            Caption = 'Tax CF Account No.';
        }
        modify("Taxable Period")
        {
            Caption = 'Taxable Period';
            OptionCaption = 'Monthly,Quarterly,Accounting Period,Yearly';
        }
        modify("Tax Bal. Account No.")
        {
            Caption = 'Tax Bal. Account No.';
        }
        modify("Variance %")
        {
            Caption = 'Variance %';
        }
        modify("Historical Periods")
        {
            Caption = 'Historical Periods';
        }
        modify("Period Type")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year';
        }
        modify("Service Pass API Key ID")
        {
            Caption = 'Service Pass API Key ID';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : @@@=Cash Flow <No.> <Description> is shown in the chart on the Role Center.;ENU=Cash Flow Forecast %1 %2 is shown in the chart on the Role Center. Do you want to show this Cash Flow Forecast instead?;ESP=La previsión de flujo de efectivo %1 %2 se muestra en el gráfico del área de trabajo. ¿Desea ver la previsión de flujo de efectivo en su lugar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : @@@=Cash Flow <No.> <Description> is shown in the chart on the Role Center.;ENU=Cash Flow Forecast %1 %2 is shown in the chart on the Role Center. Do you want to show this Cash Flow Forecast instead?;ESP=La previsión de flujo de efectivo %1 %2 se muestra en el gr?fico del área de trabajo. ?Desea ver la previsión de flujo de efectivo en su lugar?;
    //Variable type has not been exported.
}

