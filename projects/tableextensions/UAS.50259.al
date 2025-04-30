tableextension 50259 tableextension50259 extends "Standard Purchase Code"
{
    Caption = 'Standard Purchase Code';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=If you change the %1, the %2 will be rounded according to the new %3.;ESP=Si cambia el %1, el %2 será redondeado con el nuevo %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=If you change the %1, the %2 will be rounded according to the new %3.;ESP=Si cambia el %1, el %2 será redondeado con el nuevo %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "StdPurchCodeDeletionQst(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //StdPurchCodeDeletionQst : @@@="%1=Standard Purchase Code, %2=Table Caption";ENU=If you delete the code %1, the related records in the %2 table will also be deleted. Do you want to continue?;ESP=Si elimina el código %1, también se eliminarán los registros relacionados en la tabla %2. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //StdPurchCodeDeletionQst : @@@="%1=Standard Purchase Code, %2=Table Caption";ENU=If you delete the code %1, the related records in the %2 table will also be deleted. Do you want to continue?;ESP=Si elimina el código %1, tambión se eliminarán los registros relacionados en la tabla %2. ?Desea continuar?;
    //Variable type has not been exported.
}

