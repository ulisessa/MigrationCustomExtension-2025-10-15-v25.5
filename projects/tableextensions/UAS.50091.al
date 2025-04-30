tableextension 50091 tableextension50091 extends "Direct Debit Collection"
{
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
        modify("To Bank Account No.")
        {
            Caption = 'To Bank Account No.';
        }
        modify("Direct Debit Format")
        {
            OptionCaption = ' ,Standard,N58';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CloseQst(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //CloseQst : ENU=If you close the collection, you will not be able to register the payments from the collection. Do you want to close the collection anyway?;ESP=Si cierra el cobro, no podrá registrar los pagos a partir del cobro. ¿Desea cerrarlo de todos modos?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CloseQst : ENU=If you close the collection, you will not be able to register the payments from the collection. Do you want to close the collection anyway?;ESP=Si cierra el cobro, no podrá registrar los pagos a partir del cobro. ?Desea cerrarlo de todos modos?;
    //Variable type has not been exported.
}

