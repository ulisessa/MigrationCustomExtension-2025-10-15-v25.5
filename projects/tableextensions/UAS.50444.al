tableextension 50444 tableextension50444 extends "Tax Detail"
{
    fields
    {
        modify("Tax Jurisdiction Code")
        {
            Caption = 'Tax Jurisdiction Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Maximum Amount/Qty.")
        {
            Caption = 'Maximum Amount/Qty.';
        }
        modify("Tax Below Maximum")
        {
            Caption = 'Tax Below Maximum';
        }
        modify("Tax Above Maximum")
        {
            Caption = 'Tax Above Maximum';
        }
        field(50700; "Region code"; Code[10])
        {
            Caption = 'County Code';
            ToolTip = 'Specifies the value of the County Code field.';
        }
    }
}

