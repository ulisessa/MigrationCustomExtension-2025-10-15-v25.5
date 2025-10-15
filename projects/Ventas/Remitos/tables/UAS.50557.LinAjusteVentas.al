table 50557 "Lín. ajuste ventas"
{

    fields
    {
        field(2; "No. documento"; Code[30])
        {
            Editable = false;
        }
        field(3; Subfamilia; Code[20])
        {
            Editable = false;

            trigger OnLookup()
            begin
                /*CLEAR(rstLinVenta);
                CLEAR(frmLinVenta);
                rstLinVenta.SETRANGE("Tipo documento",fntAjustarReparto);
                rstLinVenta.SETRANGE("No. documento","No. documento");
                frmLinVenta.SETTABLEVIEW(rstLinVenta);
                frmLinVenta.LOOKUPMODE(TRUE);
                IF frmLinVenta.RUNMODAL = ACTION::LookupOK THEN
                BEGIN
                
                  frmLinVenta.GETRECORD(rstLinVenta);
                  Subfamilia := rstLinVenta.Subfamilia;
                
                END;
                 */

            end;
        }
        field(4; "Carpeta exportación"; Code[20])
        {
            Editable = false;
        }
        field(5; "Permiso embarque"; Code[20])
        {
        }
        field(6; "Línea venta"; Integer)
        {
            Editable = false;
            TableRelation = "Sales Line"."Line No." WHERE("Document No." = FIELD("No. documento"),
                                                           Type = FILTER(Item));
        }
        field(7; "% Ajuste KN"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "% Ajuste KN" <> 0 then begin

                    if "Kilos netos" <> 0 then
                        Error('No se puede ajustar el mismo concepto por kilo y por porcentaje');
                    if "Kilos brutos" <> 0 then
                        Error('No se puede ajustar el mismo concepto por kilo y por porcentaje');

                    "Ajuste por %" := true;
                    "Ajuste por Kilos" := false;

                end
                else begin

                    "Ajuste por %" := false;

                end;

                if ("Kilos netos" = 0) and ("Kilos brutos" = 0) then
                    "Ajuste por Kilos" := false;
            end;
        }
        field(8; "% Ajuste KB"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "% Ajuste KB" <> 0 then begin

                    if "Kilos netos" <> 0 then
                        Error('No se puede ajustar el mismo concepto por kilo y por porcentaje');
                    if "Kilos brutos" <> 0 then
                        Error('No se puede ajustar el mismo concepto por kilo y por porcentaje');

                    "Ajuste por %" := true;
                    "Ajuste por Kilos" := false;

                end
                else begin

                    "Ajuste por %" := false;

                end;

                if ("Kilos netos" = 0) and ("Kilos brutos" = 0) then
                    "Ajuste por Kilos" := false;
            end;
        }
        field(9; "Kilos netos"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Kilos netos" <> 0 then begin

                    if "% Ajuste KN" <> 0 then
                        Error('No se puede ajustar el mismo concepto por kilo y por porcentaje');
                    if "% Ajuste KB" <> 0 then
                        Error('No se puede ajustar el mismo concepto por kilo y por porcentaje');

                    "Ajuste por %" := false;
                    "Ajuste por Kilos" := true;

                end;
            end;
        }
        field(10; "Kilos brutos"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Kilos brutos" <> 0 then begin

                    if "% Ajuste KN" <> 0 then
                        Error('No se puede ajustar el mismo concepto por kilo y por porcentaje');
                    if "% Ajuste KB" <> 0 then
                        Error('No se puede ajustar el mismo concepto por kilo y por porcentaje');

                    "Ajuste por %" := false;
                    "Ajuste por Kilos" := true;

                end;
            end;
        }
        field(11; "Ajuste por %"; Boolean)
        {
            Editable = false;
        }
        field(12; "Ajuste por Kilos"; Boolean)
        {
            Editable = false;
        }
        field(13; "No. producto"; Code[20])
        {
            Editable = true;
            TableRelation = Item."No." WHERE("Item Category Code" = CONST('PESCA'));

            trigger OnValidate()
            begin
                Clear(rstItem);
                if rstItem.Get("No. producto") then begin

                    Subfamilia := rstItem.Subfamilia;
                    Descripción := rstItem.Description;
                    "Cód. unidad medida" := rstItem."Sales Unit of Measure";
                    /*  IF NOT INSERT THEN
                        MODIFY;
                     */
                end;

            end;
        }
        field(14; "Kilos Netos en remito"; Decimal)
        {
            CalcFormula = Sum("Mov. remitos"."Kilos netos" WHERE("No. documento" = FIELD("No. documento"),
                                                                  "No. producto" = FIELD("No. producto"),
                                                                  Buque = FIELD(FILTER(Buque)),
                                                                  Marea = FIELD(FILTER(Marea)),
                                                                  "No. reparto" = FIELD("No. reparto"),
                                                                  "Linea reparto" = FIELD("Linea reparto")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Kilos Brutos en remito"; Decimal)
        {
            CalcFormula = Sum("Mov. remitos"."Kilos brutos" WHERE("No. documento" = FIELD("No. documento"),
                                                                   "No. producto" = FIELD("No. producto"),
                                                                   Buque = FIELD(FILTER(Buque)),
                                                                   Marea = FIELD(FILTER(Marea)),
                                                                   "No. reparto" = FIELD("No. reparto"),
                                                                   "Linea reparto" = FIELD("Linea reparto")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Kilos Netos a enviar"; Decimal)
        {

            trigger OnValidate()
            begin

                CalcFields("Kilos Netos en remito");

                if "Kilos Netos a enviar" <> 0 then
                    Validate("% Ajuste KN", 100 - (("Kilos Netos a enviar" / "Kilos Netos en remito") * 100))
                else
                    Validate("% Ajuste KN", 0);
            end;
        }
        field(17; "Kilos Brutos a enviar"; Decimal)
        {

            trigger OnValidate()
            begin
                CalcFields("Kilos Brutos en remito");

                if "Kilos Brutos a enviar" <> 0 then
                    Validate("% Ajuste KB", 100 - (("Kilos Brutos a enviar" / "Kilos Brutos en remito") * 100))
                else
                    Validate("% Ajuste KB", 0);
            end;
        }
        field(18; "Cód. concepto ajuste"; Code[10])
        {
            Editable = false;
            TableRelation = "AFIP Interface Register";
        }
        field(19; "Descripción"; Text[100])
        {
            Editable = false;
        }
        field(20; "Cantidad en remito"; Decimal)
        {
            CalcFormula = Sum("Mov. remitos".Cantidad WHERE("No. documento" = FIELD("No. documento"),
                                                             "No. producto" = FIELD("No. producto"),
                                                             Buque = FIELD(FILTER(Buque)),
                                                             Marea = FIELD(FILTER(Marea)),
                                                             "No. reparto" = FIELD("No. reparto"),
                                                             "Linea reparto" = FIELD("Linea reparto")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Cantidad a enviar"; Decimal)
        {
        }
        field(22; "Lote origen"; Code[20])
        {
        }
        field(23; "Cantidad a reservar"; Decimal)
        {
        }
        field(24; "Kilos brutos a reservar"; Decimal)
        {
        }
        field(25; "Kilos netos a reservar"; Decimal)
        {
        }
        field(26; Buque; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            var
                l_rstDV: Record "Dimension Value";
            begin
                /*
                IF (Buque <> '') AND ("Lote origen"<>Buque+Marea) THEN
                BEGIN
                
                  VALIDATE("Lote origen",Buque+Marea);
                
                END;
                */

            end;
        }
        field(27; Marea; Code[10])
        {


            trigger OnValidate()
            begin
                /*
                IF (Buque <> '') AND ("Lote origen"<>Buque+Marea) THEN
                BEGIN
                
                  VALIDATE("Lote origen",Buque+Marea);
                
                END;
                */

            end;
        }
        field(28; "Cantidad en pedido"; Decimal)
        {
            CalcFormula = Sum("Sales Line".Quantity WHERE("Document No." = FIELD("Documento venta"),
                                                           "No." = FIELD("No. producto"),
                                                           "Shortcut Dimension 1 Code" = FIELD(Buque),
                                                           "Shortcut Dimension 2 Code" = FIELD(Marea),
                                                           "No. reparto" = FIELD("No. reparto"),
                                                           "Linea reparto" = FIELD("Linea reparto")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Kilos Netos en pedido"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Net kilos" WHERE("Document No." = FIELD("Documento venta"),
                                                              "No." = FIELD("No. producto"),
                                                              "Shortcut Dimension 1 Code" = FIELD(Buque),
                                                              "Shortcut Dimension 2 Code" = FIELD(Marea),
                                                              "No. reparto" = FIELD("No. reparto"),
                                                              "Linea reparto" = FIELD("Linea reparto")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Kilos Brutos en pedido"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Gross kilos" WHERE("Document No." = FIELD("Documento venta"),
                                                                "No." = FIELD("No. producto"),
                                                                "Shortcut Dimension 1 Code" = FIELD(Buque),
                                                                "Shortcut Dimension 2 Code" = FIELD(Marea),
                                                                "No. reparto" = FIELD("No. reparto"),
                                                                "Linea reparto" = FIELD("Linea reparto")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Location code"; Code[10])
        {
            Caption = 'Cód. depósito salida';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(100; Cliente; Text[50])
        {
        }
        field(101; "Tipo documento"; Option)
        {
            OptionMembers = Oferta,Pedido,Factura,"Nota d/c","Pedido abierto","Nota Débito";
        }
        field(102; "Documento venta"; Code[20])
        {
        }
        field(103; "Cód. unidad medida"; Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(104; "No. reparto"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(105; "Linea reparto"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(106; "Seguimiento para trazabilidad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";

            trigger OnValidate()
            var
                rst50563: Record "Mov. remitos";
            begin
                /*CLEAR(rst50563);
                IF Buque <> '' THEN
                  rst50563.SETRANGE(Buque,Buque);
                IF Marea <> '' THEN
                  rst50563.SETRANGE(Marea,Marea);
                rst50563.SETRANGE("No. producto","No. producto");
                //rstMovProd.SETRANGE(Open,TRUE);
                IF "Location code" <> '' THEN
                  rst50563.SETRANGE("Cód. depósito","Location code");
                IF rst50563.FINDSET THEN
                  ERROR('Se han encontrado reservas para esta línea, por favor elimínelas.');
                  */

            end;
        }
        field(107; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Clear(rstMovRemitos);
                rstMovRemitos.SetRange("No. documento", "No. documento");
                rstMovRemitos.SetRange("Linea reparto", "Linea reparto");
                if rstMovRemitos.FindFirst then begin

                    if "DCL application date formula" <> rstMovRemitos."DCL application date formula" then
                        if Confirm('Está cambiando el valor del campo ' + FieldCaption("DCL application date formula") + ' pero ya ha realizado una reserva.\' +
                              'Si prosigue, se eliminará la reserva realizada para esta línea. ¨Desea continuar?', true) then
                            rstMovRemitos.DeleteAll;

                end;
            end;
        }
    }

    keys
    {
        key(Key1; "No. documento", "No. producto", Buque, Marea, "Lote origen", "Seguimiento para trazabilidad")
        {
            Clustered = true;
            SumIndexFields = "Kilos Netos a enviar", "Kilos Brutos a enviar";
        }
        key(Key2; "No. documento", "Lote origen", "Descripción")
        {
            SumIndexFields = "Kilos Netos a enviar", "Kilos Brutos a enviar";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        fntVerificarRemitos;
    end;

    trigger OnInsert()
    begin
        fntGetHeader;
        "Carpeta exportación" := rstCabAjuste."Carpeta de Exportación";
        "Permiso embarque" := rstCabAjuste."Permiso de embarque";
        "Cód. concepto ajuste" := rstCabAjuste."Cód. concepto ajuste";

        "No. documento" := rstCabAjuste."No. documento";
        "Tipo documento" := rstCabAjuste."Tipo documento";
        "Documento venta" := rstCabAjuste."Documento venta";
        "No. reparto" := rstCabAjuste."No. reparto";
    end;

    trigger OnModify()
    begin
        fntVerificarRemitos;
    end;

    var
        rstLinVenta: Record "Sales Line";
        rstCabAjuste: Record "Cab. remito ventas";
        rstItem: Record Item;
        rstMovRemitos: Record "Mov. remitos";

    [Scope('OnPrem')]
    procedure fntAjustarReparto(rstAjuste: Record "Lín. ajuste ventas"): Boolean
    var
        rstLinVenta: Record "Sales Line";
        rstLinVenta2: Record "Sales Line";
        intLinea: Integer;
        dlgVentana: Dialog;
        rstAju: Record "Lín. ajuste ventas";
    begin
        /*fntEliminarAjustes(rstAjuste);
        intLinea := 1;
        CLEAR(rstLinVenta);
        dlgVentana.OPEN('Reparto:  #1#################\'+
                        'Familia:  #2#################\'+
                        'Línea:    #3#################');
        
        CLEAR(rstAju);
        rstAju.SETRANGE(rstAju."No. documento",rstAjuste."No. documento");
        IF rstAju.FIND('-') THEN
        REPEAT
        
          CLEAR(rstLinVenta);
          rstLinVenta.SETCURRENTKEY(rstLinVenta."No. documento");
          rstLinVenta.SETRANGE(rstLinVenta."Tipo documento",rstAju.fntAjustarReparto);
          rstLinVenta.SETRANGE("No. documento",rstAju."No. documento");
          rstLinVenta.SETRANGE(Tipo,rstLinVenta.Tipo::Producto);
          IF rstAju.Subfamilia <> '' THEN
            rstLinVenta.SETRANGE(Subfamilia,rstAju.Subfamilia);
          IF rstAju."Línea venta" <> 0 THEN
            rstLinVenta.SETRANGE("No. línea",rstAju."Línea venta");
          IF rstAju."No. Producto" <> '' THEN
            rstLinVenta.SETRANGE(rstLinVenta."No",rstAju."No. Producto");
          IF rstLinVenta.FIND('-') THEN
          REPEAT
        
            rstLinVenta.TESTFIELD(rstLinVenta."Cdad k.n. enviada",0);
            rstLinVenta.TESTFIELD(rstLinVenta."Cdad k.b. enviada",0);
        
            IF rstAju."Ajuste por %" THEN
            BEGIN
        
              dlgVentana.UPDATE(1,rstLinVenta."No. documento");
              dlgVentana.UPDATE(2,rstLinVenta.Subfamilia);
              dlgVentana.UPDATE(3,rstLinVenta."No. línea");
              rstLinVenta.VALIDATE(Confirmada,FALSE);
              rstLinVenta.VALIDATE(rstLinVenta."% Dto. KN",rstAju."% Ajuste KN");
              rstLinVenta.VALIDATE(rstLinVenta."% Dto. KB",rstAju."% Ajuste KB");
              rstLinVenta.VALIDATE("% Dto. cantidad");
              rstLinVenta.VALIDATE(Confirmada,TRUE);
              rstLinVenta.MODIFY;
        
              fntGenerarLinea(rstLinVenta,intLinea);
        
            END;
        
            IF rstAju."Ajuste por Kilos" THEN
            BEGIN
        
              dlgVentana.UPDATE(1,rstLinVenta."No. documento");
              dlgVentana.UPDATE(2,rstLinVenta.Subfamilia);
              dlgVentana.UPDATE(3,rstLinVenta."No. línea");
              rstLinVenta.VALIDATE(Confirmada,FALSE);
              rstLinVenta.VALIDATE("KN ajuste",rstAju."Kilos netos");
              rstLinVenta.VALIDATE("KB ajuste",rstAju."Kilos brutos");
              rstLinVenta.VALIDATE("% Dto. cantidad");
              rstLinVenta.VALIDATE(Confirmada,TRUE);
              rstLinVenta.MODIFY;
        
              CLEAR(rstLinVenta2);
              rstLinVenta2.RESET;
              rstLinVenta2.INIT;
              rstLinVenta2.TRANSFERFIELDS(rstLinVenta);
              rstLinVenta2.VALIDATE(Confirmada,FALSE);
              rstLinVenta2."No. línea" := intLinea+rstLinVenta."No. línea";
              rstLinVenta2.Tipo := rstLinVenta.Tipo::Ajuste;
              rstLinVenta2.VALIDATE(Cantidad,0);
              rstLinVenta2.VALIDATE("Precio venta",0);
              rstLinVenta2.VALIDATE("Precio coste (DL)",0);
              rstLinVenta2.VALIDATE("Precio x Kilo",0);
              rstLinVenta2.VALIDATE("Kilos Brutos",rstLinVenta."KB ajuste");
              rstLinVenta2.VALIDATE("Kilos netos",rstLinVenta."KN ajuste");
              rstLinVenta2."% Dto. KN":=rstAju."% Ajuste KN";
              rstLinVenta2."% Dto. KB":=rstAju."% Ajuste KB";
              rstLinVenta2."KN ajuste" := 0;
              rstLinVenta2."KB ajuste" := 0;
              rstLinVenta2.VALIDATE("Cód. concepto ajuste",rstAju."No. documento");
              rstLinVenta2.VALIDATE(Confirmada,TRUE);
              rstLinVenta2.INSERT;
        
            END;
        
          UNTIL rstLinVenta.NEXT = 0;
        
        UNTIL rstAju.NEXT = 0;
        
        dlgVentana.CLOSE;
        MESSAGE('Reparto ajustado');
                                    */

    end;

    [Scope('OnPrem')]
    procedure fntEliminarAjustes(rstAjuste: Record "Lín. ajuste ventas")
    var
        rstLinVenta: Record "Sales Line";
        rstLinVenta2: Record "Sales Line";
        intLinea: Integer;
        rstAju: Record "Lín. ajuste ventas";
    begin
        /*//Limpio los ajustes previos
        
        CLEAR(rstLinVenta);
        rstLinVenta.SETRANGE("Tipo documento",rstAjuste.fntAjustarReparto);
        rstLinVenta.SETRANGE("No. documento",rstAjuste."No. documento");
        rstLinVenta.SETRANGE(Tipo,rstLinVenta.Tipo::Producto);
        IF rstLinVenta.FIND('-') THEN
        REPEAT
        
          rstLinVenta.Confirmada := FALSE;
          rstLinVenta."% Dto. KN" := 0;
          rstLinVenta."% Dto. KB" := 0;
          rstLinVenta.VALIDATE("% Dto. cantidad");
          rstLinVenta."KN ajuste" := 0;
          rstLinVenta."KB ajuste" := 0;
          rstLinVenta.Confirmada := TRUE;
          rstLinVenta.MODIFY;
        
        UNTIL rstLinVenta.NEXT = 0;
        
        CLEAR(rstLinVenta);
        rstLinVenta.SETRANGE("Tipo documento",rstAjuste.fntAjustarReparto);
        rstLinVenta.SETRANGE("No. documento",rstAjuste."No. documento");
        rstLinVenta.SETRANGE(Tipo,rstLinVenta.Tipo::Ajuste);
        rstLinVenta.DELETEALL;
         */

    end;

    [Scope('OnPrem')]
    procedure fntGenerarLinea(rstLinVenta: Record "Sales Line"; intLinea: Integer)
    var
        rstLinVenta2: Record "Sales Line";
    begin
        /*ñCLEAR(rstLinVenta2);
        rstLinVenta2.TRANSFERFIELDS(rstLinVenta);
        rstLinVenta2.VALIDATE(Confirmada,FALSE);
        rstLinVenta2."No. línea" := intLinea+(rstLinVenta."No. línea"/10000);
        rstLinVenta2.Tipo := rstLinVenta.Tipo::Ajuste;
        rstLinVenta2.VALIDATE(Cantidad,0);
        rstLinVenta2.VALIDATE("Precio venta",0);
        rstLinVenta2.VALIDATE("Precio coste (DL)",0);
        rstLinVenta2.VALIDATE("Precio x Kilo",0);
        rstLinVenta2.VALIDATE("Kilos Brutos",rstLinVenta."KB ajuste");
        rstLinVenta2.VALIDATE("Kilos netos",rstLinVenta."KN ajuste");
        rstLinVenta2."% Dto. KN":=rstLinVenta."% Dto. KN";
        rstLinVenta2."% Dto. KB":=rstLinVenta."% Dto. KB";
        rstLinVenta2."KN ajuste" := 0;
        rstLinVenta2."KB ajuste" := 0;
        rstLinVenta2.VALIDATE("Cód. concepto ajuste","Cód. concepto ajuste");
        rstLinVenta2.VALIDATE(Confirmada,TRUE);
        rstLinVenta2."Línea ajustada" := rstLinVenta."No. línea";
        rstLinVenta2.INSERT;
         */

    end;

    [Scope('OnPrem')]
    procedure fntGetHeader()
    begin
        Clear(rstCabAjuste);
        rstCabAjuste.Get("No. documento");
    end;

    local procedure fntVerificarRemitos()
    var
        rstMovRemito: Record "Mov. remitos";
    begin
        Clear(rstMovRemito);
        rstMovRemito.SetRange("No. documento", "No. documento");
        rstMovRemito.SetRange(Buque, Buque);
        rstMovRemito.SetRange(Marea, Marea);
        rstMovRemito.SetRange("Lote origen", "Lote origen");
        rstMovRemito.SetRange("No. producto", "No. producto");
        rstMovRemito.SetRange("No. reparto", "No. reparto");
        rstMovRemito.SetRange("Linea reparto", "Linea reparto");
        rstMovRemito.SetRange("Cód. depósito", "Location code");
        rstMovRemito.SetRange("Seguimiento para trazabilidad", "Seguimiento para trazabilidad");
        if not rstMovRemito.IsEmpty() then
            if Confirm('Si modifica esta línea, se eliminará el picking existente.') then
                rstMovRemito.DeleteAll;
    end;
}

