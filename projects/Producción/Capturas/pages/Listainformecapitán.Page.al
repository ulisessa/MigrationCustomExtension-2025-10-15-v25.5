page 50648 "Lista informe capitán"
{
    CardPageID = "Form Informe Capitán";
    Editable = false;
    PageType = List;
    SourceTable = "Cab. informe capitán";
    SourceTableView = SORTING("Fecha de inicio de descarga")
                      ORDER(Descending);
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No. proyecto"; "No. proyecto")
                {
                }
                field("Capitán"; Capitán)
                {
                }
                field(Actividad; Actividad)
                {
                }
                field("Fecha de inicio de descarga"; "Fecha de inicio de descarga")
                {
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field(Registrado; Registrado)
                {
                }
            }
        }
    }

    actions
    {
    }
}

