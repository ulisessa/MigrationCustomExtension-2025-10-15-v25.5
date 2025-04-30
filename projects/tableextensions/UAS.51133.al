tableextension 51133 tableextension51133 extends "Base Calendar"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU="You cannot delete this record. Customized calendar changes exist for calendar code=<%1>.";ESP="No puede borrar este regist. Hay cambios en cód. calend. de calend. personaliz.=<%1>.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU="You cannot delete this record. Customized calendar changes exist for calendar code=<%1>.";ESP="No puede borrar este regist. Hay cambios en Cód. calend. de calend. personaliz.=<%1>.";
    //Variable type has not been exported.
}

