page 50163 "Weighing Scales List"
{
    PageType = List;
    SourceTable = "Weighing Scale Parameters";
    ApplicationArea = All;
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Scale code"; Rec."Scale code")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Port; Rec.Port)
                {
                }
                field("Baud Rate"; Rec."Baud Rate")
                {
                }
                field(Parity; Rec.Parity)
                {
                }
                field("Data Bits"; Rec."Data Bits")
                {
                }
                field("Stop Bits"; Rec."Stop Bits")
                {
                }
                field(Handshake; Rec.Handshake)
                {
                }
                field("No. Lot"; Rec."No. Lot")
                {
                }
                field("Update Interval (ms)"; Rec."Update Interval (ms)")
                {
                }
                field("Downward limit"; Rec."Downward limit")
                {
                }
                field("Upward limit"; Rec."Upward limit")
                {
                }
                field("Serial no."; Rec."Serial no.")
                {
                }
                field("Scale seals"; Rec."Scale seals")
                {
                }
                field("Header seals"; Rec."Header seals")
                {
                }
                field("Periodic certification"; Rec."Periodic certification")
                {
                }
                field("Periodic cert. expiration date"; Rec."Periodic cert. expiration date")
                {
                }
                field("IP address"; Rec."IP address")
                {
                }
                field("TCP port"; Rec."TCP port")
                {
                }
                field("Connection method"; Rec."Connection method")
                {
                }
            }
        }
    }

    actions
    {
    }
}

