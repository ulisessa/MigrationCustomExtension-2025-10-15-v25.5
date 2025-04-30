tableextension 50250 tableextension50250 extends "Deferral Template"
{
    fields
    {
        modify("Deferral Code")
        {
            Caption = 'Deferral Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Calc. Method")
        {
            Caption = 'Calc. Method';
        }
        modify("No. of Periods")
        {
            Caption = 'No. of Periods';
        }
        modify("Period Description")
        {
            Caption = 'Period Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteCodeErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteCodeErr : @@@="%1=Value of code that is attempting to be deleted;%2=Table caption;%3=Value for the code in the table";ENU=%1 cannot be deleted because it is set as the default deferral template code for %2 %3.;ESP=%1 no se puede eliminar porque está definido como código de plantilla de fraccionamiento predeterminado para %2 %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteCodeErr : @@@="%1=Value of code that is attempting to be deleted;%2=Table caption;%3=Value for the code in the table";ENU=%1 cannot be deleted because it is set as the default deferral template code for %2 %3.;ESP=%1 no se puede eliminar porque está definido como código de plantilla de fraccionamiento predeterminado para %2 %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NumberofPeriodsErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //NumberofPeriodsErr : ENU=You must specify one or more periods.;ESP=Debe especificar uno o más periodos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NumberofPeriodsErr : ENU=You must specify one or more periods.;ESP=Debe especificar uno o más periodos.;
    //Variable type has not been exported.
}

