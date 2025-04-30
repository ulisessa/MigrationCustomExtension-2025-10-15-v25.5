tableextension 51040 tableextension51040 extends "Activity Log"
{
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Detailed Info")
        {
            Caption = 'Detailed Info';
        }
        modify("Table No Filter")
        {
            Caption = 'Table No Filter';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DataTypeNotValidErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //DataTypeNotValidErr : ENU=The specified variant type is not valid.;ESP=El tipo de variante especificado no es válido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DataTypeNotValidErr : ENU=The specified variant type is not valid.;ESP=El tipo de variante especificado no es válido.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoDetailsMsg(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoDetailsMsg : ENU=The log does not contain any more details.;ESP=El registro no contiene más detalles.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoDetailsMsg : ENU=The log does not contain any more details.;ESP=El registro no contiene más detalles.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConfirmDeletingEntriesQst(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmDeletingEntriesQst : ENU=Are you sure that you want to delete log entries?;ESP=¿Seguro que desea eliminar los movimientos del registro?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmDeletingEntriesQst : ENU=Are you sure that you want to delete log entries?;ESP=?Seguro que desea eliminar los movimientos del registro?;
    //Variable type has not been exported.
}

