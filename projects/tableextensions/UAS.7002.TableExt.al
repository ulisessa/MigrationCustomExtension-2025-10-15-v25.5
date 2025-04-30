tableextension 7002 "SalesPrice" extends "Sales Price" //OriginalId
{
    fields
    {
        field(50000; Familia; Code[3])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Familia producto";
        }
        field(50001; Subfamilia; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));
        }
    }
}