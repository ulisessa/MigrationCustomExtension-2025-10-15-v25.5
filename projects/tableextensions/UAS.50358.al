tableextension 50358 tableextension50358 extends "Requisition Line"
{
    Caption = 'Requisition Line';
    fields
    {
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("No.")
        {
            TableRelation = IF (Type = CONST("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST(Item),
                                     "Worksheet Template Name" = FILTER(<> ''),
                                     "Journal Batch Name" = FILTER(<> '')) Item WHERE(Type = CONST(Inventory))
            ELSE
            IF (Type = CONST(Resource)) Resource
            ELSE
            IF (Type = CONST(Item),
                                              "Worksheet Template Name" = CONST(''),
                                              "Journal Batch Name" = CONST('')) Item;
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Recurring Frequency")
        {
            Caption = 'Recurring Frequency';
        }
        modify("Vendor Item No.")
        {
            Caption = 'Vendor Item No.';
        }
        modify("Sales Order No.")
        {
            Caption = 'Sales Order No.';
        }
        modify("Sales Order Line No.")
        {
            Caption = 'Sales Order Line No.';
        }
        modify("Sell-to Customer No.")
        {
            Caption = 'Sell-to Customer No.';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Order Address Code")
        {
            Caption = 'Order Address Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Prod. Order No.")
        {
            Caption = 'Prod. Order No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Demand Order No.")
        {
            Caption = 'Demand Order No.';
        }
        modify("Demand Line No.")
        {
            Caption = 'Demand Line No.';
        }
        modify("Demand Ref. No.")
        {
            Caption = 'Demand Ref. No.';
        }
        modify("Unit Of Measure Code (Demand)")
        {
            Caption = 'Unit Of Measure Code (Demand)';
        }
        modify("Original Item No.")
        {
            Caption = 'Original Item No.';
        }
        modify("Original Variant Code")
        {
            Caption = 'Original Variant Code';
        }
        modify("Item Category Code")
        {
            Caption = 'Item Category Code';
        }
        modify(Nonstock)
        {
            Caption = 'Catalog';
        }
        modify("Purchasing Code")
        {
            Caption = 'Purchasing Code';
        }
        modify("Transfer-from Code")
        {
            Caption = 'Transfer-from Code';
        }
        modify("Transfer Shipment Date")
        {
            Caption = 'Transfer Shipment Date';
        }
        modify("Line Discount %")
        {
            Caption = 'Line Discount %';
        }
        modify("Custom Sorting Order")
        {
            Caption = 'Custom Sorting Order';
        }
        modify("Routing No.")
        {
            Caption = 'Routing No.';
        }
        modify("Operation No.")
        {
            Caption = 'Operation No.';
        }
        modify("Work Center No.")
        {
            Caption = 'Work Center No.';
        }
        modify("Prod. Order Line No.")
        {
            Caption = 'Prod. Order Line No.';
        }
        modify("Planning Flexibility")
        {
            Caption = 'Planning Flexibility';
        }
        modify("Routing Reference No.")
        {
            Caption = 'Routing Reference No.';
        }
        modify("Low-Level Code")
        {
            Caption = 'Low-Level Code';
        }
        modify("Production BOM Version Code")
        {
            Caption = 'Production BOM Version Code';
        }
        modify("Routing Version Code")
        {
            Caption = 'Routing Version Code';
        }
        modify("Production BOM No.")
        {
            Caption = 'Production BOM No.';
        }
        modify("Replenishment System")
        {
            Caption = 'Replenishment System';
        }
        modify("Ref. Order No.")
        {
            Caption = 'Ref. Order No.';
        }
        modify("Ref. Line No.")
        {
            Caption = 'Ref. Line No.';
        }
        modify("Expected Operation Cost Amt.")
        {
            Caption = 'Expected Operation Cost Amt.';
        }
        modify("Related to Planning Line")
        {
            Caption = 'Related to Planning Line';
        }
        modify("Planning Line Origin")
        {
            Caption = 'Planning Line Origin';
        }
        modify("Action Message")
        {
            Caption = 'Action Message';
        }
        modify("Accept Action Message")
        {
            Caption = 'Accept Action Message';
        }
        modify("Order Promising Line No.")
        {
            Caption = 'Order Promising Line No.';
        }
        modify("Order Promising Line ID")
        {
            Caption = 'Order Promising Line ID';
        }

        //Unsupported feature: Code Modification on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;


        //Unsupported feature: Code Modification on ""Ending Time"(Field 99000897).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField(Type,Type::Item);
        if ReqLine.Get("Worksheet Template Name","Journal Batch Name","Line No.") then
          PlanningLineMgt.RecalculateWithOptionalModify(Rec,1,false)
        else
          CalcStartingDate('');

        if (CurrFieldNo in [FieldNo("Ending Date"),FieldNo("Ending Date-Time")]) and (CurrentFieldNo <> FieldNo("Due Date")) then
          SetDueDate;
        SetActionMessage;
        if "Ending Time" = 0T then begin
          MfgSetup.Get;
          "Ending Time" := MfgSetup."Normal Ending Time";
        end;
        UpdateDatetime;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TestField(Type,Type::Item);
        {IF ReqLine.GET("Worksheet Template Name","Journal Batch Name","Line No.") THEN
          PlanningLineMgt.RecalculateWithOptionalModify(Rec,1,FALSE)
        ELSE
          CalcStartingDate('');
          }
        #7..14
        */
        //end;
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';

        }
        field(50005; "No. Documento"; Code[30])
        {
        }
        field(50505; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50506; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50507; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50508; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50509; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if CurrentKey <> Rec2.CurrentKey then begin
      Rec2 := Rec;
      Rec2.SetRecFilter;
    #4..12

    ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
    ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..15
    //++Arbu
    ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
    ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
    ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
    ValidateShortcutDimCode(6,"Shortcut Dimension 6 Code");
    ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 2)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;
    TableID[1] := Type1;
    No[1] := No1;
    #4..6

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup.Purchases,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);

    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

    if "Ref. Order No." <> '' then
      GetDimFromRefOrderLine(true);

    OnAfterCreateDim(Rec,xRec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup.Purchases,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code",
      //--Arbu
      0,0);

    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                       //++Arbu
                                       "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                       "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                       "Shortcut Dimension 7 Code"
                                       //--Arbu
                                       );
    #15..19
    */
    //end;


    //Unsupported feature: Code Modification on "GetDimFromRefOrderLine(PROCEDURE 30)".

    //procedure GetDimFromRefOrderLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if AddToExisting then begin
      i := 1;
      DimSetIDArr[i] := "Dimension Set ID";
    #4..25
            DimSetIDArr[i] := AsmHeader."Dimension Set ID"
        end;
    end;
    "Dimension Set ID" := DimMgt.GetCombinedDimensionSetID(DimSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..28
    "Dimension Set ID" := DimMgt.GetCombinedDimensionSetID(DimSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                                           //++Arbu
                                                           "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                                           "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                                           "Shortcut Dimension 7 Code"
                                                           //--Arbu
                                                           );
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 88)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',"Worksheet Template Name","Journal Batch Name","Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code");
        //--Arbu
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=There is no %1 for this line.;ESP=No hay %1 para esta línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=There is no %1 for this line.;ESP=No hay %1 para esta línea.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=There is no replenishment order for this line.;ESP=No hay orden de reposición para esta línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=There is no replenishment order for this line.;ESP=No hay orden de reposición para esta línea.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text028(Variable 1055)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text028 : ENU=The %1 on this %2 must match the %1 on the sales order line it is associated with.;ESP=El %1 en este %2 debe coincidir el %1 de la línea del pedido vtas. con el que está asociado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text028 : ENU=The %1 on this %2 must match the %1 on the sales order line it is associated with.;ESP=El %1 en este %2 debe coincidir el %1 de la línea del pedido vtas. con el que está asociado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text029(Variable 1036)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text029 : ENU=Line %1 has a %2 that exceeds the %3.;ESP=La %2 de la línea %1 supera la %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text029 : ENU=Line %1 has a %2 that exceeds the %3.;ESP=La %2 de la línea %1 supera la %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text031(Variable 1059)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text031 : ENU=%1 %2 is blocked.;ESP=%1 %2 está bloqueado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text031 : ENU=%1 %2 is blocked.;ESP=%1 %2 está bloqueado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text033(Variable 1068)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text033 : ENU=%1 %2 %3 is not certified.;ESP=%1 %2 %3 no está certificado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text033 : ENU=%1 %2 %3 is not certified.;ESP=%1 %2 %3 no está certificado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text034(Variable 1053)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text034 : ENU=%1 %2 %3 %4 %5 is not certified.;ESP=%1 %2 %3 %4 %5 no está certificado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text034 : ENU=%1 %2 %3 %4 %5 is not certified.;ESP=%1 %2 %3 %4 %5 no está certificado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text036(Variable 1072)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text036 : ENU=%1 %2 %3 does not allow default numbering.;ESP=%1 %2 %3 no admite la numeración predeterminada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text036 : ENU=%1 %2 %3 does not allow default numbering.;ESP=%1 %2 %3 no admite la numeración predeterminada.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text039(Variable 1066)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text039 : ENU=You cannot assign new numbers from the number series %1 on %2.;ESP=No puede asignar números nuevos de la serie %1 en la %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text039 : ENU=You cannot assign new numbers from the number series %1 on %2.;ESP=No puede asignar números nuevos de la serie %1 en la %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text040(Variable 1064)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text040 : ENU=You cannot assign new numbers from the number series %1.;ESP=No puede asignar números nuevos de la serie %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text040 : ENU=You cannot assign new numbers from the number series %1.;ESP=No puede asignar números nuevos de la serie %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text041(Variable 1062)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text041 : ENU=You cannot assign new numbers from the number series %1 on a date before %2.;ESP=No puede asignar números nuevos de la serie %1 en una fecha anterior a %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text041 : ENU=You cannot assign new numbers from the number series %1 on a date before %2.;ESP=No puede asignar números nuevos de la serie %1 en una fecha anterior a %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text042(Variable 1054)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text042 : ENU=You cannot assign new numbers from the number series %1 line %2 because the %3 is not defined.;ESP=No puede asignar nuevos números del No. de serie %1, línea %2 porque %3 no está definido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text042 : ENU=You cannot assign new numbers from the number series %1 line %2 because the %3 is not defined.;ESP=No puede asignar nuevos números del No.de serie %1, línea %2 porque %3 no está definido.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text043(Variable 1061)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text043 : ENU=The number %1 on number series %2 cannot be extended to more than 20 characters.;ESP=El número %1 del No. de serie %2 no puede superar 20 caracteres.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text043 : ENU=The number %1 on number series %2 cannot be extended to more than 20 characters.;ESP=El número %1 del No.de serie %2 no puede superar 20 caracteres.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text044(Variable 1069)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text044 : ENU=You cannot assign numbers greater than %1 from the number series %2.;ESP=No puede asignar números mayores que %1 de la serie %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text044 : ENU=You cannot assign numbers greater than %1 from the number series %2.;ESP=No puede asignar números mayores que %1 de la serie %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ReplenishmentErr(Variable 1073)".

    //var
    //>>>> ORIGINAL VALUE:
    //ReplenishmentErr : ENU=Requisition Worksheet cannot be used to create Prod. Order replenishment.;ESP=La Hoja de demanda no se puede usar para crear la reposición de la orden de producción.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReplenishmentErr : ENU=Requisition Worksheet cannot be used to create Prod. Order replenishment.;ESP=La Hoja de demanda no se puede usar para crear la reposición de la orden de producción.;
    //Variable type has not been exported.

    var
        "---ARBUMASA---": Integer;
}

enumextension 50358 TypeEnum extends "Requisition Line Type"
{
    value(10; Resource)
    {
    }
}