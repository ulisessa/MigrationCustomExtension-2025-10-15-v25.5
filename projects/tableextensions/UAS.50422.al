tableextension 50422 tableextension50422 extends "Finance Charge Memo Header"
{
    Caption = 'Finance Charge Memo Header';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Fin. Charge Terms Code")
        {
            Caption = 'Fin. Charge Terms Code';
        }
        modify("Post Interest")
        {
            Caption = 'Post Interest';
        }
        modify("Interest Amount")
        {
            Caption = 'Interest Amount';
        }
        modify("Issuing No. Series")
        {
            Caption = 'Issuing No. Series';
        }
        modify("Issuing No.")
        {
            Caption = 'Issuing No.';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
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
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 16)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;
    TableID[1] := Type1;
    No[1] := No1;
    OnAfterCreateDimTableIDs(Rec,CurrFieldNo,TableID,No);

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup."Finance Charge Memo",
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);

    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu
    #8..10
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
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
                                                          "Shortcut Dimension 7 Code");
                                                          //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDocDim(PROCEDURE 13)".

    //procedure ShowDocDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2',TableCaption,"No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
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

    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                       //++Arbu
                                       "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                       "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                       "Shortcut Dimension 7 Code"
                                       //--Arbu
                                       );
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Finance Charge Memo %1;ESP=Doc. interés %1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Finance Charge Memo %1;ESP=Doc. interés %1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Do you want to print finance charge memo %1?;ESP=¿Confirma que desea imprimir el documento de interés %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Do you want to print finance charge memo %1?;ESP=?Confirma que desea imprimir el documento de interés %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=This change will cause the existing lines to be deleted for this finance charge memo.\\;ESP=Este cambio provocará que se borren las líneas existentes para este doc. de interés.\\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=This change will cause the existing lines to be deleted for this finance charge memo.\\;ESP=Este cambio provocar? que se borren las líneas existentes para este doc. de interés.\\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=Do you want to continue?;ESP=¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=Do you want to continue?;ESP=?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=There is not enough space to insert the text.;ESP=No hay espacio suficiente para añadir el texto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=There is not enough space to insert the text.;ESP=No hay espacio suficiente para añadir el texto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=Deleting this document will cause a gap in the number series for finance charge memos.;ESP=Si borra el documento, se provocará una discontinuidad en la numeración de la serie de doc. de interés.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=Deleting this document will cause a gap in the number series for finance charge memos.;ESP=Si borra el documento, se provocar? una discontinuidad en la numeración de la serie de doc. de interés.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=An empty finance charge memo %1 will be created to fill this gap in the number series.\\;ESP=Se creará un doc. de interés en blanco %1 para completar la misma.\\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=An empty finance charge memo %1 will be created to fill this gap in the number series.\\;ESP=Se creará un doc. de interés en blanco %1 para completar la misma.\\;
    //Variable type has not been exported.
}

