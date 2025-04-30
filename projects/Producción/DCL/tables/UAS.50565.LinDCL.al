table 50565 "Lín. DCL"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            TableRelation = Job WHERE(Tipo = CONST(Productivo),
                                       Blocked = CONST(" "));
        }
        field(2; "No. línea"; Integer)
        {
        }
        field(3; "Clasificación"; Code[20])
        {
            TableRelation = Item."No." WHERE(Captura = CONST(true),
                                              Blocked = CONST(false));

            trigger OnValidate()
            begin
                Clear(rstProducto);
                if rstProducto.Get(Clasificación) then begin

                    Descripción := rstProducto.Description;
                    "Unidad medida" := rstProducto."Base Unit of Measure";
                    Actividad := rstProducto."Global Dimension 2 Code";
                    Familia := rstProducto.Familia;
                    Subfamilia := rstProducto.Subfamilia;
                    TestField(Descripción);
                    TestField("Unidad medida");
                    TestField(Actividad);
                    TestField(Familia);
                    TestField(Subfamilia);
                    fntGetCab;
                    if "Fecha DCL" = 0D then
                        Validate("Fecha DCL", rstCabDCL."Fecha de inicio de descarga");
                    TestField("Fecha DCL");
                end;
            end;
        }
        field(4; "Descripción"; Text[150])
        {
        }
        field(5; "Unidad medida"; Code[10])
        {
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Clasificación"));
        }
        field(6; Cantidad; Decimal)
        {

            trigger OnValidate()
            begin
                //TESTFIELD("Applied kilos",0);

                Clear(rstUMxProd);
                rstUMxProd.Get(Clasificación, "Unidad medida");

                rstProducto.Get(Clasificación);
                if (rstProducto."Utiliza Tarifario") then begin

                    Validate("Kilos netos", rstLinDiaProd.FunCalcPesoNeto(Cantidad, Clasificación, rstUMxProd."Qty. per Unit of Measure"));

                end;

                fntPromedio;
            end;
        }
        field(7; "Kilos netos"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //TESTFIELD("Applied kilos",0);

                fntPromedio;
            end;
        }
        field(8; Promedio; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Cliente; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            var
                rstCliente: Record "Dimension Value";
                rstGS: Record "General Ledger Setup";
            begin
                Clear(rstCliente);
                Clear(rstGS);
                rstGS.Get();
                if rstCliente.Get(rstGS."Global Dimension 1 Code", Cliente) then
                    "Nombre cliente" := rstCliente.Name
                else
                    "Nombre cliente" := '';
            end;
        }
        field(10; "Nombre cliente"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Referencia; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Applied kilos"; Decimal)
        {
            CalcFormula = Sum("DCL Application Lines"."Origin kilos" WHERE("DCL Job no." = FIELD("No. proyecto"),
                                                                            Activity = FIELD(Actividad),
                                                                            "Original Item no." = FIELD("Clasificación")));
            Caption = 'Kilos aplicados';
            FieldClass = FlowField;
        }
        field(13; "Fecha DCL"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Reparto relacionado"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Cab. Reparto"."No. Documento";

            trigger OnValidate()
            begin
                TestField("Kilos netos");
                if ("Kilos netos" > 0) then
                    Error('Sólo debe vincular un descuento a un Reparto cuando está realizando un descuento manual.');
            end;
        }
        field(50000; Actividad; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50001; Familia; Code[10])
        {
            TableRelation = Family;
        }
        field(50002; Subfamilia; Code[10])
        {
            TableRelation = "Subfamilia producto".Code WHERE("Family code" = FIELD(Familia));
        }
        field(50003; Registrado; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Cajones acordados"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                fntImporteAcordado
            end;
        }
        field(50010; "Promedio acordado"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                fntImporteAcordado;
            end;
        }
        field(50011; "Valor por kilo acordado"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                fntImporteAcordado;
            end;
        }
        field(50012; "Importe acordado esperado"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50013; "Kilos acordados"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. proyecto", "No. línea")
        {
            Clustered = true;
            SumIndexFields = Cantidad;
        }
        key(Key2; "No. proyecto", "Clasificación")
        {
            SumIndexFields = Cantidad;
        }
        key(Key3; "No. proyecto", Subfamilia)
        {
            SumIndexFields = Cantidad;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Registrado then
            Error('No puede eliminar una línea del DCL original. Para eliminar esta línea, primero tiene que revertir el registro.');
    end;

    trigger OnInsert()
    begin
        Clear(rstCliPred);
        rstCliPred.Get();

        Validate(Cliente, rstCliPred."DCL local customer");
        fntGetCab;
        if "Fecha DCL" = 0D then
            Validate("Fecha DCL", rstCabDCL."Fecha de inicio de descarga");
    end;

    trigger OnModify()
    begin
        /*
        IF Registrado THEN
          ERROR('No puede modificar una línea del DCL original. Para modificar esta línea, primero tiene que revertir el registro.');
          */

    end;

    trigger OnRename()
    begin
        if Registrado then
            Error('No puede modificar una línea del DCL original. Para modificar esta línea, primero tiene que revertir el registro.');
    end;

    var
        rstProducto: Record Item;
        rstCabecera: Record "Cab. informe capitán";
        frmListaProd: Page "Item List";
        rstUMxProd: Record "Item Unit of Measure";
        rstLinDiaProd: Record "Item Journal Line";
        rstCliPred: Record "Sales & Receivables Setup";
        rstCabDCL: Record "Cab. DCL";

    local procedure fntPromedio()
    begin
        if (Cantidad <> 0)
          and
           ("Kilos netos" <> 0)
           then
            Promedio := Round("Kilos netos" / Cantidad, 0.01)
        else
            Promedio := 0;
    end;

    local procedure fntImporteAcordado()
    begin
        "Kilos acordados" := "Cajones acordados" * "Promedio acordado";
        if ("Kilos acordados" <> 0) and ("Valor por kilo acordado" <> 0) then
            "Importe acordado esperado" := "Kilos acordados" * "Valor por kilo acordado"
        else
            "Importe acordado esperado" := 0;
    end;

    local procedure fntGetCab()
    begin
        Clear(rstCabDCL);
        rstCabDCL.Get("No. proyecto");
    end;
}

