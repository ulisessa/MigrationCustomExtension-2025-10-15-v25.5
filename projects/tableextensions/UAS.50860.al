tableextension 50860 tableextension50860 extends "Item Charge Assignment (Purch)"
{
    fields
    {
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Document Line No.")
        {
            Caption = 'Document Line No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Item Charge No.")
        {
            Caption = 'Item Charge No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Applies-to Doc. No.")
        {
            Caption = 'Applies-to Doc. No.';
        }
        modify("Applies-to Doc. Line No.")
        {
            Caption = 'Applies-to Doc. Line No.';
        }
        modify("Applies-to Doc. Line Amount")
        {
            Caption = 'Applies-to Doc. Line Amount';
        }

        //Unsupported feature: Code Modification on ""Amount to Assign"(Field 11).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PurchLine.Get("Document Type","Document No.","Document Line No.");
        if not Currency.Get(PurchLine."Currency Code") then
          Currency.InitRoundingPrecision;
        "Amount to Assign" := Round("Qty. to Assign" * "Unit Cost",Currency."Amount Rounding Precision");
        ItemChargeAssgntPurch.SuggestAssgntFromLine(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
        //ItemChargeAssgntPurch.SuggestAssgntFromLine(Rec);
        */
        //end;
        field(50500; "Net kilos to Assign"; Decimal)
        {
            BlankZero = true;
            Caption = 'Net kilos to Assign';
            ToolTip = 'Specifies the value of the Net kilos to Assign field.';
            DecimalPlaces = 0 : 5;

        }
        field(50501; "Net kilos Assigned"; Decimal)
        {
            BlankZero = true;
            Caption = 'Net kilos Assigned';
            ToolTip = 'Specifies the value of the Net kilos Assigned field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(50502; "Gross kilos to Assign"; Decimal)
        {
            BlankZero = true;
            Caption = 'Gross kilos to Assign';
            ToolTip = 'Specifies the value of the Gross kilos to Assign field.';
            DecimalPlaces = 0 : 5;

        }
        field(50503; "Gross Assigned"; Decimal)
        {
            BlankZero = true;
            Caption = 'Gross Assigned';
            ToolTip = 'Specifies the value of the Gross Assigned field.';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot assign item charges to the %1 because it has been invoiced. Instead you can get the posted document line and then assign the item charge to that line.;ESP=No puede asignar cargos de producto al %1 porque se ha facturado. Puede traer la línea registrada del documento y asignar un cargo prod. a esa línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot assign item charges to the %1 because it has been invoiced. Instead you can get the posted document line and then assign the item charge to that line.;ESP=No puede asignar cargos de producto al %1 porque se ha facturado. Puede traer la línea registrada del documento y asignar un cargo prod. a esa línea.;
    //Variable type has not been exported.
}

