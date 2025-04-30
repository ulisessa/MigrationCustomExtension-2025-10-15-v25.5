page 50075 "Importe producción empleado"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Production amount per employee";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000008)
            {
                ShowCaption = false;
                field("Entry no."; "Entry no.")
                {
                }
                field("File no."; "File no.")
                {
                }
                field("Job no."; "Job no.")
                {
                }
                field("Starting date"; "Starting date")
                {
                }
                field("Ending date"; "Ending date")
                {
                }
                field("Role code"; "Role code")
                {
                }
                field("Exchange rate"; "Exchange rate")
                {
                }
                field("Importe en pesos"; decImporteCalculado)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    var
        rst7002: Record "Sales Price";
        rstLDA: Record "On board capture lines";
    begin
        decImporteCalculado := 0;
        Clear(rst7002);
        Clear(rstLDA);

        rstLDA.SetRange("Cód. proyecto", "Job no.");
        rstLDA.SetRange("Fecha registro", "Starting date", "Ending date");
        rstLDA.SetFilter(Kilos, '<>0');
        if rstLDA.FindSet then
            repeat

                Clear(rst7002);
                rst7002.SetRange("Item No.", rstLDA."No.");
                rst7002.SetRange("Sales Code", "Role code");
                rst7002.SetFilter("Starting Date", '<%1', "Starting date");
                //rst7002.setfilter("Ending Date",'%1|>%2',"Ending date");
                if rst7002.FindFirst then begin
                    if rst7002."Currency Code" <> '' then
                        decImporteCalculado += rst7002."Unit Price" * rstLDA.Kilos / 1000 * "Exchange rate"
                    else
                        decImporteCalculado += rst7002."Unit Price" * rstLDA.Kilos / 1000;

                end;

            until rstLDA.Next = 0;
    end;

    var
        decImporteCalculado: Decimal;
}

