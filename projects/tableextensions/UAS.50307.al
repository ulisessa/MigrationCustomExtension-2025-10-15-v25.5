tableextension 50307 tableextension50307 extends "Job Journal Line"
{
    Caption = 'Job Journal Line';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Resource Group No.")
        {
            Caption = 'Resource Group No.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Work Type Code")
        {
            Caption = 'Work Type Code';
        }
        modify("Applies-to Entry")
        {
            Caption = 'Applies-to Entry';
        }
        modify("Shpt. Method Code")
        {
            Caption = 'Shpt. Method Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Recurring Frequency")
        {
            Caption = 'Recurring Frequency';
        }
        modify("Transaction Type")
        {
            Caption = 'Transaction Type';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Area")
        {
            Caption = 'Area';
        }
        modify("Transaction Specification")
        {
            Caption = 'Transaction Specification';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify("Source Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Source Currency Code';
        }
        modify("Source Currency Line Amount")
        {
            Caption = 'Source Currency Line Amount';
        }
        modify("Time Sheet No.")
        {
            Caption = 'Time Sheet No.';
        }
        modify("Time Sheet Line No.")
        {
            Caption = 'Time Sheet Line No.';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Line Type")
        {
            Caption = 'Line Type';
        }
        modify("Line Discount %")
        {
            Caption = 'Line Discount %';
        }
        modify("Line Discount Amount")
        {
            Caption = 'Line Discount Amount';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Line Amount")
        {
            Caption = 'Line Amount';
        }
        modify("Line Amount (LCY)")
        {
            Caption = 'Line Amount (LCY)';
        }
        modify("Line Discount Amount (LCY)")
        {
            Caption = 'Line Discount Amount (LCY)';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Ledger Entry No.")
        {
            Caption = 'Ledger Entry No.';
        }
        modify("Job Planning Line No.")
        {
            Caption = 'Job Planning Line No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Service Order No.")
        {
            Caption = 'Service Order No.';
        }
        modify("Posted Service Shipment No.")
        {
            Caption = 'Posted Service Shipment No.';
        }
        modify("Lot No.")
        {
            Caption = 'Lot No.';
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
        field(50005; Contrapartida; Code[20])
        {
            Description = 'Para Obra ejecutada';
            Editable = false;
            TableRelation = Job;

            trigger OnValidate()
            begin
                TestField("Job No.");
            end;
        }
        field(50006; "Validar contrapartida"; Boolean)
        {
            Description = 'No validar acceso sino que es contrapartida de gastos indirectos';
            Editable = false;
        }
        field(50007; "Kilos brutos"; Decimal)
        {
        }
        field(50008; "Kilos netos"; Decimal)
        {
        }
        field(50009; "Registro div.-adic."; Option)
        {
            Editable = true;
            OptionMembers = Ninguno,"Sólo importe","Sólo importe div.-adic.";
        }
        field(50010; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Concepto proyecto";
        }
        field(50100; "Nombre proyecto"; Text[100])
        {
            CalcFormula = Lookup(Job.Description WHERE("No." = FIELD("Job No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50200; "Origen del registro"; Option)
        {
            Editable = false;
            OptionMembers = " ",Compras,Ventas,,,,"Reparto GG","Nómina";
        }
        field(50201; "Importe factura (DL)"; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
        }
        field(50202; "Importe factura IVA inc. (DL)"; Decimal)
        {
            AutoFormatType = 1;
            Editable = false;
        }
        field(50305; "Cód. cliente/prov. factura"; Code[20])
        {
            TableRelation = IF ("Origen del registro" = CONST(Compras)) Vendor
            ELSE
            IF ("Origen del registro" = CONST(Ventas)) Customer;
        }
        field(50306; "Cód. cliente/prov. venta"; Code[20])
        {
            TableRelation = IF ("Origen del registro" = CONST(Compras)) Vendor
            ELSE
            IF ("Origen del registro" = CONST(Ventas)) Customer;
        }
        field(50403; "No pedido compras"; Code[30])
        {
        }
        field(50500; "A cobrar"; Boolean)
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
        field(50510; "Id. Sociedad"; Code[10])
        {
        }
        field(50511; "Id. Empleado"; Code[20])
        {
        }
        field(50512; "Cód. cuenta"; Code[20])
        {
        }
        field(50513; "Proy."; Code[20])
        {
        }
        field(50514; "Id. Empresa"; Code[10])
        {
        }
        field(50515; "Fecha pago"; Date)
        {
        }
        field(50516; "Fecha imputación"; Date)
        {
        }
        field(50517; "Tipo imputación"; Code[10])
        {
        }
        field(50518; "Id. Categoría"; Code[10])
        {
        }
        field(50519; "Nombre Categoría"; Text[100])
        {
        }
        field(50520; "Id. puesto"; Code[10])
        {
        }
        field(50521; "Nombre puesto"; Text[100])
        {
        }
        field(50522; "Id. nacionalidad"; Code[10])
        {
        }
        field(50523; "Fecha sicore"; Date)
        {
        }
        field(50524; Importe; Decimal)
        {
        }
        field(50525; "Fecha de importación"; DateTime)
        {
        }
        field(50526; Buque; Code[10])
        {
        }
        field(50527; Marea; Code[10])
        {
        }
        field(50528; Costo; Code[10])
        {
        }
        field(50760; "Forzar variación existencias"; Boolean)
        {
        }
        field(60000; Horas; Decimal)
        {
            Editable = false;
        }
        field(60001; Kilos; Decimal)
        {
            DecimalPlaces = 0 : 3;
            Editable = false;
        }
        field(60002; "Precio kilo"; Decimal)
        {
            AutoFormatType = 2;
            Editable = false;
        }
        field(60003; "Importe pesca"; Decimal)
        {
            Editable = false;
        }
        field(60004; "Precio kilo tripulación"; Decimal)
        {
            AutoFormatType = 2;
        }
        field(60005; "Valor captura tripulación"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Editable = false;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LockTable;
    JobJnlTemplate.Get("Journal Template Name");
    JobJnlBatch.Get("Journal Template Name","Journal Batch Name");

    ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
    ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //++Arbu
    ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
    ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
    ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
    ValidateShortcutDimCode(6,"Shortcut Dimension 6 Code");
    ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromResource(PROCEDURE 27)".

    //procedure CopyFromResource();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Resource.Get("No.");
    Resource.CheckResourcePrivacyBlocked(false);
    Resource.TestField(Blocked,false);
    #4..7
    Validate("Unit of Measure Code",Resource."Base Unit of Measure");
    if "Time Sheet No." = '' then
      Resource.TestField("Use Time Sheet",false);

    OnAfterAssignResourceValues(Rec,Resource);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
    //++Arbu
    Validate("Unit Price (LCY)",fntTraerPrecioVenta);
    Description := Description +' - '+Format("Posting Date");
    //--Arbu


    OnAfterAssignResourceValues(Rec,Resource);
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 13)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TableID[1] := Type1;
    No[1] := No1;
    TableID[2] := Type2;
    #4..7

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,"Source Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,"Source Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code",
      //--Arbu
      0,0);
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 2)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet("Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."));
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet("Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."));
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                       //++Arbu
                                       "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                       "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                       "Shortcut Dimension 7 Code"
                                       //--Arbu
                                       );
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateDimensions(PROCEDURE 12)".

    //procedure UpdateDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CreateDim(
      DimMgt.TypeToTableID2(Type),"No.",
      DATABASE::Job,"Job No.",
      DATABASE::"Resource Group","Resource Group No.");
    if "Job Task No." <> '' then begin
      DimensionSetIDArr[1] := "Dimension Set ID";
      DimensionSetIDArr[2] :=
        DimMgt.CreateDimSetFromJobTaskDim("Job No.",
          "Job Task No.","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
      DimMgt.CreateDimForJobJournalLineWithHigherPriorities(
        Rec,CurrFieldNo,DimensionSetIDArr[3],"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Source Code",DATABASE::Job);
      "Dimension Set ID" :=
        DimMgt.GetCombinedDimensionSetID(
          DimensionSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    end;

    OnAfterUpdateDimensions(Rec,DimensionSetIDArr);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
          "Job Task No.","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                         //++Arbu
                         "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                         "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                         "Shortcut Dimension 7 Code");
                         //--Arbu

      //DimMgt.CreateDimForJobJournalLineWithHigherPriorities(
        //Rec,CurrFieldNo,DimensionSetIDArr[3],"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Source Code",DATABASE::Job);
      "Dimension Set ID" :=
        DimMgt.GetCombinedDimensionSetID(
          DimensionSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                         //++Arbu
                         "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                         "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                         "Shortcut Dimension 7 Code"
                         //--Arbu
                         );
    #15..17
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : @@@=Job Journal Line job DEFAULT 30000 is already linked to Job Planning Line  DEERFIELD, 8 WP 1120 10000. Hence Remaining Qty. cannot be calculated correctly. Posting the line may update the linked %3 unexpectedly. Do you want to continue?;ENU=%1 %2 is already linked to %3 %4. Hence %5 cannot be calculated correctly. Posting the line may update the linked %3 unexpectedly. Do you want to continue?;ESP=%1 %2 ya tiene un vínculo con %3 %4. Por lo tanto, %5 no se puede calcular correctamente. Al registrar la línea se pueden actualizar inesperadamente los %3 vinculados. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : @@@=Job Journal Line job DEFAULT 30000 is already linked to Job Planning Line  DEERFIELD, 8 WP 1120 10000. Hence Remaining Qty. cannot be calculated correctly. Posting the line may update the linked %3 unexpectedly. Do you want to continue?;ENU=%1 %2 is already linked to %3 %4. Hence %5 cannot be calculated correctly. Posting the line may update the linked %3 unexpectedly. Do you want to continue?;ESP=%1 %2 ya tiene un vínculo con %3 %4. Por lo tanto, %5 no se puede calcular correctamente. Al registrar la línea se pueden actualizar inesperadamente los %3 vinculados. ?Desea continuar?;
    //Variable type has not been exported.

    var
        rstConfSeg: Record Seguridad;
        rstConfUsu: Record "User Setup";
}

