tableextension 51198 tableextension51198 extends "Config. Package Table"
{
    Caption = 'Config. Package Table';
    fields
    {
        modify("Package Code")
        {
            Caption = 'Package Code';
        }
        modify("No. of Package Records")
        {
            Caption = 'No. of Package Records';
        }
        modify("No. of Package Errors")
        {
            Caption = 'No. of Package Errors';
        }
        modify("Imported Date and Time")
        {
            Caption = 'Imported Date and Time';
        }
        modify("Exported Date and Time")
        {
            Caption = 'Exported Date and Time';
        }
        modify("Created Date and Time")
        {
            Caption = 'Created Date and Time';
        }
        modify("Table Caption")
        {
            Caption = 'Table Caption';
        }
        modify("Page ID")
        {
            Caption = 'Page ID';
        }
        modify("No. of Fields Included")
        {
            Caption = 'No. of Fields Included';
        }
        modify("No. of Fields Available")
        {
            Caption = 'No. of Fields Available';
        }
        modify("No. of Fields to Validate")
        {
            Caption = 'No. of Fields to Validate';
        }
        modify("Package Caption")
        {
            Caption = 'Package Caption';
        }
        modify("Delayed Insert")
        {
            Caption = 'Delayed Insert';
        }
    }

    //Unsupported feature: Code Modification on "InitPackageFields(PROCEDURE 1)".

    //procedure InitPackageFields();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FieldsAdded := false;
    ConfigPackageMgt.SetFieldFilter(Field,"Table ID",0);
    if Field.FindSet then
      repeat
        if not ConfigPackageField.Get("Package Code","Table ID",Field."No.") and
           not ConfigPackageMgt.IsDimSetIDField("Table ID",Field."No.")
        then begin
          ConfigPackageMgt.InsertPackageField(
            ConfigPackageField,"Package Code","Table ID",Field."No.",Field.FieldName,Field."Field Caption",
    #10..38
    end;

    exit(FieldsAdded);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
           not ConfigPackageMgt.ExceptionField("Table ID",Field."No.")
    #7..41
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot use the Dimensions as Columns function for table %1.;ESP=No puede usar la función Dimensiones como columnas para la tabla %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot use the Dimensions as Columns function for table %1.;ESP=No puede usar la función Dimensiones como columnas para la tabla %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=The Default Dimension and Dimension Value tables must be included in the package %1 to enable this option. The missing tables will be added to the package. Do you want to continue?;ESP=Las tablas Dimensión predeterminada y Valor de dimensión deben estar incluidas en el paquete %1 para activar esta opción. Las tablas que falten se agregarán al paquete. ¿Confirma que desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=The Default Dimension and Dimension Value tables must be included in the package %1 to enable this option. The missing tables will be added to the package. Do you want to continue?;ESP=Las tablas Dimensión predeterminada y Valor de dimensión deben estar incluidas en el paquete %1 para activar esta opción. Las tablas que falten se agregarán al paquete. ?Confirma que desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=You cannot rename the configuration package table.;ESP=No puede cambiar el nombre de la tabla de paquetes de configuración.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=You cannot rename the configuration package table.;ESP=No puede cambiar el nombre de la tabla de paquetes de configuración.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=The setup of Dimensions as Columns was canceled.;ESP=La configuración de dimensiones como columnas se ha cancelado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=The setup of Dimensions as Columns was canceled.;ESP=La configuración de dimensiones como columnas se ha cancelado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : ENU=Define the drill-down page in the %1 field.;ESP=Defina la página detallada en el campo %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : ENU=Define the drill-down page in the %1 field.;ESP=Defina la p?gina detallada en el campo %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotAddParentErr(Variable 1033)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotAddParentErr : ENU=Cannot add a parent table. This table is already included in a three-level hierarchy, which is the maximum.;ESP=No se puede agregar una tabla principal. Esta tabla ya está incluida en una jerarquía de tres niveles, que es el máximo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotAddParentErr : ENU=Cannot add a parent table. This table is already included in a three-level hierarchy, which is the maximum.;ESP=No se puede agregar una tabla principal. Esta tabla ya está incluida en una jerarquía de tres niveles, que es el máximo.;
    //Variable type has not been exported.
}

