tableextension 51332 tableextension51332 extends "Production BOM Line"
{
    Caption = 'Production BOM Line';
    fields
    {
        modify("Production BOM No.")
        {
            Caption = 'Production BOM No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Version Code")
        {
            Caption = 'Version Code';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify(Position)
        {
            Caption = 'Position';
        }
        modify("Position 2")
        {
            Caption = 'Position 2';
        }
        modify("Position 3")
        {
            Caption = 'Position 3';
        }
        modify("Routing Link Code")
        {
            Caption = 'Routing Link Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Calculation Formula")
        {
            Caption = 'Calculation Formula';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "BOMVersionUOMErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //BOMVersionUOMErr : @@@="%1=UOM Code;%2=Item No.;%3=Production BOM No.;%4=Version Code";ENU="The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3, Version Code = %4.";ESP="No existe el código de unidad de medida %1 para el elemento %2. Campos y valores de identificación: N.º L.M. producción = %3, Código de versión = %4.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BOMVersionUOMErr : @@@="%1=UOM Code;%2=Item No.;%3=Production BOM No.;%4=Version Code";ENU="The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3, Version Code = %4.";ESP="No existe el código de unidad de medida %1 para el elemento %2. Campos y valores de identificación: No. L.M. producción = %3, Código de versión = %4.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BOMHeaderUOMErr(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //BOMHeaderUOMErr : @@@="%1=UOM Code;%2=Item No.;%3=Production BOM No.";ENU="The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3.";ESP="No existe el código de unidad de medida %1 para el elemento %2. Campos y valores de identificación: N.º L.M. producción = %3.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BOMHeaderUOMErr : @@@="%1=UOM Code;%2=Item No.;%3=Production BOM No.";ENU="The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3.";ESP="No existe el código de unidad de medida %1 para el elemento %2. Campos y valores de identificación: No. L.M. producción = %3.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BOMLineUOMErr(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //BOMLineUOMErr : @@@="%1=UOM Code;%2=Item No.;%3=Production BOM No.;%4=Version Code;%5=Line No.";ENU="The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3, Version Code = %4, Line No. = %5.";ESP="No existe el código de unidad de medida %1 para el elemento %2. Campos y valores de identificación: N.º L.M. producción = %3, Código de versión = %4, N.º línea = %5.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BOMLineUOMErr : @@@="%1=UOM Code;%2=Item No.;%3=Production BOM No.;%4=Version Code;%5=Line No.";ENU="The Unit of Measure Code %1 for Item %2 does not exist. Identification fields and values: Production BOM No. = %3, Version Code = %4, Line No. = %5.";ESP="No existe el código de unidad de medida %1 para el elemento %2. Campos y valores de identificación: No. L.M. producción = %3, Código de versión = %4, No. línea = %5.";
    //Variable type has not been exported.
}

