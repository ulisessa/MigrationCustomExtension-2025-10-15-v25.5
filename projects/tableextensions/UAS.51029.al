tableextension 51029 tableextension51029 extends "Payment Order"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("No. Printed")
        {
            Caption = 'No. Printed';
        }
        modify("Category Filter")
        {
            Caption = 'Category Filter';
        }
        modify("Global Dimension 1 Filter")
        {
            Caption = 'Global Dimension 1 Filter';
        }
        modify("Global Dimension 2 Filter")
        {
            Caption = 'Global Dimension 2 Filter';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Export Electronic Payment")
        {
            Caption = 'Export Electronic Payment';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text1100000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100000 : ENU=This Payment Order is not empty. Remove all its bills and invoices and try again.;ESP=La orden de pago no está vacía. Elimine todos sus efectos y facturas e inténtelo de nuevo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100000 : ENU=This Payment Order is not empty. Remove all its bills and invoices and try again.;ESP=La orden de pago no está vacía. Elimine todos sus efectos y facturas e inténtelo de nuevo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100001 : ENU=can only be changed when the %1 is empty;ESP=solo se puede cambiar cuando %1 está vacía;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100001 : ENU=can only be changed when the %1 is empty;ESP=solo se puede cambiar cuando %1 está vacía;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100002 : ENU=The operation is not allowed for payment order using %1. Check your currency setup.;ESP=La operación no se permite para ord. pago que usan %1. Compruebe la configuración de la divisa.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100002 : ENU=The operation is not allowed for payment order using %1. Check your currency setup.;ESP=La operación no se permite para ord. pago que usan %1. Compruebe la configuración de la divisa.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100003 : ENU=This payment order has already been printed. Proceed anyway?;ESP=Ya se ha impreso la orden de pago. ¿Confirma que desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100003 : ENU=This payment order has already been printed. Proceed anyway?;ESP=Ya se ha impreso la orden de pago. ?Confirma que desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100004 : ENU=The update has been interrupted by the user.;ESP=La actualización se ha interrumpido por el usuario.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100004 : ENU=The update has been interrupted by the user.;ESP=La actualización se ha interrumpido por el usuario.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100008(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100008 : ENU=untitled;ESP=sin título;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100008 : ENU=untitled;ESP=sin título;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ExportAgainQst(Variable 1100000)".

    //var
    //>>>> ORIGINAL VALUE:
    //ExportAgainQst : ENU=The selected payment order has already been exported. Do you want to export again?;ESP=La orden de pago seleccionada ya se ha exportado. ¿Desea repetir la exportación?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ExportAgainQst : ENU=The selected payment order has already been exported. Do you want to export again?;ESP=La orden de pago seleccionada ya se ha exportado. ?Desea repetir la exportación?;
    //Variable type has not been exported.
}

