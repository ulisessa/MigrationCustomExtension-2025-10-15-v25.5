tableextension 50682 tableextension50682 extends "Misc. Article Information"
{
    Caption = 'Misc. Article Information';
    fields
    {
        modify("Employee No.")
        {
            Caption = 'Employee No.';
        }
        modify("Misc. Article Code")
        {
            Caption = 'Misc. Article Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("In Use")
        {
            Caption = 'In Use';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot delete information if there are comments associated with it.;ESP=No se puede eliminar la información de recursos diversos si tiene comentarios asociados.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot delete information if there are comments associated with it.;ESP=No se puede eliminar la información de recursos diversos si tiene comentarios asociados.;
    //Variable type has not been exported.
}

