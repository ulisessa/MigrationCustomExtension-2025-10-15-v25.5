tableextension 50064 tableextension50064 extends "Cost Allocation Source"
{
    Caption = 'Cost Allocation Source';
    fields
    {
        modify("Valid From")
        {
            Caption = 'Valid From';
        }
        modify("Valid To")
        {
            Caption = 'Valid To';
        }
        modify("Cost Center Code")
        {
            Caption = 'Cost Center Code';
        }
        modify("Cost Object Code")
        {
            Caption = 'Cost Object Code';
        }
        modify("Total Share")
        {
            Caption = 'Total Share';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Allocation Source Type")
        {
            Caption = 'Allocation Source Type';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=To assign the allocation ID, the Last Allocation ID field must be defined in the Cost Accounting setup.;ESP=Para asignar el identificador de asignación, el campo Id. última asignación debe estar definido en la configuración de contabilidad de costes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=To assign the allocation ID, the Last Allocation ID field must be defined in the Cost Accounting setup.;ESP=Para asignar el identificador de asignación, el campo Id. última asignación debe estar definido en la configuración de contabilidad de costes.;
    //Variable type has not been exported.
}

