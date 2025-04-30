page 50666 "Lista Lín. DCL"
{
    PageType = List;
    SourceTable = "Lín. DCL";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. proyecto"; "No. proyecto")
                {
                }
                field("No. línea"; "No. línea")
                {
                }
                field("Clasificación"; Clasificación)
                {
                }
                field("Descripción"; Descripción)
                {
                }
                field("Unidad medida"; "Unidad medida")
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Kilos netos"; "Kilos netos")
                {
                }
                field(Promedio; Promedio)
                {
                }
                field(Cliente; Cliente)
                {
                }
                field("Nombre cliente"; "Nombre cliente")
                {
                }
                field(Referencia; Referencia)
                {
                }
                field("Applied kilos"; "Applied kilos")
                {
                }
                field("Fecha DCL"; "Fecha DCL")
                {
                }
                field("Reparto relacionado"; "Reparto relacionado")
                {
                }
                field(Actividad; Actividad)
                {
                }
                field(Familia; Familia)
                {
                }
                field(Subfamilia; Subfamilia)
                {
                }
                field(Registrado; Registrado)
                {
                }
                field("Cajones acordados"; "Cajones acordados")
                {
                }
                field("Promedio acordado"; "Promedio acordado")
                {
                }
                field("Valor por kilo acordado"; "Valor por kilo acordado")
                {
                }
                field("Importe acordado esperado"; "Importe acordado esperado")
                {
                }
                field("Kilos acordados"; "Kilos acordados")
                {
                }
            }
        }
    }

    actions
    {
    }
}

