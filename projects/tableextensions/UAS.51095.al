tableextension 51095 tableextension51095 extends "Bin Creation Worksheet Line"
{
    Caption = 'Bin Creation Worksheet Line';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify(Type)
        {
            OptionCaption = 'Bin,Bin Content';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Bin Type Code")
        {
            Caption = 'Bin Type Code';
        }
        modify("Warehouse Class Code")
        {
            Caption = 'Warehouse Class Code';
        }
        modify("Min. Qty.")
        {
            Caption = 'Min. Qty.';
        }
        modify("Max. Qty.")
        {
            Caption = 'Max. Qty.';
        }
        modify("Special Equipment Code")
        {
            Caption = 'Special Equipment Code';
        }
        modify("Bin Ranking")
        {
            Caption = 'Bin Ranking';
        }
        modify("Maximum Cubage")
        {
            Caption = 'Maximum Cubage';
        }
        modify("Maximum Weight")
        {
            Caption = 'Maximum Weight';
        }
        modify(Default)
        {
            Caption = 'Default';
        }
        modify("Cross-Dock Bin")
        {
            Caption = 'Cross-Dock Bin';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        field(50000; "Min. net kilos"; Decimal)
        {
            Caption = 'Min. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(50001; "Max. net kilos"; Decimal)
        {
            Caption = 'Max. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(50002; "Min. gross kilos"; Decimal)
        {
            Caption = 'Min. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(50003; "Max. gross kilos"; Decimal)
        {
            Caption = 'Max. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
    }


    //Unsupported feature: Code Modification on "OpenWksh(PROCEDURE 17)".

    //procedure OpenWksh();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WMSMgt.CheckUserIsWhseEmployee;
    CheckTemplateName(
      BinCreateWkshLine.GetRangeMax("Worksheet Template Name"),
      CurrentLocationCode,CurrentWkshName);
    #5..8
    BinCreateWkshTemplate.Get(BinCreateWkshLine.GetRangeMax("Worksheet Template Name"));
    BinCreateWkshLine.SetRange(Type,BinCreateWkshTemplate.Type);
    BinCreateWkshLine.FilterGroup := 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //WMSMgt.CheckUserIsWhseEmployee;
    #2..11
    */
    //end;


    //Unsupported feature: Code Modification on "CheckTemplateName(PROCEDURE 16)".

    //procedure CheckTemplateName();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WMSMgt.GetWMSLocation(CurrentLocationCode);

    BinCreateWkshName.SetRange("Worksheet Template Name",CurrentWkshTemplateName);
    BinCreateWkshName.SetRange("Location Code",CurrentLocationCode);
    #5..17
      Commit;
    end;
    CurrentWkshName := BinCreateWkshName.Name;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //WMSMgt.GetWMSLocation(CurrentLocationCode);
    #2..20
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Default Worksheet;ESP=Hoja genérica;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Default Worksheet;ESP=Hoja genérica;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=The Total Cubage %1 of the %2 in the bin contents exceeds the entered %3 %4.\Do you still want to enter this %3?;ESP=El cubicaje total %1 del %2 en el tipo de ubicación excede el %3 %4 introducido.\¿Desea introducir este %3?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=The Total Cubage %1 of the %2 in the bin contents exceeds the entered %3 %4.\Do you still want to enter this %3?;ESP=El cubicaje total %1 del %2 en el tipo de ubicación excede el %3 %4 introducido.\?Desea introducir este %3?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=The location %1 of bin creation  Wksh. batch %2 is not enabled for user %3.;ESP=El almacén %1 del proceso hoj. trab. creac. ubic. %2 no está habilitado para usuario %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=The location %1 of bin creation  Wksh. batch %2 is not enabled for user %3.;ESP=El almacén %1 del proceso hoj. trab. creac. ubic. %2 no está habilitado para usuario %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : ENU=There is already a default bin content for location code %1, item no. %2 and variant code %3.;ESP=Hay ya un contenido de ubic. genérica para el cód. de alm. %1, No. prod. %2 y cód. variante %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : ENU=There is already a default bin content for location code %1, item no. %2 and variant code %3.;ESP=Hay ya un contenido de ubic. genérica para el Cód. de alm. %1, No.prod. %2 y Cód. variante %3.;
    //Variable type has not been exported.
}

