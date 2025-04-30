tableextension 51106 tableextension51106 extends Bin
{
    Caption = 'Bin';
    fields
    {
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Adjustment Bin")
        {
            Caption = 'Adjustment Bin';
        }
        modify("Bin Type Code")
        {
            Caption = 'Bin Type Code';
        }
        modify("Warehouse Class Code")
        {
            Caption = 'Warehouse Class Code';
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
        modify(Empty)
        {
            Caption = 'Empty';
        }
        modify(Default)
        {
            Caption = 'Default';
        }
        modify("Cross-Dock Bin")
        {
            Caption = 'Cross-Dock Bin';
        }
        field(50000; "No es posicionamiento"; Boolean)
        {
            InitValue = true;
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU="You cannot %1 the %2 with %3 = %4, %5 = %6, because one or more %7 exists for this %2.";ESP="No puede %1 el %2 con %3 = %4, %5 = %6, porque existen uno o más %7 para este %2.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU="You cannot %1 the %2 with %3 = %4, %5 = %6, because one or more %7 exists for this %2.";ESP="No puede %1 el %2 con %3 = %4, %5 = %6, porque existen uno o más %7 para este %2.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=One or more %1 exists for this bin. Do you still want to delete this %2?;ESP=Existen uno o más %1 para esta ubicación. ¿Desea eliminar este %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=One or more %1 exists for this bin. Do you still want to delete this %2?;ESP=Existen uno o más %1 para esta ubicación. ?Desea eliminar este %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=The total cubage %1 of the %2 in the bin contents exceeds the entered %3 %4.\Do you still want to enter this %3?;ESP=El cubicaje total %1 del %2 en los contenidos ubicación excede el introducido en %3 %4.\¿Desea insertar este %3?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=The total cubage %1 of the %2 in the bin contents exceeds the entered %3 %4.\Do you still want to enter this %3?;ESP=El cubicaje total %1 del %2 en los contenidos ubicación excede el introducido en %3 %4.\?Desea insertar este %3?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=The total weight %1 of the %2 in the bin contents exceeds the entered %3 %4.\Do you still want to enter this %3?;ESP=El peso total %1 del %2 en los contenidos ubicación excede el introducido en %3 %4.\¿Desea insertar este %3?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=The total weight %1 of the %2 in the bin contents exceeds the entered %3 %4.\Do you still want to enter this %3?;ESP=El peso total %1 del %2 en los contenidos ubicación excede el introducido en %3 %4.\?Desea insertar este %3?;
    //Variable type has not been exported.
}

