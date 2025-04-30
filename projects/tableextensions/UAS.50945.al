tableextension 50945 tableextension50945 extends "Service Contract Template"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 2)".

            Caption = 'Description';
        }
        modify("Invoice Period")
        {
            OptionCaption = 'Month,Two Months,Quarter,Half Year,Year,None';
        }
        modify("Max. Labor Unit Price")
        {
            Caption = 'Max. Labor Unit Price';
        }
        modify("Service Zone Code")
        {
            Caption = 'Service Zone Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("Default Response Time (Hours)")
        {
            Caption = 'Default Response Time (Hours)';
        }
        modify("Contract Lines on Invoice")
        {
            Caption = 'Contract Lines on Invoice';
        }
        modify("Default Service Period")
        {
            Caption = 'Default Service Period';
        }
        modify("Invoice after Service")
        {
            Caption = 'Invoice after Service';
        }
        modify("Contract Group Code")
        {
            Caption = 'Contract Group Code';
        }
        modify("Automatic Credit Memos")
        {
            Caption = 'Automatic Credit Memos';
        }
        modify("Price Inv. Increase Code")
        {
            Caption = 'Price Inv. Increase Code';
        }
        modify("Serv. Contract Acc. Gr. Code")
        {
            Caption = 'Serv. Contract Acc. Gr. Code';
        }
    }

    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.RenameDefaultDim(DATABASE::"Service Contract Template",xRec."No.","No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++ARbu DimMgt.RenameDefaultDim(DATABASE::"Service Contract Template",xRec."No.","No.");
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot checkmark this field because you do not have permissions for the Service Order Management Area.;ESP=No puede activar este campo porque no tiene permisos para el área de Gestión pedido servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot checkmark this field because you do not have permissions for the Service Order Management Area.;ESP=No puede activar este campo porque no tiene permisos para el área de Gestión pedido servicio.;
    //Variable type has not been exported.
}

