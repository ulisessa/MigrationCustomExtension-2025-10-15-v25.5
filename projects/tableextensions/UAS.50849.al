tableextension 50849 tableextension50849 extends "Whse. Cross-Dock Opportunity"
{
    Caption = 'Whse. Cross-Dock Opportunity';
    fields
    {
        modify("Source Name/No.")
        {
            Caption = 'Source Name/No.';
        }
        modify("Source Line No.")
        {
            Caption = 'Source Line No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("From Source No.")
        {
            Caption = 'From Source No.';
        }
        modify("From Source Line No.")
        {
            Caption = 'From Source Line No.';
        }
        modify("From Source Subline No.")
        {
            Caption = 'From Source Subline No.';
        }
        modify("To Source No.")
        {
            Caption = 'To Source No.';
        }
        modify("To Source Line No.")
        {
            Caption = 'To Source Line No.';
        }
        modify("To Source Subline No.")
        {
            Caption = 'To Source Subline No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Qty. to Cross-Dock")
        {
            Caption = 'Qty. to Cross-Dock';
        }
        modify("Qty. to Cross-Dock (Base)")
        {
            Caption = 'Qty. to Cross-Dock (Base)';
        }
        modify("Qty. Cross-Docked (Base)")
        {
            Caption = 'Qty. Cross-Docked (Base)';
        }
        modify("To-Src. Unit of Measure Code")
        {
            Caption = 'To-Src. Unit of Measure Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CrossDockQtyExceedsReceiptQtyErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CrossDockQtyExceedsReceiptQtyErr : ENU=The sum of the Qty. to Cross-Dock and Qty. Cross-Docked (Base) fields must not exceed the value in the Qty. to Receive field on the warehouse receipt line.;ESP=La suma de los campos Cant. a tránsito directo y Cant. tránsito directo (base) no debe superar el valor en el campo Cantidad a recibir en la línea de recepción de almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CrossDockQtyExceedsReceiptQtyErr : ENU=The sum of the Qty. to Cross-Dock and Qty. Cross-Docked (Base) fields must not exceed the value in the Qty. to Receive field on the warehouse receipt line.;ESP=La suma de los campos Cant. a tránsito directo y Cant. tránsito directo (base) no debe superar el valor en el campo Cantidad a recibir en la línea de recepción de almacén.;
    //Variable type has not been exported.
}

