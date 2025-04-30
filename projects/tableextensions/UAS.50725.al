tableextension 50725 tableextension50725 extends "CRM Post Configuration"
{
    Caption = 'Post Configuration';
    fields
    {
        modify("msdyn_PostConfigId")
        {
            Caption = 'Post Configuration';
        }
        modify(VersionNumber)
        {
            Caption = 'Version Number';
        }
        modify(ImportSequenceNumber)
        {
            Caption = 'Import Sequence Number';
        }
        modify(OverriddenCreatedOn)
        {
            Caption = 'Record Created On';
        }
        modify(TimeZoneRuleVersionNumber)
        {
            Caption = 'Time Zone Rule Version Number';
        }
        modify(UTCConversionTimeZoneCode)
        {
            Caption = 'UTC Conversion Time Zone Code';
        }
        modify("msdyn_Otc")
        {
            Caption = 'Object Type Code';
        }
        modify("msdyn_Status")
        {
            Caption = 'Configuration Status';
        }
    }
}

