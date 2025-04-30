tableextension 50435 tableextension50435 extends "Resources Setup"
{
    fields
    {
        modify("Resource Nos.")
        {
            Caption = 'Resource Nos.';
        }
        modify("Time Sheet Nos.")
        {
            Caption = 'Time Sheet Nos.';
        }
        modify("Time Sheet First Weekday")
        {
            Caption = 'Time Sheet First Weekday';
            OptionCaption = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
        }
        modify("Time Sheet by Job Approval")
        {
            OptionCaption = 'Never,Machine Only,Always';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU="%1 cannot be changed, because there is at least one submitted time sheet line with Type=Job.";ESP="%1 no se puede cambiar porque existe al menos una línea del parte de horas enviada con Tipo=Proyecto.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU="%1 cannot be changed, because there is at least one submitted time sheet line with Type=Job.";ESP="%1 no se puede cambiar porque existe al menos una línea del parte de horas enviada con Tipo=Proyecto.";
    //Variable type has not been exported.
}

