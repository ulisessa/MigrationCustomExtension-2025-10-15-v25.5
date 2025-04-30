tableextension 50478 tableextension50478 extends "Analysis View"
{
    Caption = 'Analysis View';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Last Entry No.")
        {
            Caption = 'Last Entry No.';
        }
        modify("Last Budget Entry No.")
        {
            Caption = 'Last Budget Entry No.';
        }
        modify("Last Date Updated")
        {
            Caption = 'Last Date Updated';
        }
        modify("Date Compression")
        {
            Caption = 'Date Compression';
            OptionCaption = 'None,Day,Week,Month,Quarter,Year,Period';
        }
        modify("Dimension 1 Code")
        {
            Caption = 'Dimension 1 Code';
        }
        modify("Dimension 2 Code")
        {
            Caption = 'Dimension 2 Code';
        }
        modify("Dimension 3 Code")
        {
            Caption = 'Dimension 3 Code';
        }
        modify("Dimension 4 Code")
        {
            Caption = 'Dimension 4 Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=%1\You cannot use the same dimension twice in the same analysis view.;ESP=%1\No puede usar la misma dim. dos veces en la misma vista de análisis.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=%1\You cannot use the same dimension twice in the same analysis view.;ESP=%1\No puede usar la misma dim. dos veces en la misma vista de análisis.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The dimension %1 is used in the analysis view %2 %3.;ESP=La dimensión %1 se usa en la vista de análisis %2 %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The dimension %1 is used in the analysis view %2 %3.;ESP=La dimensión %1 se usa en la vista de análisis %2 %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=" You must therefore retain the dimension to keep consistency between the analysis view and the G/L entries.";ESP=" Debe conservar la dimensión para mantener la consistencia entre la vista de análisis y los movs. de contabilidad.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=" You must therefore retain the dimension to keep consistency between the analysis view and the G/L entries.";ESP=" Debe conservar la dimensión para mantener la consistencia entre la vista de análisis y los movs. de contabilidad.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=All analysis views must be updated with the latest G/L entries and G/L budget entries.;ESP=Todas las vistas de análisis deben ser actualizadas con los últimos movs. de contabilidad y presupuestos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=All analysis views must be updated with the latest G/L entries and G/L budget entries.;ESP=Todas las vistas de análisis deben ser actualizadas con los últimos movs. de contabilidad y presupuestos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=" Both blocked and unblocked analysis views must be updated.";ESP=" Deben actualizarse las vistas de análisis bloqueadas y sin bloquear.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=" Both blocked and unblocked analysis views must be updated.";ESP=" Deben actualizarse las vistas de análisis bloqueadas y sin bloquear.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=" Note, you must remove the checkmark in the blocked field before updating the blocked analysis views.\";ESP=" Nota, debe borrar la marca en el campo bloqueado antes de actualizar las vistas de análisis bloqueadas.\";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=" Note, you must remove the checkmark in the blocked field before updating the blocked analysis views.\";ESP=" Nota, debe borrar la marca en el campo bloqueado antes de actualizar las vistas de análisis bloqueadas.\";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=Currently, %1 analysis views are not updated.;ESP=Actualmente, %1 vistas de análisis no están actualizadas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=Currently, %1 analysis views are not updated.;ESP=Actualmente, %1 vistas de análisis no están actualizadas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=" Do you wish to update these analysis views?";ESP=" ¿Confirma que desea actualizar estas vistas de análisis?";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=" Do you wish to update these analysis views?";ESP=" ?Confirma que desea actualizar estas vistas de análisis?";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : ENU=All analysis views must be updated with the latest G/L entries.;ESP=Todas las vistas de análisis deben ser actualizadas con los últimos movs.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : ENU=All analysis views must be updated with the latest G/L entries.;ESP=Todas las vistas de análisis deben ser actualizadas con los últimos movs.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=If you change the contents of the %1 field, the analysis view entries will be deleted.;ESP=Si cambia los contenidos del campo %1, se borrarán los movs. de vista análisis.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=If you change the contents of the %1 field, the analysis view entries will be deleted.;ESP=Si cambia los contenidos del campo %1, se borrarán los movs. de vista análisis.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text012(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text012 : ENU=\You will have to update again.\\Do you want to enter a new value in the %1 field?;ESP=\Tendrá que actualizar de nuevo.\\¿Quiere introducir un valor nuevo en el campo %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text012 : ENU=\You will have to update again.\\Do you want to enter a new value in the %1 field?;ESP=\Tendrá que actualizar de nuevo.\\?Quiere introducir un valor nuevo en el campo %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU=The update has been interrupted in response to the warning.;ESP=La actualización ha sido interrumpida como repuesta a la advertencia.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU=The update has been interrupted in response to the warning.;ESP=La actualización ha sido interrumpida como repuesta a la advertencia.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text014(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text014 : ENU=If you change the contents of the %1 field, the analysis view entries will be changed as well.\\;ESP=Si cambia los contenidos del campo %1, cambiarán también los movs. vista de análisis.\\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text014 : ENU=If you change the contents of the %1 field, the analysis view entries will be changed as well.\\;ESP=Si cambia los contenidos del campo %1, cambiarán tambión los movs. vista de análisis.\\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text015(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text015 : ENU=Do you want to enter a new value in the %1 field?;ESP=¿Confirma que desea introducir un valor nuevo en el campo %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text015 : ENU=Do you want to enter a new value in the %1 field?;ESP=?Confirma que desea introducir un valor nuevo en el campo %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text017(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text017 : ENU=When you enable %1, you need to update the analysis view. Do you want to update the analysis view now?;ESP=Si se activa %1, debe actualizarse la vista de análisis. ¿Desea actualizar la vista de análisis ahora?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text017 : ENU=When you enable %1, you need to update the analysis view. Do you want to update the analysis view now?;ESP=Si se activa %1, debe actualizarse la vista de análisis. ?Desea actualizar la vista de análisis ahora?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ClearDimTotalingConfirmTxt(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //ClearDimTotalingConfirmTxt : ENU=Changing dimension will clear dimension totaling columns of Account Schedule Lines using current Analysis Vew. \Do you want to continue?;ESP=Al cambiar la dimensión, se borrarán las columnas totales de dimensiones de las líneas del esquema de cuentas mediante la Vista de análisis actual. \¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ClearDimTotalingConfirmTxt : ENU=Changing dimension will clear dimension totaling columns of Account Schedule Lines using current Analysis Vew. \Do you want to continue?;ESP=Al cambiar la dimensión, se borrarán las columnas totales de dimensiones de las líneas del esquema de cuentas mediante la Vista de análisis actual. \?Desea continuar?;
    //Variable type has not been exported.
}

