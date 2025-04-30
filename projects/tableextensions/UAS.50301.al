tableextension 50301 tableextension50301 extends "Resource Unit of Measure"
{
    fields
    {
        modify("Resource No.")
        {
            Caption = 'Resource No.';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : @@@="%1 = Resource Unit of Measure, %2 = Resource Unit of Measure Code, %3 = Resource No., %4 = Base Unit of Measure";ENU=You cannot change the value %2 of the %1 field for resource %3 because it is the resource''s %4, and there are one or more open ledger entries for the resource.;ESP=No se puede cambiar el valor %2 del campo %1 para el recurso %3 porque es %4 del recurso y hay uno o más movimientos abiertos para el recurso.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : @@@="%1 = Resource Unit of Measure, %2 = Resource Unit of Measure Code, %3 = Resource No., %4 = Base Unit of Measure";ENU=You cannot change the value %2 of the %1 field for resource %3 because it is the resource''s %4, and there are one or more open ledger entries for the resource.;ESP=No se puede cambiar el valor %2 del campo %1 para el recurso %3 porque es %4 del recurso y hay uno o más movimientos abiertos para el recurso.;
    //Variable type has not been exported.
}

