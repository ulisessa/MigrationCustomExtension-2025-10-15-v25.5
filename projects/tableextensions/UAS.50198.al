tableextension 50198 tableextension50198 extends "Workflow Step Instance"
{
    fields
    {
        modify("Workflow Code")
        {
            Caption = 'Workflow Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Created Date-Time")
        {
            Caption = 'Created Date-Time';
        }
        modify("Last Modified Date-Time")
        {
            Caption = 'Last Modified Date-Time';
        }
        modify("Last Modified By User ID")
        {
            Caption = 'Last Modified By User ID';
        }
        modify("Function Name")
        {
            Caption = 'Function Name';
        }
        modify("Original Workflow Code")
        {
            Caption = 'Original Workflow Code';
        }
        modify("Sequence No.")
        {
            Caption = 'Sequence No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "ActiveInstancesWillBeArchivedQst(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //ActiveInstancesWillBeArchivedQst : ENU=Are you sure you want to archive all workflow step instances in the workflow?;ESP=¿Seguro que desea archivar todas las instancias de paso de flujo de trabajo en el flujo de trabajo?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ActiveInstancesWillBeArchivedQst : ENU=Are you sure you want to archive all workflow step instances in the workflow?;ESP=?Seguro que desea archivar todas las instancias de paso de flujo de trabajo en el flujo de trabajo?;
    //Variable type has not been exported.
}

