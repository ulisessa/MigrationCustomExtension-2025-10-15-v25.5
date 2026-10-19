tableextension 7002 "SalesPrice" extends "Sales Price" //OriginalId
{
    fields
    {
        field(50000; Familia; Code[3])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Familia producto";
        }
        field(50001; Subfamilia; Code[20])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));
        }
    }
}