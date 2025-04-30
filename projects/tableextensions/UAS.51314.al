tableextension 51314 tableextension51314 extends "Item Vendor"
{
    fields
    {
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Lead Time Calculation")
        {
            Caption = 'Lead Time Calculation';
        }
        modify("Vendor Item No.")
        {
            Caption = 'Vendor Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        field(60000; "Nombre proveedor"; Text[100])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Vendor No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60001; "Nombre producto"; Text[250])
        {
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Item No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }


    //Unsupported feature: Code Modification on "InsertItemCrossReference(PROCEDURE 1)".

    //procedure InsertItemCrossReference();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ItemCrossReference.WritePermission then
      if ("Vendor No." <> '') and ("Item No." <> '') then
        DistIntegration.InsertItemCrossReference(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {IF ItemCrossReference.WRITEPERMISSION THEN
      IF ("Vendor No." <> '') AND ("Item No." <> '') THEN
        DistIntegration.InsertItemCrossReference(Rec);
        }
    */
    //end;
}

