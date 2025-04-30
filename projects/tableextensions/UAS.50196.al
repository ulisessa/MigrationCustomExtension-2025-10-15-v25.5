tableextension 50196 tableextension50196 extends Workflow
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DisableReferringWorkflowsMsg(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //DisableReferringWorkflowsMsg : ENU=Other workflows where the workflow is used as a sub-workflow are being disabled.;ESP=Se están deshabilitando otros flujos de trabajo en los que se usa el flujo de trabajo como flujo de trabajo secundario.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DisableReferringWorkflowsMsg : ENU=Other workflows where the workflow is used as a sub-workflow are being disabled.;ESP=Se están deshabilitando otros flujos de trabajo en los que se usa el flujo de trabajo como flujo de trabajo secundario.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DisableReferringWorkflowsQst(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //DisableReferringWorkflowsQst : @@@="%1 = Workflow Identifier (e.g. The MS-PIW workflow is used as a sub-workflow in other workflows, which you must disable before you can edit the MS-PIW workflow.\\Do you want to disable all workflows where the MS-PIW workflow is used?)";ENU=The %1 workflow is used as a sub-workflow in other workflows, which you must disable before you can edit the %1 workflow.\\Do you want to disable all workflows where the %1 workflow is used?;ESP=El flujo de trabajo %1 se usa como flujo de trabajo secundario en otros flujos de trabajo, que debe deshabilitar antes de poder editar el flujo de trabajo %1.\\¿Desea deshabilitar todos los flujos de trabajo en los que se usa el flujo de trabajo %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DisableReferringWorkflowsQst : @@@="%1 = Workflow Identifier (e.g. The MS-PIW workflow is used as a sub-workflow in other workflows, which you must disable before you can edit the MS-PIW workflow.\\Do you want to disable all workflows where the MS-PIW workflow is used?)";ENU=The %1 workflow is used as a sub-workflow in other workflows, which you must disable before you can edit the %1 workflow.\\Do you want to disable all workflows where the %1 workflow is used?;ESP=El flujo de trabajo %1 se usa como flujo de trabajo secundario en otros flujos de trabajo, que debe deshabilitar antes de poder editar el flujo de trabajo %1.\\?Desea deshabilitar todos los flujos de trabajo en los que se usa el flujo de trabajo %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "MissingFunctionNamesErr(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //MissingFunctionNamesErr : ENU=All workflow steps must have valid function names.;ESP=Todos los pasos de flujo de trabajo deben tener nombres de función válidos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MissingFunctionNamesErr : ENU=All workflow steps must have valid function names.;ESP=Todos los pasos de flujo de trabajo deben tener nombres de función válidos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SameEventConditionsErr(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //SameEventConditionsErr : @@@="%1=Table Caption";ENU=One or more entry-point steps exist that use the same event on table %1. You must specify unique event conditions on entry-point steps that use the same table.;ESP=Existen uno o varios pasos de punto de entrada que usan el mismo evento en la tabla %1. Debe especificar condiciones de evento únicas en los pasos de punto de entrada que usen la misma tabla.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SameEventConditionsErr : @@@="%1=Table Caption";ENU=One or more entry-point steps exist that use the same event on table %1. You must specify unique event conditions on entry-point steps that use the same table.;ESP=Existen uno o varios pasos de punto de entrada que usan el mismo evento en la tabla %1. Debe especificar condiciones de evento únicas en los pasos de punto de entrada que usen la misma tabla.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ValidateWorkflowProgressMsg(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //ValidateWorkflowProgressMsg : ENU=The workflow is being validated.;ESP=El flujo de trabajo se está validando.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ValidateWorkflowProgressMsg : ENU=The workflow is being validated.;ESP=El flujo de trabajo se está validando.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "WorkflowStepInstanceLinkErr(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //WorkflowStepInstanceLinkErr : @@@="%1 and %2 = Workflow Identifiers (e.g. The MS-PIW workflow cannot start because all ending steps in the MS-SIAPW sub-workflow have a value in the Next Workflow Step ID field.\\Make sure that at least one step in the MS-SIAPW sub-workflow does not have a value in the Next Workflow Step ID field.)";ENU=The %1 workflow cannot start because all ending steps in the %2 sub-workflow have a value in the Next Workflow Step ID field.\\Make sure that at least one step in the %2 sub-workflow does not have a value in the Next Workflow Step ID field.;ESP=El flujo de trabajo %1 no se puede iniciar porque todos los pasos de finalización del flujo de trabajo secundario %2 tienen un valor en el campo Id. de siguiente paso de flujo de trabajo.\\Asegúrese de que al menos un paso del flujo de trabajo secundario %2 no tiene un valor en el campo Id. de siguiente paso de flujo de trabajo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WorkflowStepInstanceLinkErr : @@@="%1 and %2 = Workflow Identifiers (e.g. The MS-PIW workflow cannot start because all ending steps in the MS-SIAPW sub-workflow have a value in the Next Workflow Step ID field.\\Make sure that at least one step in the MS-SIAPW sub-workflow does not have a value in the Next Workflow Step ID field.)";ENU=The %1 workflow cannot start because all ending steps in the %2 sub-workflow have a value in the Next Workflow Step ID field.\\Make sure that at least one step in the %2 sub-workflow does not have a value in the Next Workflow Step ID field.;ESP=El flujo de trabajo %1 no se puede iniciar porque todos los pasos de finalización del flujo de trabajo secundario %2 tienen un valor en el campo Id. de siguiente paso de flujo de trabajo.\\Asegúrese de que al menos un paso del flujo de trabajo secundario %2 no tiene un valor en el campo Id. de siguiente paso de flujo de trabajo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ValidateTableRelationErr(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //ValidateTableRelationErr : ENU=You must define a table relation between all records used in events.;ESP=Debe definir una relación de tabla entre todos los registros utilizados en los eventos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ValidateTableRelationErr : ENU=You must define a table relation between all records used in events.;ESP=Debe definir una relación de tabla entre todos los registros utilizados en los eventos.;
    //Variable type has not been exported.
}

