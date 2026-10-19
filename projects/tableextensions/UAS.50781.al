tableextension 50781 tableextension50781 extends "Fixed Asset"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Search Description")
        {
            Caption = 'Search Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("FA Class Code")
        {
            Caption = 'FA Class Code';
        }
        modify("FA Subclass Code")
        {
            Caption = 'FA Subclass Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("FA Location Code")
        {
            Caption = 'FA Location Code';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Warranty Date")
        {
            Caption = 'Warranty Date';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Maintenance Vendor No.")
        {
            Caption = 'Maintenance Vendor No.';
        }
        modify("Next Service Date")
        {
            Caption = 'Next Service Date';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
            end;
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Global Dimension 5 Code");
            end;
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global Dimension 6 Code");
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
            end;
        }
        field(50005; "Global Dimension 1 Filter"; Code[10])
        {
            CaptionClass = '1,1,1';
            Caption = 'Filtro dim. global 1';
            ToolTip = 'Specifies the value of the Filtro dim. global 1 field.';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
            end;
        }
        field(50006; "Global Dimension 2 Filter"; Code[10])
        {
            CaptionClass = '1,1,2';
            Caption = 'Filtro dim. global 2';
            ToolTip = 'Specifies the value of the Filtro dim. global 2 field.';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
            end;
        }
        field(50007; "Global Dimension 3 Filter"; Code[10])
        {
            CaptionClass = '1,2,3';
            Caption = 'Filtro dim. global 3';
            ToolTip = 'Specifies the value of the Filtro dim. global 3 field.';
            FieldClass = FlowFilter;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
            end;
        }
        field(50008; "Global Dimension 4 Filter"; Code[10])
        {
            CaptionClass = '1,2,4';
            Caption = 'Filtro dim. global 4';
            ToolTip = 'Specifies the value of the Filtro dim. global 4 field.';
            FieldClass = FlowFilter;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
            end;
        }
        field(50009; "Global Dimension 5 Filter"; Code[10])
        {
            CaptionClass = '1,2,5';
            Caption = 'Filtro dim. global 5';
            ToolTip = 'Specifies the value of the Filtro dim. global 5 field.';
            FieldClass = FlowFilter;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Global Dimension 5 Code");
            end;
        }
        field(50010; "Global Dimension 6 Filter"; Code[10])
        {
            CaptionClass = '1,2,6';
            Caption = 'Filtro dim. global 6';
            ToolTip = 'Specifies the value of the Filtro dim. global 6 field.';
            FieldClass = FlowFilter;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global Dimension 6 Code");
            end;
        }
        field(50011; "Global Dimension 7 Filter"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Filtro dim. global 7';
            ToolTip = 'Specifies the value of the Filtro dim. global 7 field.';
            FieldClass = FlowFilter;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
            end;
        }
        field(50026; "Eslora de arqueo (m)"; Decimal)
        {
            Caption = 'Eslora de arqueo (m)';
            ToolTip = 'Specifies the value of the Eslora de arqueo (m) field.';
        }
        field(50027; "Manga (m)"; Decimal)
        {
            Caption = 'Manga (m)';
            ToolTip = 'Specifies the value of the Manga (m) field.';
        }
        field(50028; "Puntal (m)"; Decimal)
        {
            Caption = 'Puntal (m)';
            ToolTip = 'Specifies the value of the Puntal (m) field.';
        }
        field(50029; "Bodega neta (m)"; Decimal)
        {
            Caption = 'Bodega neta (m)';
            ToolTip = 'Specifies the value of the Bodega neta (m) field.';
        }
        field(50030; "T.R.B."; Decimal)
        {
            Caption = 'T.R.B.';
            ToolTip = 'Specifies the value of the T.R.B field.';
        }
        field(50031; "T.R.N."; Decimal)
        {
            Caption = 'T.R.N.';
            ToolTip = 'Specifies the value of the T.R.N field.';
        }
        field(50032; "País de construcción"; Text[30])
        {
            Caption = 'País de construcción';
            ToolTip = 'Specifies the value of the País de construcción field.';
            TableRelation = "Country/Region";
        }
        field(50033; "Año de construcción"; Integer)
        {
            Caption = 'Año de construcción';
            ToolTip = 'Specifies the value of the Año de construcción field.';
        }
        field(50034; "Motor principal n?"; Text[30])
        {
            Caption = 'Motor principal n?';
            ToolTip = 'Specifies the value of the Motor principal n? field.';
        }
        field(50035; "Motor principal marca"; Text[30])
        {
            Caption = 'Motor principal marca';
            ToolTip = 'Specifies the value of the Motor principal marca field.';
        }
        field(50036; "Motor principal modelo"; Text[30])
        {
            Caption = 'Motor principal modelo';
            ToolTip = 'Specifies the value of the Motor principal modelo field.';
        }
        field(50037; "Motor principal potencia (KW)"; Decimal)
        {
            Caption = 'Motor principal potencia (KW)';
            ToolTip = 'Specifies the value of the Motor principal potencia (KW) field.';
        }
        field(50038; "Motor auxiliar n?"; Text[30])
        {
            Caption = 'Motor auxiliar n?';
            ToolTip = 'Specifies the value of the Motor auxiliar n? field.';
        }
        field(50039; "Motor auxiliar marca"; Text[30])
        {
            Caption = 'Motor auxiliar marca';
            ToolTip = 'Specifies the value of the Motor auxiliar marca field.';
        }
        field(50040; "Motor auxiliar modelo"; Text[30])
        {
            Caption = 'Motor auxiliar modelo';
            ToolTip = 'Specifies the value of the Motor auxiliar modelo field.';
        }
        field(50041; "Motor auxiliar potencia (KW)"; Decimal)
        {
            Caption = 'Motor auxiliar potencia (KW)';
            ToolTip = 'Specifies the value of the Motor auxiliar potencia (KW) field.';
        }
        field(50042; "Volumen túneles"; Decimal)
        {
            Caption = 'Volumen túneles';
            ToolTip = 'Specifies the value of the Volumen túneles field.';
        }
        field(50402; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;
        }
        field(50403; "Ubicación"; Code[10])
        {
            Caption = 'Ubicación';
            ToolTip = 'Specifies the value of the Ubicación field.';
        }
        field(50404; "Grupo contable"; Code[10])
        {
            Caption = 'Grupo contable';
            ToolTip = 'Specifies the value of the Grupo contable field.';
            Description = 'Campo únicamente descriptivo';
        }
        field(50500; "Utiliza Cód. serie"; Boolean)
        {
            Caption = 'Utiliza Cód. serie';
            ToolTip = 'Specifies the value of the Utiliza Cód. serie field.';
        }
        field(50501; Familia; Code[5])
        {
            Caption = 'Family';
            ToolTip = 'Specifies the value of the Family field.';
            TableRelation = "DCL Application Lines";
        }
        field(50502; Subfamilia; Code[5])
        {
            Caption = 'Subfamily';
            ToolTip = 'Specifies the value of the Subfamily field.';
            TableRelation = "xCost Object" WHERE(Code = FIELD(Familia));
        }
        field(50503; "Específico"; Code[18])
        {
            Caption = 'Específico';
            ToolTip = 'Specifies the value of the Específico field.';
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "No." = '' then begin
      FASetup.Get;
      FASetup.TestField("Fixed Asset Nos.");
    #4..6
    "Main Asset/Component" := "Main Asset/Component"::" ";
    "Component of Main Asset" := '';

    DimMgt.UpdateDefaultDim(
      DATABASE::"Fixed Asset","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    fntActualizarSeptima;

    DimMgt.UpdateDefaultDim(
      DATABASE::"Fixed Asset","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code",
      //++Arbu
      "Global Dimension 3 Code","Global Dimension 4 Code",
      "Global Dimension 5 Code","Global Dimension 6 Code",
      "Global Dimension 7 Code");
      //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesLine.RenameNo(SalesLine.Type::"Fixed Asset",xRec."No.","No.");
    PurchaseLine.RenameNo(PurchaseLine.Type::"Fixed Asset",xRec."No.","No.");
    DimMgt.RenameDefaultDim(DATABASE::"Fixed Asset",xRec."No.","No.");

    "Last Date Modified" := Today;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SalesLine.RenameNo(SalesLine.Type::"Fixed Asset",xRec."No.","No.");
    PurchaseLine.RenameNo(PurchaseLine.Type::"Fixed Asset",xRec."No.","No.");
    //DimMgt.RenameDefaultDim(DATABASE::"Fixed Asset",xRec."No.","No.");

    "Last Date Modified" := Today;
    */
    //end;

    local procedure fntActualizarSeptima()
    var
        l_rstGLS: Record "General Ledger Setup";
        l_rstD: Record Dimension;
        l_rstDV: Record "Dimension Value";
        l_rst352: Record "Default Dimension";
    begin
        //++Arbu 2020
        //Cambiar el nombre de la dimensión global 7 a Relación Costo
        Clear(l_rstGLS);
        l_rstGLS.Get();
        if l_rstGLS."Global Dimension 7 Code" <> '' then begin

            Clear(l_rstD);
            l_rstD.SetRange(Code, l_rstGLS."Global Dimension 7 Code");
            if l_rstD.FindFirst then begin

                Clear(l_rstDV);
                l_rstDV."Dimension Code" := l_rstD.Code;
                l_rstDV.Code := "No.";
                l_rstDV.Name := CopyStr(Description, 1, 50);
                l_rstDV."Dimension Value Type" := l_rstDV."Dimension Value Type"::Standard;
                l_rstDV."Global Dimension No." := 7;
                if not l_rstDV.Insert(true) then;

                Clear(l_rst352);
                l_rst352."Table ID" := 5600;
                l_rst352."No." := l_rstDV.Code;
                l_rst352."Dimension Code" := l_rstDV."Dimension Code";
                l_rst352."Dimension Value Code" := l_rstDV.Code;
                l_rst352."Value Posting" := l_rst352."Value Posting"::"Code Mandatory";
                if not l_rst352.Insert(true) then;

                "Global Dimension 7 Code" := l_rstDV.Code;

            end;

        end;

        //--Arbu 2020
    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot delete %1 %2 because it has associated depreciation books.;ESP=No se puede eliminar %1 %2 ya que tiene asociados libros de amortización.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot delete %1 %2 because it has associated depreciation books.;ESP=No se puede eliminar %1 %2 ya que tiene asociados libros de amortización.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NotificationNameTxt(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //NotificationNameTxt : ENU=Fixed Asset Acquisition Wizard;ESP=Asistente de adquisición de activos fijos;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NotificationNameTxt : ENU=Fixed Asset Acquisition Wizard;ESP=Asistente de adquisición de activos fijos;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NotificationDescriptionTxt(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //NotificationDescriptionTxt : ENU=Notify when ready to acquire the fixed asset.;ESP=Notificar cuando esté listo para comprar el activo fijo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NotificationDescriptionTxt : ENU=Notify when ready to acquire the fixed asset.;ESP=Notificar cuando está listo para comprar el activo fijo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ReadyToAcquireMsg(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //ReadyToAcquireMsg : ENU=You are ready to acquire the fixed asset.;ESP=Está listo para comprar el activo fijo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ReadyToAcquireMsg : ENU=You are ready to acquire the fixed asset.;ESP=está listo para comprar el activo fijo.;
    //Variable type has not been exported.
}

