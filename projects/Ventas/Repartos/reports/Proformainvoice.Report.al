report 50572 "Pro forma invoice"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Ventas/Repartos/reports/Proformainvoice.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Cab. Reparto"; "Cab. Reparto")
        {
            column(Logo; rstCI."Logo path")
            {
            }
            column(PuertoConsolidado; strPE)
            {
            }
            column(PuertoConsolidadoCaption; strCaptionPE)
            {
            }
            column(PuertoDestino; strPD)
            {
            }
            column(PuertoDestinoCaption; strCaptionPD)
            {
            }
            column(PuertoSalida; strPS)
            {
            }
            column(PuertoSalidaCaption; strCaptionPS)
            {
            }
            column(Reparto; "Cab. Reparto"."No. Documento")
            {
            }
            column(CompanyName; rstCI.Name)
            {
            }
            column(Direccion; rstCI.Address)
            {
            }
            column(Direccion2; rstCI."Address 2")
            {
            }
            column(Ciudad; rstCI.City)
            {
            }
            column(Telefono; rstCI."Phone No.")
            {
            }
            column(CUIT; rstCI."VAT Registration No.")
            {
            }
            column(CodigoPostal; rstCI."Post Code")
            {
            }
            column(Provincia; rstCI.County)
            {
            }
            column(Email; rstCI."E-Mail")
            {
            }
            column(PaisOrigen; strPaisOrigen)
            {
            }
            column(strInvAddrss; strInvAddrss)
            {
            }
            column(strShipAddrss; strShipAddrss)
            {
            }
            column(Province; rstCI.Province)
            {
            }
            column(ClienteNombre; rstCust.Name)
            {
            }
            column(ClienteDireccion; rst222.Address)
            {
            }
            column(ClienteDireccion2; rst222."Address 2")
            {
            }
            column(ClienteCiudad; rst222.City)
            {
            }
            column(ClientePostal; rst222."Post Code")
            {
            }
            column(ClientePais; strPaisDestino)
            {
            }
            column(strSalesConditions; strSalesConditions)
            {
            }
            column(strSalesConditionsCaption; strSalesConditionsCaption)
            {
            }
            column(strSalesConditions2; strSalesConditions2)
            {
            }
            column(strSalesConditionsCaption2; strSalesConditionsCaption2)
            {
            }
            column(strDocs; strDocs)
            {
            }
            column(TipoContenedor; "Cab. Reparto"."Container type")
            {
                IncludeCaption = true;
            }
            column(CantContenedores; "Cab. Reparto"."Quantity of containers")
            {
                IncludeCaption = true;
            }
            column(Currency; "Cab. Reparto"."Currency Code")
            {
            }
            column(ShipBy; strShipBy)
            {
            }
            column(strShipByCaption; strShipByCaption)
            {
            }
            column(strComprador; strComprador)
            {
            }
            column(strFecha; strFecha)
            {
            }
            column(strInvoice; strInvoice)
            {
            }
            dataitem("Lín. reparto"; "Lín. reparto")
            {
                DataItemLink = "No. Documento" = FIELD("No. Documento");
                DataItemTableView = WHERE("Reservar - KN" = FILTER(<> 0));
                column(LinRep; "Lín. reparto"."No. línea")
                {
                }
                column(CodProducto; "Lín. reparto"."No. Producto")
                {
                }
                column(Descripcion; strDesc)
                {
                }
                column(DescripcionCaption; strDescCaption)
                {
                }
                column("ReservarKN_Línreparto"; "Lín. reparto"."Reservar - KN")
                {
                }
                column("strReservarKNCaption_Línreparto"; strReservarKNCaption)
                {
                }
                column("ReservarUMB_Línreparto"; "Lín. reparto"."Reservar - UMB")
                {
                }
                column("strReservarUMBCaption_Línreparto"; strReservarUMBCaption)
                {
                }
                column("PrecioUSDxKN_Línreparto"; "Lín. reparto"."Precio USD x KN")
                {
                }
                column("strPrecioCaption_Línreparto"; strPrecioCaption)
                {
                }
                column("ImporteUSDxKN_Línreparto"; "Lín. reparto"."Importe USD x KN")
                {
                }
                column("strTotalCaption_Línreparto"; strTotalCaption)
                {
                }
                column(ReservarUMD; "Lín. reparto"."Reservar - UMB")
                {
                }
                column(strReservarUMBCaption; strReservarUMBCaption)
                {
                }

                trigger OnAfterGetRecord()
                var
                    rstUOM: Record "Unit of Measure Translation";
                begin
                    strDescCaption := "Lín. reparto".FieldCaption(Descripcion);
                    strReservarKNCaption := "Lín. reparto".FieldCaption("Lín. reparto"."Reservar - KN"/*"Lín. reparto".Tons*/);
                    Clear(rstUOM);
                    if rstUOM.Get("Lín. reparto"."Cod. unidad medida", rstCust."Language Code") then;
                    strReservarUMBCaption := "Lín. reparto".FieldCaption("Reservar - UMB") + Format(NewLineChar[1]) + Format(NewLineChar[2]) + rstUOM.Description/*"Lín. reparto"."Cod. unidad medida"*/;
                    strPrecioCaption := "Lín. reparto".FieldCaption("Lín. reparto"."Precio USD x KN");
                    strTotalCaption := "Lín. reparto".FieldCaption("Lín. reparto"."Importe USD x KN");
                    i := 0;
                    strDesc := '';
                    Clear(rst279);
                    rst279.SetRange("No.", "Lín. reparto"."No. Producto");
                    rst279.SetRange("Language Code", rstCust."Language Code");
                    if rst279.FindSet then
                        repeat

                            i += 1;
                            if i <> 1 then
                                strDesc += Format(NewLineChar[1]) + Format(NewLineChar[2]) + rst279.Text
                            else
                                strDesc += rst279.Text;

                        until rst279.Next = 0;

                    if strDesc = '' then
                        strDesc := "Lín. reparto".Descripcion;

                end;
            }

            trigger OnAfterGetRecord()
            var
                rstEP: Record "Entry/Exit Point";
                Language: Record Language;
                rst3: Record "Payment Terms";
                rstPT: Record "Payment Term Translation";
                rstBA: Record "Bank Account";
                rst280: Record "Extended Text Line";
                rst463: Record "Shipment Method Translation";
                LanguageMgmt: Codeunit Language;
            begin
                Clear(rstCust);
                rstCust.Get("Cab. Reparto"."Cliente factura");

                CurrReport.Language := LanguageMgmt.GetLanguageID(rstCust."Language Code");

                Clear(rst280);
                rst280.SetRange(rst280."Table Name", rst280."Table Name"::Reparto);
                rst280.SetRange("No.", "Cab. Reparto"."No. Documento");
                rst280.SetRange("Language Code", rstCust."Language Code");
                if rst280.FindSet then
                    repeat

                        if strDocs = '' then
                            strDocs := rst280.Text
                        else
                            strDocs += Format(NewLineChar[1]) + Format(NewLineChar[2]) + rst280.Text;

                    until rst280.Next = 0;

                strCaptionPD := "Cab. Reparto".FieldCaption("Destination port");
                strCaptionPS := "Cab. Reparto".FieldCaption("Exit port");
                strCaptionPE := "Cab. Reparto".FieldCaption("Loading port");

                Clear(rstEP);
                rstEP.SetRange(Code, "Cab. Reparto"."Exit port");
                if rstEP.FindFirst then
                    strPS := rstEP.Description;

                Clear(rstEP);
                rstEP.SetRange(Code, "Cab. Reparto"."Loading port");
                if rstEP.FindFirst then
                    strPE := rstEP.Description;

                Clear(rst222);
                rst222.SetRange("Customer No.", "Cab. Reparto"."Cliente factura");
                rst222.SetRange(Code, "Cab. Reparto"."Invoice address");
                if rst222.FindFirst then begin

                    if strInvAddrss = '' then
                        strInvAddrss := rst222.Address;
                    if rst222."Address 2" <> '' then
                        strInvAddrss += ' ' + rst222."Address 2";
                    if rst222.City <> '' then
                        strInvAddrss += ', ' + rst222.City;


                    Clear(rstCountry);
                    if rstCountry.Get(rst222."Country/Region Code") then;

                    Clear(rstGT);
                    if rstCust."Language Code" <> '' then begin

                        rstGT.Get(rstGT."Object Type"::Table, 9, rstCust."Language Code", rst222."Country/Region Code");
                        strInvAddrss += ', ' + rstGT."Name/Desciption";

                    end
                    else begin

                        if rst222."Country/Region Code" <> '' then
                            strInvAddrss += ', ' + rstCountry.Name;

                    end;

                    if rst222."Phone No." <> '' then
                        strInvAddrss += Format(NewLineChar[1]) + Format(NewLineChar[2]) + 'Tel. ' + rst222."Phone No.";

                end
                else begin

                    if strInvAddrss = '' then
                        strInvAddrss := rstCust.Address;
                    if rstCust."Address 2" <> '' then
                        strInvAddrss += ' ' + rstCust."Address 2";
                    if rstCust.City <> '' then
                        strInvAddrss += ', ' + rstCust.City;


                    Clear(rstCountry);
                    if rstCountry.Get(rstCust."Country/Region Code") then;

                    Clear(rstGT);
                    if rstCust."Language Code" <> '' then begin

                        rstGT.Get(rstGT."Object Type"::Table, 9, rstCust."Language Code", rstCust."Country/Region Code");
                        strInvAddrss += ', ' + rstGT."Name/Desciption";

                    end
                    else begin

                        if rstCust."Country/Region Code" <> '' then
                            strInvAddrss += ', ' + rstCountry.Name;

                    end;
                    if rstCust."Phone No." <> '' then
                        strInvAddrss += Format(NewLineChar[1]) + Format(NewLineChar[2]) + 'Tel. ' + rstCust."Phone No.";

                end;

                Clear(rst222);
                rst222.SetRange("Customer No.", "Cab. Reparto".Cliente);
                rst222.SetRange(Code, "Cab. Reparto"."Shipment address");
                if rst222.FindFirst then begin

                    if strShipAddrss = '' then
                        strShipAddrss := rst222.Address;
                    if rst222."Address 2" <> '' then
                        strShipAddrss += ' ' + rst222."Address 2";
                    if rst222.City <> '' then
                        strShipAddrss += ', ' + rst222.City;

                    Clear(rstCountry);
                    if rstCountry.Get(rst222."Country/Region Code") then;

                    Clear(rstGT);
                    if rstCust."Language Code" <> '' then begin

                        rstGT.Get(rstGT."Object Type"::Table, 9, rstCust."Language Code", rst222."Country/Region Code");
                        strInvAddrss += ', ' + rstGT."Name/Desciption";

                    end
                    else begin

                        if rst222."Country/Region Code" <> '' then
                            strShipAddrss += ', ' + rstCountry.Name;

                    end;

                    if rst222."Phone No." <> '' then
                        strShipAddrss += Format(NewLineChar[1]) + Format(NewLineChar[2]) + 'Tel. ' + rst222."Phone No.";

                end
                else begin

                    if strShipAddrss = '' then
                        strShipAddrss := rstCust.Address;
                    if rstCust."Address 2" <> '' then
                        strShipAddrss += ' ' + rstCust."Address 2";
                    if rstCust.City <> '' then
                        strShipAddrss += ', ' + rstCust.City;

                    Clear(rstCountry);
                    if rstCountry.Get(rstCust."Country/Region Code") then;

                    Clear(rstGT);
                    if rstCust."Language Code" <> '' then begin

                        rstGT.Get(rstGT."Object Type"::Table, 9, rstCust."Language Code", rstCust."Country/Region Code");
                        strInvAddrss += ', ' + rstGT."Name/Desciption";

                    end
                    else begin

                        if rstCust."Country/Region Code" <> '' then
                            strShipAddrss += ', ' + rstCountry.Name;

                    end;

                    if rstCust."Phone No." <> '' then
                        strShipAddrss += Format(NewLineChar[1]) + Format(NewLineChar[2]) + 'Tel. ' + rstCust."Phone No.";

                end;

                Clear(rstEP);
                rstEP.SetRange(Code, "Destination port");
                if rstEP.FindFirst then
                    strPD := rstEP.Description;

                Clear(rstCountry);
                if rstCountry.Get(rst222."Country/Region Code") then
                    strPaisDestino := rstCountry.Name;

                Clear(rstGT);
                if rstCust."Language Code" <> '' then begin

                    rstGT.Get(rstGT."Object Type"::Table, 9, rstCust."Language Code", rstCust."Country/Region Code");
                    strPaisDestino := rstGT."Name/Desciption";

                end;

                Clear(rst463);
                if not rst463.Get("Cab. Reparto"."Sales conditions", rstCust."Language Code") then begin

                    Clear(rstSC);
                    rstSC.Get("Cab. Reparto"."Sales conditions");

                end;

                Clear(rstPT);
                if not rstPT.Get("Cab. Reparto"."Payment terms", rstCust."Language Code") then begin

                    Clear(rst3);
                    if rst3.Get("Cab. Reparto"."Payment terms") then;

                end;

                strSalesConditionsCaption := "Cab. Reparto".FieldCaption("Sales conditions") + ': ' + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                //strSalesConditionsCaption += "Cab. Reparto".FIELDCAPTION("Destination port")+':'+FORMAT(NewLineChar[1])+FORMAT(NewLineChar[2]);
                strSalesConditionsCaption += "Cab. Reparto".FieldCaption("Cab. Reparto"."Payment terms") + ':' + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                strSalesConditions += rst463.Description + rstSC.Description + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                //strSalesConditions += strPaisDestino+FORMAT(NewLineChar[1])+FORMAT(NewLineChar[2]);
                strSalesConditions += rstPT.Description + rst3.Description + Format(NewLineChar[1]) + Format(NewLineChar[2]);

                Clear(rstBA);
                if rstBA.Get("Cab. Reparto"."Beneficiary bank") then;
                strSalesConditionsCaption2 += "Cab. Reparto".FieldCaption("Beneficiary bank") + ':' + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                strSalesConditionsCaption2 += Format(NewLineChar[1]) + Format(NewLineChar[2]);
                strSalesConditionsCaption2 += Format(NewLineChar[1]) + Format(NewLineChar[2]);
                strSalesConditionsCaption2 += Format(NewLineChar[1]) + Format(NewLineChar[2]);
                strSalesConditionsCaption2 += Format(NewLineChar[1]) + Format(NewLineChar[2]);
                strSalesConditionsCaption2 += Format(NewLineChar[1]) + Format(NewLineChar[2]);

                strSalesConditions2 += rstBA.Name + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                strSalesConditions2 += rstBA.FieldCaption(Address) + ': ' + rstBA.Address + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                strSalesConditions2 += rstBA.FieldCaption(CBU) + ': ' + rstBA.CBU + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                ;
                strSalesConditions2 += rstBA.FieldCaption(rstBA."Bank Account No.") + ': ' + rstBA."Bank Account No." + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                strSalesConditions2 += rstBA.FieldCaption(rstBA."SWIFT Code") + ': ' + rstBA."SWIFT Code" + Format(NewLineChar[1]) + Format(NewLineChar[2]);

                if "Cab. Reparto"."Corresponsal bank" <> '' then begin

                    strSalesConditionsCaption2 += "Cab. Reparto".FieldCaption("Corresponsal bank") + ':' + Format(NewLineChar[1]) + Format(NewLineChar[2]);

                    Clear(rstBA);
                    if rstBA.Get("Cab. Reparto"."Corresponsal bank") then;
                    strSalesConditions2 += rstBA.Name + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                    strSalesConditions2 += 'Address: ' + rstBA.Address + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                    strSalesConditions2 += 'CBU: ' + rstBA.CBU + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                    ;
                    strSalesConditions2 += 'ABA: ' + rstBA."Bank Account No." + Format(NewLineChar[1]) + Format(NewLineChar[2]);
                    strSalesConditions2 += 'Swift code: ' + rstBA."SWIFT Code";

                end;


                if rstCust."Language Code" <> '' then
                    if "Cab. Reparto"."Quantity of containers" <> 0 then
                        strShipBy := Format("Cab. Reparto"."Quantity of containers") + ': Containers FCL of ' + Format("Cab. Reparto"."Container type") + ' feet.'
                    else
                        strShipBy := Format("Cab. Reparto"."Container type")
                else
                    if "Cab. Reparto"."Quantity of containers" <> 0 then
                        strShipBy := Format("Cab. Reparto"."Quantity of containers") + ': Contenedores FCL de ' + Format("Cab. Reparto"."Container type") + ' pies.'
                    else
                        strShipBy := Format("Cab. Reparto"."Container type");

                if rstCust."Language Code" <> '' then begin
                    strShipByCaption := 'Shipped over:';
                    strComprador := 'Buyer: ';
                    strFecha := 'Date: ';
                    strInvoice := 'PRO FORMA INVOICE';
                end
                else begin

                    strShipByCaption := 'Enviado por:';
                    strComprador := 'Comprador: ';
                    strFecha := 'Fecha: ';
                    strInvoice := 'FACTURA PROFORMA';

                end;
            end;

            trigger OnPreDataItem()
            begin
                Clear(rstCI);
                rstCI.Get;

                Clear(rstGT);
                Clear(rstCountry);
                rstCountry.Get(rstCI."Country/Region Code");
                strPaisOrigen := rstCountry.Name;

                NewLineChar[1] := 13;
                NewLineChar[2] := 10;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
        strPE = 'PORT OF LOADING';
        strPS = 'PORT OF EXIT';
        strPD = 'PUERTO DE DESTINO';
        strDes = 'Description';
        strFeet = 'Pies';
    }

    var
        rstCI: Record "Company Information";
        strPS: Text;
        strPE: Text;
        strPD: Text;
        rstCountry: Record "Country/Region";
        rstGT: Record "General Translation";
        rstCust: Record Customer;
        rstSC: Record "Shipment Method";
        rst222: Record "Ship-to Address";
        strPaisDestino: Text;
        strPaisOrigen: Text;
        strCaptionPD: Text;
        strCaptionPE: Text;
        strCaptionPS: Text;
        strDesc: Text;
        rst279: Record "Extended Text Line";
        i: Integer;
        strDescCaption: Text;
        strPrecioCaption: Text;
        strTotalCaption: Text;
        strReservarKNCaption: Text;
        NewLineChar: array[2] of Char;
        strShipAddrss: Text;
        strInvAddrss: Text;
        strSalesConditions: Text;
        strSalesConditionsCaption: Text;
        strDocs: Text;
        strReservarUMBCaption: Text;
        strSalesConditions2: Text;
        strSalesConditionsCaption2: Text;
        strClienteDireccion: Text;
        strClienteDireccion2: Text;
        strClienteCiudad: Text;
        strClientePostal: Text;
        strShipBy: Text;
        strShipByCaption: Text;
        strComprador: Text;
        strFecha: Text;
        strInvoice: Text;
}

