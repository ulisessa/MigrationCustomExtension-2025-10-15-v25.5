page 50688 "Lista líneas pedido compra"
{
    Editable = false;
    PageType = List;
    SourceTable = "Purchase Line";
    SourceTableView = SORTING("Document Type", Type, "Document No.", "Buy-from Vendor No.", "No.")
                      WHERE("Document Type" = CONST(Order),
                            Type = FILTER(Item | "G/L Account"));
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No. Cab. Solicitud"; "No. Cab. Solicitud")
                {
                }
                field("No. Linea Solicitud"; "No. Linea Solicitud")
                {
                }
                field("No. Documento Compra"; "No. Documento Compra")
                {
                }
                field(Usuario; Usuario)
                {
                }
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Receipt No."; "Receipt No.")
                {
                }
                field("Receipt Line No."; "Receipt Line No.")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Quantity Received"; "Quantity Received")
                {
                }
                field("Outstanding Quantity"; "Outstanding Quantity")
                {
                }
                field("Document No."; "Document No.")
                {
                }
                field("Expected Receipt Date"; "Expected Receipt Date")
                {
                }
                field("Plazo a Transferir"; "Plazo a Transferir")
                {
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Buy-from Vendor No."; "Buy-from Vendor No.")
                {
                }
                field("Nombre proveedor"; "Nombre proveedor")
                {
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                }
                field("Currency Code"; "Currency Code")
                {
                }
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                }
            }
            group(Control34)
            {
                ShowCaption = false;
                label(Control37)
                {
                    CaptionClass = Text19049684;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                label(Control38)
                {
                    CaptionClass = Text19053527;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("TotalesCantidad[1]"; TotalesCantidad[1])
                {
                    Caption = 'Totales';
                    Editable = false;
                }
                label(Control39)
                {
                    CaptionClass = Text19041164;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("TotalesCantidad[2]"; TotalesCantidad[2])
                {
                    Editable = false;
                }
                label(Control42)
                {
                    CaptionClass = Text19001678;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("TotalesCantidad[3]"; TotalesCantidad[3])
                {
                    Editable = false;
                }
                label(Control40)
                {
                    CaptionClass = Text19040112;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("TotalesImporte[1]"; TotalesImporte[1])
                {
                    Editable = false;
                }
                label(Control41)
                {
                    CaptionClass = Text19036001;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("TotalesImporte[2]"; TotalesImporte[2])
                {
                    Editable = false;
                }
                field("TotalesImporte[3]"; TotalesImporte[3])
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Calcular Totales")
            {
                Caption = 'Calcular Totales';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    CalculaTotales;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        LimpiaTotales;
    end;

    var
        TotalesCantidad: array[3] of Decimal;
        TotalesImporte: array[3] of Decimal;
        Text19049684: Label 'Cant. Pedida';
        Text19053527: Label 'Cant. Servida';
        Text19041164: Label 'Cant. Pendiente';
        Text19001678: Label 'Imp. Pedido';
        Text19040112: Label 'Imp. Servido';
        Text19036001: Label 'Imp. Pendiente';

    [Scope('OnPrem')]
    procedure CalculaTotales()
    var
        LinCompra: Record "Purchase Line";
    begin
        LinCompra.Reset;
        LinCompra.SetCurrentKey("Document Type", Type, "Document No.", "Buy-from Vendor No.", "No.");
        LinCompra.CopyFilters(Rec);

        LimpiaTotales;

        if LinCompra.Find('-') then
            repeat
                TotalesCantidad[1] := TotalesCantidad[1] + LinCompra.Quantity;
                TotalesCantidad[2] := TotalesCantidad[2] + LinCompra."Quantity Received";
                TotalesCantidad[3] := TotalesCantidad[3] + LinCompra."Outstanding Quantity";
                TotalesImporte[1] := TotalesImporte[1] + LinCompra.Quantity * LinCompra."Direct Unit Cost";
                TotalesImporte[2] := TotalesImporte[2] + LinCompra."Quantity Received" * LinCompra."Direct Unit Cost";
                TotalesImporte[3] := TotalesImporte[3] + LinCompra."Outstanding Quantity" * LinCompra."Direct Unit Cost";
            until LinCompra.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure LimpiaTotales()
    begin
        Clear(TotalesCantidad);
        Clear(TotalesImporte);
    end;
}

