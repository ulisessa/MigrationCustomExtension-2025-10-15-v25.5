tableextension 50724 tableextension50724 extends "CRM Annotation"
{
    fields
    {
        modify(ObjectId)
        {
            Caption = 'Regarding';
        }
        modify(Subject)
        {
            Caption = 'Title';
        }
        modify(NoteText)
        {
            Caption = 'Description';
        }
        modify(FileSize)
        {
            Caption = 'File Size (Bytes)';
        }
        modify(ModifiedOn)
        {
            Caption = 'Modified On';
        }
        modify(VersionNumber)
        {
            Caption = 'Version Number';
        }
        modify(OverriddenCreatedOn)
        {
            Caption = 'Record Created On';
        }
        modify(ImportSequenceNumber)
        {
            Caption = 'Import Sequence Number';
        }
    }
}

