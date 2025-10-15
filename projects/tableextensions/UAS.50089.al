tableextension 50089 "Credit Transfer Register Ext." extends "Credit Transfer Register"
{
    Caption = 'Credit Transfer Register';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Created Date-Time")
        {
            Caption = 'Created Date-Time';
        }
        modify("No. of Transfers")
        {
            Caption = 'No. of Transfers';
        }
        modify("From Bank Account No.")
        {
            Caption = 'From Bank Account No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "PaymentsFileNotFoundErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //PaymentsFileNotFoundErr : ENU=The original payment file was not found.\Export a new file from the Payment Journal window.;ESP=No se encontró el archivo de pagos original.\Exporte un archivo nuevo desde la ventana Diario pagos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PaymentsFileNotFoundErr : ENU=The original payment file was not found.\Export a new file from the Payment Journal window.;ESP=No se encontró el archivo de pagos original.\Exporte un archivo nuevo desde la ventana Diario pagos.;
    //Variable type has not been exported.
}

