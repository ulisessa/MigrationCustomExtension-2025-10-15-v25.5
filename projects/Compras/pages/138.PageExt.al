pageextension 138 "Posted Invoice Header for Arbu" extends "Posted Purchase Invoice" //OriginalId
{
    layout
    {
        addbefore("Invoice Details")
        {
            group("Grupo Arbumasa")
            {
                field("Shortcut Dimension 3 Code"; rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Dimensions;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                    ToolTip = 'Specifies the code for Shortcut Dimension 3, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 4 Code"; rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Dimensions;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                    ToolTip = 'Specifies the code for Shortcut Dimension 4, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 5 Code"; rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Dimensions;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                    ToolTip = 'Specifies the code for Shortcut Dimension 5, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 6 Code"; rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = Dimensions;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                    ToolTip = 'Specifies the code for Shortcut Dimension 6, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 7 Code"; rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = Dimensions;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                    ToolTip = 'Specifies the code for Shortcut Dimension 7, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Concepto proyecto"; rec."Concepto proyecto")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Fecha Embarque"; rec."Fecha Embarque")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Carpeta de Importación"; rec."Carpeta de Importación")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Lugar de Pago"; rec."Lugar de Pago")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Payment block"; rec."Payment block")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Payment blocked by"; rec."Payment blocked by")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field(Usuario; rec.Usuario)
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Cód. confirmación compra prov."; rec."Cód. confirmación compra prov.")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("No. Despacho Importación"; rec."No. Despacho Importación")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Fecha Oficialización"; rec."Fecha Oficialización")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Winnings retention code"; Rec."Winnings retention code")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Old Job No."; Rec."Old Job No.")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Importe provisión (DL)"; Rec."Importe provisión (DL)")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Fecha recepción fra."; Rec."Fecha recepción fra.")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("No. Remito"; Rec."No. Remito")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Archivo vinculado"; Rec."Archivo vinculado")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Departamento de pago"; Rec."Departamento de pago")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("CAI-CAE"; Rec."CAI-CAE")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Tipo documento AFIP"; Rec."Tipo documento AFIP")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Fecha último seguimiento"; Rec."Fecha último seguimiento")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Solicitud vinculada"; Rec."Solicitud vinculada")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Importe segun solicitud"; Rec."Importe segun solicitud")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("AFIP currency code"; Rec."AFIP currency code")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Current security group"; Rec."Current security group")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Tipo documento mensajeria"; Rec."Tipo documento mensajeria")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field(Estado; Rec.Estado)
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Tipo fiscal"; Rec."Tipo fiscal")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field(Province; Rec.Province)
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
                field("Tipo factura"; Rec."Tipo factura")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                    Editable = true;
                    Description = 'Arbu Fields';
                }
            }
        }
    }
}
