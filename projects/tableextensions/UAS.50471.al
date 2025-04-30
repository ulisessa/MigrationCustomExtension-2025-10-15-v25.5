tableextension 50471 tableextension50471 extends "Default Dimension"
{
    Caption = 'Default Dimension';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Dimension Code")
        {
            Caption = 'Dimension Code';
        }
        modify("Dimension Value Code")
        {
            Caption = 'Dimension Value Code';
        }
        modify("Table Caption")
        {
            Caption = 'Table Caption';
        }
        modify("Multi Selection Action")
        {
            Caption = 'Multi Selection Action';
        }

        //Unsupported feature: Code Modification on ""Table ID"(Field 1).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Clear(TempAllObjWithCaption);
        DimMgt.DefaultDimObjectNoList(TempAllObjWithCaption);
        if PAGE.RunModal(PAGE::Objects,TempAllObjWithCaption) = ACTION::LookupOK then begin
          "Table ID" := TempAllObjWithCaption."Object ID";
          Validate("Table ID");
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        Clear(TempAllObjWithCaption);
        DimMgt.SetupObjectNoList(TempAllObjWithCaption);
        #3..6
        */
        //end;


        //Unsupported feature: Code Modification on ""Table ID"(Field 1).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CalcFields("Table Caption");
        DimMgt.DefaultDimObjectNoList(TempAllObjWithCaption);
        TempAllObjWithCaption."Object Type" := TempAllObjWithCaption."Object Type"::Table;
        TempAllObjWithCaption."Object ID" := "Table ID";
        if not TempAllObjWithCaption.Find then
          FieldError("Table ID");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CalcFields("Table Caption");
        DimMgt.SetupObjectNoList(TempAllObjWithCaption);
        #3..6
        */
        //end;
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GLSetup.Get;
    if "Dimension Code" = GLSetup."Global Dimension 1 Code" then
      UpdateGlobalDimCode(1,"Table ID","No.",'');
    if "Dimension Code" = GLSetup."Global Dimension 2 Code" then
      UpdateGlobalDimCode(2,"Table ID","No.",'');
    DimMgt.DefaultDimOnDelete(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    if "Dimension Code" = GLSetup."Global Dimension 3 Code" then
      UpdateGlobalDimCode(3,"Table ID","No.",'');
    if "Dimension Code" = GLSetup."Global Dimension 4 Code" then
      UpdateGlobalDimCode(4,"Table ID","No.",'');
    if "Dimension Code" = GLSetup."Global Dimension 5 Code" then
      UpdateGlobalDimCode(5,"Table ID","No.",'');
    if "Dimension Code" = GLSetup."Global Dimension 6 Code" then
      UpdateGlobalDimCode(6,"Table ID","No.",'');
    if "Dimension Code" = GLSetup."Global Dimension 7 Code" then
      UpdateGlobalDimCode(7,"Table ID","No.",'');
    DimMgt.DefaultDimOnDelete(Rec);
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GLSetup.Get;
    if "Dimension Code" = GLSetup."Global Dimension 1 Code" then
      UpdateGlobalDimCode(1,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 2 Code" then
      UpdateGlobalDimCode(2,"Table ID","No.","Dimension Value Code");
    DimMgt.DefaultDimOnInsert(Rec);
    UpdateParentId;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    if "Dimension Code" = GLSetup."Global Dimension 3 Code" then
      UpdateGlobalDimCode(3,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 4 Code" then
      UpdateGlobalDimCode(4,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 5 Code" then
      UpdateGlobalDimCode(5,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 6 Code" then
      UpdateGlobalDimCode(6,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 7 Code" then
      UpdateGlobalDimCode(7,"Table ID","No.","Dimension Value Code");
    DimMgt.DefaultDimOnInsert(Rec);
    UpdateParentId;
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GLSetup.Get;
    if "Dimension Code" = GLSetup."Global Dimension 1 Code" then
      UpdateGlobalDimCode(1,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 2 Code" then
      UpdateGlobalDimCode(2,"Table ID","No.","Dimension Value Code");
    DimMgt.DefaultDimOnModify(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    if "Dimension Code" = GLSetup."Global Dimension 3 Code" then
      UpdateGlobalDimCode(3,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 4 Code" then
      UpdateGlobalDimCode(4,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 5 Code" then
      UpdateGlobalDimCode(5,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 6 Code" then
      UpdateGlobalDimCode(6,"Table ID","No.","Dimension Value Code");
    if "Dimension Code" = GLSetup."Global Dimension 7 Code" then
      UpdateGlobalDimCode(7,"Table ID","No.","Dimension Value Code");
    DimMgt.DefaultDimOnModify(Rec);
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateGLAccGlobalDimCode(PROCEDURE 26)".

    //procedure UpdateGLAccGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if GLAcc.Get(GLAccNo) then begin
      case GlobalDimCodeNo of
        1:
          GLAcc."Global Dimension 1 Code" := NewDimValue;
        2:
          GLAcc."Global Dimension 2 Code" := NewDimValue;
      end;
      GLAcc.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if GLAcc.Get(GLAccNo) then begin
      case GlobalDimCodeNo of
            1:GLAcc."Global Dimension 1 Code" := NewDimValue;
            2:GLAcc."Global Dimension 2 Code" := NewDimValue;
            3:GLAcc."Global Dimension 3 Code" := NewDimValue;
            4:GLAcc."Global Dimension 4 Code" := NewDimValue;
            5:GLAcc."Global Dimension 5 Code" := NewDimValue;
            6:GLAcc."Global Dimension 6 Code" := NewDimValue;
            7:GLAcc."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateCustGlobalDimCode(PROCEDURE 27)".

    //procedure UpdateCustGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Cust.Get(CustNo) then begin
      case GlobalDimCodeNo of
        1:
          Cust."Global Dimension 1 Code" := NewDimValue;
        2:
          Cust."Global Dimension 2 Code" := NewDimValue;
      end;
      Cust.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if Cust.Get(CustNo) then begin
      case GlobalDimCodeNo of
            1:Cust."Global Dimension 1 Code" := NewDimValue;
            2:Cust."Global Dimension 2 Code" := NewDimValue;
            3:Cust."Global dimension 3 Code" := NewDimValue;
            4:Cust."Global Dimension 4 Code" := NewDimValue;
            5:Cust."Global Dimension 5 Code" := NewDimValue;
            6:Cust."Global Dimension 6 Code" := NewDimValue;
            7:Cust."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateVendGlobalDimCode(PROCEDURE 28)".

    //procedure UpdateVendGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Vend.Get(VendNo) then begin
      case GlobalDimCodeNo of
        1:
          Vend."Global Dimension 1 Code" := NewDimValue;
        2:
          Vend."Global Dimension 2 Code" := NewDimValue;
      end;
      Vend.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if Vend.Get(VendNo) then begin
      case GlobalDimCodeNo of
            1:Vend."Global Dimension 1 Code" := NewDimValue;
            2:Vend."Global Dimension 2 Code" := NewDimValue;
            3:Vend."Global Dimension 3 Code" := NewDimValue;
            4:Vend."Global Dimension 4 Code" := NewDimValue;
            5:Vend."Global Dimension 5 Code" := NewDimValue;
            6:Vend."Global Dimension 6 Code" := NewDimValue;
            7:Vend."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateItemGlobalDimCode(PROCEDURE 29)".

    //procedure UpdateItemGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Item.Get(ItemNo) then begin
      case GlobalDimCodeNo of
        1:
          Item."Global Dimension 1 Code" := NewDimValue;
        2:
          Item."Global Dimension 2 Code" := NewDimValue;
      end;
      Item.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if Item.Get(ItemNo) then begin
      case GlobalDimCodeNo of
            1:Item."Global Dimension 1 Code" := NewDimValue;
            2:Item."Global Dimension 2 Code" := NewDimValue;
            3:Item."Global Dimension 3 Code" := NewDimValue;
            4:Item."Global Dimension 4 Code" := NewDimValue;
            5:Item."Global Dimension 5 Code" := NewDimValue;
            6:Item."Global Dimension 6 Code" := NewDimValue;
            7:Item."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateResGrGlobalDimCode(PROCEDURE 30)".

    //procedure UpdateResGrGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ResGr.Get(ResGrNo) then begin
      case GlobalDimCodeNo of
        1:
          ResGr."Global Dimension 1 Code" := NewDimValue;
        2:
          ResGr."Global Dimension 2 Code" := NewDimValue;
      end;
      ResGr.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if ResGr.Get(ResGrNo) then begin
      case GlobalDimCodeNo of
            1:ResGr."Global Dimension 1 Code" := NewDimValue;
            2:ResGr."Global Dimension 2 Code" := NewDimValue;
            3:ResGr."Global Dimension 3 Code" := NewDimValue;
            4:ResGr."Global Dimension 4 Code" := NewDimValue;
            5:ResGr."Global Dimension 5 Code" := NewDimValue;
            6:ResGr."Global Dimension 6 Code" := NewDimValue;
            7:ResGr."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateResGlobalDimCode(PROCEDURE 31)".

    //procedure UpdateResGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Res.Get(ResNo) then begin
      case GlobalDimCodeNo of
        1:
          Res."Global Dimension 1 Code" := NewDimValue;
        2:
          Res."Global Dimension 2 Code" := NewDimValue;
      end;
      Res.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if Res.Get(ResNo) then begin
      case GlobalDimCodeNo of
            1:Res."Global Dimension 1 Code" := NewDimValue;
            2:Res."Global Dimension 2 Code" := NewDimValue;
            3:Res."Global Dimension 3 Code" := NewDimValue;
            4:Res."Global Dimension 4 Code" := NewDimValue;
            5:Res."Global Dimension 5 Code" := NewDimValue;
            6:Res."Global Dimension 6 Code" := NewDimValue;
            7:Res."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateJobGlobalDimCode(PROCEDURE 32)".

    //procedure UpdateJobGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Job.Get(JobNo) then begin
      case GlobalDimCodeNo of
        1:
          Job."Global Dimension 1 Code" := NewDimValue;
        2:
          Job."Global Dimension 2 Code" := NewDimValue;
      end;
      Job.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if Job.Get(JobNo) then begin
      case GlobalDimCodeNo of
            1:Job."Global Dimension 1 Code" := NewDimValue;
            2:Job."Global Dimension 2 Code" := NewDimValue;
            3:Job."Global Dimension 3 Code" := NewDimValue;
            4:Job."Global Dimension 4 Code" := NewDimValue;
            5:Job."Global Dimension 5 Code" := NewDimValue;
            6:Job."Global Dimension 6 Code" := NewDimValue;
            7:Job."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateBankGlobalDimCode(PROCEDURE 33)".

    //procedure UpdateBankGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if BankAcc.Get(BankAccNo) then begin
      case GlobalDimCodeNo of
        1:
          BankAcc."Global Dimension 1 Code" := NewDimValue;
        2:
          BankAcc."Global Dimension 2 Code" := NewDimValue;
      end;
      BankAcc.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if BankAcc.Get(BankAccNo) then begin
      case GlobalDimCodeNo of
            1:BankAcc."Global Dimension 1 Code" := NewDimValue;
            2:BankAcc."Global Dimension 2 Code" := NewDimValue;
            3:BankAcc."Global Dimension 3 Code" := NewDimValue;
            4:BankAcc."Global Dimension 4 Code" := NewDimValue;
            5:BankAcc."Global Dimension 5 Code" := NewDimValue;
            6:BankAcc."Global Dimension 6 Code" := NewDimValue;
            7:BankAcc."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateEmpoyeeGlobalDimCode(PROCEDURE 34)".

    //procedure UpdateEmpoyeeGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Employee.Get(EmployeeNo) then begin
      case GlobalDimCodeNo of
        1:
          Employee."Global Dimension 1 Code" := NewDimValue;
        2:
          Employee."Global Dimension 2 Code" := NewDimValue;
      end;
      Employee.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if Employee.Get(EmployeeNo) then begin
      case GlobalDimCodeNo of
            1:Employee."Global Dimension 1 Code" := NewDimValue;
            2:Employee."Global Dimension 2 Code" := NewDimValue;
            3:Employee."Global Dimension 3 Code" := NewDimValue;
            4:Employee."Global Dimension 4 Code" := NewDimValue;
            5:Employee."Global Dimension 5 Code" := NewDimValue;
            6:Employee."Global Dimension 6 Code" := NewDimValue;
            7:Employee."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateFAGlobalDimCode(PROCEDURE 35)".

    //procedure UpdateFAGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FA.Get(FANo) then begin
      case GlobalDimCodeNo of
        1:
          FA."Global Dimension 1 Code" := NewDimValue;
        2:
          FA."Global Dimension 2 Code" := NewDimValue;
      end;
      FA.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if FA.Get(FANo) then begin
      case GlobalDimCodeNo of
            1:FA."Global Dimension 1 Code" := NewDimValue;
            2:FA."Global Dimension 2 Code" := NewDimValue;
            3:FA."Global Dimension 3 Code" := NewDimValue;
            4:FA."Global Dimension 4 Code" := NewDimValue;
            5:FA."Global Dimension 5 Code" := NewDimValue;
            6:FA."Global Dimension 6 Code" := NewDimValue;
            7:FA."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateInsuranceGlobalDimCode(PROCEDURE 36)".

    //procedure UpdateInsuranceGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Insurance.Get(InsuranceNo) then begin
      case GlobalDimCodeNo of
        1:
          Insurance."Global Dimension 1 Code" := NewDimValue;
        2:
          Insurance."Global Dimension 2 Code" := NewDimValue;
      end;
      Insurance.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if Insurance.Get(InsuranceNo) then begin
      case GlobalDimCodeNo of
            1:Insurance."Global Dimension 1 Code" := NewDimValue;
            2:Insurance."Global Dimension 2 Code" := NewDimValue;
            3:Insurance."Global Dimension 3 Code" := NewDimValue;
            4:Insurance."Global Dimension 4 Code" := NewDimValue;
            5:Insurance."Global Dimension 5 Code" := NewDimValue;
            6:Insurance."Global Dimension 6 Code" := NewDimValue;
            7:Insurance."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateRespCenterGlobalDimCode(PROCEDURE 37)".

    //procedure UpdateRespCenterGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if RespCenter.Get(RespCenterNo) then begin
      case GlobalDimCodeNo of
        1:
          RespCenter."Global Dimension 1 Code" := NewDimValue;
        2:
          RespCenter."Global Dimension 2 Code" := NewDimValue;
      end;
      RespCenter.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if RespCenter.Get(RespCenterNo) then begin
      case GlobalDimCodeNo of
            1:RespCenter."Global Dimension 1 Code" := NewDimValue;
            2:RespCenter."Global Dimension 2 Code" := NewDimValue;
            3:RespCenter."Global Dimension 3 Code" := NewDimValue;
            4:RespCenter."Global Dimension 4 Code" := NewDimValue;
            5:RespCenter."Global Dimension 5 Code" := NewDimValue;
            6:RespCenter."Global Dimension 6 Code" := NewDimValue;
            7:RespCenter."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateWorkCenterGlobalDimCode(PROCEDURE 38)".

    //procedure UpdateWorkCenterGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if WorkCenter.Get(WorkCenterNo) then begin
      case GlobalDimCodeNo of
        1:
          WorkCenter."Global Dimension 1 Code" := NewDimValue;
        2:
          WorkCenter."Global Dimension 2 Code" := NewDimValue;
      end;
      WorkCenter.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if WorkCenter.Get(WorkCenterNo) then begin
      case GlobalDimCodeNo of
            1:WorkCenter."Global Dimension 1 Code" := NewDimValue;
            2:WorkCenter."Global Dimension 2 Code" := NewDimValue;
            3:WorkCenter."Global Dimension 3 Code" := NewDimValue;
            4:WorkCenter."Global Dimension 4 Code" := NewDimValue;
            5:WorkCenter."Global Dimension 5 Code" := NewDimValue;
            6:WorkCenter."Global Dimension 6 Code" := NewDimValue;
            7:WorkCenter."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateSalesPurchGlobalDimCode(PROCEDURE 39)".

    //procedure UpdateSalesPurchGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if SalespersonPurchaser.Get(SalespersonPurchaserNo) then begin
      case GlobalDimCodeNo of
        1:
          SalespersonPurchaser."Global Dimension 1 Code" := NewDimValue;
        2:
          SalespersonPurchaser."Global Dimension 2 Code" := NewDimValue;
      end;
      SalespersonPurchaser.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if SalespersonPurchaser.Get(SalespersonPurchaserNo) then begin
      case GlobalDimCodeNo of
            1:SalespersonPurchaser."Global Dimension 1 Code" := NewDimValue;
            2:SalespersonPurchaser."Global Dimension 2 Code" := NewDimValue;
            3:SalespersonPurchaser."Global Dimension 3 Code" := NewDimValue;
            4:SalespersonPurchaser."Global Dimension 4 Code" := NewDimValue;
            5:SalespersonPurchaser."Global Dimension 5 Code" := NewDimValue;
            6:SalespersonPurchaser."Global Dimension 6 Code" := NewDimValue;
            7:SalespersonPurchaser."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateCampaignGlobalDimCode(PROCEDURE 40)".

    //procedure UpdateCampaignGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Campaign.Get(CampaignNo) then begin
      case GlobalDimCodeNo of
        1:
          Campaign."Global Dimension 1 Code" := NewDimValue;
        2:
          Campaign."Global Dimension 2 Code" := NewDimValue;
      end;
      Campaign.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if Campaign.Get(CampaignNo) then begin
      case GlobalDimCodeNo of
            1:Campaign."Global Dimension 1 Code" := NewDimValue;
            2:Campaign."Global Dimension 2 Code" := NewDimValue;
            3:Campaign."Global Dimension 3 Code" := NewDimValue;
            4:Campaign."Global Dimension 4 Code" := NewDimValue;
            5:Campaign."Global Dimension 5 Code" := NewDimValue;
            6:Campaign."Global Dimension 6 Code" := NewDimValue;
            7:Campaign."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateCustTempGlobalDimCode(PROCEDURE 41)".

    //procedure UpdateCustTempGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if CustTemplate.Get(CustTemplateNo) then begin
      case GlobalDimCodeNo of
        1:
          CustTemplate."Global Dimension 1 Code" := NewDimValue;
        2:
          CustTemplate."Global Dimension 2 Code" := NewDimValue;
      end;
      CustTemplate.Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if CustTemplate.Get(CustTemplateNo) then begin
      case GlobalDimCodeNo of
            1:CustTemplate."Global Dimension 1 Code" := NewDimValue;
            2:CustTemplate."Global Dimension 2 Code" := NewDimValue;
            3:CustTemplate."Global Dimension 3 Code" := NewDimValue;
            4:CustTemplate."Global Dimension 4 Code" := NewDimValue;
            5:CustTemplate."Global Dimension 5 Code" := NewDimValue;
            6:CustTemplate."Global Dimension 6 Code" := NewDimValue;
            7:CustTemplate."Global Dimension 7 Code" := NewDimValue;
    #7..9
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "NoValidateErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoValidateErr : @@@="%1 - a master table record key value; %2 - table caption. ";ENU=The field No. of table Default Dimension contains a value (%1) that cannot be found in the related table (%2).;ESP=El campo N.º de la tabla Dimensión predeterminada contiene un valor (%1) que no se puede encontrar en la tabla relacionada (%2).;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoValidateErr : @@@="%1 - a master table record key value; %2 - table caption. ";ENU=The field No. of table Default Dimension contains a value (%1) that cannot be found in the related table (%2).;ESP=El campo No. de la tabla Dimensión predeterminada contiene un valor (%1) que no se puede encontrar en la tabla relacionada (%2).;
    //Variable type has not been exported.
}

