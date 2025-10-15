table 50212 "Modificadores Costos"
{

    fields
    {
        field(1; "Tipo registro"; Option)
        {
            NotBlank = true;
            OptionMembers = " ","Proyecto presupuestado","Registro presupuestado","Actividad comercial",Nomina;
        }
        field(2; Proyecto; Code[20])
        {
            NotBlank = true;
            TableRelation = Job;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                Clear(rstProyecto);
                if rstProyecto.Get(Proyecto) then begin

                    rstProyecto.CalcFields("Importe contabilizado DA", "Kilos netos descargados");
                    Buque := rstProyecto."Global Dimension 1 Code";
                    Marea := rstProyecto."Global Dimension 2 Code";
                    "Forma de reparto" := rstProyecto."Forma de reparto";
                    "Criterio de reparto" := rstProyecto."Criterio de reparto";
                    "Starting date" := rstProyecto."Starting Date";
                    "Ending date" := rstProyecto."Ending Date";
                    "Kilos capturados" := rstProyecto."Kilos netos descargados";
                    "Días de marea proyecto" := rstProyecto."Dias de mar reales";
                    Actividad := rstProyecto."Global Dimension 3 Code";
                    if ("Starting date" <> 0D) and ("Ending date" <> 0D) then
                        "Días de marea anuales" := fntDiasAnuales;

                    if rstProyecto."Cuenta Informe Costos" <> '' then
                        Validate("No. cuenta", rstProyecto."Cuenta Informe Costos");

                end;
            end;
        }
        field(3; Buque; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(4; Marea; Code[10])
        {

        }
        field(5; "Forma de reparto"; Option)
        {
            OptionMembers = " ",Estructura,"Por departamento","Por actividad";
        }
        field(6; "Criterio de reparto"; Option)
        {
            OptionMembers = " ","Por días marea","Por kilos","Por Importe";
        }
        field(7; "Starting date"; Date)
        {
            Caption = 'Fecha inicio';

            trigger OnValidate()
            begin
                if ("Starting date" <> 0D) and ("Ending date" <> 0D) then
                    Validate("Días de marea proyecto", "Ending date" - "Starting date" + 1);
            end;
        }
        field(8; "Ending date"; Date)
        {
            Caption = 'Fecha fin';

            trigger OnValidate()
            begin
                if ("Starting date" <> 0D) and ("Ending date" <> 0D) then
                    Validate("Días de marea proyecto", "Ending date" - "Starting date" + 1);
            end;
        }
        field(9; "Kilos capturados"; Decimal)
        {
        }
        field(10; "USD a proyecto"; Decimal)
        {
        }
        field(11; "No. cuenta"; Code[20])
        {
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                Clear(rstCuenta);
                rstCuenta.Get("No. cuenta");

                "Nombre de cuenta" := rstCuenta.Name;
                "Grupo de cuenta" := rstCuenta."Grupo Informe Costos";
                "Denominación de costos" := rstCuenta."Denominación común costos";
                "Fecha modificada" := CalcDate('<-CY>', Today);
            end;
        }
        field(12; "No. documento"; Code[50])
        {
        }
        field(13; "Nombre de cuenta"; Text[99])
        {
        }
        field(14; "Grupo de cuenta"; Text[99])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('GRUPO COSTOS'));
        }
        field(15; "Denominación de costos"; Text[99])
        {
        }
        field(16; "USD registrados"; Decimal)
        {
        }
        field(17; "Días de marea proyecto"; Decimal)
        {

            trigger OnValidate()
            begin
                "Año modificado" := Date2DMY("Ending date", 3);
                "Días de marea anuales" := fntDiasAnuales;
            end;
        }
        field(18; "Días de marea anuales"; Integer)
        {
        }
        field(19; "Fecha modificada"; Date)
        {

            trigger OnValidate()
            begin
                "Año modificado" := Date2DMY("Fecha modificada", 3);
            end;
        }
        field(20; "Año modificado"; Integer)
        {
        }
        field(21; Actividad; Code[20])
        {
        }
        field(22; "Automático"; Boolean)
        {
        }
        field(23; "Source code"; Code[10])
        {
            Caption = 'Cód. origen';
            TableRelation = Vendor;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(24; "Source name"; Text[50])
        {
            Caption = 'Nombre origen';
        }
        field(25; "Amount in VLE"; Decimal)
        {
            Caption = 'Importe en VLE';
        }
        field(26; "USD promedio"; Decimal)
        {
        }
        field(27; "Desviación"; Decimal)
        {
        }
        field(28; "Kilos capturados período"; Decimal)
        {
        }
        field(29; "Kilos capturados promedio"; Decimal)
        {
        }
        field(30; "Proyectos en período"; Decimal)
        {
        }
        field(31; "USD período"; Decimal)
        {
        }
        field(32; "USD período promedio"; Decimal)
        {
        }
        field(33; "$ registrados"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';
            DataClassification = ToBeClassified;

        }
        field(35; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';
            DataClassification = ToBeClassified;

        }
        field(36; "Global Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            DataClassification = ToBeClassified;

        }
        field(37; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            DataClassification = ToBeClassified;

        }
        field(38; "Vendor no."; Code[10])
        {
            Caption = 'No. proveedor';
            DataClassification = ToBeClassified;
        }
        field(39; "Vendor name"; Text[30])
        {
            Caption = 'Nombre proveedor';
            DataClassification = ToBeClassified;
        }
        field(40; "Entry no."; Integer)
        {
            Caption = 'No. movimiento';
            DataClassification = ToBeClassified;
        }
        field(41; "GLE Entry no."; Integer)
        {
            Caption = 'No. movimiento contable';
            DataClassification = ToBeClassified;
        }
        field(42; "Fecha oficializacion"; Date)
        {
            Caption = 'Fecha oficialización';
            DataClassification = ToBeClassified;
        }
        field(43; "Fecha cumplido"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Proyecto de origen"; Code[14])
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Fecha descarga origen"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Grupo Informe Costos"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('GRUPO COSTOS'));
        }
    }

    keys
    {
        key(Key1; "Tipo registro", Proyecto, Buque, Marea, "No. cuenta", "Fecha modificada", "No. documento", "USD registrados", "Entry no.")
        {
            Clustered = true;
            SumIndexFields = "Días de marea proyecto";
        }
        key(Key2; Proyecto, Buque, Marea, "No. cuenta", "No. documento")
        {
        }
        key(Key3; "Tipo registro", Proyecto, Buque, "Año modificado")
        {
            SumIndexFields = "Días de marea proyecto";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Clear(rstModifCosto);
        if "Tipo registro" = "Tipo registro"::"Proyecto presupuestado" then begin

            rstModifCosto.SetRange(rstModifCosto."Tipo registro", rstModifCosto."Tipo registro"::"Registro presupuestado");
            rstModifCosto.SetRange(Proyecto, Proyecto);
            rstModifCosto.DeleteAll;

        end;
    end;

    trigger OnInsert()
    begin
        /*
        IF "Tipo registro" = "Tipo registro"::"Registro presupuestado" THEN
        BEGIN
        
          CLEAR(rstModifCosto);
          rstModifCosto.SETRANGE(rstModifCosto."Tipo registro",rstModifCosto."Tipo registro"::"Proyecto presupuestado");
          rstModifCosto.SETRANGE(Proyecto,Proyecto);
          rstModifCosto.FIND('-');
          "Starting date" := rstModifCosto."Starting date";
          "Ending date" :=rstModifCosto."Ending date";
          "Fecha modificada" := rstModifCosto."Fecha modificada";
          "Año modificado" := rstModifCosto."Año modificado";
          Actividad := rstModifCosto.Actividad;
        
        END;
        */

    end;

    var
        rstDep: Record "Country/Region Translation";
        rstProyecto: Record Job;
        rstCuenta: Record "G/L Account";
        rstProyDias: Record Job;
        rstProyDiasP: Record "Modificadores Costos";
        rstModifCosto: Record "Modificadores Costos";

    [Scope('OnPrem')]
    procedure fntDiasAnuales(): Decimal
    var
        decDias: Decimal;
    begin
        decDias := 0;

        Clear(rstProyDias);
        rstProyDias.SetRange(Tipo, rstProyDias.Tipo::Productivo);
        rstProyDias.SetRange("Global Dimension 1 Code", Buque);
        rstProyDias.SetRange(Tipo, 1);
        rstProyDias.SetRange("Year tide", "Año modificado");
        if rstProyDias.FindSet then
            repeat

                decDias += rstProyDias."Dias de mar reales";

            until rstProyDias.Next = 0;

        Clear(rstProyDiasP);
        rstProyDiasP.SetRange(Buque, Buque);
        rstProyDiasP.SetRange("Tipo registro", 1);
        rstProyDiasP.SetRange("Año modificado", "Año modificado");
        rstProyDiasP.SetFilter(rstProyDiasP.Proyecto, '<>%1', Proyecto);
        if rstProyDiasP.FindSet then
            repeat

                Clear(rstProyDias);
                rstProyDias.Get(rstProyDiasP.Proyecto);
                if rstProyDias.Tipo = rstProyDias.Tipo::Productivo then
                    decDias += rstProyDiasP."Días de marea proyecto";

            until rstProyDiasP.Next = 0;

        decDias += "Ending date" - "Starting date" + 1;

        exit(decDias);
    end;
}

