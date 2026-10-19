tableextension 50367 tableextension50367 extends "VAT Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Bill-to/Pay-to No.")
        {
            Caption = 'Bill-to/Pay-to No.';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Closed by Entry No.")
        {
            Caption = 'Closed by Entry No.';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Internal Ref. No.")
        {
            Caption = 'Internal Ref. No.';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Use Tax")
        {
            Caption = 'Use Tax';
        }
        modify("Tax Jurisdiction Code")
        {
            Caption = 'Tax Jurisdiction Code';
        }
        modify("Sales Tax Connection No.")
        {
            Caption = 'Sales Tax Connection No.';
        }
        modify("Unrealized VAT Entry No.")
        {
            Caption = 'Unrealized VAT Entry No.';
        }
        modify("Ship-to/Order Address Code")
        {
            Caption = 'Ship-to/Order Address Code';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("VAT Registration No.")
        {
            Caption = 'VAT Registration No.';
        }
        modify("Reversed by Entry No.")
        {
            Caption = 'Reversed by Entry No.';
        }
        modify("Reversed Entry No.")
        {
            Caption = 'Reversed Entry No.';
        }
        modify("G/L Acc. No.")
        {
            Caption = 'G/L Account No.';
        }
        modify("Delivery Operation Code")
        {
            Caption = 'Delivery Operation Code';
        }
        modify("No Taxable Type")
        {
            OptionCaption = ' ,Non Taxable Art 7-14 and others,Non Taxable Due To Localization Rules';
        }
        field(50500; "Importe Recuperado"; Decimal)
        {
            Caption = 'Importe Recuperado';
            ToolTip = 'Specifies the value of the Importe Recuperado field.';

            trigger OnValidate()
            begin
                if "Importe Recuperado" <> 0 then begin

                    "% Recuperado" := Round(1 - ("Importe Recuperado" / Amount) * 100, 0.01);

                end;
            end;
        }
        field(50501; "% Recuperado"; Decimal)
        {
            Caption = '% Recuperado';
            ToolTip = 'Specifies the value of the % Recuperado field.';
            MaxValue = 100;
            MinValue = 0;
        }
        field(50502; "IVA Total"; Decimal)
        {
            Caption = 'IVA Total';
            ToolTip = 'Specifies the value of the IVA Total field.';
            CalcFormula = Sum("VAT Entry".Amount WHERE("Document No." = FIELD("Document No."),
                                                        "Document Type" = FIELD("Document Type"),
                                                        "Bill-to/Pay-to No." = FIELD("Bill-to/Pay-to No."),
                                                        "Tax Jurisdiction Code" = CONST('RI')));
            FieldClass = FlowField;
        }
        field(50503; Computable; Boolean)
        {
            Caption = 'Computable';
            ToolTip = 'Specifies the value of the Computable field.';
            CalcFormula = Lookup("Tax Group".Computable WHERE(Code = FIELD("Tax Group Code")));
            FieldClass = FlowField;
        }
        field(50597; "Fecha anulación"; Date)
        {
            Caption = 'Fecha anulación';
            ToolTip = 'Specifies the value of the Fecha anulación field.';
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
            Caption = 'Usuario Anulación';
            ToolTip = 'Specifies the value of the Usuario Anulación field.';
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';
        }
        field(50700; "Tipo de impuesto"; Option)
        {
            Caption = 'Tipo de impuesto';
            ToolTip = 'Specifies the value of the Tipo de impuesto field.';
            Description = 'IVA,IVA no inscripto,IVA percepcion,Ingreso Brutos,otros';
            OptionMembers = IVA,"IVA No Inscripto","IVA Percepcion","Ingreso Brutos";
        }
        field(50701; "Tipo retención"; Code[10])
        {
            Caption = 'Tipo retención';
            ToolTip = 'Specifies the value of the Tipo retención field.';
            Description = 'rel. tabla Códigos retenciones campo tipo retención';
        }
        field(50702; "% exención impuesto"; Decimal)
        {
            Caption = '% exención impuesto';
            ToolTip = 'Specifies the value of the % exención impuesto field.';
        }
        field(50703; "Fecha validación exención"; Date)
        {
            Caption = 'Fecha validación exención';
            ToolTip = 'Specifies the value of the Fecha validación exención field.';
        }
        field(50704; "Cód. retención IVA"; Code[20])
        {
            Caption = 'Cód. retención IVA';
            ToolTip = 'Specifies the value of the Cód. retención IVA field.';
            Description = 'Rel. tabla Códigos retenciones campo codigo cuanto tipo = IVA';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));
        }
        field(50705; "Cód. retención SS"; Code[20])
        {
            Caption = 'Cód. retención SS';
            ToolTip = 'Specifies the value of the Cód. retención SS field.';
            Description = 'Rel. tabla Códigos retenciones campo codigo cuanto tipo = IB';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50706; "Cód. retención ganancias"; Code[20])
        {
            Caption = 'Cód. retención ganancias';
            ToolTip = 'Specifies the value of the Cód. retención ganancias field.';
            Description = 'Rel. tabla Códigos retenciones campo codigo cuanto tipo = GANANCIAS';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50707; Letra; Text[30])
        {
            Caption = 'Letra';
            ToolTip = 'Specifies the value of the Letra field.';
        }
        field(50708; "Punto venta"; Code[10])
        {
            Caption = 'Punto venta';
            ToolTip = 'Specifies the value of the Punto venta field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUNTO VENTA'));
        }
        field(50800; "CIF/NIF"; Text[20])
        {
            Caption = 'VAT Registration No.';
            ToolTip = 'Specifies the value of the VAT Registration No field.';
        }
        field(60000; "Fecha vto."; Date)
        {
            Caption = 'Fecha vto.';
            ToolTip = 'Specifies the value of the Fecha vto field.';
        }
        field(60001; "Fecha registro liquidación"; Date)
        {
            Caption = 'Fecha registro liquidación';
            ToolTip = 'Specifies the value of the Fecha registro liquidación field.';
        }
        field(63000; "Base a pagar"; Decimal)
        {
            Caption = 'Base a pagar';
            ToolTip = 'Specifies the value of the Base a pagar field.';
            AutoFormatType = 1;
        }
        field(63001; "Base pendiente"; Decimal)
        {
            Caption = 'Base pendiente';
            ToolTip = 'Specifies the value of the Base pendiente field.';
            AutoFormatType = 1;
        }
        field(63002; "Cuota a pagar"; Decimal)
        {
            Caption = 'Cuota a pagar';
            ToolTip = 'Specifies the value of the Cuota a pagar field.';
            AutoFormatType = 1;
        }
        field(63003; "Cuota pendiente"; Decimal)
        {
            Caption = 'Cuota pendiente';
            ToolTip = 'Specifies the value of the Cuota pendiente field.';
            AutoFormatType = 1;
        }
        field(65000; "% IVA deducible"; Decimal)
        {
            Caption = '% IVA deducible';
            ToolTip = 'Specifies the value of the % IVA deducible field.';
            Description = 'IVA no deducible';
        }
        field(65001; "% IVA no deducible"; Decimal)
        {
            Caption = '% IVA no deducible';
            ToolTip = 'Specifies the value of the % IVA no deducible field.';
            Description = 'IVA no deducible';
        }
        field(66000; "No. mov. origen"; Integer)
        {
            Caption = 'No. mov. origen';
            ToolTip = 'Specifies the value of the No. mov. origen field.';
        }
        field(70000; "Nombre factura compra"; Text[50])
        {
            Caption = 'Nombre factura compra';
            ToolTip = 'Specifies the value of the Nombre factura compra field.';
            CalcFormula = Lookup("Purch. Inv. Header"."Buy-from Vendor No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(70001; "CIF factura compra"; Text[50])
        {
            Caption = 'CIF factura compra';
            ToolTip = 'Specifies the value of the CIF factura compra field.';
            CalcFormula = Lookup("Purch. Inv. Header"."VAT Registration No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(70002; "Nombre abono compra"; Text[50])
        {
            Caption = 'Nombre abono compra';
            ToolTip = 'Specifies the value of the Nombre abono compra field.';
            CalcFormula = Lookup("Purch. Cr. Memo Hdr."."Buy-from Vendor No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(70003; "CIF abono compra"; Text[50])
        {
            Caption = 'CIF abono compra';
            ToolTip = 'Specifies the value of the CIF abono compra field.';
            CalcFormula = Lookup("Purch. Cr. Memo Hdr."."VAT Registration No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
    }


    //Unsupported feature: Code Modification on "SetGLAccountNo(PROCEDURE 10)".

    //procedure SetGLAccountNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetRange("G/L Acc. No.",'');
    if WithUI then begin
      if not ConfirmManagement.ConfirmProcess(ConfirmAdjustQst,false) then
    #4..12
        GLEntryVATEntryLink.SetRange("VAT Entry No.","Entry No.");
        if GLEntryVATEntryLink.FindFirst then
          if GLEntry.Get(GLEntryVATEntryLink."G/L Entry No.") then begin
            VATEntryEdit.SetGLAccountNo("Entry No.",GLEntry."G/L Account No.");
            if WithUI and GuiAllowed then begin
              Index += 1;
              Window.Update(2,Round(Index / NoOfRecords * 10000,1));
            end;
          end;
      until Next = 0;
    if WithUI and GuiAllowed then
      Window.Close;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..15
    //        VATEntryEdit.SetGLAccountNo("Entry No.",GLEntry."G/L Account No.");
    #17..24
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "ConfirmAdjustQst(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmAdjustQst : ENU=Do you want to fill the G/L Account No. field in VAT entries that are linked to G/L Entries?;ESP=¿Desea rellenar el campo N.º cuenta en los movimientos de IVA vinculados a los movimientos de contabilidad?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmAdjustQst : ENU=Do you want to fill the G/L Account No. field in VAT entries that are linked to G/L Entries?;ESP=?Desea rellenar el campo No. cuenta en los movimientos de IVA vinculados a los movimientos de contabilidad?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AdjustTitleMsg(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //AdjustTitleMsg : ENU=Adjust G/L Account No. in VAT entries.\;ESP=Permite ajustar el número de cuenta en los movimientos de IVA.\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AdjustTitleMsg : ENU=Adjust G/L Account No. in VAT entries.\;ESP=Permite ajustar el número de cuenta en los movimientos de IVA.\;
    //Variable type has not been exported.
}

