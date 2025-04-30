tableextension 50967 tableextension50967 extends "Serv. Price Adjustment Detail"
{
    fields
    {
        modify("Serv. Price Adjmt. Gr. Code")
        {
            Caption = 'Serv. Price Adjmt. Gr. Code';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=%1 already exists with adjustments for specific %2 numbers. Delete these lines if you need an adjustment for all %2 records.;ESP=Ya existe el %1 con ajustes para %2 números específicos. Elimine estas líneas si necesita un ajuste para todos los registros %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=%1 already exists with adjustments for specific %2 numbers. Delete these lines if you need an adjustment for all %2 records.;ESP=Ya existe el %1 con ajustes para %2 números específicos. Elimine estas líneas si necesita un ajuste para todos los registros %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=%1 already exists for this %2 with %3 set to blank. Delete this line if you need adjustments for specific %4 numbers.;ESP=Ya existe %1 para este %2 con %3 blanco. Elimine esta línea si necesita ajustes para %4 números específicos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=%1 already exists for this %2 with %3 set to blank. Delete this line if you need adjustments for specific %4 numbers.;ESP=Ya existe %1 para este %2 con %3 blanco. Elimine esta línea si necesita ajustes para %4 números específicos.;
    //Variable type has not been exported.
}

