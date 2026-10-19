table 50212 "Modificadores Costos"
{

    fields
    {
        field(1; "Tipo registro"; Option)
        {
            Caption = 'Tipo registro';
            ToolTip = 'Specifies the value of the Tipo registro field.';
            NotBlank = true;
            OptionMembers = " ","Proyecto presupuestado","Registro presupuestado","Actividad comercial",Nomina;
        }
        field(2; Proyecto; Code[20])
        {
            Caption = 'Proyecto';
            ToolTip = 'Specifies the value of the Proyecto field.';
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
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(4; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

        }
        field(5; "Forma de reparto"; Option)
        {
            Caption = 'Forma de reparto';
            ToolTip = 'Specifies the value of the Forma de reparto field.';
            OptionMembers = " ",Estructura,"Por departamento","Por actividad";
        }
        field(6; "Criterio de reparto"; Option)
        {
            Caption = 'Criterio de reparto';
            ToolTip = 'Specifies the value of the Criterio de reparto field.';
            OptionMembers = " ","Por días marea","Por kilos","Por Importe";
        }
        field(7; "Starting date"; Date)
        {
            Caption = 'Fecha inicio';
            ToolTip = 'Specifies the value of the Fecha inicio field.';

            trigger OnValidate()
            begin
                if ("Starting date" <> 0D) and ("Ending date" <> 0D) then
                    Validate("Días de marea proyecto", "Ending date" - "Starting date" + 1);
            end;
        }
        field(8; "Ending date"; Date)
        {
            Caption = 'Fecha fin';
            ToolTip = 'Specifies the value of the Fecha fin field.';

            trigger OnValidate()
            begin
                if ("Starting date" <> 0D) and ("Ending date" <> 0D) then
                    Validate("Días de marea proyecto", "Ending date" - "Starting date" + 1);
            end;
        }
        field(9; "Kilos capturados"; Decimal)
        {
            Caption = 'Kilos capturados';
            ToolTip = 'Specifies the value of the Kilos capturados field.';
        }
        field(10; "USD a proyecto"; Decimal)
        {
            Caption = 'USD a proyecto';
            ToolTip = 'Specifies the value of the USD a proyecto field.';
        }
        field(11; "No. cuenta"; Code[20])
        {
            Caption = 'No. cuenta';
            ToolTip = 'Specifies the value of the No. cuenta field.';
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
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(13; "Nombre de cuenta"; Text[99])
        {
            Caption = 'Nombre de cuenta';
            ToolTip = 'Specifies the value of the Nombre de cuenta field.';
        }
        field(14; "Grupo de cuenta"; Text[99])
        {
            Caption = 'Grupo de cuenta';
            ToolTip = 'Specifies the value of the Grupo de cuenta field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('GRUPO COSTOS'));
        }
        field(15; "Denominación de costos"; Text[99])
        {
            Caption = 'Denominación de costos';
            ToolTip = 'Specifies the value of the Denominación de costos field.';
        }
        field(16; "USD registrados"; Decimal)
        {
            Caption = 'USD registrados';
            ToolTip = 'Specifies the value of the USD registrados field.';
        }
        field(17; "Días de marea proyecto"; Decimal)
        {
            Caption = 'Días de marea proyecto';
            ToolTip = 'Specifies the value of the Días de marea proyecto field.';

            trigger OnValidate()
            begin
                "Año modificado" := Date2DMY("Ending date", 3);
                "Días de marea anuales" := fntDiasAnuales;
            end;
        }
        field(18; "Días de marea anuales"; Integer)
        {
            Caption = 'Días de marea anuales';
            ToolTip = 'Specifies the value of the Días de marea anuales field.';
        }
        field(19; "Fecha modificada"; Date)
        {
            Caption = 'Fecha modificada';
            ToolTip = 'Specifies the value of the Fecha modificada field.';

            trigger OnValidate()
            begin
                "Año modificado" := Date2DMY("Fecha modificada", 3);
            end;
        }
        field(20; "Año modificado"; Integer)
        {
            Caption = 'Año modificado';
            ToolTip = 'Specifies the value of the Año modificado field.';
        }
        field(21; Actividad; Code[20])
        {
            Caption = 'Actividad';
            ToolTip = 'Specifies the value of the Actividad field.';
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(22; "Automático"; Boolean)
        {
            Caption = 'Automático';
            ToolTip = 'Specifies the value of the Automático field.';
        }
        field(23; "Source code"; Code[10])
        {
            Caption = 'Source Code';
            ToolTip = 'Specifies the value of the Source Code field.';
            TableRelation = Vendor;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(24; "Source name"; Text[50])
        {
            Caption = 'Nombre origen';
            ToolTip = 'Specifies the value of the Nombre origen field.';
        }
        field(25; "Amount in VLE"; Decimal)
        {
            Caption = 'Importe en VLE';
            ToolTip = 'Specifies the value of the Importe en VLE field.';
        }
        field(26; "USD promedio"; Decimal)
        {
            Caption = 'USD promedio';
            ToolTip = 'Specifies the value of the USD promedio field.';
        }
        field(27; "Desviación"; Decimal)
        {
            Caption = 'Variance';
            ToolTip = 'Specifies the value of the Variance field.';
        }
        field(28; "Kilos capturados período"; Decimal)
        {
            Caption = 'Kilos capturados período';
            ToolTip = 'Specifies the value of the Kilos capturados período field.';
        }
        field(29; "Kilos capturados promedio"; Decimal)
        {
            Caption = 'Kilos capturados promedio';
            ToolTip = 'Specifies the value of the Kilos capturados promedio field.';
        }
        field(30; "Proyectos en período"; Decimal)
        {
            Caption = 'Proyectos en período';
            ToolTip = 'Specifies the value of the Proyectos en período field.';
        }
        field(31; "USD período"; Decimal)
        {
            Caption = 'USD período';
            ToolTip = 'Specifies the value of the USD período field.';
        }
        field(32; "USD período promedio"; Decimal)
        {
            Caption = 'USD período promedio';
            ToolTip = 'Specifies the value of the USD período promedio field.';
        }
        field(33; "$ registrados"; Decimal)
        {
            Caption = '$ registrados';
            ToolTip = 'Specifies the value of the $ registrados field.';
            DataClassification = ToBeClassified;
        }
        field(34; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';
            DataClassification = ToBeClassified;

        }
        field(35; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';
            DataClassification = ToBeClassified;

        }
        field(36; "Global Dimension 6 Code"; Code[20])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';
            DataClassification = ToBeClassified;

        }
        field(37; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';
            DataClassification = ToBeClassified;

        }
        field(38; "Vendor no."; Code[10])
        {
            Caption = 'Vendor No.';
            ToolTip = 'Specifies the value of the Vendor No field.';
            DataClassification = ToBeClassified;
        }
        field(39; "Vendor name"; Text[30])
        {
            Caption = 'Nombre proveedor';
            ToolTip = 'Specifies the value of the Nombre proveedor field.';
            DataClassification = ToBeClassified;
        }
        field(40; "Entry no."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            DataClassification = ToBeClassified;
        }
        field(41; "GLE Entry no."; Integer)
        {
            Caption = 'No. movimiento contable';
            ToolTip = 'Specifies the value of the No. movimiento contable field.';
            DataClassification = ToBeClassified;
        }
        field(42; "Fecha oficializacion"; Date)
        {
            Caption = 'Fecha oficialización';
            ToolTip = 'Specifies the value of the Fecha oficialización field.';
            DataClassification = ToBeClassified;
        }
        field(43; "Fecha cumplido"; Date)
        {
            Caption = 'Fecha cumplido';
            ToolTip = 'Specifies the value of the Fecha cumplido field.';
            DataClassification = ToBeClassified;
        }
        field(44; "Proyecto de origen"; Code[14])
        {
            Caption = 'Proyecto de origen';
            ToolTip = 'Specifies the value of the Proyecto de origen field.';
            DataClassification = ToBeClassified;
        }
        field(45; "Fecha descarga origen"; Date)
        {
            Caption = 'Fecha descarga origen';
            ToolTip = 'Specifies the value of the Fecha descarga origen field.';
            DataClassification = ToBeClassified;
        }
        field(46; "Grupo Informe Costos"; Text[50])
        {
            Caption = 'Grupo Informe Costos';
            ToolTip = 'Specifies the value of the Grupo Informe Costos field.';
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

