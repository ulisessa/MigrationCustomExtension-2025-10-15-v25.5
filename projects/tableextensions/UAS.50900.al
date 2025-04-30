tableextension 50900 tableextension50900 extends "Service Item Line"
{
    Caption = 'Service Item Line';
    fields
    {
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Service Item No.")
        {
            Caption = 'Service Item No.';
        }
        modify("Service Item Group Code")
        {
            Caption = 'Service Item Group Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Serial No.")
        {
            Caption = 'Serial No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Repair Status Code")
        {
            Caption = 'Repair Status Code';
        }
        modify("Finishing Date")
        {
            Caption = 'Finishing Date';
        }
        modify("Finishing Time")
        {
            Caption = 'Finishing Time';
        }
        modify("Service Shelf No.")
        {
            Caption = 'Service Shelf No.';
        }
        modify("Warranty Starting Date (Parts)")
        {
            Caption = 'Warranty Starting Date (Parts)';
        }
        modify("Warranty Ending Date (Parts)")
        {
            Caption = 'Warranty Ending Date (Parts)';
        }
        modify(Warranty)
        {
            Caption = 'Warranty';
        }
        modify("Warranty % (Parts)")
        {
            Caption = 'Warranty % (Parts)';
        }
        modify("Warranty % (Labor)")
        {
            Caption = 'Warranty % (Labor)';
        }
        modify("Warranty Starting Date (Labor)")
        {
            Caption = 'Warranty Starting Date (Labor)';
        }
        modify("Warranty Ending Date (Labor)")
        {
            Caption = 'Warranty Ending Date (Labor)';
        }
        modify("Contract No.")
        {
            Caption = 'Contract No.';
        }
        modify("Location of Service Item")
        {
            Caption = 'Location of Service Item';
        }
        modify("Loaner No.")
        {
            Caption = 'Loaner No.';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Vendor Item No.")
        {
            Caption = 'Vendor Item No.';
        }
        modify("Fault Reason Code")
        {
            Caption = 'Fault Reason Code';
        }
        modify("Service Price Group Code")
        {
            Caption = 'Service Price Group Code';
        }
        modify("Fault Area Code")
        {
            Caption = 'Fault Area Code';
        }
        modify("Symptom Code")
        {
            Caption = 'Symptom Code';
        }
        modify("Fault Code")
        {
            Caption = 'Fault Code';
        }
        modify("Resolution Code")
        {
            Caption = 'Resolution Code';
        }
        modify("Resolution Comment")
        {
            Caption = 'Resolution Comment';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Serv. Price Adjmt. Gr. Code")
        {
            Caption = 'Serv. Price Adjmt. Gr. Code';
        }
        modify("Adjustment Type")
        {
            OptionCaption = 'Fixed,Maximum,Minimum';
        }
        modify("No. of Active/Finished Allocs")
        {
            Caption = 'No. of Active/Finished Allocs';
        }
        modify("No. of Allocations")
        {
            Caption = 'No. of Allocations';
        }
        modify("No. of Previous Services")
        {
            Caption = 'No. of Previous Services';
        }
        modify("Contract Line No.")
        {
            Caption = 'Contract Line No.';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Allocation Date Filter")
        {
            Caption = 'Allocation Date Filter';
        }
        modify("Repair Status Code Filter")
        {
            Caption = 'Repair Status Code Filter';
        }
        modify("Allocation Status Filter")
        {
            Caption = 'Allocation Status Filter';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }

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
        //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "CalculateResponseDateTime(PROCEDURE 1)".

    //procedure CalculateResponseDateTime();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ServMgtSetup.Get;
    ServMgtSetup.TestField("Base Calendar Code");
    CalendarCustomized :=
    #4..20
    if not ServHour.FindFirst then begin
      WholeResponseDays := HoursLeft div 24;
      HoursOnLastDay := HoursLeft - WholeResponseDays * 24;
      if CalendarMgmt.CalcTimeDelta(OrderTime,000000T) / 3600000 + HoursOnLastDay >= 24 then begin
        WholeResponseDays := WholeResponseDays + 1;
        HoursOnLastDay := HoursOnLastDay - 24;
      end;
      "Response Date" := OrderDate + WholeResponseDays;
      "Response Time" := OrderTime + HoursOnLastDay * 3600000;
      exit;
    end;
    #32..60
              else
                StartingTime := ServHour."Starting Time";

              if HoursLeft > CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",StartingTime) then begin
                TotTime := TotTime + CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",StartingTime);
                HoursOnLastDay := CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",StartingTime);
              end else begin
                TotTime := TotTime + HoursLeft;
                HoursOnLastDay := HoursLeft;
              end;
            end;
          end else begin
            if ServHour."Starting Time" = 0T then begin
              if ("Contract No." <> '') and ContractServHourExist then begin
    #75..137
              ;
            end;

            if HoursLeft > CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",ServHour."Starting Time") then begin
              TotTime := TotTime + CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",ServHour."Starting Time");
              HoursOnLastDay := CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",ServHour."Starting Time");
            end else begin
              TotTime := TotTime + HoursLeft;
              HoursOnLastDay := HoursLeft;
            end;
          end;
          if LastTotTime < TotTime then begin
            HoursLeft := HoursLeft - (TotTime - LastTotTime);
            LastTotTime := TotTime;
    #152..166
      "Response Date" := OrderDate;
      "Response Time" := OrderTime;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..23
    {  IF CalendarMgmt.CalcTimeDelta(OrderTime,000000T) / 3600000 + HoursOnLastDay >= 24 THEN BEGIN
        WholeResponseDays := WholeResponseDays + 1;
        HoursOnLastDay := HoursOnLastDay - 24;
      END;
     } "Response Date" := OrderDate + WholeResponseDays;
    #29..63
    {          IF HoursLeft > CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",StartingTime) THEN BEGIN
                TotTime := TotTime + CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",StartingTime);
                HoursOnLastDay := CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",StartingTime);
              END ELSE BEGIN
                TotTime := TotTime + HoursLeft;
                HoursOnLastDay := HoursLeft;
              END;
     }       end;
    #72..140
            {IF HoursLeft > CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",ServHour."Starting Time") THEN BEGIN
              TotTime := TotTime + CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",ServHour."Starting Time");
              HoursOnLastDay := CalendarMgmt.CalcTimeDelta(ServHour."Ending Time",ServHour."Starting Time");
            END ELSE BEGIN
              TotTime := TotTime + HoursLeft;
              HoursOnLastDay := HoursLeft;
            END;
          }end;
    #149..169
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 26)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;

    if "Document No." = '' then
    #4..13

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';

    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup."Service Management",
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",ServHeader."Dimension Set ID",DATABASE::"Service Header");
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..16
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu
    #17..20
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code",
        //--Arbu
        ServHeader."Dimension Set ID",DATABASE::"Service Header");
    //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 25)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";

    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',"Document Type","Document No.","Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

    if OldDimSetID <> "Dimension Set ID" then begin
      Modify;
      if ServLineExists then
        UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
        );
    #7..12
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateAllLineDim(PROCEDURE 41)".

    //procedure UpdateAllLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Update all lines with changed dimensions.

    if NewParentDimSetID = OldParentDimSetID then
    #4..14
        if ServLine."Dimension Set ID" <> NewDimSetID then begin
          ServLine."Dimension Set ID" := NewDimSetID;
          DimMgt.UpdateGlobalDimFromDimSetID(
            ServLine."Dimension Set ID",ServLine."Shortcut Dimension 1 Code",ServLine."Shortcut Dimension 2 Code");
          ServLine.Modify;
        end;
      until ServLine.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..17
            ServLine."Dimension Set ID",ServLine."Shortcut Dimension 1 Code",ServLine."Shortcut Dimension 2 Code",
            //++Arbu
            ServLine."Shortcut Dimension 1 Code",ServLine."Shortcut Dimension 1 Code",
            ServLine."Shortcut Dimension 1 Code",ServLine."Shortcut Dimension 1 Code",
            ServLine."Shortcut Dimension 1 Code"
            //--Arbu
            );
    #19..21
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=You have changed one of the fault reporting codes on the %1, but it has not been changed on the existing service lines. You must update the existing service lines manually.;ESP=Ha cambiado uno de los códigos de informe de defectos en %1, pero el mismo no se cambió en las líneas de servicio existentes. Debe actualizar manualmente las líneas de servicio existentes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=You have changed one of the fault reporting codes on the %1, but it has not been changed on the existing service lines. You must update the existing service lines manually.;ESP=Ha cambiado uno de los Códigos de informe de defectos en %1, pero el mismo no se cambió en las líneas de servicio existentes. Debe actualizar manualmente las líneas de servicio existentes.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=You cannot delete %1 %2,%3, because %4 is attached to it.;ESP=No puede eliminar %1 %2,%3, porque %4 está anexado a él.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=You cannot delete %1 %2,%3, because %4 is attached to it.;ESP=No puede eliminar %1 %2,%3, porque %4 está anexado a él.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=You cannot change the %1 on the %2, because %3 is attached to it.;ESP=No puede eliminar el %1 en el %2, porque %3 está anexado a él.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=You cannot change the %1 on the %2, because %3 is attached to it.;ESP=No puede eliminar el %1 en el %2, porque %3 está anexado a él.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text016(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text016 : ENU=You cannot change the %1 field because it is linked to the %2 specified on the line.;ESP=No puede modificar el campo %1 porque está relacionado con el %2 especificado en la línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text016 : ENU=You cannot change the %1 field because it is linked to the %2 specified on the line.;ESP=No puede modificar el campo %1 porque está relacionado con el %2 especificado en la línea.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text023(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text023 : ENU=You cannot change the warranty information because %1 is selected.;ESP=No puede modificar la información sobre garantía porque está seleccionado %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text023 : ENU=You cannot change the warranty information because %1 is selected.;ESP=No puede modificar la información sobre garantía porque está seleccionado %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text024(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text024 : ENU=Do you want to activate a warranty for this service item line?;ESP=¿Desea activar una garantía para esta línea prod. servicio?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text024 : ENU=Do you want to activate a warranty for this service item line?;ESP=?Desea activar una garantía para esta línea prod. servicio?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text025(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text025 : ENU=Do you want to deactivate the warranty for this service item line?;ESP=¿Confirma que desea desactivar la garantía para esta línea prod. servicio?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text025 : ENU=Do you want to deactivate the warranty for this service item line?;ESP=?Confirma que desea desactivar la garantía para esta línea prod. servicio?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text028(Variable 1026)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text028 : @@@="1%=FIELDCAPTION(""Loaner No.""); 2%=FORMAT(ServHeader.""Document Type""); 3%=ServHeader.FIELDCAPTION(""No.""); 4%=ServHeader.""No."");";ENU=You cannot change the %1, because it has been lent in connection with %2 %3 %4.\\You can receive it by clicking Functions, Receive Loaner.;ESP=No se puede cambiar %1 porque se ha prestado en relación con %2 %3 %4\\Para recibirlo, haga clic en Funciones, Recibir prod. prestado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text028 : @@@="1%=FIELDCAPTION(""Loaner No.""); 2%=FORMAT(ServHeader.""Document Type""); 3%=ServHeader.FIELDCAPTION(""No.""); 4%=ServHeader.""No."");";ENU=You cannot change the %1, because it has been lent in connection with %2 %3 %4.\\You can receive it by clicking Functions, Receive Loaner.;ESP=No se puede cambiar %1 porque se ha prestado en relación con %2 %3 %4\\Para recibirlo, haga clic en Funciones, Recibir prod. prestado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text029(Variable 1027)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text029 : ENU=Do you want to lend %1 %2?;ESP=¿Confirma que desea prestar %1 %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text029 : ENU=Do you want to lend %1 %2?;ESP=?Confirma que desea prestar %1 %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text033(Variable 1059)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text033 : ENU=A service item line cannot belong to a service contract and to a service price group at the same time.;ESP=Una línea de producción de servicio no puede pertenecer a un contrato de servicio y a un grupo de precios de servicio al mismo tiempo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text033 : ENU=A service item line cannot belong to a service contract and to a service price group at the same time.;ESP=Una línea de producción de servicio no puede pertenecer a un contrato de servicio y a un grupo de precios de servicio al mismo tiempo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text035(Variable 1061)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text035 : ENU=The %1 %2 cannot be used in service orders.;ESP=El %1 %2 no se puede util. en órd. servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text035 : ENU=The %1 %2 cannot be used in service orders.;ESP=El %1 %2 no se puede util. en órd. servicio.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text037(Variable 1069)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text037 : ENU=It is not possible to select %1 because some linked service lines have been posted.;ESP=No se puede seleccionar %1 porque algunas líneas de servicio relacionadas han sido registradas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text037 : ENU=It is not possible to select %1 because some linked service lines have been posted.;ESP=No se puede seleccionar %1 porque algunas líneas de servicio relacionadas han sido registradas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text038(Variable 1070)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text038 : ENU=Price adjustment on each existing %1 will be cancelled. Continue?;ESP=Se cancelará el ajuste de precio de cada %1. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text038 : ENU=Price adjustment on each existing %1 will be cancelled. Continue?;ESP=Se cancelar? el ajuste de precio de cada %1. ?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text039(Variable 1046)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text039 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text039 : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text040(Variable 1073)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text040 : ENU=The selected %1 has a different %2 for this %3.\\Do you want to continue?;ESP=El %1 seleccionado tiene un %2 diferente para este %3.\\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text040 : ENU=The selected %1 has a different %2 for this %3.\\Do you want to continue?;ESP=El %1 seleccionado tiene un %2 diferente para este %3.\\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text045(Variable 1078)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text045 : ENU=The %1 for this %2 occurs in more than 1 year. Please verify the setting for service hours and the %3 for the %4.;ESP=El valor de %1 para %2 sucede en más de 1 año. Por favor, verifique la configuración de las horas de servicio y el valor de %3 en %4.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text045 : ENU=The %1 for this %2 occurs in more than 1 year. Please verify the setting for service hours and the %3 for the %4.;ESP=El valor de %1 para %2 sucede en más de 1 año. Por favor, verifique la configuración de las horas de servicio y el valor de %3 en %4.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text047(Variable 1080)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text047 : ENU=Service item %1 is included in more than one contract.\\Do you want to assign a contract number to the service order line?;ESP=El prod. servicio %1 está incluido en más de un contrato.\\¿Desea asignar un número contrato a la línea del pedido servicio?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text047 : ENU=Service item %1 is included in more than one contract.\\Do you want to assign a contract number to the service order line?;ESP=El prod. servicio %1 está incluido en más de un contrato.\\?Desea asignar un número contrato a la línea del pedido servicio?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text052(Variable 1082)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text052 : ENU=Contract %1 is not signed.;ESP=No está firmado el contrato %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text052 : ENU=Contract %1 is not signed.;ESP=No está firmado el contrato %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text053(Variable 1083)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text053 : ENU=You cannot change the contract number because some of the service lines have already been posted.;ESP=No puede modificar el número contrato porque alguna de las líneas ya se ha registrado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text053 : ENU=You cannot change the contract number because some of the service lines have already been posted.;ESP=No puede modificar el número contrato porque alguna de las líneas ya se ha registrado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text054(Variable 1084)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text054 : ENU=If you change the contract number, the existing service lines for this order line will be re-created.\Do you want to continue?;ESP=Si modifica el número contrato, las líneas servicio actuales para esta línea pedido se volverán a crear.\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text054 : ENU=If you change the contract number, the existing service lines for this order line will be re-created.\Do you want to continue?;ESP=Si modifica el número contrato, las líneas servicio actuales para esta línea pedido se volverán a crear.\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text056(Variable 1048)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text056 : ENU=One or more service lines of %6 %7 and/or %8 exist for %1, %2 %3, %4 %5. There is a check mark in the %9 field of %10 %11, therefore %10 %11 cannot be applied to service line of %6 %7 and/or %8.\\ Do you want to apply it for other service lines?;ESP=Una línea o varias líneas de servicio de %6 %7 y/o %8 existen para %1, %2 %3, %4 %5. El campo %9 tiene una casilla de verificación de %10 %11, por lo tanto %10 %11 no se puede aplicar a la línea de servicio de %6 %7 y/o %8.\\ ¿Desea aplicarlo para otras líneas de servicio?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text056 : ENU=One or more service lines of %6 %7 and/or %8 exist for %1, %2 %3, %4 %5. There is a check mark in the %9 field of %10 %11, therefore %10 %11 cannot be applied to service line of %6 %7 and/or %8.\\ Do you want to apply it for other service lines?;ESP=Una línea o varias líneas de servicio de %6 %7 y/o %8 existen para %1, %2 %3, %4 %5. El campo %9 tiene una casilla de verificación de %10 %11, por lo tanto %10 %11 no se puede aplicar a la línea de servicio de %6 %7 y/o %8.\\ ?Desea aplicarlo para otras líneas de servicio?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text057(Variable 1102601000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text057 : ENU=Default Service Hours;ESP=Horas servicio genér.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text057 : ENU=Default Service Hours;ESP=Horas servicio genér.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text059(Variable 1102601002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text059 : ENU=Default warranty duration is negative. The warranty cannot be activated.;ESP=La duración predeterminada de la garantía es negativa. No se puede activar la garantía.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text059 : ENU=Default warranty duration is negative. The warranty cannot be activated.;ESP=La duración predeterminada de la garantía es negativa. No se puede activar la garantía.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text060(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text060 : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\¿Desea actualizar las líneas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text060 : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\?Desea actualizar las líneas?;
    //Variable type has not been exported.
}

