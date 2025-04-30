tableextension 50910 tableextension50910 extends "Service Mgt. Setup"
{
    Caption = 'Service Mgt. Setup';
    fields
    {
        modify("Fault Reporting Level")
        {
            OptionCaption = 'None,Fault,Fault+Symptom,Fault+Symptom+Area (IRIS)';
        }
        modify("Warranty Disc. % (Parts)")
        {
            Caption = 'Warranty Disc. % (Parts)';
        }
        modify("Warranty Disc. % (Labor)")
        {
            Caption = 'Warranty Disc. % (Labor)';
        }
        modify("Contract Inv. Line Text Code")
        {
            Caption = 'Contract Inv. Line Text Code';
        }
        modify("Contract Line Inv. Text Code")
        {
            Caption = 'Contract Line Inv. Text Code';
        }
        modify("Contract Inv. Period Text Code")
        {
            Caption = 'Contract Inv. Period Text Code';
        }
        modify("Contract Credit Line Text Code")
        {
            Caption = 'Contract Credit Line Text Code';
        }
        modify("Send First Warning To")
        {
            Caption = 'Send First Warning To';
        }
        modify("Send Second Warning To")
        {
            Caption = 'Send Second Warning To';
        }
        modify("Send Third Warning To")
        {
            Caption = 'Send Third Warning To';
        }
        modify("Next Service Calc. Method")
        {
            Caption = 'Next Service Calc. Method';
        }
        modify("Service Zones Option")
        {
            Caption = 'Service Zones Option';
            OptionCaption = 'Code Shown,Warning Displayed,Not Used';
        }
        modify("Resource Skills Option")
        {
            Caption = 'Resource Skills Option';
            OptionCaption = 'Code Shown,Warning Displayed,Not Used';
        }
        modify("One Service Item Line/Order")
        {
            Caption = 'One Service Item Line/Order';
        }
        modify("Fault Reason Code Mandatory")
        {
            Caption = 'Fault Reason Code Mandatory';
        }
        modify("Contract Serv. Ord.  Max. Days")
        {
            Caption = 'Contract Serv. Ord.  Max. Days';
        }
        modify("Last Contract Service Date")
        {
            Caption = 'Last Contract Service Date';
        }
        modify("Work Type Code Mandatory")
        {
            Caption = 'Work Type Code Mandatory';
        }
        modify("Logo Position on Documents")
        {
            Caption = 'Logo Position on Documents';
        }
        modify("Use Contract Cancel Reason")
        {
            Caption = 'Use Contract Cancel Reason';
        }
        modify("Default Response Time (Hours)")
        {
            Caption = 'Default Response Time (Hours)';
        }
        modify("Default Warranty Duration")
        {
            Caption = 'Default Warranty Duration';
        }
        modify("Contract Invoice Nos.")
        {
            Caption = 'Contract Invoice Nos.';
        }
        modify("Service Order Nos.")
        {
            Caption = 'Service Order Nos.';
        }
        modify("Service Contract Nos.")
        {
            Caption = 'Service Contract Nos.';
        }
        modify("Contract Template Nos.")
        {
            Caption = 'Contract Template Nos.';
        }
        modify("Troubleshooting Nos.")
        {
            Caption = 'Troubleshooting Nos.';
        }
        modify("Prepaid Posting Document Nos.")
        {
            Caption = 'Prepaid Posting Document Nos.';
        }
        modify("Loaner Nos.")
        {
            Caption = 'Loaner Nos.';
        }
        modify("Serv. Job Responsibility Code")
        {
            Caption = 'Serv. Job Responsibility Code';
        }
        modify("Contract Value Calc. Method")
        {
            Caption = 'Contract Value Calc. Method';
        }
        modify("Service Quote Nos.")
        {
            Caption = 'Service Quote Nos.';
        }
        modify("Posted Service Invoice Nos.")
        {
            Caption = 'Posted Service Invoice Nos.';
        }
        modify("Posted Serv. Credit Memo Nos.")
        {
            Caption = 'Posted Serv. Credit Memo Nos.';
        }
        modify("Posted Service Shipment Nos.")
        {
            Caption = 'Posted Service Shipment Nos.';
        }
        modify("Shipment on Invoice")
        {
            Caption = 'Shipment on Invoice';
        }
        modify("Service Credit Memo Nos.")
        {
            Caption = 'Service Credit Memo Nos.';
        }
        modify("Base Calendar Code")
        {
            Caption = 'Base Calendar Code';
        }
        modify("Contract Credit Memo Nos.")
        {
            Caption = 'Contract Credit Memo Nos.';
        }
    }
}

