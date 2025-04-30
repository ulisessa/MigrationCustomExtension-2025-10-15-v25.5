tableextension 50493 tableextension50493 extends "Object Translation"
{
    Caption = 'Object Translation';
    fields
    {
        modify("Object Type")
        {
            OptionCaption = ' ,Table,Form,Report,,Codeunit,XMLPort,MenuSuite,Page';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

