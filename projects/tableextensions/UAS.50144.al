tableextension 50144 tableextension50144 extends "Salesperson/Purchaser"
{
    LookupPageID = "Salespersons/Purchasers";
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Commission %")
        {
            Caption = 'Commission %';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Next Task Date")
        {
            Caption = 'Next Task Date';
        }
        modify("No. of Opportunities")
        {
            Caption = 'No. of Opportunities';
        }
        modify("No. of Interactions")
        {
            Caption = 'No. of Interactions';
        }
        modify("Duration (Min.)")
        {
            Caption = 'Duration (Min.)';
        }
        modify("Action Taken Filter")
        {
            Caption = 'Action Taken Filter';
        }
        modify("Campaign Filter")
        {
            Caption = 'Campaign Filter';
        }
        modify("Chances of Success % Filter")
        {
            Caption = 'Chances of Success % Filter';
        }
        modify("Search E-Mail")
        {
            Caption = 'Search Email';
        }
        modify("E-Mail 2")
        {
            Caption = 'Email 2';
        }
        field(50000; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
            end;
        }
        field(50002; "Global Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Global Dimension 5 Code");
            end;
        }
        field(50003; "Global Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,1,6';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global Dimension 6 Code");
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnInsert".

    //trigger (Variable: l_blank)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Validate(Code);
    DimMgt.UpdateDefaultDim(
      DATABASE::"Salesperson/Purchaser",Code,
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      "Global Dimension 1 Code","Global Dimension 2 Code",
      //++Arbu
      l_blank,l_blank,l_blank,l_blank,l_blank);
      //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.RenameDefaultDim(DATABASE::"Salesperson/Purchaser",xRec.Code,Code);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //DimMgt.RenameDefaultDim(DATABASE::"Salesperson/Purchaser",xRec.Code,Code);
    */
    //end;

    var
        l_blank: Code[10];


    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteBecauseActiveTasksErr(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteBecauseActiveTasksErr : @@@="%1 = Salesperson/Purchaser code.";ENU=You cannot delete the salesperson/purchaser with code %1 because it has open tasks.;ESP=No puede eliminar el vendedor o comprador con código %1 porque tiene tareas abiertas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteBecauseActiveTasksErr : @@@="%1 = Salesperson/Purchaser code.";ENU=You cannot delete the salesperson/purchaser with code %1 because it has open tasks.;ESP=No puede eliminar el vendedor o comprador con código %1 porque tiene tareas abiertas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BlockedSalesPersonPurchErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //BlockedSalesPersonPurchErr : @@@="%1 = post or create, %2 = Salesperson / Purchaser, %3 = salesperson / purchaser code.";ENU=You cannot %1 this document because %2 %3 is blocked due to privacy.;ESP=No puede %1 este documento porque el %2 %3 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BlockedSalesPersonPurchErr : @@@="%1 = post or create, %2 = Salesperson / Purchaser, %3 = salesperson / purchaser code.";ENU=You cannot %1 this document because %2 %3 is blocked due to privacy.;ESP=No puede %1 este documento porque el %2 %3 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PrivacyBlockedGenericTxt(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //PrivacyBlockedGenericTxt : @@@="%1 = Salesperson / Purchaser, %2 = salesperson / purchaser code.";ENU=Privacy Blocked must not be true for %1 %2.;ESP=La opción Privacidad bloqueada no debe ser verdadera para %1 %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PrivacyBlockedGenericTxt : @@@="%1 = Salesperson / Purchaser, %2 = salesperson / purchaser code.";ENU=Privacy Blocked must not be true for %1 %2.;ESP=La opción Privacidad bloqueada no debe ser verdadera para %1 %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteBecauseActiveOpportunitiesErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteBecauseActiveOpportunitiesErr : @@@="%1 = Salesperson/Purchaser code.";ENU=You cannot delete the salesperson/purchaser with code %1 because it has open opportunities.;ESP=No puede eliminar el comercial o el comprador con el código %1, ya que tiene oportunidades pendientes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteBecauseActiveOpportunitiesErr : @@@="%1 = Salesperson/Purchaser code.";ENU=You cannot delete the salesperson/purchaser with code %1 because it has open opportunities.;ESP=No puede eliminar el comercial o el comprador con el código %1, ya que tiene oportunidades pendientes.;
    //Variable type has not been exported.
}

