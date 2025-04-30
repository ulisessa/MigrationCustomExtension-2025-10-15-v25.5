page 50097 "Tariff number details"
{
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Tariff Number Details";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field("Starting date"; "Starting date")
                {
                }
                field("Ending date"; "Ending date")
                {
                }
                field("Tipo producto"; "Tipo producto")
                {
                }
                field("Anticipo ganancias"; "Anticipo ganancias")
                {
                }
                field(Derechos; Derechos)
                {
                }
                field("Plazo a Transferir"; "Plazo a Transferir")
                {
                }
                field(Reembolsos; Reembolsos)
                {
                }
                field(Reintegros; Reintegros)
                {
                }
                field("Coeficiente imp. expo"; "Coeficiente imp. expo")
                {
                }
                field(Procedencia; Procedencia)
                {
                }
                field("Exchange type"; "Exchange type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

