tableextension 50241 "Curr. Exch. RateUpd.Set. Ext." extends "Curr. Exch. Rate Update Setup"
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
        modify("Data Exch. Def Code")
        {
            Caption = 'Data Exch. Def Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DataExchangeLineDefNameTxt(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //DataExchangeLineDefNameTxt : ENU=Parent Node for Currency Code;ESP=Nodo principal del código de divisa;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DataExchangeLineDefNameTxt : ENU=Parent Node for Currency Code;ESP=Nodo principal del código de divisa;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DataExchangeMappingDefNameTxt(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //DataExchangeMappingDefNameTxt : ENU=Mapping for Currency Exchange;ESP=Asignación de cambio de divisa;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DataExchangeMappingDefNameTxt : ENU=Mapping for Currency Exchange;ESP=Asignación de cambio de divisa;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DailyUpdateQst(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //DailyUpdateQst : ENU=A job queue entry for daily update of exchange rates has been created.\\Do you want to open the Job Queue Entries window?;ESP=Se creó un movimiento de la cola de proyectos para la actualización diaria de los tipos de cambio.\\¿Desea abrir la ventana Movs. cola proyecto?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DailyUpdateQst : ENU=A job queue entry for daily update of exchange rates has been created.\\Do you want to open the Job Queue Entries window?;ESP=Se creó un movimiento de la cola de proyectos para la actualización diaria de los tipos de cambio.\\?Desea abrir la ventana Movs. cola proyecto?;
    //Variable type has not been exported.
}

