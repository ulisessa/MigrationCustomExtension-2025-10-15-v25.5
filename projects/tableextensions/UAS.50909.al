tableextension 50909 tableextension50909 extends "Service Hour"
{
    fields
    {
        modify("Service Contract No.")
        {
            Caption = 'Service Contract No.';
        }
        modify(Day)
        {
            Caption = 'Day';
            OptionCaption = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
        }
        modify("Valid on Holidays")
        {
            Caption = 'Valid on Holidays';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=Do you want to copy the default service calendar?;ESP=¿Desea copiar el calendario de servicio genérico?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=Do you want to copy the default service calendar?;ESP=?Desea copiar el calendario de servicio genérico?;
    //Variable type has not been exported.
}

