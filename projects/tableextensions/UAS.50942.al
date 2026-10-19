tableextension 50942 tableextension50942 extends "Service Contract Header"
{
    fields
    {
        modify("Contract No.")
        {
            Caption = 'Contract No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Salesperson Code")
        {
            Caption = 'Salesperson Code';
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to Customer No.';
        }
        modify("Bill-to Address")
        {
            Caption = 'Bill-to Address';
        }
        modify("Bill-to Address 2")
        {
            Caption = 'Bill-to Address 2';
        }
        modify("Bill-to City")
        {
            Caption = 'Bill-to City';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Ship-to Name")
        {
            Caption = 'Ship-to Name';
        }
        modify("Ship-to Address")
        {
            Caption = 'Ship-to Address';
        }
        modify("Ship-to Address 2")
        {
            Caption = 'Ship-to Address 2';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code';
        }
        modify("Ship-to City")
        {
            Caption = 'Ship-to City';
        }
        modify("Serv. Contract Acc. Gr. Code")
        {
            Caption = 'Serv. Contract Acc. Gr. Code';
        }
        modify("Last Invoice Date")
        {
            Caption = 'Last Invoice Date';
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
        modify("Cancel Reason Code")
        {
            Caption = 'Cancel Reason Code';
        }
        modify("Last Price Update Date")
        {
            Caption = 'Last Price Update Date';
        }
        modify("Last Price Update %")
        {
            Caption = 'Last Price Update %';
        }
        modify("Contract Lines on Invoice")
        {
            Caption = 'Contract Lines on Invoice';
        }
        modify("No. of Posted Invoices")
        {
            Caption = 'No. of Posted Invoices';
        }
        modify("No. of Unposted Invoices")
        {
            Caption = 'No. of Unposted Invoices';
        }
        modify("Payment Terms Code")
        {
            Caption = 'Payment Terms Code';
        }
        modify("Invoice after Service")
        {
            Caption = 'Invoice after Service';
        }
        modify("Contract Group Code")
        {
            Caption = 'Contract Group Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Automatic Credit Memos")
        {
            Caption = 'Automatic Credit Memos';
        }
        modify("Template No.")
        {
            Caption = 'Template No.';
        }
        modify("Price Inv. Increase Code")
        {
            Caption = 'Price Inv. Increase Code';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Fax No.")
        {
            Caption = 'Fax No.';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        modify("Ship-to County")
        {
            Caption = 'Ship-to County';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Bill-to Country/Region Code")
        {
            Caption = 'Bill-to Country/Region Code';
        }
        modify("Ship-to Country/Region Code")
        {
            Caption = 'Ship-to Country/Region Code';
        }
        modify("Ship-to Name 2")
        {
            Caption = 'Ship-to Name 2';
        }
        modify("Contract Gain/Loss Amount")
        {
            Caption = 'Contract Gain/Loss Amount';
        }
        modify("No. of Posted Credit Memos")
        {
            Caption = 'No. of Posted Credit Memos';
        }
        modify("No. of Unposted Credit Memos")
        {
            Caption = 'No. of Unposted Credit Memos';
        }
        modify("Reason Code Filter")
        {
            Caption = 'Reason Code Filter';
        }
        modify("Contact No.")
        {
            Caption = 'Contact No.';
        }
        modify("Bill-to Contact No.")
        {
            Caption = 'Bill-to Contact No.';
        }
        modify("Bill-to Contact")
        {
            Caption = 'Bill-to Contact';
        }
        modify("Last Invoice Period End")
        {
            Caption = 'Last Invoice Period End';
        }

        //Unsupported feature: Code Modification on ""Bill-to Customer No."(Field 16).OnValidate".

        //trigger "(Field 16)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckChangeStatus;
        if xRec."Bill-to Customer No." <> "Bill-to Customer No." then
          if xRec."Bill-to Customer No." <> '' then begin
        #4..36
              "Bill-to Contact" := Cust.Contact;
          end;

          if not HideValidationDialog then
            CustCheckCrLimit.ServiceContractHeaderCheck(Rec);

          CalcFields(
            "Bill-to Name","Bill-to Name 2","Bill-to Address","Bill-to Address 2",
            "Bill-to Post Code","Bill-to City","Bill-to County","Bill-to Country/Region Code");
        #46..54
          DATABASE::"Responsibility Center","Responsibility Center",
          DATABASE::"Service Contract Template","Template No.",
          DATABASE::"Service Order Type","Service Order Type");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..39
          {IF NOT HideValidationDialog THEN
            CustCheckCrLimit.ServiceContractHeaderCheck(Rec);
            }
        #43..57
        */
        //end;


        //Unsupported feature: Code Modification on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
          //++Arbu
          "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
          "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
          "Shortcut Dimension 7 Code"
          //--Arbu
        );
        */
        //end;
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 16)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Change Status" <> "Change Status"::Open then
      exit;

    #4..15

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup."Service Management",
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu

    #19..21
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
      //++Arbu
      "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
      "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
      "Shortcut Dimension 7 Code",
      //--Arbu
      0,0);
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDocDim(PROCEDURE 18)".

    //procedure ShowDocDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2',"Contract Type","Contract No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        "Shortcut Dimension 1 Code"
        //--Arbu
        );
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Do you want to create the contract using a contract template?;ESP=¿Desea crear el contrato utilizando una plantilla contrato?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Do you want to create the contract using a contract template?;ESP=?Desea crear el contrato utilizando una plantilla contrato?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot delete this document. Your identification is set up to process from %1 %2 only.;ESP=No puede borrar este documento. Su identificación está configurada solo para procesar %1 %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot delete this document. Your identification is set up to process from %1 %2 only.;ESP=No puede borrar este documento. Su identificación está configurada solo para procesar %1 %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CancelTheContractQst(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //CancelTheContractQst : @@@=%1: Text008;ENU=%1 It is not possible to change a service contract to its previous status.\\Do you want to cancel the contract?;ESP=%1 No se puede cambiar un contrato de servicio a su estado anterior.\\¿Desea cancelar el contrato?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CancelTheContractQst : @@@=%1: Text008;ENU=%1 It is not possible to change a service contract to its previous status.\\Do you want to cancel the contract?;ESP=%1 No se puede cambiar un contrato de servicio a su estado anterior.\\?Desea cancelar el contrato?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : ENU=Do you want to cancel %1?;ESP=¿Desea cancelar %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : ENU=Do you want to cancel %1?;ESP=?Desea cancelar %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=You cannot change the %1 field manually because there are contract lines for this customer.\\;ESP=No puede modificar el campo %1 manualmente porque existen líneas contrato para este cliente.\\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=You cannot change the %1 field manually because there are contract lines for this customer.\\;ESP=No puede modificar el campo %1 manualmente porque existen líneas contrato para este cliente.\\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text012(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text012 : ENU=To change the customer, use the Change Customer function.;ESP=Para modificar el cliente, utilice la función de Cambiar cliente.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text012 : ENU=To change the customer, use the Change Customer function.;ESP=Para modificar el cliente, utilice la función de Cambiar cliente.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text014(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text014 : ENU=Do you want to change %1?;ESP=¿Confirma que desea cambiar %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text014 : ENU=Do you want to change %1?;ESP=?Confirma que desea cambiar %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text026(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text026 : ENU=%1 must be the first day in the month.;ESP=%1 debe ser el primer día del mes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text026 : ENU=%1 must be the first day in the month.;ESP=%1 debe ser el primer día del mes.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text028(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text028 : ENU=%1 must be the last day in the month.;ESP=%1 debe ser el último día del mes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text028 : ENU=%1 must be the last day in the month.;ESP=%1 debe ser el último día del mes.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text031(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text031 : ENU=You have changed the %1 field.\\The contract lines will not be updated.;ESP=Ha modificado el campo %1.\\No se actualizarán las líns. contrato.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text031 : ENU=You have changed the %1 field.\\The contract lines will not be updated.;ESP=Ha modificado el campo %1.\\No se actualizarán las líns. contrato.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text034(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text034 : ENU=Some of the contract lines have a longer response time than the %1 field on the service contract header. Do you want to update them?;ESP=El tiempo de respuesta de algunas líneas de contrato es superior al especificado en el campo %1 de la cabecera de contrato de servicio. ¿Desea actualizarlos?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text034 : ENU=Some of the contract lines have a longer response time than the %1 field on the service contract header. Do you want to update them?;ESP=El tiempo de respuesta de algunas líneas de contrato es superior al especificado en el campo %1 de la cabecera de contrato de servicio. ?Desea actualizarlos?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text040(Variable 1030)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text040 : ENU=Your identification is set up to process from %1 %2 only.;ESP=Su identificación está configurada para procesar solo desde %1 %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text040 : ENU=Your identification is set up to process from %1 %2 only.;ESP=Su identificación está configurada para procesar solo desde %1 %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text042(Variable 1057)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text042 : ENU=The amounts on the service contract header and service contract lines have not been updated. The value of the %1 field indicates the currency in which the amounts in the sales documents belonging to this contract are calculated. The amounts on the service contract are presented in LCY only.;ESP=No se han actualizado los importes de la cabecera de contrato de servicio ni de las líneas de contrato de servicio. El valor del campo %1 indica la divisa que se usa para calcular los importes en los documentos de ventas relacionados con este contrato. Los importes del contrato de servicio solo se presentan en DL.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text042 : ENU=The amounts on the service contract header and service contract lines have not been updated. The value of the %1 field indicates the currency in which the amounts in the sales documents belonging to this contract are calculated. The amounts on the service contract are presented in LCY only.;ESP=No se han actualizado los importes de la cabecera de contrato de servicio ni de las líneas de contrato de servicio. El valor del campo %1 indica la divisa que se usa para calcular los importes en los documentos de ventas relacionados con este contrato. Los importes del contrato de servicio solo se presentan en DL.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text044(Variable 1067)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text044 : ENU=Contact %1 %2 is not related to customer %3.;ESP=Contacto %1 %2 no está relacionado con el cliente %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text044 : ENU=Contact %1 %2 is not related to customer %3.;ESP=Contacto %1 %2 no está relacionado con el cliente %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text045(Variable 1033)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text045 : ENU=Contact %1 %2 is related to a different company than customer %3.;ESP=Contacto %1 %2 está relacionado con una empresa diferente al cliente %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text045 : ENU=Contact %1 %2 is related to a different company than customer %3.;ESP=Contacto %1 %2 está relacionado con una empresa diferente al cliente %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text048(Variable 1065)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text048 : ENU=There are unposted invoices linked to this contract.\\Do you want to cancel the contract?;ESP=Existen facturas sin registrar relacionadas con este contrato.\\¿Desea cancelar el contrato?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text048 : ENU=There are unposted invoices linked to this contract.\\Do you want to cancel the contract?;ESP=Existen facturas sin registrar relacionadas con este contrato.\\?Desea cancelar el contrato?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text049(Variable 1066)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text049 : ENU=There are unposted credit memos linked to this contract.\\Do you want to cancel the contract?;ESP=Existen abonos sin registrar relacionados con este contrato.\\¿Desea cancelar el contrato?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text049 : ENU=There are unposted credit memos linked to this contract.\\Do you want to cancel the contract?;ESP=Existen abonos sin registrar relacionados con este contrato.\\?Desea cancelar el contrato?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text051(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text051 : ENU=Contact %1 %2 is not related to a customer.;ESP=El contacto %1 %2 no está relacionado con un cliente.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text051 : ENU=Contact %1 %2 is not related to a customer.;ESP=El contacto %1 %2 no está relacionado con un cliente.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text052(Variable 1070)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text052 : ENU=%1 service ledger entries exist for this service contract\Would you like to continue?;ESP=Existen %1 movs. servicio para este contrato servicio\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text052 : ENU=%1 service ledger entries exist for this service contract\Would you like to continue?;ESP=Existen %1 movs. servicio para este contrato servicio\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text053(Variable 1071)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text053 : ENU=The deletion process has been interrupted.;ESP=Se ha interrumpido el proceso de eliminación.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text053 : ENU=The deletion process has been interrupted.;ESP=Se ha interrumpido el proceso de eliminación.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text054(Variable 1076)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text054 : ENU=You cannot checkmark this field because you do not have permissions for the Service Order Management Area.;ESP=No puede activar este campo porque no tiene permisos para el área de Gestión pedido servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text054 : ENU=You cannot checkmark this field because you do not have permissions for the Service Order Management Area.;ESP=No puede activar este campo porque no tiene permisos para el área de Gestión pedido servicio.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text055(Variable 1079)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text055 : ENU=There are unposted invoices and credit memos linked to this contract.\\Do you want to cancel the contract?;ESP=Existen facturas y abonos sin registrar relacionados con este contrato.\\¿Desea cancelar el contrato?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text055 : ENU=There are unposted invoices and credit memos linked to this contract.\\Do you want to cancel the contract?;ESP=Existen facturas y abonos sin registrar relacionados con este contrato.\\?Desea cancelar el contrato?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text056(Variable 1080)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text056 : ENU=The contract expiration dates on the service contract lines that are later than %1 on the %2 will be replaced with %3.\Do you want to continue?;ESP=Las fechas de fin del contrato en las líneas contrato servicio son posteriores que %1 en el %2 será reemplazado con %3.\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text056 : ENU=The contract expiration dates on the service contract lines that are later than %1 on the %2 will be replaced with %3.\Do you want to continue?;ESP=Las fechas de fin del contrato en las líneas contrato servicio son posteriores que %1 en el %2 será reemplazado con %3.\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text057(Variable 1081)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text057 : ENU=You cannot select both the %1 and the %2 check boxes.;ESP=No puede seleccionar las casillas de verificación de %1 y de %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text057 : ENU=You cannot select both the %1 and the %2 check boxes.;ESP=No puede seleccionar las casillas de verificación de %1 y de %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text058(Variable 1026)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text058 : ENU=You cannot use the Distribution functionality if there are no contract lines in the service contract.;ESP=No puede utilizar la funcionalidad de Distribución si no existen líneas contrato en el contrato servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text058 : ENU=You cannot use the Distribution functionality if there are no contract lines in the service contract.;ESP=No puede utilizar la funcionalidad de Distribución si no existen líneas contrato en el contrato servicio.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text059(Variable 1082)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text059 : ENU=You cannot use the Distribution Based on Profit option if the sum of values in the Profit field on the contract lines equals to zero.;ESP=No puede utilizar la opción de Distribución basada en Bº si las suma de los valores del campo Beneficio de las líneas contrato es cero.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text059 : ENU=You cannot use the Distribution Based on Profit option if the sum of values in the Profit field on the contract lines equals to zero.;ESP=No puede utilizar la opción de Distribución basada en B? si las suma de los valores del campo Beneficio de las líneas contrato es cero.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text060(Variable 1083)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text060 : ENU=You cannot use the Distribution Based on Line Amount option if the sum of values in the Line Amount field on the contract lines equals to zero.;ESP=No puede utilizar la opción de Distribución basada en Importe línea si la suma de los valores del campo Importe línea en las líneas contrato es cero.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text060 : ENU=You cannot use the Distribution Based on Line Amount option if the sum of values in the Line Amount field on the contract lines equals to zero.;ESP=No puede utilizar la opción de Distribución basada en Importe línea si la suma de los valores del campo Importe línea en las líneas contrato es cero.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text061(Variable 1084)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text061 : ENU=The annual amount difference has been distributed and one or more contract lines have zero or less in the %1 fields.\You can enter an amount in the %1 field.;ESP=Se ha distribuido el importe anual y una o más líneas contrato tienen cero o menos en los campos %1.\Puede introducir un importe en el campo %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text061 : ENU=The annual amount difference has been distributed and one or more contract lines have zero or less in the %1 fields.\You can enter an amount in the %1 field.;ESP=Se ha distribuido el importe anual y una o más líneas contrato tienen cero o menos en los campos %1.\Puede introducir un importe en el campo %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text062(Variable 1085)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text062 : ENU=Some lines containing service items have been added to one or more contracts\while the quote had the %1 %2.\Do you want to see these lines?;ESP=Se han añadido algunas líneas con prods. servici a uno o más contratos\mientras que la oferta tenía el %1 %2.\¿Desea ver estas líneas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text062 : ENU=Some lines containing service items have been added to one or more contracts\while the quote had the %1 %2.\Do you want to see these lines?;ESP=Se han añadido algunas líneas con prods. servici a uno o más contratos\mientras que la oferta ten?a el %1 %2.\?Desea ver estas líneas?;
    //Variable type has not been exported.
}

