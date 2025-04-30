page 50051 "Inflation Indexes"
{
    PageType = List;
    SourceTable = "Inflation index";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Year; Year)
                {
                }
                field(Month; Month)
                {
                }
                field("Inflation index"; "Inflation index")
                {
                }
            }
        }
    }

    actions
    {
    }
}

