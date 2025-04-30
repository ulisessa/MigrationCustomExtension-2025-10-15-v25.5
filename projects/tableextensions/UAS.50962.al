tableextension 50962 tableextension50962 extends "Document Sending Profile"
{
    Caption = 'Document Sending Profile';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify(Printer)
        {
            OptionCaption = 'No,Yes (Prompt for Settings),Yes (Use Default Settings)';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
            OptionCaption = 'No,Yes (Prompt for Settings),Yes (Use Default Settings)';
        }
        modify("E-Mail Attachment")
        {
            Caption = 'Email Attachment';
        }
        modify("E-Mail Format")
        {
            Caption = 'Email Format';
        }
        modify("Electronic Document")
        {
            Caption = 'Electronic Document';
        }
        modify("Electronic Format")
        {
            Caption = 'Electronic Format';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "UpdateAssCustomerQst(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateAssCustomerQst : ENU=If you delete document sending profile %1, it will also be deleted on customer cards that use the profile.\\Do you want to continue?;ESP=Si elimina el perfil de envío de documento %1, también se eliminará en las fichas de cliente que usen el perfil.\\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateAssCustomerQst : ENU=If you delete document sending profile %1, it will also be deleted on customer cards that use the profile.\\Do you want to continue?;ESP=Si elimina el perfil de envío de documento %1, tambión se eliminará en las fichas de cliente que usen el perfil.\\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteErr(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteErr : ENU=Cannot delete the document sending profile.;ESP=No se puede eliminar el perfil de envío de documentos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteErr : ENU=Cannot delete the document sending profile.;ESP=No se puede eliminar el perfil de envío de documentos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotSendMultipleSalesDocsErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotSendMultipleSalesDocsErr : ENU=You can only send one electronic sales document at a time.;ESP=Solo puede enviar un documento de venta electrónico a la vez.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotSendMultipleSalesDocsErr : ENU=You can only send one electronic sales document at a time.;ESP=Solo puede enviar un documento de venta electrónico a la vez.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ShipmentsTxt(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //ShipmentsTxt : ENU=Shipments;ESP=Envíos;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShipmentsTxt : ENU=Shipments;ESP=Envíos;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ProfileSelectionQst(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //ProfileSelectionQst : @@@=Translation should contain comma separators between variants as ENU value does. No other commas should be there.;ENU=Confirm the first profile and use it for all selected documents.,Confirm the profile for each document.,Use the default profile for all selected documents without confimation.;ESP=Confirmar el primer perfil y usarlo para todos los documentos seleccionados.,Confirmar el perfil para cada documento.,Usar el perfil predeterminado para todos los documentos seleccionados sin requerir confirmación.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ProfileSelectionQst : @@@=Translation should contain comma separators between variants as ENU value does. No other commas should be there.;ENU=Confirm the first profile and use it for all selected documents.,Confirm the profile for each document.,Use the default profile for all selected documents without confimation.;ESP=Confirmar el primer perfil y usarlo para todos los documentos seleccionados.,Confirmar el perfil para cada documento.,Usar el perfil predeterminado para todos los documentos seleccionados sin requerir confirmación.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CustomerProfileSelectionInstrTxt(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //CustomerProfileSelectionInstrTxt : ENU="Customers on the selected documents might use different document sending profiles. Choose one of the following options: ";ESP="Los clientes de los documentos seleccionados pueden usar diferentes perfiles de envío de documentos. Elija una de las siguientes opciones: ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CustomerProfileSelectionInstrTxt : ENU="Customers on the selected documents might use different document sending profiles. Choose one of the following options: ";ESP="Los clientes de los documentos seleccionados pueden usar diferentes perfiles de envío de documentos. Elija una de las siguientes opciones: ";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "VendorProfileSelectionInstrTxt(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //VendorProfileSelectionInstrTxt : ENU="Vendors on the selected documents might use different document sending profiles. Choose one of the following options: ";ESP="Los proveedores de los documentos seleccionados pueden usar diferentes perfiles de envío de documentos. Elija una de las siguientes opciones: ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //VendorProfileSelectionInstrTxt : ENU="Vendors on the selected documents might use different document sending profiles. Choose one of the following options: ";ESP="Los proveedores de los documentos seleccionados pueden usar diferentes perfiles de envío de documentos. Elija una de las siguientes opciones: ";
    //Variable type has not been exported.
}

