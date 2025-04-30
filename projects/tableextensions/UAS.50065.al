tableextension 50065 tableextension50065 extends "Cost Allocation Target"
{
    Caption = 'Cost Allocation Target';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Static Base")
        {
            Caption = 'Static Base';
        }
        modify("Static Weighting")
        {
            Caption = 'Static Weighting';
        }
        modify(Share)
        {
            Caption = 'Share';
        }
        modify("No. Filter")
        {
            Caption = 'No. Filter';
        }
        modify("Allocation Target Type")
        {
            Caption = 'Allocation Target Type';
        }
        modify("Percent per Share")
        {
            Caption = 'Percent per Share';
        }
        modify("Amount per Share")
        {
            Caption = 'Amount per Share';
        }
        modify("Share Updated on")
        {
            Caption = 'Share Updated on';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=%1 can only be used with static allocations.;ESP=%1 solo se puede usar con asignaciones estáticas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=%1 can only be used with static allocations.;ESP=%1 solo se puede usar con asignaciones estáticas.;
    //Variable type has not been exported.
}

