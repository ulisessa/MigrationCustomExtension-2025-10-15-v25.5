tableextension 50268 tableextension50268 extends "Data Migration Status"
{
    Caption = 'Data Migration Status';
    fields
    {
        modify("Migration Type")
        {
            Caption = 'Migration Type';
        }
        modify("Total Number")
        {
            Caption = 'Total Number';
        }
        modify("Migrated Number")
        {
            Caption = 'Migrated Number';
        }
        modify("Migration Codeunit To Run")
        {
            Caption = 'Migration Codeunit To Run';
        }
    }
}

