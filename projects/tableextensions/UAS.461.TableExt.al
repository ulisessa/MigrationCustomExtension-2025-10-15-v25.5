tableextension 461 "PrepaymentInvBuffLine" extends "Prepayment Inv. Line Buffer" //OriginalId
{
    fields
    {
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3';
            ToolTip = 'Specifies the value of the Global Dimension 3 field.';
            DataClassification = ToBeClassified;

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            DataClassification = ToBeClassified;

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            DataClassification = ToBeClassified;

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            DataClassification = ToBeClassified;

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            DataClassification = ToBeClassified;

        }
    }
}