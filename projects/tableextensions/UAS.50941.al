tableextension 50941 tableextension50941 extends "Service Contract Line"
{
    Caption = 'Service Contract Line';
    fields
    {
        modify("Contract No.")
        {
            Caption = 'Contract No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Service Item No.")
        {
            Caption = 'Service Item No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Service Item Group Code")
        {
            Caption = 'Service Item Group Code';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Last Planned Service Date")
        {
            Caption = 'Last Planned Service Date';
        }
        modify("Last Service Date")
        {
            Caption = 'Last Service Date';
        }
        modify("Last Preventive Maint. Date")
        {
            Caption = 'Last Preventive Maint. Date';
        }
        modify("Line Value")
        {
            Caption = 'Line Value';
        }
        modify("Line Discount %")
        {
            Caption = 'Line Discount %';
        }
        modify("Line Amount")
        {
            Caption = 'Line Amount';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("New Line")
        {
            Caption = 'New Line';
        }
        modify("Line Cost")
        {
            Caption = 'Line Cost';
        }
        modify("Line Discount Amount")
        {
            Caption = 'Line Discount Amount';
        }
        modify(Profit)
        {
            Caption = 'Profit';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=This service item does not belong to customer no. %1.;ESP=Este producto de servicio no pertenece al cliente n.º %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=This service item does not belong to customer no. %1.;ESP=Este producto de servicio no pertenece al cliente no. %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Service item %1 has a different ship-to code for this customer.\\Do you want to continue?;ESP=El producto de servicio %1 tiene un código de dirección de envío diferente para este cliente.\\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Service item %1 has a different ship-to code for this customer.\\Do you want to continue?;ESP=El producto de servicio %1 tiene un código de dirección de envío diferente para este cliente.\\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=%1 field value cannot be later than the %2 field value on the contract line.;ESP=El valor del campo %1 no puede ser posterior que el del campo %2 en la línea de contrato.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=%1 field value cannot be later than the %2 field value on the contract line.;ESP=El valor del campo %1 no puede ser posterior que el del campo %2 en la línea de contrato.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=Service ledger entry exists for service contract line %1.\\You may need to create a credit memo.;ESP=Existe un movimiento de servicio para la línea de contrato %1.\\Es posible que tenga que crear un abono.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=Service ledger entry exists for service contract line %1.\\You may need to create a credit memo.;ESP=Existe un movimiento de servicio para la línea de contrato %1.\\Es posible que tenga que crear un abono.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text015(Variable 1026)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text015 : ENU=You cannot delete service contract lines on %1 service contracts.;ESP=No puede eliminar líns. contrato servicio en %1 contratos servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text015 : ENU=You cannot delete service contract lines on %1 service contracts.;ESP=No puede eliminar líns. contrato servicio en %1 contratos servicio.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text016(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text016 : ENU=Service contract lines must have at least a %1 filled in.;ESP=Las líns. contrato servicio deben tener al menos un %1 rellenado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text016 : ENU=Service contract lines must have at least a %1 filled in.;ESP=Las líns. contrato servicio deben tener al menos un %1 rellenado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text019(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text019 : ENU=Service item %1 already belongs to one or more service contracts/quotes.\\Do you want to continue?;ESP=El producto de servicio %1 ya pertenece a una o más ofertas o contratos.\\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text019 : ENU=Service item %1 already belongs to one or more service contracts/quotes.\\Do you want to continue?;ESP=El producto de servicio %1 ya pertenece a una o más ofertas o contratos.\\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text020(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text020 : ENU=The service period for service item %1 under contract %2 has not yet started.;ESP=El periodo servicio para el prod. servicio %1 bajo el contrato %2 todavía no ha comenzado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text020 : ENU=The service period for service item %1 under contract %2 has not yet started.;ESP=El periodo servicio para el prod. servicio %1 bajo el contrato %2 todavía no ha comenzado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text022(Variable 1033)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text022 : ENU=If you delete this contract line while the Automatic Credit Memos check box is not selected, a credit memo will not be created.\Do you want to continue?;ESP=Si elimina esta línea contrato y no está seleccionada la casilla de verificación de Abonos automáticos, no se creará un abono.\¿Dese continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text022 : ENU=If you delete this contract line while the Automatic Credit Memos check box is not selected, a credit memo will not be created.\Do you want to continue?;ESP=Si elimina esta línea contrato y no está seleccionada la casilla de verificación de Abonos automáticos, no se creará un abono.\?Dese continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text023(Variable 1034)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text023 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text023 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text024(Variable 1035)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text024 : ENU=You cannot enter a later date in or clear the %1 field on the contract line that has been invoiced for the period containing that date.;ESP=No puede introducir una fecha posterior a la existente ni borrar la fecha en el campo %1 de una línea de contrato facturada para el periodo al que corresponde la fecha.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text024 : ENU=You cannot enter a later date in or clear the %1 field on the contract line that has been invoiced for the period containing that date.;ESP=No puede introducir una fecha posterior a la existente ni borrar la fecha en el campo %1 de una línea de contrato facturada para el periodo al que corresponde la fecha.;
    //Variable type has not been exported.
}

