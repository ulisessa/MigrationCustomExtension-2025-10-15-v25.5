tableextension 50168 tableextension50168 extends "Acc. Sched. KPI Web Srv. Setup"
{
    fields
    {
        modify("Forecasted Values Start")
        {
            OptionCaption = 'After Latest Closed Period,After Current Date';
        }
        modify(Period)
        {
            OptionCaption = 'Fiscal Year - Last Locked Period,Current Fiscal Year,Current Calendar Year,Current Calendar Quarter,Current Month,Today,Current Period,Last Locked Period,Current Fiscal Year + 3 Previous Years';
        }
        modify("View By")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year,Period';
        }
        modify("Data Last Updated")
        {
            Caption = 'Data Last Updated';
        }
        modify("Last G/L Entry Included")
        {
            Caption = 'Last G/L Entry Included';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "ServiceNameErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //ServiceNameErr : ENU=The service name may only contain letters A-Z, a-z, digits 0-9, and hyphens (-). No other characters are allowed.;ESP=El nombre de servicio solo puede contener las letras A-Z, a-z, los dígitos 0-9 y guiones (-). No se admiten otros caracteres.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ServiceNameErr : ENU=The service name may only contain letters A-Z, a-z, digits 0-9, and hyphens (-). No other characters are allowed.;ESP=El nombre de servicio solo puede contener las letras A-Z, a-z, los d?gitos 0-9 y guiones (-). No se admiten otros caracteres.;
    //Variable type has not been exported.
}

