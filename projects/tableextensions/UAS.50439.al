tableextension 50439 tableextension50439 extends "Tax Area"
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
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
        field(50000; "Importar Reproweb"; Boolean)
        {
        }
        field(50001; "Realizar consulta constancia"; Boolean)
        {
        }
        field(50700; "Tipo fiscal"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
            ObsoleteTag = '12/2025';
            ObsoleteState = Pending;
            ObsoleteReason = 'Reemplazado por campo Grupo Registro IVA Negocio';
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "TaxAreaInUseErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //TaxAreaInUseErr : ENU=You cannot delete this tax rate because it is used on one or more existing documents.;ESP=No puede eliminar esta tasa de impuesto porque se usa en uno o más documentos existentes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TaxAreaInUseErr : ENU=You cannot delete this tax rate because it is used on one or more existing documents.;ESP=No puede eliminar esta tasa de impuesto porque se usa en uno o más documentos existentes.;
    //Variable type has not been exported.
}

