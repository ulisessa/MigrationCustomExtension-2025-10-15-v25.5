tableextension 46 "Item Register fields" extends "Item Register"
{
    fields
    {
        field(50000; "No. documento"; Code[30])
        {
            Caption = 'No. documento';
            DataClassification = CustomerContent;
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            Caption = 'Nombre libro diario';
            DataClassification = CustomerContent;
        }
        field(50506; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            DataClassification = CustomerContent;
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
            Caption = 'Usuario Anulación';
            DataClassification = CustomerContent;
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            DataClassification = CustomerContent;
        }
    }
}
