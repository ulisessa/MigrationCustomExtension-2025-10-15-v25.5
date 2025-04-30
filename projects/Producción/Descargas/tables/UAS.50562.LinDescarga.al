table 50562 "Lín. descarga"
{

    fields
    {
        field(1; "No. proyecto"; Code[20])
        {
            TableRelation = Job WHERE(Tipo = CONST(Productivo),
                                       Blocked = CONST(" "));

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                rstProyecto.Get("No. proyecto");
                Buque := rstProyecto."Global Dimension 1 Code";
                Marea := rstProyecto."Global Dimension 3 Code";
            end;
        }
        field(2; "No. remito"; Code[20])
        {
            NotBlank = true;


        }
        field(3; "Line no."; Integer)
        {
            AutoIncrement = true;
            NotBlank = true;
        }
        field(4; "Item no."; Code[20])
        {
            Caption = 'Clasificación';
            TableRelation = Item."No." WHERE(Captura = CONST(true),
                                              Blocked = CONST(false));

            trigger OnValidate()
            begin
                Clear(rstProducto);
                if rstProducto.Get("Item no.") then begin

                    Description := rstProducto.Description;
                    "Unidad medida" := rstProducto."Base Unit of Measure";
                    Actividad := rstProducto."Global Dimension 2 Code";
                    Familia := rstProducto.Familia;
                    Subfamilia := rstProducto.Subfamilia;

                end;
            end;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Descripción';
        }
        field(6; "Unidad medida"; Code[10])
        {
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item no."));
        }
        field(7; Cantidad; Decimal)
        {

            trigger OnValidate()
            begin
                Clear(rstUMxProd);
                rstUMxProd.Get("Item no.", "Unidad medida");

                rstProducto.Get("Item no.");
                if (rstProducto."Utiliza Tarifario") then begin

                    Validate("Gross weight", rstLinDiaProd.FunCalcPesoBruto(Cantidad, "Item no.", rstUMxProd."Qty. per Unit of Measure"));
                    Validate("Net weight", rstLinDiaProd.FunCalcPesoNeto(Cantidad, "Item no.", rstUMxProd."Qty. per Unit of Measure"));

                end;

                fntPromedio;
            end;
        }
        field(8; "Net weight"; Decimal)
        {
            Caption = 'Kilos netos';

            trigger OnValidate()
            begin
                fntPromedio;
            end;
        }
        field(9; "Gross weight"; Decimal)
        {
            Caption = 'Kilos brutos';
        }
        field(10; "Fecha remito"; Date)
        {
        }
        field(11; "Transport's license"; Code[10])
        {
            Caption = 'Transporte matrícula';
        }
        field(12; Temperatura; Decimal)
        {
        }
        field(13; "Hora de ingreso"; Time)
        {
        }
        field(14; "Tipo de amparo sanitario"; Option)
        {
            BlankZero = true;
            OptionMembers = ,"P.T.","P.T.R.","C.S.E.P.","Guía de tránsito";
        }
        field(15; "No. amparo sanitario"; Code[30])
        {
        }
        field(16; Destino; Code[30])
        {
        }
        field(17; "No. Pallet"; Code[20])
        {
        }
        field(18; Location; Code[10])
        {
            Caption = 'Cámara';
            TableRelation = Location;
        }
        field(19; Buque; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(20; Marea; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(21; Puerto; Code[10])
        {
        }
        field(22; Promedio; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Bin code"; Code[20])
        {
            Caption = 'Ubicación';
            DataClassification = ToBeClassified;
            TableRelation = Bin.Code WHERE("Location Code" = FIELD(Location));
        }
        field(24; Tare; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Gross + Tare"; Decimal)
        {
            Caption = 'Bruto + tara';
            DataClassification = ToBeClassified;
        }
        field(26; "Weighing Date and Time"; DateTime)
        {
            Caption = 'Fecha y hora pesada';
            DataClassification = ToBeClassified;
        }
        field(27; Confirmed; Option)
        {
            Caption = 'Confirmado';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Pesar activamente",Confirmada,Reabrir;
        }
        field(28; Status; Text[50])
        {
            Caption = 'Estado';
            DataClassification = ToBeClassified;
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
        field(60000; "Manual unit of measure"; Code[10])
        {
            Caption = 'Unidad medida manual';
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item no."));
        }
        field(60001; "Manual weight"; Decimal)
        {
            Caption = 'Peso manual';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. proyecto", "Line no.")
        {
            Clustered = true;
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key2; "No. proyecto", "Item no.")
        {
            SQLIndex = "No. proyecto", "Item no.";
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key3; "No. proyecto", Subfamilia)
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key4; "No. proyecto", "Unidad medida")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key5; "No. proyecto", "No. remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key6; "No. proyecto", "No. Pallet")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key7; Actividad)
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key8; Buque, Actividad)
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key9; Buque, "Item no.", "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key10; Buque, Actividad, "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key11; Puerto, Buque, "Item no.", "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key12; Puerto, Buque, Actividad, "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key13; Actividad, Subfamilia, Buque, "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key14; Subfamilia, Puerto, Buque, Actividad, "Fecha remito")
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
        key(Key15; Subfamilia, Puerto, Buque, Actividad, "Fecha remito", Marea)
        {
            SumIndexFields = Cantidad, "Net weight", "Gross weight";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        rst32: Record "Item Ledger Entry";
    begin
        Clear(rst32);
        rst32.SetRange(rst32."Item No.", "Item no.");
        rst32.SetRange("Job No.", "No. proyecto");
        rst32.SetRange(Revertido, false);
        if (not rst32.IsEmpty) then
            Error('Existen registros para esta descarga, no puede eliminarla.');
    end;

    trigger OnInsert()
    begin
        Clear(rstCabDesc);
        rstCabDesc.Get("No. proyecto");
        Validate("No. proyecto", rstCabDesc."No. proyecto");
        if Location = '' then
            Location := rstCabDesc.Location;
        Puerto := rstCabDesc.Puerto;
    end;

    var
        rstProducto: Record Item;
        rstCabecera: Record "Cab. descarga";
        rstUMxProd: Record "Item Unit of Measure";
        rstLinDiaProd: Record "Item Journal Line";
        rstCabDesc: Record "Cab. descarga";
        rstProyecto: Record Job;
        frmListaProd: Page "Item List";

    [Scope('OnPrem')]
    procedure Navigate()
    var
        NavigateForm: Page Navigate;
    begin
        NavigateForm.SetDoc("Fecha remito", "No. remito");
        NavigateForm.Run;
    end;

    local procedure fntPromedio()
    begin
        if (Cantidad <> 0)
          and
           ("Net weight" <> 0)
           then
            Promedio := Round("Net weight" / Cantidad, 0.01)
        else
            Promedio := 0;
    end;
}

