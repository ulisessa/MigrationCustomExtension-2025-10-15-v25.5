table 50528 "Produccion Planta"
{
    // IBdos Argentina - USS - 080503 - Adición Arbumasa
    // 
    // Doversys - USS - 200803 - Modificación Arbumasa
    //  a) Traigo la actividad del proyecto
    // 
    // US.ARBU - 20040524 - Inicio Modificación Arbumasa para el seguimiento de documentos


    fields
    {
        field(1; "Nombre libro diario"; Code[10])
        {
            TableRelation = "Item Journal Template";
        }
        field(2; "Nombre seccion diario"; Code[10])
        {
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro diario"));
        }
        field(3; "No. OP"; Code[10])
        {
            Editable = true;
        }
        field(4; "Fecha registro"; Date)
        {
        }
        field(5; "Puerto/Aeropuerto"; Code[10])
        {
            Caption = 'Ciudad';
            TableRelation = "Entry/Exit Point";
        }
        field(6; "OP1 - Salida MP1"; Decimal)
        {
        }
        field(7; "OP1 - Entrada"; Decimal)
        {
        }
        field(8; "OP2 - Salida"; Decimal)
        {
        }
        field(9; "OP2 - Entrada"; Decimal)
        {
        }
        field(10; "OP3 - Salida"; Decimal)
        {
        }
        field(11; "OP3 - Entrada"; Decimal)
        {
        }
        field(12; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(13; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(14; "Global Dimension 3"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';


            trigger OnValidate()
            begin
                "No. documento" := GenerarNoDoc(Rec);
            end;
        }
        field(15; "Global Dimension 4"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Global Dimension 4 Code';

        }
        field(16; "Global Dimension 5"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Global Dimension 5 Code';

        }
        field(17; "Global Dimension 6"; Code[20])
        {
            Caption = 'Global Dimension 6 Code';
        }
        field(18; "Global Dimension 7"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'ENU=Global Dimension 7 Code;ESP=Cód. dimensión global 7';

        }
        field(19; "OP1 - Salida MP2"; Decimal)
        {
        }
        field(20; "OP1 - Salida MP3"; Decimal)
        {
        }
        field(21; "No. documento"; Code[30])
        {
        }
        field(22; "Produccion terminada"; Boolean)
        {


        }
        field(23; Registrado; Boolean)
        {
        }
        field(24; "Rendimiento PT1"; Decimal)
        {
        }
        field(25; "Rendimiento PT2"; Decimal)
        {
        }
        field(26; "Rendimiento PT3"; Decimal)
        {
        }
        field(27; "Merma DyP"; Decimal)
        {
        }
        field(28; "Rendimiento Engorde"; Decimal)
        {
        }
        field(29; "Proyecto Origen"; Code[20])
        {
            TableRelation = Job;

            trigger OnValidate()
            begin
                if (xRec."Proyecto Origen" <> '') and (xRec."Proyecto Origen" <> Rec."Proyecto Origen") then begin

                    if Confirm('Si modifica la cabecera, se eliminarán los registros cargados en el detalle de Producción.\' +
                               '¨Está seguro de proseguir?') then begin

                        PunLins.Reset;
                        PunLins.SetRange(PunLins."Nombre libro diario", "Nombre libro diario");
                        PunLins.SetRange(PunLins."Nombre seccion diario", "Nombre seccion diario");
                        PunLins.SetRange("No. documento", "No. documento");
                        PunLins.DeleteAll;

                    end;

                end;

                //Doversys - USS - 200803 - Inicio Modificación Arbumasa
                //Traigo la actividad del proyecto

                Clear(PunProyecto);
                if PunProyecto.Get("Proyecto Origen") then begin

                    "Global Dimension 1" := PunProyecto."Global Dimension 1 Code";
                    "Global Dimension 2" := PunProyecto."Global Dimension 2 Code";
                    "Global Dimension 3" := PunProyecto."Global Dimension 3 Code";
                    "No. documento" := GenerarNoDoc(Rec);
                    "Lote origen" := "Global Dimension 1" + "Global Dimension 2";

                end;

                //Doversys - USS - 200803 - Fin Modificación Arbumasa

                fntGenerarLote;
            end;
        }
        field(30; "Proyecto Destino"; Code[20])
        {
            TableRelation = Job;

            trigger OnValidate()
            begin
                if (xRec."Proyecto Destino" <> '') and (xRec."Proyecto Destino" <> Rec."Proyecto Destino") then begin

                    if Confirm('Si modifica la cabecera, se eliminarán los registros cargados en el detalle de Producción.\' +
                               '¨Está seguro de proseguir?') then begin

                        PunLins.Reset;
                        PunLins.SetRange(PunLins."Nombre libro diario", "Nombre libro diario");
                        PunLins.SetRange(PunLins."Nombre seccion diario", "Nombre seccion diario");
                        PunLins.SetRange("No. documento", "No. documento");
                        PunLins.DeleteAll;

                    end;

                end;

                Clear(PunProyecto);
                if PunProyecto.Get("Proyecto Destino") then
                    "Global Dimension 2" := PunProyecto."Global Dimension 2 Code";
            end;
        }
        field(31; "Fecha produccion"; Date)
        {

            trigger OnValidate()
            begin
                "Fecha registro" := "Fecha produccion";
            end;
        }
        field(32; "Hora inicio"; Time)
        {
        }
        field(33; "Hora fin"; Time)
        {
        }
        field(34; Usuario; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(35; "Encargado Produccion"; Text[250])
        {
        }
        field(36; "Buque Tercero"; Code[3])
        {
        }
        field(37; "Marea Tercero"; Code[7])
        {
            Editable = true;
        }
        field(38; Tercero; Boolean)
        {
        }
        field(39; "Lote origen"; Code[20])
        {
        }
        field(100; "CAL Pelado Entrada KG"; Decimal)
        {
            Caption = 'CAL Pelado Entrada KG';
        }
        field(101; "CAL Pelado Vaina KG"; Decimal)
        {
            Caption = 'CAL Pelado Vaina KG';
        }
        field(102; "CAL Pelado Rejos KG"; Decimal)
        {
            Caption = 'CAL Pelado Rejos KG';
        }
        field(103; "CAL Pelado Aletas KG"; Decimal)
        {
            Caption = 'CAL Pelado Aletas KG';
        }
        field(104; "CAL Pelado Vaina RE (%)"; Decimal)
        {
            Caption = 'CAL Pelado Vaina RE (%)';
        }
        field(105; "CAL Pelado Rejos RE (%)"; Decimal)
        {
            Caption = 'CAL Pelado Rejos RE (%)';
        }
        field(106; "CAL Pelado Aletas RE (%)"; Decimal)
        {
            Caption = 'CAL Pelado Aletas RE (%)';
        }
        field(107; "CAL Engorde Entrada KG"; Decimal)
        {
            Caption = 'CAL Engorde Entrada KG';
        }
        field(108; "CAL Engorde Salida KG"; Decimal)
        {
            Caption = 'CAL Engorde Salida KG';
        }
        field(109; "CAL Engorde RE (%)"; Decimal)
        {
            Caption = 'CAL Engorde RE (%)';
        }
        field(110; "CAL Envasado Entrada KG"; Decimal)
        {
            Caption = 'CAL Envasado Entrada KG';
        }
        field(111; "CAL Envasado Salida KG"; Decimal)
        {
            Caption = 'CAL Envasado Salida KG';
        }
        field(112; "CAL Produccion RE (%)"; Decimal)
        {
            Caption = 'CAL Producción RE (%)';
        }
        field(113; "CAL Merma Pelado (%)"; Decimal)
        {
            Caption = 'CAL Merma Pelado (%)';
        }
        field(114; "CAL Vaina Sin Pelar KG"; Decimal)
        {
            Caption = 'CAL Vaina Sin Pelar KG';
        }
        field(115; "CAL Vaina Sin Pelar (%)"; Decimal)
        {
            Caption = 'CAL Vaina Sin Pelar (%)';
        }
        field(116; "CAL Residuos KG"; Decimal)
        {
            Caption = 'CAL Residuos KG';
        }
        field(117; "CAL Vaina Sin Engorde KN"; Decimal)
        {
            Caption = 'CAL Vaina Sin Engorde KN';
        }
        field(118; "CAL Rejo Sin Engorde KN"; Decimal)
        {
            Caption = 'CAL Rejo Sin Engorde KN';
        }
        field(119; "CAL Entero Sin Clasificar KN"; Decimal)
        {
            Caption = 'CAL Entero Sin Clasificar KN';
        }
        field(120; "CAL Entrada SE Reproceso"; Decimal)
        {
            Caption = 'CAL Entrada SE Reproceso';
        }
        field(121; "CAL Entrada MP"; Decimal)
        {
            Caption = 'CAL Entrada MP';
        }
        field(122; "CAL Salida KG Semielaborado"; Decimal)
        {
            Caption = 'CAL Salida KG Semielaborado';
        }
        field(123; "CAL Vaina MP"; Decimal)
        {
            Caption = 'CAL Vaina MP';
        }
        field(124; "CAL Entero MP"; Decimal)
        {
            Caption = 'CAL Entero MP';
        }
        field(125; "CAL Rejo MP"; Decimal)
        {
            Caption = 'CAL Rejo MP';
            Description = 'Se utiliza con Rejo proveniente de buque';
        }
        field(126; "CAL Rejo Sucio PT"; Decimal)
        {
            Caption = 'CAL Rejo Sucio PT';
            Description = 'Se utiliza con Rejo proveniente de Entero, que se almacena para reprocesar';
        }
        field(127; "CAL Rejo Sucio MP"; Decimal)
        {
            Caption = 'CAL Rejo Sucio MP';
            Description = 'Se utiliza con Rejo proveniente de Entero, que se almacena para reprocesar';
        }
        field(128; "CAL Rejo a Congelar PT"; Decimal)
        {
            Caption = 'CAL Rejo a Congelar PT';
            Description = 'Se utiliza con Rejo proveniente de Entero, que se almacena para reprocesar';
        }
        field(129; "CAL Entrada PT"; Decimal)
        {
            Caption = 'CAL Entrada PT';
        }
        field(200; "FRE Clasificacion Entrada KG"; Decimal)
        {
            Caption = 'FRE Clasificación Entrada KG';
        }
        field(201; "FRE Clasificacion Salida KG"; Decimal)
        {
            Caption = 'FRE Clasificación Salida KG';
        }
        field(202; "FRE Clasificacion Pelado KG"; Decimal)
        {
            Caption = 'FRE Clasificación Pelado KG';
        }
        field(203; "FRE Clasificacion Cola KG"; Decimal)
        {
            Caption = 'FRE Clasificación Cola KG';
        }
        field(204; "FRE Clasificacion Entero KG"; Decimal)
        {
            Caption = 'FRE Clasificación Entero KG';
        }
        field(205; "FRE Clas. Pelado RE (%)"; Decimal)
        {
            Caption = 'FRE Clas. Pelado RE (%)';
        }
        field(206; "FRE Clas. Cola RE (%)"; Decimal)
        {
            Caption = 'FRE Clas. Cola RE (%)';
        }
        field(207; "FRE Clas. Entero RE (%)"; Decimal)
        {
            Caption = 'FRE Clas. Entero RE (%)';
        }
        field(208; "FRE Pelado Entrada KG"; Decimal)
        {
            Caption = 'FRE Pelado Entrada KG';
        }
        field(209; "FRE Pelado Salida KG"; Decimal)
        {
            Caption = 'FRE Pelado Salida KG';
        }
        field(210; "FRE Pelado RE (%)"; Decimal)
        {
            Caption = 'FRE Pelado RE (%)';
        }
        field(211; "FRE Envasado Entrada KG"; Decimal)
        {
            Caption = 'FRE Envasado Entrada KG';
        }
        field(212; "FRE Envasado Salida KG"; Decimal)
        {
            Caption = 'FRE Envasado Salida KG';
        }
        field(213; "FRE Produccion RE (%)"; Decimal)
        {
            Caption = 'FRE Producción RE (%)';
        }
        field(214; "FRE Merma Clasificacion (%)"; Decimal)
        {
            Caption = 'FRE Merma Clasificación (%)';
        }
        field(215; "FRE Seccionado Entrada KG"; Decimal)
        {
            Caption = 'FRE Seccionado Entrada KG';
        }
        field(216; "FRE Seccionado Salida KG"; Decimal)
        {
            Caption = 'FRE Seccionado Salida KG';
        }
        field(217; "FRE Seccionado Entrada RE (%)"; Decimal)
        {
            Caption = 'FRE Seccionado Entrada RE (%)';
        }
        field(218; "FRE Entrada KG"; Decimal)
        {
            Caption = 'FRE Entrada KG';
        }
        field(219; "FRE Residuos Entrada"; Decimal)
        {
            Caption = 'FRE Residuos Entrada';
        }
        field(220; "FRE Residuos Entrada (%)"; Decimal)
        {
            Caption = 'FRE Residuos Entrada (%)';
        }
        field(300; "PES Entera Entrada KG"; Decimal)
        {
            Caption = 'PES Entera Entrada KG';
            Description = 'Ingreso de Merluza Entera (MP) a Producción';
        }
        field(301; "PES Entera Salida KG"; Decimal)
        {
            Caption = 'PES Entera Salida KG';
            Description = 'Salida de Merluza Entera (PT) de la Producción';
        }
        field(302; "PES Entera Clasif. RE (%)"; Decimal)
        {
            Caption = 'PES Entera Clasif. RE (%)';
            Description = 'Rendimiento de la Merluza Entera (PT) sobre la Merluza Entera (MP)';
        }
        field(303; "PES Entera Clasif. Merma KG"; Decimal)
        {
            Caption = 'PES Entera Clasif. Merma KG';
            Description = 'Merma de la Merluza Entera (PT) sobre la Merluza Entera (MP)';
        }
        field(304; "PES Entera Clasif. Descarte KG"; Decimal)
        {
            Caption = 'PES Entera Clasif. Descarte KG';
            Description = 'Merluza Entera descartada (Parasitado o mal estado)';
        }
        field(305; "PES Clasificacion Descarte"; Decimal)
        {
            Caption = 'PES Clasificacion Descarte';
        }
        field(306; "PES Clasificacion RE (%)"; Decimal)
        {
            Caption = 'PES Clasificacion RE (%)';
        }
        field(307; "PES Envasado Entrada KG"; Decimal)
        {
            Caption = 'PES Envasado Entrada KG';
        }
        field(308; "PES Envasado Salida KG"; Decimal)
        {
            Caption = 'PES Envasado Salida KG';
        }
        field(309; "PES Produccion RE (%)"; Decimal)
        {
            Caption = 'PES Producción RE (%)';
        }
        field(310; "PES Produccion Merma"; Decimal)
        {
            Caption = 'PES Producción Merma';
        }
        field(311; "PES MP Entrada KG"; Decimal)
        {
            Caption = 'PES MP Entrada KG';
        }
        field(312; "PES Carioca Entrada KG"; Decimal)
        {
            Caption = 'PES Carioca Entrada KG';
        }
        field(313; "PES Carioca Entrada RE (%)"; Decimal)
        {
            Caption = 'PES Carioca Entrada RE (%)';
        }
        field(314; "PES Entera Entrada RE (%)"; Decimal)
        {
            Caption = 'PES Entera Entrada RE (%)';
        }
        field(315; "PES Carioca Proceso-Out KG"; Decimal)
        {
            Caption = 'PES Carioca Proceso-Out KG';
        }
        field(316; "PES Carioca Proceso RE (%)"; Decimal)
        {
            Caption = 'PES Carioca Proceso RE (%)';
        }
        field(317; "PES Carioca RE (%)"; Decimal)
        {
            Caption = 'PES Carioca RE (%)';
        }
        field(318; "PES Filete S/E RE (%)"; Decimal)
        {
            Caption = 'PES Filete S/E RE (%)';
        }
        field(319; "PES Filete S/E Entrada KG"; Decimal)
        {
            Caption = 'PES Filete S/E Entrada KG';
        }
        field(320; "PES Filete S/E Salida KG"; Decimal)
        {
            Caption = 'PES Filete S/E Salida KG';
        }
        field(321; "PES Filete S/E Merma"; Decimal)
        {
            Caption = 'PES Filete S/E Merma';
        }
        field(322; "PES Filete C/E Entrada KG"; Decimal)
        {
            Caption = 'PES Filete C/E Entrada KG';
        }
        field(323; "PES Filete C/E Salida KG"; Decimal)
        {
            Caption = 'PES Filete C/E Salida KG';
        }
        field(324; "PES Filete C/E RE (%)"; Decimal)
        {
            Caption = 'PES Filete C/E RE (%)';
        }
        field(325; "PES Filete C/E Merma"; Decimal)
        {
            Caption = 'PES Filete C/E Merma';
        }
        field(326; "PES Filete C/E Residuos"; Decimal)
        {
            Caption = 'PES Filete C/E Residuos';
        }
        field(327; "PES Filete S/E Residuos"; Decimal)
        {
            Caption = 'PES Filete S/E Residuos';
        }
        field(328; "PES Carioca Descarte"; Decimal)
        {
            Caption = 'PES Carioca Descarte';
        }
        field(329; "PES Carioca Merma (%)"; Decimal)
        {
            Caption = 'PES Carioca Merma (%)';
        }
        field(330; "PES HG Entrada KG"; Decimal)
        {
            Caption = 'PES HG Entrada KG';
        }
        field(331; "PES HG Salida KG"; Decimal)
        {
            Caption = 'PES HG Salida KG';
        }
        field(332; "PES HG RE (%)"; Decimal)
        {
            Caption = 'PES HG RE (%)';
        }
        field(333; "PES HG Descarte"; Decimal)
        {
            Caption = 'PES HG Descarte';
        }
        field(334; "PES HG Merma (%)"; Decimal)
        {
            Caption = 'PES HG Merma (%)';
        }
        field(335; "PES Carioca HG Entrada KG"; Decimal)
        {
            Caption = 'PES Carioca HG Entrada KG';
        }
        field(336; "PES Carioca HG Salida KG"; Decimal)
        {
            Caption = 'PES Carioca HG Salida KG';
        }
        field(337; "PES Carioca HG RE (%)"; Decimal)
        {
            Caption = 'PES Carioca HG RE (%)';
        }
        field(338; "PES Carioca HG Descarte"; Decimal)
        {
            Caption = 'PES Carioca HG Descarte';
        }
        field(339; "PES Carioca HG Merma (%)"; Decimal)
        {
            Caption = 'PES Carioca HG Merma (%)';
        }
        field(340; "PES Filete Clasif. Entrada KG"; Decimal)
        {
            Caption = 'PES Filete Clasif. Entrada KG';
        }
        field(341; "PES Filete Clasif. Salida KG"; Decimal)
        {
            Caption = 'PES Filete Clasif. Salida KG';
        }
        field(400; "ANC Entera Entrada KG"; Decimal)
        {
            Caption = 'ANC Entera Entrada KG';
        }
        field(401; "ANC Entera Salida KG"; Decimal)
        {
            Caption = 'ANC Entera Salida KG';
        }
        field(403; "ANC Envasado Entrada KG"; Decimal)
        {
            Caption = 'ANC Envasado Entrada KG';
        }
        field(404; "ANC Envasado Salida KG"; Decimal)
        {
            Caption = 'ANC Envasado Salida KG';
        }
        field(405; "ANC Produccion RE (%)"; Decimal)
        {
            Caption = 'ANC Producción RE (%)';
        }
        field(50597; "Fecha anulacion"; Date)
        {
            Caption = 'Fecha anulación';
        }
        field(50598; "Usuario anulacion"; Code[20])
        {
            Caption = 'Usuario anulación';
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
        }
    }

    keys
    {
        key(Key1; "Nombre libro diario", "Nombre seccion diario", "No. documento")
        {
            Clustered = true;
        }
        key(Key2; "Fecha registro", "No. documento")
        {
        }
        key(Key3; "Nombre seccion diario", "No. documento")
        {
        }
        key(Key4; "Nombre libro diario", "Nombre seccion diario", "No. OP")
        {
        }
        key(Key5; "Fecha produccion", "No. documento")
        {
        }
        key(Key6; "No. documento")
        {
        }
        key(Key7; "Proyecto Origen", "Proyecto Destino", "Fecha produccion")
        {
        }
        key(Key8; "Fecha produccion", "Proyecto Origen", "Proyecto Destino")
        {
        }
        key(Key9; "Nombre seccion diario", "Fecha produccion", "No. documento")
        {
        }
        key(Key10; "Lote origen", "Fecha produccion")
        {
        }
        key(Key11; "Global Dimension 2", "Puerto/Aeropuerto", "Fecha registro")
        {
        }
        key(Key12; "Proyecto Destino", "Fecha registro")
        {
        }
    }

    fieldgroups
    {
    }




    var
        DiarioProd: Record "Item Journal Batch";
        PunProyecto: Record Job;
        rstLinProd: Record "Item Journal Line";
        ConfUsu: Record "User Setup";
        PunMensajeria: Record Mensajeria;
        rstSecDiarioProd: Record "Item Journal Batch";
        rstProduccionPlanta: Record "Produccion Planta";
        PunLins: Record "Lin. produccion planta";
        rstLinProdPta: Record "Lin. produccion planta";
        rstInfoempresa: Record "Company Information";

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        //IBdos Argentina - USS - 191202 - Inicio Modificación Arbumasa
        //Adición de función Navegar

        FormNavegar.SetDoc("Fecha registro", "No. documento");
        FormNavegar.Run;

        //IBdos Argentina - USS - 191202 - Fin Modificación Arbumasa
    end;

    [Scope('OnPrem')]
    procedure GenerarNoDoc(rstProduccion: Record "Produccion Planta"): Code[30]
    var
        rstDepartamento: Record "Dimension Value";
        rstProyecto: Record Job;
        codNumeroDocumento: Code[30];
        blnUnico: Boolean;
        rstGLSetup: Record "General Ledger Setup";
    begin
        Clear(rstDepartamento);
        Clear(rstProyecto);
        Clear(rstSecDiarioProd);
        Clear(rstGLSetup);
        rstGLSetup.Get();
        rstDepartamento.Get(rstGLSetup."Global Dimension 1 Code", "Global Dimension 1");
        rstProyecto.Get("Proyecto Origen");
        rstSecDiarioProd.Get(rstProduccion."Nombre libro diario", rstProduccion."Nombre seccion diario");

        if rstDepartamento."Use code" in [rstDepartamento."Use code"::Tercero, rstDepartamento."Use code"::Cliente]
         then
            codNumeroDocumento :=
            CopyStr("Puerto/Aeropuerto", 1, 2) /*+COPYSTR(rstDepartamento.Code,1,3) */+ '-' + DelChr(Format("Fecha produccion"), '=', '/') +
            '-' + "Global Dimension 1" + '-' + CopyStr(Format("Global Dimension 3"), 4, 3) + '-0'
        else
            codNumeroDocumento :=
            CopyStr("Puerto/Aeropuerto", 1, 2) /*+COPYSTR(rstDepartamento.Code,1,3) */+ '-' + DelChr(Format("Fecha produccion"), '=', '/') +
            '-' + "Global Dimension 1" + '-' + CopyStr(Format("Global Dimension 3"), 4, 3) + '-0';

        Clear(rstProduccionPlanta);
        blnUnico := false;
        rstProduccionPlanta.SetCurrentKey(rstProduccionPlanta."No. documento");
        rstProduccionPlanta.SetRange("No. documento", codNumeroDocumento);
        //rstProduccionPlanta.SETRANGE(rstProduccionPlanta.Registrado,TRUE);
        if rstProduccionPlanta.Find('-') then
            repeat

                codNumeroDocumento := IncStr(codNumeroDocumento);
                Clear(rstProduccionPlanta);
                rstProduccionPlanta.SetCurrentKey(rstProduccionPlanta."No. documento");
                rstProduccionPlanta.SetRange("No. documento", codNumeroDocumento);
                if not rstProduccionPlanta.Find('-') then
                    blnUnico := true;

            until blnUnico;

        exit(codNumeroDocumento);

    end;

    [Scope('OnPrem')]
    procedure GenerarNoLote(codPuerto: Code[10]; datFechaRegistro: Date; codBuque: Code[3]; codMarea: Code[6]; codDepartamento: Code[3]; codMesCiudad: Code[6]; codPallet: Code[4]): Code[30]
    var
        rstDepartamento: Record Dimension;
        rstProyecto: Record Job;
        strDia: Text[2];
        strMes: Text[2];
        strYear: Text[4];
        rstProduccion: Record "Produccion Planta";
    begin
        Clear(rstDepartamento);
        Clear(rstProyecto);
        rstDepartamento.Get(codDepartamento);

        if StrLen(Format(Date2DMY(datFechaRegistro, 1))) < 2 then
            strDia := '0' + Format(Date2DMY(datFechaRegistro, 1))
        else
            strDia := Format(Date2DMY(datFechaRegistro, 1));

        if StrLen(Format(Date2DMY(datFechaRegistro, 2))) < 2 then
            strMes := '0' + Format(Date2DMY(datFechaRegistro, 2))
        else
            strMes := Format(Date2DMY(datFechaRegistro, 2));

        if StrLen(Format(Date2DMY(datFechaRegistro, 3))) < 2 then
            strYear := '0' + Format(Date2DMY(datFechaRegistro, 3))
        else
            strYear := Format(Date2DMY(datFechaRegistro, 3));

        if StrLen(strYear) > 2 then
            strYear := CopyStr(strYear, 3, 2);


        if codPallet = '' then begin

            if rstDepartamento."Use code" in [rstDepartamento."Use code"::Tercero, rstDepartamento."Use code"::Cliente]
            then
                exit(codDepartamento + '-' +/*COPYSTR(*/Format(codMesCiudad)/*,4,3)*//*+'-'+{codBuque+codMarea}{strYear+strMes+strDia}*/)
            else
                exit(codDepartamento + '-' +/*COPYSTR(*/Format(codMesCiudad)/*,4,3)*//*+'-'+{codBuque+codMarea}{strYear+strMes+strDia}*/);

        end
        else begin

            if rstDepartamento."Use code" in [rstDepartamento."Use code"::Tercero, rstDepartamento."Use code"::Cliente]
            then
                exit(codDepartamento + '-' +/*COPYSTR(*/Format(codMesCiudad)/*,4,3)+'-'+codBuque+codMareastrYear+strMes+strDia*/+ '-' +
                codPallet)
            else
                exit(codDepartamento + '-' +/*COPYSTR(*/Format(codMesCiudad)/*,4,3)+'-'+codBuque+codMareastrYear+strMes+strDia*/+ '-' +
                codPallet);

        end;

    end;

    [Scope('OnPrem')]
    procedure fntGenerarLote()
    begin
        /*
        IF ("Buque Tercero" <> '') AND ("Marea Tercero" <> '') THEN
          "Lote origen" := "Buque Tercero"+"Marea Tercero"
        ELSE
        BEGIN
         */
        if ("Global Dimension 1" <> '') and ("Global Dimension 3" <> '') then
            "Lote origen" := "Global Dimension 1" + "Global Dimension 3";
        /*
      END;
         */

    end;
}

