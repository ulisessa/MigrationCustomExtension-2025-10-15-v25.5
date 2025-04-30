page 50160 "Purchase invoice lines"
{
    Caption = 'Líneas factura compra';
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Purch. Inv. Line";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.")
                {
                }
                field("Line No."; "Line No.")
                {
                }
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Buy-from Vendor No."; "Buy-from Vendor No.")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Posting Group"; "Posting Group")
                {
                }
                field("Expected Receipt Date"; "Expected Receipt Date")
                {
                }
                field(Description; Description)
                {
                }
                field("Description 2"; "Description 2")
                {
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                }
                field(Quantity; Quantity)
                {
                }
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                }
                field("VAT %"; "VAT %")
                {
                }
                field(Amount; Amount)
                {
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                }
                field("Unit Price (LCY)"; "Unit Price (LCY)")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Job No."; "Job No.")
                {
                }
                field("Receipt No."; "Receipt No.")
                {
                }
                field("Receipt Line No."; "Receipt Line No.")
                {
                }
                field("Pay-to Vendor No."; "Pay-to Vendor No.")
                {
                }
                field("Inv. Discount Amount"; "Inv. Discount Amount")
                {
                }
                field("Vendor Item No."; "Vendor Item No.")
                {
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                }
                field("VAT Calculation Type"; "VAT Calculation Type")
                {
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Transport Method"; "Transport Method")
                {
                }
                field("Attached to Line No."; "Attached to Line No.")
                {
                }
                field("Entry Point"; "Entry Point")
                {
                }
                field("Area"; Area)
                {
                }
                field("Transaction Specification"; "Transaction Specification")
                {
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                }
                field("Tax Liable"; "Tax Liable")
                {
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                }
                field("Use Tax"; "Use Tax")
                {
                }
                field("VAT Base Amount"; "VAT Base Amount")
                {
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("System-Created Entry"; "System-Created Entry")
                {
                }
                field("Line Amount"; "Line Amount")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                }
                field("Shortcut Dimension 6 Code"; "Shortcut Dimension 6 Code")
                {
                }
                field("Shortcut Dimension 7 Code"; "Shortcut Dimension 7 Code")
                {
                }
                field("Concepto proyecto"; "Concepto proyecto")
                {
                }
                field("No. Cab. Solicitud"; "No. Cab. Solicitud")
                {
                }
                field("No. Linea Solicitud"; "No. Linea Solicitud")
                {
                }
                field("No. Documento Compra"; "No. Documento Compra")
                {
                }
                field("No. Linea Documento Compra"; "No. Linea Documento Compra")
                {
                }
                field("Plazo a Transferir"; "Plazo a Transferir")
                {
                }
                field("No. Oferta"; "No. Oferta")
                {
                }
                field("No. Linea Oferta"; "No. Linea Oferta")
                {
                }
                field("Cód. arancelario"; "Cód. arancelario")
                {
                }
                field(Usuario; Usuario)
                {
                }
                field("Carpeta de Importación"; "Carpeta de Importación")
                {
                }
                field(Flete; Flete)
                {
                }
                field("Fecha recepción proveedor"; "Fecha recepción proveedor")
                {
                }
                field("Actividad AFIP"; "Actividad AFIP")
                {
                }
                field("Descripción cód. arancelario"; "Descripción cód. arancelario")
                {
                }
                field("Consumir automáticamente"; "Consumir automáticamente")
                {
                }
                field("Cód. retención IVA"; "Cód. retención IVA")
                {
                }
                field("Importe DA"; "Importe DA")
                {
                }
                field("Importe DL"; "Importe DL")
                {
                }
                field("Cód. retención SS"; "Cód. retención SS")
                {
                }
                field("Cód. retención ganancias"; "Cód. retención ganancias")
                {
                }
                field(Provincia; Provincia)
                {
                }
                field("No. Despacho"; "No. Despacho")
                {
                }
            }
        }
    }

    actions
    {
    }
}

