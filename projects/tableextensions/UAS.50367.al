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

            trigger OnValidate()
            begin
                if "Importe Recuperado" <> 0 then begin

                    "% Recuperado" := Round(1 - ("Importe Recuperado" / Amount) * 100, 0.01);

                end;
            end;
        }
        field(50501; "% Recuperado"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(50502; "IVA Total"; Decimal)
        {
            CalcFormula = Sum("VAT Entry".Amount WHERE("Document No." = FIELD("Document No."),
                                                        "Document Type" = FIELD("Document Type"),
                                                        "Bill-to/Pay-to No." = FIELD("Bill-to/Pay-to No."),
                                                        "Tax Jurisdiction Code" = CONST('RI')));
            FieldClass = FlowField;
        }
        field(50503; Computable; Boolean)
        {
            CalcFormula = Lookup("Tax Group".Computable WHERE(Code = FIELD("Tax Group Code")));
            FieldClass = FlowField;
        }
        field(50597; "Fecha anulación"; Date)
        {
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {
        }
        field(50700; "Tipo de impuesto"; Option)
        {
            Description = 'IVA,IVA no inscripto,IVA percepcion,Ingreso Brutos,otros';
            OptionMembers = IVA,"IVA No Inscripto","IVA Percepcion","Ingreso Brutos";
        }
        field(50701; "Tipo retención"; Code[10])
        {
            Description = 'rel. tabla Códigos retenciones campo tipo retención';
        }
        field(50702; "% exención impuesto"; Decimal)
        {
        }
        field(50703; "Fecha validación exención"; Date)
        {
        }
        field(50704; "Cód. retención IVA"; Code[20])
        {
            Description = 'Rel. tabla Códigos retenciones campo codigo cuanto tipo = IVA';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));
        }
        field(50705; "Cód. retención SS"; Code[20])
        {
            Description = 'Rel. tabla Códigos retenciones campo codigo cuanto tipo = IB';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50706; "Cód. retención ganancias"; Code[20])
        {
            Description = 'Rel. tabla Códigos retenciones campo codigo cuanto tipo = GANANCIAS';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50707; Letra; Text[30])
        {
        }
        field(50708; "Punto venta"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUNTO VENTA'));
        }
        field(50800; "CIF/NIF"; Text[20])
        {
            Caption = 'CUIT';
        }
        field(60000; "Fecha vto."; Date)
        {
        }
        field(60001; "Fecha registro liquidación"; Date)
        {
        }
        field(63000; "Base a pagar"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(63001; "Base pendiente"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(63002; "Cuota a pagar"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(63003; "Cuota pendiente"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(65000; "% IVA deducible"; Decimal)
        {
            Description = 'IVA no deducible';
        }
        field(65001; "% IVA no deducible"; Decimal)
        {
            Description = 'IVA no deducible';
        }
        field(66000; "No. mov. origen"; Integer)
        {
        }
        field(70000; "Nombre factura compra"; Text[50])
        {
            CalcFormula = Lookup("Purch. Inv. Header"."Buy-from Vendor No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(70001; "CIF factura compra"; Text[50])
        {
            CalcFormula = Lookup("Purch. Inv. Header"."VAT Registration No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(70002; "Nombre abono compra"; Text[50])
        {
            CalcFormula = Lookup("Purch. Cr. Memo Hdr."."Buy-from Vendor No." WHERE("No." = FIELD("Document No.")));
            FieldClass = FlowField;
        }
        field(70003; "CIF abono compra"; Text[50])
        {
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

