tableextension 50684 tableextension50684 extends "Confidential Information"
{
    Caption = 'Confidential Information';
    fields
    {
        modify("Employee No.")
        {
            Caption = 'Employee No.';
        }
        modify("Confidential Code")
        {
            Caption = 'Confidential Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You can not delete confidential information if there are comments associated with it.;ESP=No se puede eliminar la información confidencial si tiene comentarios asociados.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You can not delete confidential information if there are comments associated with it.;ESP=No se puede eliminar la información confidencial si tiene comentarios asociados.;
    //Variable type has not been exported.
}

