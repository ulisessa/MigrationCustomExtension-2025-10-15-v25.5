table 50543 "Lín. reparto"
{
    DrillDownPageID = "Lín. reparto";

    fields
    {
        field(1; "No. Documento"; Code[30])
        {
            NotBlank = true;
        }
        field(2; "No. línea"; Integer)
        {
            InitValue = 10000;
            NotBlank = true;
        }
        field(3; "No. Producto"; Code[20])
        {
            NotBlank = true;
            TableRelation = Item."No." WHERE ("Exportación" = CONST (true),
                                              Blocked = CONST (false));

            trigger OnValidate()
            var
                rstGLS: Record "General Ledger Setup";
                rstDV: Record "Dimension Value";
            begin
                Clear(rstGLS);
                rstGLS.Get();

                Clear(rstProducto);
                if rstProducto.Get("No. Producto") then begin
                    Validate(Descripcion, rstProducto.Description);
                    Validate(Actividad, rstProducto."Global Dimension 2 Code");
                    Validate("Cod. unidad medida", rstProducto."Base Unit of Measure");
                    Clear(rstDV);
                    rstDV.Get(rstGLS."Global Dimension 2 Code", Actividad);
                    "Seguimiento para trazabilidad" := rstDV."Seguimiento para trazabilidad";
                end;
            end;
        }
        field(4; Descripcion; Text[200])
        {
            Caption = 'Description';
        }
        field(9; "Location code"; Code[10])
        {
            Caption = 'Cód. depósito salida';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(10; "Cantidad a enviar"; Decimal)
        {
            DecimalPlaces = 0 : 2;
        }
        field(11; "Fecha ingreso"; Date)
        {
        }
        field(12; "Cod. unidad medida"; Code[10])
        {
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No. Producto"));
        }
        field(13; Puerto; Code[20])
        {
        }
        field(14; Actividad; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));

            trigger OnValidate()
            var
                l_rstDV: Record "Dimension Value";
                l_rstGLS: Record "General Ledger Setup";
            begin
                Clear(l_rstGLS);
                l_rstGLS.Get();
                Clear(l_rstDV);
                if l_rstDV.Get(l_rstGLS."Global Dimension 2 Code", Actividad) then
                    "DCL application date formula" := l_rstDV."DCL application date formula";
            end;
        }
        field(16; "Cod. deposito"; Code[10])
        {
            TableRelation = Location;
        }
        field(17; "Cantidad x Unidad Medida"; Decimal)
        {
            InitValue = 1;

            trigger OnValidate()
            begin
                CalcFields("Existencias - UMB");
                "Cantidad para Venta" := "Existencias - UMB";
            end;
        }
        field(18; "Tipo movimiento"; Option)
        {
            FieldClass = Normal;
            OptionMembers = Stock,Venta;
        }
        field(19; "Cantidad para Venta"; Decimal)
        {
            DecimalPlaces = 0 : 2;
        }
        field(20; "Total a enviar"; Decimal)
        {
            CalcFormula = Sum ("Lín. reparto"."Cantidad a enviar" WHERE ("No. Producto" = FIELD ("No. Producto"),
                                                                        "Tipo movimiento" = CONST (Venta)));
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
        }
        field(22; Proyecto; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." WHERE ("Kilos netos pendientes" = FILTER (<> 0),
                                             "Filtro producto" = FIELD ("No. Producto"),
                                             "Filtro lote" = FIELD ("Lote origen"));
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                fntValidarProyecto(FieldCaption(Proyecto));
            end;
        }
        field(23; Buque; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));

            trigger OnValidate()
            begin
                fntValidarProyecto(FieldCaption(Buque));
            end;
        }
        field(24; Marea; Code[10])
        {
            TableRelation = Job."Global Dimension 3 Code" WHERE ("Global Dimension 1 Code" = FIELD (Buque),
                                                                 "Kilos netos pendientes" = FILTER (<> 0),
                                                                 "Filtro producto" = FIELD ("No. Producto"));
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                fntValidarProyecto(FieldCaption(Marea));
            end;
        }
        field(25; "Lote origen"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Precio USD x KN"; Decimal)
        {
            Caption = 'Price per kilo';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                fntCalTotal;
            end;
        }
        field(27; "Importe USD x KN"; Decimal)
        {
            Caption = 'Total Amount (FOB)';
            DataClassification = ToBeClassified;
        }
        field(28; "Seguimiento para trazabilidad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(29; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            DataClassification = ToBeClassified;
        }
        field(2000; "Existencias - KN"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry"."Net kilos" WHERE ("Lote origen" = FIELD (FILTER ("Lote origen")),
                                                                     "Item No." = FIELD (FILTER ("No. Producto")),
                                                                     "Entry/Exit Point" = FIELD (FILTER (Puerto)),
                                                                     "Location Code" = FIELD (FILTER ("Cod. deposito"))));
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;
        }
        field(2001; "Existencias - UMB"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry".Quantity WHERE ("Lote origen" = FIELD (FILTER ("Lote origen")),
                                                                  "Item No." = FIELD (FILTER ("No. Producto")),
                                                                  "Entry/Exit Point" = FIELD (FILTER (Puerto)),
                                                                  "Location Code" = FIELD (FILTER ("Cod. deposito")),
                                                                  "Global Dimension 1 Code" = FIELD (FILTER (Buque)),
                                                                  "Global dimension 3 Code" = FIELD (FILTER (Marea))));
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                CalcFields("Existencias - UMB");
                if "Cantidad x Unidad Medida" <> 0 then
                    "Cantidad para Venta" := "Existencias - UMB" / "Cantidad x Unidad Medida"
                else
                    "Cantidad para Venta" := "Existencias - UMB";
            end;
        }
        field(2002; "Comprometido - UMB"; Decimal)
        {
            CalcFormula = Sum ("Lín. reparto"."Reservar - UMB" WHERE ("No. Producto" = FIELD (FILTER ("No. Producto")),
                                                                     "Lote origen" = FIELD (FILTER ("Lote origen")),
                                                                     Puerto = FIELD (FILTER (Puerto)),
                                                                     "Cod. deposito" = FIELD (FILTER ("Cod. deposito")),
                                                                     Proyecto = FIELD (FILTER (Proyecto)),
                                                                     Registrado = CONST (true)));
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                CalcFields("Existencias - UMB");
                if "Cantidad x Unidad Medida" <> 0 then
                    "Cantidad para Venta" := "Existencias - UMB" / "Cantidad x Unidad Medida"
                else
                    "Cantidad para Venta" := "Existencias - UMB";
            end;
        }
        field(2003; "Reservar - UMB"; Decimal)
        {
            Caption = 'Units';
            DecimalPlaces = 0 : 2;

            trigger OnValidate()
            begin
                CalcFields("Existencias - UMB", "Existencias - KN");
                if "Cantidad x Unidad Medida" <> 0 then
                    "Cantidad para Venta" := "Existencias - UMB" / "Cantidad x Unidad Medida"
                else
                    "Cantidad para Venta" := "Existencias - UMB";
            end;
        }
        field(2004; "Reservar - KN"; Decimal)
        {
            Caption = 'Net kilos';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;

            trigger OnValidate()
            begin
                fntCalTotal;
            end;
        }
        field(2005; "Reservar - KB"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(2006; "Comprometido calculado - UMB"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(2007; "Comprometido calculado - KN"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(2008; "Comprometido calculado - KB"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(2009; "Envío realizado - UMB"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry".Quantity WHERE ("Item No." = FIELD ("No. Producto"),
                                                                  "No. reparto" = FIELD ("No. Documento"),
                                                                  "Linea reparto" = FIELD ("No. línea")));
            FieldClass = FlowField;
        }
        field(2010; "Envío realizado - KN"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry"."Net kilos" WHERE ("Item No." = FIELD ("No. Producto"),
                                                                     "No. reparto" = FIELD ("No. Documento"),
                                                                     "Linea reparto" = FIELD ("No. línea")));
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;
        }
        field(2011; "Envío realizado - KB"; Decimal)
        {
            CalcFormula = Sum ("Item Ledger Entry"."Gross kilos" WHERE ("Item No." = FIELD ("No. Producto"),
                                                                       "No. reparto" = FIELD ("No. Documento"),
                                                                       "Linea reparto" = FIELD ("No. línea")));
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;
        }
        field(2012; Tons; Decimal)
        {
            Caption = 'Tons';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;

            trigger OnValidate()
            begin
                fntCalTotal;
            end;
        }
        field(3000; Registrado; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. Documento", "No. línea")
        {
            Clustered = true;
        }
        key(Key2; "No. Documento", "No. Producto")
        {
        }
        key(Key3; "Fecha ingreso")
        {
        }
        key(Key4; "No. Producto")
        {
        }
        key(Key5; "Tipo movimiento", Buque, Marea, "Cod. deposito", Puerto, "No. Producto")
        {
        }
        key(Key6; "Tipo movimiento", "No. Producto", Puerto, "Cod. deposito")
        {
        }
        key(Key7; "No. Documento", "Tipo movimiento", "Cod. deposito", Puerto, "No. Producto")
        {
        }
        key(Key8; "No. Documento", "Tipo movimiento", Buque, Marea, "Cod. deposito", Puerto, "No. Producto")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        fntTraerCabecera;
        Puerto := rstCabRep."Loading port";
        Clear(rstLinRep);
        rstLinRep.SetRange("No. Documento", "No. Documento");
        if rstLinRep.FindLast then
            "No. línea" += rstLinRep."No. línea" + 10000;
    end;

    trigger OnModify()
    begin
        Clear(rstLinRep);
        rstLinRep.SetRange("No. Producto", "No. Producto");
        rstLinRep.SetRange(Buque, Buque);
        rstLinRep.SetRange(Marea, Marea);
        rstLinRep.SetRange(Proyecto, Proyecto);
        rstLinRep.SetRange("No. Documento", "No. Documento");
        rstLinRep.SetRange("Seguimiento para trazabilidad", "Seguimiento para trazabilidad");
        rstLinRep.SetFilter("No. línea", '<>%1', "No. línea");
        if rstLinRep.FindFirst then
            Error('Ya existe una línea idéntica para este lote de producto.');
    end;

    var
        rstProducto: Record Item;
        rstCabRep: Record "Cab. Reparto";
        rstLinRep: Record "Lín. reparto";

    local procedure fntValidarProyecto(ChangedFieldName: Text[100])
    var
        rstJob: Record Job;
        cduFish: Codeunit Trazabilidad;
    begin
        case ChangedFieldName of
            FieldCaption(Proyecto):
                begin

                    Clear(rstJob);
                    if rstJob.Get(Proyecto) then begin

                        Buque := rstJob."Global Dimension 1 Code";
                        Marea := rstJob."Global Dimension 3 Code";
                        "Lote origen" := cduFish.CalcLoteOrigen(rstJob);

                    end
                    else begin

                        Buque := '';
                        Marea := '';
                        "Lote origen" := '';

                    end;

                end;

            FieldCaption(Buque), FieldCaption(Marea):
                begin

                    if (Buque <> '') and (Marea <> '') and
                       ((Buque <> xRec.Buque) or (Marea <> xRec.Marea)) then begin

                        Clear(rstJob);
                        rstJob.SetRange("Global Dimension 1 Code", Buque);
                        rstJob.SetRange("Global Dimension 3 Code", Marea);
                        if rstJob.FindFirst then begin

                            Proyecto := rstJob."No.";
                            "Lote origen" := rstJob."Lote origen";

                        end
                        else begin

                            Proyecto := '';
                            "Lote origen" := '';

                        end;

                    end;

                end;

        end;
    end;

    local procedure fntTraerCabecera()
    begin
        Clear(rstCabRep);
        rstCabRep.Get("No. Documento");
    end;

    local procedure fntCalTotal()
    begin
        "Importe USD x KN" := "Precio USD x KN" * "Reservar - KN";
        if "Reservar - KN" = 0 then
            Tons := 0
        else
            Tons := "Reservar - KN" / 1000;
    end;
}

