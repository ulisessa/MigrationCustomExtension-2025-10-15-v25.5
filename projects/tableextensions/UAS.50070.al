tableextension 50070 "Cost Budget Register Ext." extends "Cost Budget Register"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Source)
        {
            OptionCaption = 'Transfer from G/L Budget,Cost Journal,Allocation,Manual';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("From Budget Entry No.")
        {
            Caption = 'From Budget Entry No.';
        }
        modify("To Budget Entry No.")
        {
            Caption = 'To Budget Entry No.';
        }
        modify("From Cost Budget Entry No.")
        {
            Caption = 'From Cost Budget Entry No.';
        }
        modify("To Cost Budget Entry No.")
        {
            Caption = 'To Cost Budget Entry No.';
        }
        modify("No. of Entries")
        {
            Caption = 'No. of Entries';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=All registers up to the current register %1 will be closed and can no longer be deleted.\\Do you want to close the registers?;ESP=Se cerrarán todos los registros hasta el registro actual %1 y ya no se podrán eliminar.\\¿Desea cerrar los registros?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=All registers up to the current register %1 will be closed and can no longer be deleted.\\Do you want to close the registers?;ESP=Se cerrarán todos los registros hasta el registro actual %1 y ya no se podrán eliminar.\\?Desea cerrar los registros?;
    //Variable type has not been exported.
}

