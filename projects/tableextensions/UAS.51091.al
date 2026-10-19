tableextension 51091 tableextension51091 extends "Whse. Internal Pick Line"
{
    Caption = 'Whse. Internal Pick Line';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("To Bin Code")
        {
            Caption = 'To Bin Code';
        }
        modify("To Zone Code")
        {
            Caption = 'To Zone Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Sorting Sequence No.")
        {
            Caption = 'Sorting Sequence No.';
        }
        field(50010; "Net kilos (Base)"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            ToolTip = 'Specifies the value of the Net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50011; "Gross kilos (Base)"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50012; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos (Base)';
            ToolTip = 'Specifies the value of the Net kilos (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50013; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos (Base)';
            ToolTip = 'Specifies the value of the Gross kilos (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50014; "Net kilos to handle (Base)"; Decimal)
        {
            Caption = 'Net kilos to handle (Base)';
            ToolTip = 'Specifies the value of the Net kilos to handle (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50015; "Gross kilos to handle (Base)"; Decimal)
        {
            Caption = 'Gross kilos to handle (Base)';
            ToolTip = 'Specifies the value of the Gross kilos to handle (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50016; "Net kilos to invoice (Base)"; Decimal)
        {
            Caption = 'Net kilos to invoice (Base)';
            ToolTip = 'Specifies the value of the Net kilos to invoice (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50017; "Gross kilos to invoice (Base)"; Decimal)
        {
            Caption = 'Gross kilos to invoice (Base)';
            ToolTip = 'Specifies the value of the Gross kilos to invoice (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50018; "Net kilos invoiced (Base)"; Decimal)
        {
            Caption = 'Net kilos invoiced (Base)';
            ToolTip = 'Specifies the value of the Net kilos invoiced (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50019; "Gross kilos invoiced (Base)"; Decimal)
        {
            Caption = 'Gross kilos invoiced (Base)';
            ToolTip = 'Specifies the value of the Gross kilos invoiced (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50022; "Net kilos to Handle"; Decimal)
        {
            Caption = 'Net kilos to Handle';
            ToolTip = 'Specifies the value of the Net kilos to Handle field.';
            DecimalPlaces = 0 : 5;
        }
        field(50023; "Gross kilos to Handle"; Decimal)
        {
            Caption = 'Gross kilos to Handle';
            ToolTip = 'Specifies the value of the Gross kilos to Handle field.';
            DecimalPlaces = 0 : 5;
        }
        field(50024; "Net kilos to invoice"; Decimal)
        {
            Caption = 'Net kilos to invoice';
            ToolTip = 'Specifies the value of the Net kilos to invoice field.';
            DecimalPlaces = 0 : 5;
        }
        field(50025; "Gross kilos to invoice"; Decimal)
        {
            Caption = 'Gross kilos to invoice';
            ToolTip = 'Specifies the value of the Gross kilos to invoice field.';
            DecimalPlaces = 0 : 5;
        }
        field(50026; "Nk actual handled (Base)"; Decimal)
        {
            Caption = 'Nk actual handled (Base)';
            ToolTip = 'Specifies the value of the Nk actual handled (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50027; "Gk actual handled (Base)"; Decimal)
        {
            Caption = 'Gk actual handled (Base)';
            ToolTip = 'Specifies the value of the Gk actual handled (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50038; "Net kilos handled (Base)"; Decimal)
        {
            Caption = 'Net kilos handled (Base)';
            ToolTip = 'Specifies the value of the Net kilos handled (Base) field.';
            DecimalPlaces = 0 : 5;
        }
        field(50039; "Gross kilos handled (Base)"; Decimal)
        {
            Caption = 'Gross kilos handled (Base)';
            ToolTip = 'Specifies the value of the Gross kilos handled (Base) field.';
            DecimalPlaces = 0 : 5;
        }
    }


    //Unsupported feature: Code Modification on "CheckBin(PROCEDURE 9)".

    //procedure CheckBin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "To Bin Code" <> '' then begin
      GetLocation("Location Code");
      if not Location."Directed Put-away and Pick" then
    #4..21
        BinContent.CheckIncreaseBinContent(
          "Qty. Outstanding",WhseInternalPickLine.Quantity,
          WhseInternalPickLine.Cubage,WhseInternalPickLine.Weight,
          Cubage,Weight,false,false);
        "To Zone Code" := BinContent."Zone Code";
      end else begin
        Bin.Get("Location Code","To Bin Code");
    #29..33
        "To Zone Code" := Bin."Zone Code";
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..24
          Cubage,Weight,false,false,
          //++Arbu
          "Net kilos to handle (Base)",0,"Gross kilos to handle (Base)",0);
          //--Arbu
    #26..36
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU="%1 = %2 is less than the %3 = %4.\Do you really want to delete the %5?";ESP="%1 = %2 es menor que el %3 = %4.\¿Desea eliminar el %5?";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU="%1 = %2 is less than the %3 = %4.\Do you really want to delete the %5?";ESP="%1 = %2 es menor que el %3 = %4.\?Desea eliminar el %5?";
    //Variable type has not been exported.
}

