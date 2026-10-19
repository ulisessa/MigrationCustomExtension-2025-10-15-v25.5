tableextension 4 "Currency Fields" extends "Currency" //OriginalId
{
    fields
    {
        field(50005; "Pagar s proveedores"; Boolean)
        {
            Caption = 'Pagar s proveedores';
            ToolTip = 'Specifies the value of the Pagar s proveedores field.';

        }
        field(50006; "xTipo Cambio"; Decimal)
        {
            Caption = 'xTipo Cambio';
            ToolTip = 'Specifies the value of the xTipo Cambio field.';

        }
        field(50007; "xTasa Aduanas"; Decimal)
        {
            Caption = 'xTasa Aduanas';
            ToolTip = 'Specifies the value of the xTasa Aduanas field.';

        }
        field(50100; "xPrecisi n Redondeo"; Decimal)
        {
            Caption = 'xPrecisi n Redondeo';
            ToolTip = 'Specifies the value of the xPrecisi n Redondeo field.';

        }
    }
}