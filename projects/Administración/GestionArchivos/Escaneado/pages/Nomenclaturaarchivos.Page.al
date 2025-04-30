page 50091 "Nomenclatura archivos"
{
    SourceTable = "Integer";

    layout
    {
        area(content)
        {
            group("Títulos")
            {
                field("strNivel[1]"; strNivel[1])
                {
                    CaptionClass = strTitulo[1];
                    Editable = "strNivel[1]Editable";
                    Enabled = "strNivel[1]Enable";
                    Visible = "strNivel[1]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[1] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[1] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[1] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[1] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[1] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[1] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[1] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[1] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[1] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[1] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[1] = 'No. Proveedor' then begin
                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[1]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                    'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');
                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);
                            end;
                        end;
                    end;
                }
                field("strNivel[2]"; strNivel[2])
                {
                    CaptionClass = strTitulo[2];
                    Editable = "strNivel[2]Editable";
                    Enabled = "strNivel[2]Enable";
                    Visible = "strNivel[2]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[2] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[2] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[2] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[2] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[2] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[2] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[2] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[2] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[2] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[2] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[2] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[2]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');

                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);

                            end;

                        end;
                    end;
                }
                field("strNivel[3]"; strNivel[3])
                {
                    CaptionClass = strTitulo[3];
                    Editable = "strNivel[3]Editable";
                    Enabled = "strNivel[3]Enable";
                    Visible = "strNivel[3]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[3] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[3] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[3] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[3] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[3] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[3] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[3] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[3] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[3] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[3] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[3] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[3]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');

                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);

                            end;

                        end;
                    end;
                }
                field("strNivel[4]"; strNivel[4])
                {
                    CaptionClass = strTitulo[4];
                    Editable = "strNivel[4]Editable";
                    Enabled = "strNivel[4]Enable";
                    Visible = "strNivel[4]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[4] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[4] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[4] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[4] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[4] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[4] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[4] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[4] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[4] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[4] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[4] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[4]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');

                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[4]);

                            end;

                        end;
                    end;
                }
                field("strNivel[5]"; strNivel[5])
                {
                    CaptionClass = strTitulo[5];
                    Editable = "strNivel[5]Editable";
                    Enabled = "strNivel[5]Enable";
                    Visible = "strNivel[5]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[5] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[5] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[5] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[5] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[5] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[5] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[5] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[5] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[5] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[5] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[5] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[5]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');
                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);

                            end;

                        end;
                    end;
                }
                field("strNivel[6]"; strNivel[6])
                {
                    CaptionClass = strTitulo[6];
                    Editable = "strNivel[6]Editable";
                    Enabled = "strNivel[6]Enable";
                    Visible = "strNivel[6]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        if strTitulo[6] = 'No. Producto' then begin

                            Clear(rstProducto);
                            Clear(frmProducto);

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[6] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[6] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            Clear(frmProveedor);
                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[6] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[6] = 'No. Cliente' then begin

                            Clear(rstCliente);
                            Clear(frmCliente);
                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[6] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[6] = 'No. Proyecto' then begin

                            Clear(rstProyecto);
                            Clear(frmProyecto);
                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[6] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[6] = 'No. Orden Pago' then begin

                            Clear(rstMovProv);
                            Clear(frmMovProv);
                            rstMovProv.SetRange(rstMovProv."Vendor No.", rstProveedor."No.");
                            rstMovProv.SetFilter("Document Type", '%1|%2', rstMovProv."Document Type"::Payment, rstMovProv."Document Type"::" ");
                            frmMovProv.SetTableView(rstMovProv);
                            frmMovProv.LookupMode(true);
                            if frmMovProv.RunModal = ACTION::LookupOK then begin

                                frmMovProv.GetRecord(rstMovProv);
                                strNivel[6] := rstMovProv."Document No.";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[6] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[6]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');

                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);

                            end;

                        end;
                    end;
                }
                field("strNivel[7]"; strNivel[7])
                {
                    CaptionClass = strTitulo[7];
                    Editable = "strNivel[7]Editable";
                    Enabled = "strNivel[7]Enable";
                    Visible = "strNivel[7]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[7] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[7] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[7] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[7] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[7] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[7] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[7] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[7] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[7] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[7] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[7] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[7]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');

                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);

                            end;

                        end;
                    end;
                }
                field("strNivel[8]"; strNivel[8])
                {
                    CaptionClass = strTitulo[8];
                    Editable = "strNivel[8]Editable";
                    Enabled = "strNivel[8]Enable";
                    Visible = "strNivel[8]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[8] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[8] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[8] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[8] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[8] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[8] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[8] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[8] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[8] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[8] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[8] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[8]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');

                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);

                            end;

                        end;
                    end;
                }
                field("strNivel[9]"; strNivel[9])
                {
                    CaptionClass = strTitulo[9];
                    Editable = "strNivel[9]Editable";
                    Enabled = "strNivel[9]Enable";
                    Visible = "strNivel[9]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        l_rstDV: Record "Dimension Value";
                        l_rstGLS: Record "General Ledger Setup";
                        l_pgeDV: Page "Dimension Values";
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[9] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[9] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[9] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[9] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[9] = 'Tipo documento AFIP' then begin

                            Clear(l_rstGLS);
                            l_rstGLS.Get();
                            l_rstGLS.TestField("AFIP Doc Type Dimension");
                            Clear(l_rstDV);
                            l_rstDV.SetRange("Dimension Code", l_rstGLS."AFIP Doc Type Dimension");
                            if strNivel[9] <> '' then
                                l_rstDV.SetRange(Code, strNivel[9]);

                            Clear(l_pgeDV);
                            l_pgeDV.SetTableView(l_rstDV);
                            l_pgeDV.LookupMode(true);
                            if l_pgeDV.RunModal = ACTION::LookupOK then begin

                                l_pgeDV.GetRecord(l_rstDV);
                                strNivel[9] := l_rstDV.Code;

                            end;

                        end;

                        if strTitulo[9] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[9] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[9] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[9] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[9] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[9] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[9] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[9]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');

                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);

                            end;

                        end;
                    end;
                }
                field("strNivel[10]"; strNivel[10])
                {
                    CaptionClass = strTitulo[10];
                    Editable = "strNivel[10]Editable";
                    Enabled = "strNivel[10]Enable";
                    Visible = "strNivel[10]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[10] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[10] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[10] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[10] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[10] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[10] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[10] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[10] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[10] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[10] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[10] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[10]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');

                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);

                            end;

                        end;
                    end;
                }
                field("strNivel[11]"; strNivel[11])
                {
                    CaptionClass = strTitulo[11];
                    Editable = "strNivel[11]Editable";
                    Enabled = "strNivel[11]Enable";
                    Visible = "strNivel[11]Visible";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstProducto);
                        Clear(frmProducto);
                        Clear(rstProveedor);
                        Clear(frmProveedor);
                        Clear(rstCliente);
                        Clear(frmCliente);
                        Clear(rstProyecto);
                        Clear(frmProyecto);

                        if strTitulo[11] = 'No. Producto' then begin

                            frmProducto.SetTableView(rstProducto);
                            frmProducto.LookupMode(true);
                            if frmProducto.RunModal = ACTION::LookupOK then begin

                                frmProducto.GetRecord(rstProducto);
                                strNivel[11] := rstProducto."No.";

                            end;

                        end;

                        if strTitulo[11] = 'No. Proveedor' then begin

                            frmProveedor.SetTableView(rstProveedor);
                            frmProveedor.LookupMode(true);
                            if frmProveedor.RunModal = ACTION::LookupOK then begin

                                frmProveedor.GetRecord(rstProveedor);
                                strNivel[11] := rstProveedor."No.";

                            end;

                        end;

                        if strTitulo[11] = 'No. Cliente' then begin

                            frmCliente.SetTableView(rstCliente);
                            frmCliente.LookupMode(true);
                            if frmCliente.RunModal = ACTION::LookupOK then begin

                                frmCliente.GetRecord(rstCliente);
                                strNivel[11] := rstCliente."No.";

                            end;

                        end;

                        if strTitulo[11] = 'No. Proyecto' then begin

                            frmProyecto.SetTableView(rstProyecto);
                            frmProyecto.LookupMode(true);
                            if frmProyecto.RunModal = ACTION::LookupOK then begin

                                frmProyecto.GetRecord(rstProyecto);
                                strNivel[11] := rstProyecto."No.";

                            end;

                        end;

                        if strTitulo[11] = 'No. Orden Pago' then begin

                            frmRegistroMovsContabilidad.SetTableView(rstRegistroMovsContabilidad);
                            frmRegistroMovsContabilidad.LookupMode(true);
                            if frmRegistroMovsContabilidad.RunModal = ACTION::LookupOK then begin

                                frmRegistroMovsContabilidad.GetRecord(rstRegistroMovsContabilidad);
                                strNivel[11] := rstRegistroMovsContabilidad."No. documento";

                            end;

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        if strTitulo[11] = 'No. Proveedor' then begin

                            Clear(rstProveedor);
                            if rstProveedor.Get(strNivel[11]) then begin

                                if (rstProveedor."Fecha vencimiento CAI" < Today) and (rstProveedor."Lleva CAI" = true) then
                                    Message('La fecha de vencimiento del CAI informada en la ficha del proveedor ha vencido.\' +
                                            'Por favor, ingrese un nuevo CAI y actualice la fecha de vencimiento del mismo.');

                                Clear(l_rst38);
                                l_rst38.ValidateCompanyandVendorStatus(strNivel[1]);

                            end;

                        end;
                    end;
                }
            }
            group(BarCode)
            {
                field("Código de barras"; strCB)
                {

                    trigger OnValidate()
                    begin
                        fntCodBarras;
                        fntCodBarras;
                    end;
                }
                field(QR; strQR)
                {

                    trigger OnValidate()
                    begin
                        fntQR(strQR);
                    end;
                }
                field("No usar alimentador"; blnFB)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        "strNivel[11]Editable" := true;
        "strNivel[10]Editable" := true;
        "strNivel[9]Editable" := true;
        "strNivel[8]Editable" := true;
        "strNivel[7]Editable" := true;
        "strNivel[6]Editable" := true;
        "strNivel[5]Editable" := true;
        "strNivel[4]Editable" := true;
        "strNivel[3]Editable" := true;
        "strNivel[2]Editable" := true;
        "strNivel[1]Editable" := true;
        "strNivel[11]Visible" := true;
        "strTitulo[11]Visible" := true;
        "strNivel[10]Visible" := true;
        "strTitulo[10]Visible" := true;
        "strNivel[9]Visible" := true;
        "strTitulo[9]Visible" := true;
        "strNivel[8]Visible" := true;
        "strTitulo[8]Visible" := true;
        "strNivel[7]Visible" := true;
        "strTitulo[7]Visible" := true;
        "strNivel[6]Visible" := true;
        "strTitulo[6]Visible" := true;
        "strNivel[5]Visible" := true;
        "strTitulo[5]Visible" := true;
        "strNivel[4]Visible" := true;
        "strTitulo[4]Visible" := true;
        "strNivel[3]Visible" := true;
        "strTitulo[3]Visible" := true;
        "strNivel[2]Visible" := true;
        "strTitulo[2]Visible" := true;
        "strNivel[1]Visible" := true;
        "strTitulo[1]Visible" := true;

        "strNivel[11]Enable" := true;
        "strNivel[10]Enable" := true;
        "strNivel[9]Enable" := true;
        "strNivel[8]Enable" := true;
        "strNivel[7]Enable" := true;
        "strNivel[6]Enable" := true;
        "strNivel[5]Enable" := true;
        "strNivel[4]Enable" := true;
        "strNivel[3]Enable" := true;
        "strNivel[2]Enable" := true;
        "strNivel[1]Enable" := true;
    end;

    trigger OnOpenPage()
    begin
        for i := 1 to 11 do begin

            if strTitulo[i] = '' then begin

                case i of

                    1:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N1');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[1]Visible" := false;
                                "strNivel[1]Visible" := false;

                            end;

                        end;

                    2:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N2');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[2]Visible" := false;
                                "strNivel[2]Visible" := false;

                            end;

                        end;

                    3:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N3');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[3]Visible" := false;
                                "strNivel[3]Visible" := false;

                            end;

                        end;

                    4:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N4');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[4]Visible" := false;
                                "strNivel[4]Visible" := false;

                            end;

                        end;

                    5:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N5');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[5]Visible" := false;
                                "strNivel[5]Visible" := false;

                            end;

                        end;

                    6:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N6');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[6]Visible" := false;
                                "strNivel[6]Visible" := false;

                            end;

                        end;

                    7:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N7');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[7]Visible" := false;
                                "strNivel[7]Visible" := false;

                            end;

                        end;

                    8:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N8');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[8]Visible" := false;
                                "strNivel[8]Visible" := false;

                            end;

                        end;

                    9:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N9');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[9]Visible" := false;
                                "strNivel[9]Visible" := false;

                            end;

                        end;

                    10:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N10');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[10]Visible" := false;
                                "strNivel[10]Visible" := false;

                            end;

                        end;

                    11:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N11');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[11]Visible" := false;
                                "strNivel[11]Visible" := false;

                            end;

                        end;


                end;

            end;

            if strNivel[i] <> '' then begin

                case i of

                    1:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N1');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[1]Editable" := false;
                                "strNivel[1]Editable" := false;
                                "strNivel[1]Enable" := false;

                            end;

                        end;

                    2:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N2');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[2]Editable" := false;
                                "strNivel[2]Editable" := false;
                                "strNivel[2]Enable" := false;

                            end;

                        end;

                    3:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N3');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[3]Editable" := false;
                                "strNivel[3]Editable" := false;
                                "strNivel[3]Enable" := false;

                            end;

                        end;

                    4:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N4');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[4]Editable" := false;
                                "strNivel[4]Editable" := false;
                                "strNivel[4]Enable" := false;

                            end;

                        end;

                    5:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N5');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[5]Editable" := false;
                                "strNivel[5]Editable" := false;
                                "strNivel[5]Enable" := false;

                            end;

                        end;

                    6:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N6');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[6]Editable" := false;
                                "strNivel[6]Editable" := false;
                                "strNivel[6]Enable" := false;

                            end;

                        end;

                    7:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N7');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[7]Editable" := false;
                                "strNivel[7]Editable" := false;
                                "strNivel[7]Enable" := false;

                            end;

                        end;

                    8:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N8');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[8]Editable" := false;
                                "strNivel[8]Editable" := false;
                                "strNivel[8]Enable" := false;

                            end;

                        end;

                    9:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N9');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[9]Editable" := false;
                                "strNivel[9]Editable" := false;
                                "strNivel[9]Enable" := false;

                            end;

                        end;

                    10:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N10');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[10]Editable" := false;
                                "strNivel[10]Editable" := false;
                                "strNivel[10]Enable" := false;

                            end;

                        end;

                    11:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N11');
                            if rstNiveles.Find('-') then;
                            if not rstNiveles.Automático then begin

                                "strTitulo[11]Editable" := false;
                                "strNivel[11]Editable" := false;
                                "strNivel[11]Enable" := false;

                            end;

                        end;

                end;

            end
            else begin

                case i of

                    1:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N1');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[1]Editable" := false;
                                "strNivel[1]Editable" := false;
                                "strNivel[1]Enable" := false;

                            end;

                        end;

                    2:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N2');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[2]Editable" := false;
                                "strNivel[2]Editable" := false;
                                "strNivel[2]Enable" := false;

                            end;

                        end;

                    3:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N3');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[3]Editable" := false;
                                "strNivel[3]Editable" := false;
                                "strNivel[3]Enable" := false;

                            end;

                        end;

                    4:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N4');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[4]Editable" := false;
                                "strNivel[4]Editable" := false;
                                "strNivel[4]Enable" := false;

                            end;

                        end;

                    5:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N5');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[5]Editable" := false;
                                "strNivel[5]Editable" := false;
                                "strNivel[5]Enable" := false;

                            end;

                        end;

                    6:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N6');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[6]Editable" := false;
                                "strNivel[6]Editable" := false;
                                "strNivel[6]Enable" := false;

                            end;

                        end;

                    7:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N7');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[7]Editable" := false;
                                "strNivel[7]Editable" := false;
                                "strNivel[7]Enable" := false;

                            end;

                        end;

                    8:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N8');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[8]Editable" := false;
                                "strNivel[8]Editable" := false;
                                "strNivel[8]Enable" := false;

                            end;

                        end;

                    9:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N9');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[9]Editable" := false;
                                "strNivel[9]Editable" := false;
                                "strNivel[9]Enable" := false;

                            end;

                        end;

                    10:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N10');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[10]Editable" := false;
                                "strNivel[10]Editable" := false;
                                "strNivel[10]Enable" := false;

                            end;

                        end;

                    11:
                        begin

                            Clear(rstNiveles);
                            rstNiveles.SetRange(rstNiveles."No.", rstNiveles1."No.");
                            rstNiveles.SetRange(Nivel, 'N11');
                            if rstNiveles.Find('-') then;
                            if rstNiveles.Automático then begin

                                "strTitulo[11]Editable" := false;
                                "strNivel[11]Editable" := false;
                                "strNivel[11]Enable" := false;

                            end;

                        end;

                end;

            end;

        end;
    end;

    var
        strTitulo: array[12] of Text[50];
        strNivel: array[12] of Text[50];
        i: Integer;
        h: Integer;
        rstProducto: Record Item;
        frmProducto: Page "Item List";
        rstProveedor: Record Vendor;
        frmProveedor: Page "Vendor List";
        rstCliente: Record Customer;
        frmCliente: Page "Customer List";
        rstProyecto: Record Job;
        frmProyecto: Page "Job List";
        rstNiveles: Record "Específicos por ruta";
        rstNiveles1: Record "Específicos por ruta";
        frmRegistroMovsContabilidad: Page "G/L Registers";
        rstRegistroMovsContabilidad: Record "G/L Register";
        rstMovProv: Record "Vendor Ledger Entry";
        frmMovProv: Page "Vendor Ledger Entries";

        "strTitulo[1]Visible": Boolean;

        "strNivel[1]Visible": Boolean;

        "strTitulo[2]Visible": Boolean;

        "strNivel[2]Visible": Boolean;

        "strTitulo[3]Visible": Boolean;

        "strNivel[3]Visible": Boolean;

        "strTitulo[4]Visible": Boolean;

        "strNivel[4]Visible": Boolean;

        "strTitulo[5]Visible": Boolean;

        "strNivel[5]Visible": Boolean;

        "strTitulo[6]Visible": Boolean;

        "strNivel[6]Visible": Boolean;

        "strTitulo[7]Visible": Boolean;

        "strNivel[7]Visible": Boolean;

        "strTitulo[8]Visible": Boolean;

        "strNivel[8]Visible": Boolean;

        "strTitulo[9]Visible": Boolean;

        "strNivel[9]Visible": Boolean;

        "strTitulo[10]Visible": Boolean;

        "strNivel[10]Visible": Boolean;

        "strTitulo[11]Visible": Boolean;

        "strNivel[11]Visible": Boolean;

        "strTitulo[1]Editable": Boolean;

        "strNivel[1]Editable": Boolean;

        "strTitulo[2]Editable": Boolean;

        "strNivel[2]Editable": Boolean;

        "strTitulo[3]Editable": Boolean;

        "strNivel[3]Editable": Boolean;

        "strTitulo[4]Editable": Boolean;

        "strNivel[4]Editable": Boolean;

        "strTitulo[5]Editable": Boolean;

        "strNivel[5]Editable": Boolean;

        "strTitulo[6]Editable": Boolean;

        "strNivel[6]Editable": Boolean;

        "strTitulo[7]Editable": Boolean;

        "strNivel[7]Editable": Boolean;

        "strTitulo[8]Editable": Boolean;

        "strNivel[8]Editable": Boolean;

        "strTitulo[9]Editable": Boolean;

        "strNivel[9]Editable": Boolean;

        "strTitulo[10]Editable": Boolean;

        "strNivel[10]Editable": Boolean;

        "strTitulo[11]Editable": Boolean;

        "strNivel[11]Editable": Boolean;
        strCB: Text[1024];
        "strNivel[11]Enable": Boolean;
        "strNivel[10]Enable": Boolean;
        "strNivel[9]Enable": Boolean;
        "strNivel[8]Enable": Boolean;
        "strNivel[7]Enable": Boolean;
        "strNivel[6]Enable": Boolean;
        "strNivel[5]Enable": Boolean;
        "strNivel[4]Enable": Boolean;
        "strNivel[3]Enable": Boolean;
        "strNivel[2]Enable": Boolean;
        "strNivel[1]Enable": Boolean;
        blnFB: Boolean;
        rstGLS: Record "General Ledger Setup";
        rstDV: Record "Dimension Value";
        strLetraDocu: Code[1];
        strQR: Text;
        l_rst38: Record "Purchase Header";

    [Scope('OnPrem')]
    procedure fntAbrirConNiveles(var strTitulos: array[11] of Text[50]; var strNiveles: array[11] of Text[50]; rstNiveles: Record "Específicos por ruta")
    begin
        for i := 1 to 11 do begin

            strTitulo[i] := strTitulos[i];
            strNivel[i] := strNiveles[i];

        end;

        rstNiveles1 := rstNiveles;
    end;

    [Scope('OnPrem')]
    procedure fntDevolverNombre(var strNivelesFinales: array[11] of Text[50]; var l_blnFB: Boolean)
    var
        strNombre: Text[250];
    begin
        for i := 1 to 11 do begin

            strNivelesFinales[i] := strNivel[i];

        end;

        l_blnFB := blnFB;
    end;

    local procedure fntCodBarras()
    begin
        //MESSAGE('%1',STRLEN(strCB));
        case StrLen(strCB) of
            40, 41://4 posiciones en Punto de Venta, 2 en Tipo documento, 4 posiciones año
                begin

                    for i := 1 to 11 do begin

                        if strTitulo[i] = 'No. Proveedor' then begin
                            strNivel[i] := CopyStr(strCB, 1, 10);
                            Clear(rstProveedor);
                            rstProveedor.Get(strNivel[i]);
                        end;

                        if (rstProveedor."No." <> '') then begin
                            if strTitulo[i] = 'No. Proveedor' then
                                strNivel[i] := CopyStr(strCB, 1, 10);
                            if strTitulo[i] = 'Tipo documento AFIP' then
                                strNivel[i] := CopyStr(strCB, 12, 2);
                            if strTitulo[i] = 'Fecha vencimiento' then
                                strNivel[i] := CopyStr(strCB, 38, 2) + CopyStr(strCB, 36, 2) + CopyStr(strCB, 32, 4);
                            if strTitulo[i] = 'CAI-CAE' then
                                strNivel[i] := CopyStr(strCB, 18, 14);

                            Clear(rstGLS);
                            rstGLS.Get();

                            Clear(rstDV);
                            if strTitulo[i] = 'Tipo documento AFIP' then begin
                                rstDV.Get(rstGLS."AFIP Doc Type Dimension", '0' + strNivel[i]);
                                strLetraDocu := rstDV."Establecimiento No. Oficial";
                            end;
                            if strTitulo[i] = 'No. documento' then
                                strNivel[i] := strLetraDocu + CopyStr(strCB, 14, 4) + '-';

                        end;

                    end;

                end;
            38://4 posiciones Punto de Venta, 2 tipo documento
                begin

                    for i := 1 to 11 do begin

                        if strTitulo[i] = 'No. Proveedor' then begin
                            strNivel[i] := CopyStr(strCB, 1, 10);
                            Clear(rstProveedor);
                            rstProveedor.Get(strNivel[i]);
                        end;

                        if (rstProveedor."No." <> '') then begin
                            if strTitulo[i] = 'No. Proveedor' then
                                strNivel[i] := CopyStr(strCB, 1, 10);
                            if strTitulo[i] = 'Tipo documento AFIP' then
                                strNivel[i] := CopyStr(strCB, 12, 2);
                            if strTitulo[i] = 'Fecha vencimiento' then
                                strNivel[i] := CopyStr(strCB, 36, 2) + CopyStr(strCB, 34, 2) + CopyStr(strCB, 32, 2);
                            if strTitulo[i] = 'CAI-CAE' then
                                strNivel[i] := CopyStr(strCB, 18, 14);

                            Clear(rstGLS);
                            rstGLS.Get();

                            Clear(rstDV);
                            if strTitulo[i] = 'Tipo documento AFIP' then begin
                                rstDV.Get(rstGLS."AFIP Doc Type Dimension", '0' + strNivel[i]);
                                strLetraDocu := rstDV."Establecimiento No. Oficial";
                            end;
                            if strTitulo[i] = 'No. documento' then
                                strNivel[i] := strLetraDocu + CopyStr(strCB, 14, 4) + '-';

                        end;

                    end;

                end;

            42://5 posiciones Punto de Venta, 3 tipo documento, 4 año
                begin

                    for i := 1 to 11 do begin

                        if strTitulo[i] = 'No. Proveedor' then begin
                            strNivel[i] := CopyStr(strCB, 1, 10);
                            Clear(rstProveedor);
                            rstProveedor.Get(strNivel[i]);
                        end;

                        if (rstProveedor."No." <> '') then begin
                            if strTitulo[i] = 'No. Proveedor' then
                                strNivel[i] := CopyStr(strCB, 1, 10);
                            if strTitulo[i] = 'Tipo documento AFIP' then
                                strNivel[i] := CopyStr(strCB, 12, 3);
                            if strTitulo[i] = 'Fecha vencimiento' then
                                strNivel[i] := CopyStr(strCB, 40, 2) + CopyStr(strCB, 38, 2) + CopyStr(strCB, 34, 4);
                            if strTitulo[i] = 'CAI-CAE' then
                                strNivel[i] := CopyStr(strCB, 20, 14);

                            Clear(rstGLS);
                            rstGLS.Get();

                            Clear(rstDV);
                            if strTitulo[i] = 'Tipo documento AFIP' then begin
                                rstDV.Get(rstGLS."AFIP Doc Type Dimension", strNivel[i]);
                                strLetraDocu := rstDV."Establecimiento No. Oficial";
                            end;
                            if strTitulo[i] = 'No. documento' then
                                strNivel[i] := strLetraDocu + CopyStr(strCB, 15, 5) + '-';

                        end;

                    end;

                end;

        end;
    end;

    local procedure fntQR(strQR: Text)
    var
        l_rstTempBlob: Codeunit "Temp Blob";
        l_intVer: Integer;
        l_strFecha: Text;
        l_strCUIT: Text;
        l_strPtoVta: Text;
        l_strTipoCmp: Text;
        l_strNroCmp: Text;
        l_strImporte: Text;
        l_strMoneda: Text;
        l_strCtz: Text;
        l_strNroDocRec: Text;
        l_strTipoDocRec: Text;
        l_strTipoCodAut: Text;
        l_strCodAut: Text;
        l_rstVendor: Record Vendor;
        cdu50501: Codeunit "Registro diarios";
        l_rstGLS: Record "General Ledger Setup";
        Base64: Codeunit "Base64 Convert";
    begin
        //MESSAGE('%1',STRLEN(strCB));
        Clear(l_rstGLS);
        l_rstGLS.Get();
        if StrPos(strQR, l_rstGLS."AFIP QR URL") <> 0 then
            strQR := CopyStr(strQR, StrLen(l_rstGLS."AFIP QR URL") + 1, 1024);
        Clear(l_rstTempBlob);
        strQR := Base64.FromBase64(strQR);
        /*
        ver Numérico 1 digito OBLIGATORIO – versión del formato de los datos del comprobante 1
        fecha full-date (RFC3339) OBLIGATORIO – Fecha de emisión del comprobante "2020-10-13"
        cuit Numérico 11 dígitos OBLIGATORIO – Cuit del Emisor del comprobante 30000000007
        ptoVta Numérico hasta 5 digitos OBLIGATORIO – Punto de venta utilizado para emitir el comprobante 10
        tipoCmp Numérico hasta 3 dígitos OBLIGATORIO – tipo de comprobante (según Tablas del sistema ) 1
        nroCmp Numérico hasta 8 dígitos OBLIGATORIO – Número del comprobante 94
        importe Decimal hasta 13 enteros y 2 decimales OBLIGATORIO – Importe Total del comprobante (en la moneda en la que fue emitido) 12100
        moneda 3 caracteres OBLIGATORIO – Moneda del comprobante (según Tablas del sistema ) "DOL"
        ctz Decimal hasta 13 enteros y 6 decimales OBLIGATORIO – Cotización en pesos argentinos de la moneda utilizada (1 cuando la moneda sea pesos) 65
        tipoDocRec Numérico hasta 2 dígitos DE CORRESPONDER – Código del Tipo de documento del receptor (según Tablas del sistema ) 80
        nroDocRec Numérico hasta 20 dígitos DE CORRESPONDER – Número de documento del receptor correspondiente al tipo de documento indicado 20000000001
        tipoCodAut string OBLIGATORIO – “A” para comprobante autorizado por CAEA, “E” para comprobante autorizado por CAE "E"
        codAut Numérico 14 dígitos OBLIGATORIO – Código de autorización otorgado por AFIP para el comprobante 70417054367476
        */

        if StrPos(strQR, 'ver') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'ver') + StrLen('ver'), 1000);
            Evaluate(l_intVer, CopyStr(strQR, StrPos(strQR, ':') + 1, 1));
        end;
        if StrPos(strQR, 'fecha') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'fecha') + StrLen('fecha"'), 1000);
            l_strFecha := CopyStr(strQR, StrPos(strQR, '"') + 1, 10);
        end;
        if StrPos(strQR, 'cuit') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'cuit') + StrLen('cuit"'), 1000);
            l_strCUIT := CopyStr(strQR, StrPos(strQR, ':') + 1, 11);
            l_strCUIT := CopyStr(l_strCUIT, 1, 2) + '-' + CopyStr(l_strCUIT, 3, 8) + '-' + CopyStr(l_strCUIT, 11, 1);
            Clear(l_rstVendor);
            l_rstVendor.SetRange("VAT Registration No.", l_strCUIT);
            l_rstVendor.FindFirst;
        end;
        if StrPos(strQR, 'ptoVta') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'ptoVta') + StrLen('ptoVta":'), 1000);
            l_strPtoVta := CopyStr(strQR, 1, StrPos(strQR, ',') - 1);
        end;
        if StrPos(strQR, 'tipoCmp') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'tipoCmp') + StrLen('tipoCmp":'), 1000);
            l_strTipoCmp := cdu50501.fntNum(3, CopyStr(strQR, 1, StrPos(strQR, ',') - 1));
        end;
        if StrPos(strQR, 'nroCmp') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'nroCmp') + StrLen('nroCmp":'), 1000);
            l_strNroCmp := cdu50501.fntNum(8, CopyStr(strQR, 1, StrPos(strQR, ',') - 1));
        end;
        if StrPos(strQR, 'importe') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'importe') + StrLen('importe":'), 1000);
            l_strImporte := CopyStr(strQR, 1, StrPos(strQR, ',') - 1);
        end;
        if StrPos(strQR, 'moneda') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'moneda') + StrLen('moneda":'), 1000);
            l_strMoneda := CopyStr(strQR, 1, StrPos(strQR, ',') - 1);
        end;
        if StrPos(strQR, 'ctz') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'ctz') + StrLen('ctz":'), 1000);
            l_strCtz := CopyStr(strQR, 1, StrPos(strQR, ',') - 1);
        end;
        if StrPos(strQR, 'tipoDocRec') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'tipoDocRec') + StrLen('tipoDocRec":'), 1000);
            l_strTipoDocRec := CopyStr(strQR, 1, StrPos(strQR, ',') - 1);
        end;
        if StrPos(strQR, 'nroDocRec') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'nroDocRec') + StrLen('nroDocRec":'), 1000);
            l_strNroDocRec := CopyStr(strQR, 1, StrPos(strQR, ',') - 1);
        end;
        if StrPos(strQR, 'tipoCodAut') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'tipoCodAut') + StrLen('tipoCodAut":'), 1000);
            l_strTipoCodAut := CopyStr(strQR, 1, StrPos(strQR, ',') - 1);
        end;
        if StrPos(strQR, 'codAut') <> 0 then begin
            strQR := CopyStr(strQR, StrPos(strQR, 'codAut') + StrLen('codAut":'), 1000);
            l_strCodAut := CopyStr(strQR, 1, StrPos(strQR, '}') - 1);
        end;
        for i := 1 to 11 do begin
            if strTitulo[i] = 'Fecha factura' then
                strNivel[i] := CopyStr(l_strFecha, 9, 2) + CopyStr(l_strFecha, 6, 2) + CopyStr(l_strFecha, 1, 4);
            if strTitulo[i] = 'Fecha factura' then
                strNivel[i] := CopyStr(l_strFecha, 9, 2) + CopyStr(l_strFecha, 6, 2) + CopyStr(l_strFecha, 1, 4);
            if strTitulo[i] = 'No. Proveedor' then begin
                strNivel[i] := l_rstVendor."No.";
            end;
            case l_strTipoCmp of
                '001', '002', '003', '004', '005', '023', '024':
                    strLetraDocu := 'A';
                '006', '007', '008', '009', '010':
                    strLetraDocu := 'B';
                '011', '012', '013', '015':
                    strLetraDocu := 'C';
                /*
                '006','007','008','009','010':
                  strLetraDocu := 'B';*/
                '051', '052', '053', '054', '055':
                    strLetraDocu := 'M';
                else
                    Error('No se reconoce el tipo de documento');
            end;
            if strTitulo[i] = 'Tipo documento AFIP' then
                strNivel[i] := cdu50501.fntNum(3, l_strTipoCmp);
            if strTitulo[i] = 'No. documento' then
                strNivel[i] := strLetraDocu + cdu50501.fntNum(5, l_strPtoVta) + '-' + cdu50501.fntNum(8, l_strNroCmp);
            if strTitulo[i] = 'Importe total' then
                strNivel[i] := l_strImporte;
            if strTitulo[i] = 'Moneda' then
                strNivel[i] := l_strImporte;
            if strTitulo[i] = 'Cotización' then
                strNivel[i] := l_strCtz;
            if strTitulo[i] = 'Tipo documento receptor' then
                strNivel[i] := l_strTipoDocRec;
            if strTitulo[i] = 'Nro documento receptor' then
                strNivel[i] := l_strNroDocRec;
            if strTitulo[i] = 'Tipo autenticación' then
                strNivel[i] := l_strTipoCodAut;
            if strTitulo[i] = 'CAI-CAE' then
                strNivel[i] := l_strCodAut;
        end;

    end;
}

