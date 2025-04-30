tableextension 50635 tableextension50635 extends Opportunity
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Salesperson Code")
        {
            Caption = 'Salesperson Code';
        }
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify("Contact No.")
        {
            Caption = 'Contact No.';
        }
        modify("Contact Company No.")
        {
            Caption = 'Contact Company No.';
        }
        modify("Sales Cycle Code")
        {
            Caption = 'Sales Cycle Code';
        }
        modify("Sales Document No.")
        {
            Caption = 'Sales Document No.';
        }
        modify("Creation Date")
        {
            Caption = 'Creation Date';
        }
        modify("Chances of Success %")
        {
            Caption = 'Chances of Success %';
        }
        modify("Campaign Description")
        {
            Caption = 'Campaign Description';
        }
        modify("Segment No.")
        {
            Caption = 'Segment No.';
        }
        modify("No. of Interactions")
        {
            Caption = 'No. of Interactions';
        }
        modify("Segment Description")
        {
            Caption = 'Segment Description';
        }
        modify("Wizard Chances of Success %")
        {
            Caption = 'Wizard Chances of Success %';
        }
        modify("Wizard Campaign Description")
        {
            Caption = 'Wizard Campaign Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot delete this opportunity while it is active.;ESP=No puede borrar esta oportunidad mientras esté activa.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot delete this opportunity while it is active.;ESP=No puede borrar esta oportunidad mientras está activa.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Do you want to create an opportunity for all contacts in the %1 segment?;ESP=¿Desea crear una oportunidad en todos los contactos del segmento %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Do you want to create an opportunity for all contacts in the %1 segment?;ESP=?Desea crear una oportunidad en todos los contactos del segmento %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=Sales %1 %2 is already assigned to opportunity %3.;ESP=%1 %2 venta ya está asignada a la oportunidad %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=Sales %1 %2 is already assigned to opportunity %3.;ESP=%1 %2 venta ya está asignada a la oportunidad %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ChangeConfirmQst(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //ChangeConfirmQst : @@@="%1 = Field Caption";ENU=Do you want to change %1 on the related open tasks with the same %1?;ESP=¿Desea cambiar %1 en las tareas abiertas relacionadas con el mismo %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ChangeConfirmQst : @@@="%1 = Field Caption";ENU=Do you want to change %1 on the related open tasks with the same %1?;ESP=?Desea cambiar %1 en las tareas abiertas relacionadas con el mismo %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=Contact %1 %2 is related to another company.;ESP=Contacto %1 %2 está relacionado con otra empresa.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=Contact %1 %2 is related to another company.;ESP=Contacto %1 %2 está relacionado con otra empresa.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text023(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text023 : ENU=You must fill in the contact that is involved in the opportunity.;ESP=Debe seleccionar el contacto que está relacionado con la oportunidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text023 : ENU=You must fill in the contact that is involved in the opportunity.;ESP=Debe seleccionar el contacto que está relacionado con la oportunidad.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text025(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text025 : ENU=The Estimated closing date has to be later than this change;ESP=La fecha estimada de cierre debe ser posterior a la fecha de esta modificación;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text025 : ENU=The Estimated closing date has to be later than this change;ESP=La fecha estimada de cierre debe ser posterior a la fecha de esta modificación;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ActivateFirstStageQst(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //ActivateFirstStageQst : ENU=Would you like to activate first stage for this opportunity?;ESP=¿Desea activar la primera etapa para esta oportunidad?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ActivateFirstStageQst : ENU=Would you like to activate first stage for this opportunity?;ESP=?Desea activar la primera etapa para esta oportunidad?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SalesCycleNotFoundErr(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesCycleNotFoundErr : ENU=Sales Cycle Stage not found.;ESP=No se encontró la etapa de ciclo de ventas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesCycleNotFoundErr : ENU=Sales Cycle Stage not found.;ESP=No se encontró la etapa de ciclo de ventas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UpdateSalesQuoteWithCustTemplateQst(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateSalesQuoteWithCustTemplateQst : ENU=Do you want to update the sales quote with a customer template?;ESP=¿Desea actualizar la oferta de venta con una plantilla de cliente?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateSalesQuoteWithCustTemplateQst : ENU=Do you want to update the sales quote with a customer template?;ESP=?Desea actualizar la oferta de venta con una plantilla de cliente?;
    //Variable type has not been exported.
}

