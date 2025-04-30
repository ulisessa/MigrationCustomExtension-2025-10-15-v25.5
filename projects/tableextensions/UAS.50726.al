tableextension 50726 tableextension50726 extends "CRM Role"
{
    fields
    {
        modify(OrganizationId)
        {
            Caption = 'Organization';
        }
        modify(VersionNumber)
        {
            Caption = 'Version number';
        }
        modify(OverriddenCreatedOn)
        {
            Caption = 'Record Created On';
        }
        modify(ImportSequenceNumber)
        {
            Caption = 'Import Sequence Number';
        }
        modify(SolutionId)
        {
            Caption = 'Solution';
        }
        modify(RoleIdUnique)
        {
            Caption = 'Unique Id';
        }
        modify(ParentRootRoleId)
        {
            Caption = 'Parent Root Role';
        }
    }
}

