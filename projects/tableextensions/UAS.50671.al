tableextension 50671 tableextension50671 extends "Employee Qualification"
{
    Caption = 'Employee Qualification';
    fields
    {
        modify("Employee No.")
        {
            Caption = 'Employee No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Qualification Code")
        {
            Caption = 'Qualification Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Institution/Company")
        {
            Caption = 'Institution/Company';
        }
        modify("Course Grade")
        {
            Caption = 'Course Grade';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot delete employee qualification information if there are comments associated with it.;ESP=No se puede eliminar la cualificación si tiene comentarios asociados.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot delete employee qualification information if there are comments associated with it.;ESP=No se puede eliminar la cualificación si tiene comentarios asociados.;
    //Variable type has not been exported.
}

