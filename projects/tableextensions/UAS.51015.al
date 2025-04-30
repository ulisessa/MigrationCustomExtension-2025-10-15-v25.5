tableextension 51015 tableextension51015 extends "Bill Group"
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
        modify("Dealing Type")
        {
            Caption = 'Dealing Type';
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
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text1100001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100001 : ENU=The creation of a new %1 was cancelled by the user;ESP=Se ha cancelado la creación de %1 por el usuario;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100001 : ENU=The creation of a new %1 was cancelled by the user;ESP=Se ha cancelado la creación de %1 por el usuario;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100002 : ENU=This Bill Group is not empty. Remove all its bills and try again.;ESP=La remesa no está vacía. Elimine todos sus efectos e inténtelo de nuevo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100002 : ENU=This Bill Group is not empty. Remove all its bills and try again.;ESP=La remesa no está vacía. Elimine todos sus efectos e inténtelo de nuevo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100003 : ENU=can only be changed when the %1 is empty;ESP=solo se puede cambiar cuando %1 está vacía;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100003 : ENU=can only be changed when the %1 is empty;ESP=solo se puede cambiar cuando %1 está vacía;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100004 : ENU=The operation is not allowed for bill groups using %1. Check your currency setup.;ESP=La operación no se permite para remesas que usan %1. Compruebe la configuración de la divisa.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100004 : ENU=The operation is not allowed for bill groups using %1. Check your currency setup.;ESP=La operación no se permite para remesas que usan %1. Compruebe la configuración de la divisa.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100007(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100007 : ENU=This bill group has already been printed. Proceed anyway?;ESP=Ya se ha impreso la remesa. ¿Confirma que desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100007 : ENU=This bill group has already been printed. Proceed anyway?;ESP=Ya se ha impreso la remesa. ?Confirma que desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100008(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100008 : ENU=The update has been interrupted by the user.;ESP=La actualización se ha interrumpido por el usuario.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100008 : ENU=The update has been interrupted by the user.;ESP=La actualización se ha interrumpido por el usuario.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100012(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100012 : ENU=untitled;ESP=sin título;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100012 : ENU=untitled;ESP=sin título;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "InvoiceDiscountingOptionTxt(Variable 1100016)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvoiceDiscountingOptionTxt : ENU=Invoice Discounting;ESP=Operación de cesión de crédito;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvoiceDiscountingOptionTxt : ENU=Invoice Discounting;ESP=Operación de cesión de Crédito;
    //Variable type has not been exported.
}

