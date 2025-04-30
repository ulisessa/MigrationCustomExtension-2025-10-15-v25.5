tableextension 51241 tableextension51241 extends "Manufacturing Cue"
{
    Caption = 'Manufacturing Cue';
    fields
    {
        modify("Prod. BOMs under Development")
        {
            Caption = 'Prod. BOMs under Development';
        }
        modify("Prod. Orders Routings-in Queue")
        {
            Caption = 'Prod. Orders Routings-in Queue';
        }
        modify("Prod. Orders Routings-in Prog.")
        {
            Caption = 'Prod. Orders Routings-in Prog.';
        }
        modify("Invt. Picks to Production")
        {
            Caption = 'Invt. Picks to Production';
        }
        modify("Invt. Put-aways from Prod.")
        {
            Caption = 'Invt. Put-aways from Prod.';
        }
        modify("Rlsd. Prod. Orders Until Today")
        {
            Caption = 'Rlsd. Prod. Orders Until Today';
        }
    }
}

