tableextension 51365 tableextension51365 extends "Inventory Profile Track Buffer"
{
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Demand Line No.")
        {
            Caption = 'Demand Line No.';
        }
        modify("Sequence No.")
        {
            Caption = 'Sequence No.';
        }
        modify("Surplus Type")
        {
            OptionCaption = 'None,Forecast,BlanketOrder,SafetyStock,ReorderPoint,MaxInventory,FixedOrderQty,MaxOrder,MinOrder,OrderMultiple,DampenerQty,PlanningFlexibility,Undefined,EmergencyOrder';
        }
        modify("Warning Level")
        {
            OptionCaption = ',Emergency,Exception,Attention';
        }
    }
}

