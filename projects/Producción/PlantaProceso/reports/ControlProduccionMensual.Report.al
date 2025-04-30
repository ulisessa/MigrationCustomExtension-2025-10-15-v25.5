report 50517 "Control Produccion Mensual"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/ControlProduccionMensual.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            DataItemTableView = SORTING ("Fecha produccion", "Proyecto Origen", "Proyecto Destino") ORDER(Ascending);
            RequestFilterFields = "Nombre libro diario", "Nombre seccion diario", "Proyecto Origen", "Proyecto Destino", "Fecha produccion";
            column(USERID; UserId)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(Mes; Mes)
            {
            }
            column(aa; aa)
            {
            }
            column("Produccion_Planta__GETFILTER__Fecha_producción__"; "Produccion Planta".GetFilter("Fecha produccion"))
            {
            }
            column(USERID_Control81; UserId)
            {
            }
            column(FORMAT_TODAY_0_4__Control89; Format(Today, 0, 4))
            {
            }
            column(aa_Control116; aa)
            {
            }
            column(Mes_Control117; Mes)
            {
            }
            column("Produccion_Planta__GETFILTER__Fecha_producción___Control42"; "Produccion Planta".GetFilter("Fecha produccion"))
            {
            }
            column(Produccion_Planta__Proyecto_Destino_; "Proyecto Destino")
            {
            }
            column(Produccion_Planta__Proyecto_Origen_; "Proyecto Origen")
            {
            }
            column(d31; d31)
            {
            }
            column(d30; d30)
            {
            }
            column(d29; d29)
            {
            }
            column(d28; d28)
            {
            }
            column(d27; d27)
            {
            }
            column(d26; d26)
            {
            }
            column(d25; d25)
            {
            }
            column(d24; d24)
            {
            }
            column(d23; d23)
            {
            }
            column(d22; d22)
            {
            }
            column(d21; d21)
            {
            }
            column(d20; d20)
            {
            }
            column(d19; d19)
            {
            }
            column(d18; d18)
            {
            }
            column(d17; d17)
            {
            }
            column(d16; d16)
            {
            }
            column(d15; d15)
            {
            }
            column(d14; d14)
            {
            }
            column(d13; d13)
            {
            }
            column(d12; d12)
            {
            }
            column(d11; d11)
            {
            }
            column(d10; d10)
            {
            }
            column(d9; d9)
            {
            }
            column(d8; d8)
            {
            }
            column(d7; d7)
            {
            }
            column(d6; d6)
            {
            }
            column(d5; d5)
            {
            }
            column(d4; d4)
            {
            }
            column(d3; d3)
            {
            }
            column(d2; d2)
            {
            }
            column(d1; d1)
            {
            }
            column(aa_Control78; aa)
            {
            }
            column("Descripción"; Descripción)
            {
            }
            column(VarFechaProd; VarFechaProd)
            {
            }
            column(mm; mm)
            {
            }
            column(ddd; ddd)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column("DescripciónCaption"; DescripciónCaptionLbl)
            {
            }
            column(V1Caption; V1CaptionLbl)
            {
            }
            column(V2Caption; V2CaptionLbl)
            {
            }
            column(V3Caption; V3CaptionLbl)
            {
            }
            column(V4Caption; V4CaptionLbl)
            {
            }
            column(V5Caption; V5CaptionLbl)
            {
            }
            column(V6Caption; V6CaptionLbl)
            {
            }
            column(V7Caption; V7CaptionLbl)
            {
            }
            column(V8Caption; V8CaptionLbl)
            {
            }
            column(V9Caption; V9CaptionLbl)
            {
            }
            column(V10Caption; V10CaptionLbl)
            {
            }
            column(V11Caption; V11CaptionLbl)
            {
            }
            column(V12Caption; V12CaptionLbl)
            {
            }
            column(V13Caption; V13CaptionLbl)
            {
            }
            column(V14Caption; V14CaptionLbl)
            {
            }
            column(V15Caption; V15CaptionLbl)
            {
            }
            column(V16Caption; V16CaptionLbl)
            {
            }
            column(V17Caption; V17CaptionLbl)
            {
            }
            column(V18Caption; V18CaptionLbl)
            {
            }
            column(V19Caption; V19CaptionLbl)
            {
            }
            column(V20Caption; V20CaptionLbl)
            {
            }
            column(V21Caption; V21CaptionLbl)
            {
            }
            column(V22Caption; V22CaptionLbl)
            {
            }
            column(V23Caption; V23CaptionLbl)
            {
            }
            column(V24Caption; V24CaptionLbl)
            {
            }
            column(V25Caption; V25CaptionLbl)
            {
            }
            column(V26Caption; V26CaptionLbl)
            {
            }
            column(V27Caption; V27CaptionLbl)
            {
            }
            column(V28Caption; V28CaptionLbl)
            {
            }
            column(V29Caption; V29CaptionLbl)
            {
            }
            column(V30Caption; V30CaptionLbl)
            {
            }
            column(V31Caption; V31CaptionLbl)
            {
            }
            column(deCaption; deCaptionLbl)
            {
            }
            column(V31Caption_Control11; V31Caption_Control11Lbl)
            {
            }
            column(V30Caption_Control12; V30Caption_Control12Lbl)
            {
            }
            column(V29Caption_Control13; V29Caption_Control13Lbl)
            {
            }
            column(V28Caption_Control20; V28Caption_Control20Lbl)
            {
            }
            column(V27Caption_Control44; V27Caption_Control44Lbl)
            {
            }
            column(V26Caption_Control45; V26Caption_Control45Lbl)
            {
            }
            column(V25Caption_Control80; V25Caption_Control80Lbl)
            {
            }
            column(V24Caption_Control82; V24Caption_Control82Lbl)
            {
            }
            column(V23Caption_Control83; V23Caption_Control83Lbl)
            {
            }
            column(CurrReport_PAGENO_Control84Caption; CurrReport_PAGENO_Control84CaptionLbl)
            {
            }
            column(V22Caption_Control86; V22Caption_Control86Lbl)
            {
            }
            column(V21Caption_Control87; V21Caption_Control87Lbl)
            {
            }
            column(V20Caption_Control88; V20Caption_Control88Lbl)
            {
            }
            column(V19Caption_Control90; V19Caption_Control90Lbl)
            {
            }
            column(V18Caption_Control91; V18Caption_Control91Lbl)
            {
            }
            column(V17Caption_Control92; V17Caption_Control92Lbl)
            {
            }
            column(V16Caption_Control93; V16Caption_Control93Lbl)
            {
            }
            column(V15Caption_Control94; V15Caption_Control94Lbl)
            {
            }
            column(V14Caption_Control95; V14Caption_Control95Lbl)
            {
            }
            column(V13Caption_Control96; V13Caption_Control96Lbl)
            {
            }
            column(V12Caption_Control97; V12Caption_Control97Lbl)
            {
            }
            column(V11Caption_Control98; V11Caption_Control98Lbl)
            {
            }
            column(V10Caption_Control99; V10Caption_Control99Lbl)
            {
            }
            column(V9Caption_Control100; V9Caption_Control100Lbl)
            {
            }
            column(V8Caption_Control101; V8Caption_Control101Lbl)
            {
            }
            column(V7Caption_Control102; V7Caption_Control102Lbl)
            {
            }
            column(V6Caption_Control103; V6Caption_Control103Lbl)
            {
            }
            column(V5Caption_Control104; V5Caption_Control104Lbl)
            {
            }
            column(V4Caption_Control105; V4Caption_Control105Lbl)
            {
            }
            column(V3Caption_Control106; V3Caption_Control106Lbl)
            {
            }
            column(V2Caption_Control107; V2Caption_Control107Lbl)
            {
            }
            column(V1Caption_Control108; V1Caption_Control108Lbl)
            {
            }
            column("DescripciónCaption_Control109"; DescripciónCaption_Control109Lbl)
            {
            }
            column(deCaption_Control118; deCaption_Control118Lbl)
            {
            }
            column(Produccion_Planta_Nombre_libro_diario; "Nombre libro diario")
            {
            }
            column("Produccion_Planta_Nombre_sección_diario"; "Nombre seccion diario")
            {
            }
            column(Produccion_Planta_N__documento; "No. documento")
            {
            }

            trigger OnPreDataItem()
            begin
                //CurrReport.CREATETOTALS(d1,d2,d3,d4,d5,d6,d7,d8,d9,d10)//,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23
                //,d24,d25,d26,d27,d28,d29,d31);

                d1 := 0;
                d2 := 0;
                d3 := 0;
                d4 := 0;
                d5 := 0;
                d6 := 0;
                d7 := 0;
                d8 := 0;
                d9 := 0;
                d10 := 0;
                d11 := 0;
                d12 := 0;
                d13 := 0;
                d14 := 0;
                d15 := 0;
                d16 := 0;
                d17 := 0;
                d18 := 0;
                d19 := 0;
                d20 := 0;
                d21 := 0;
                d22 := 0;
                d23 := 0;
                d24 := 0;
                d25 := 0;
                d26 := 0;
                d27 := 0;
                d28 := 0;
                d29 := 0;
                d30 := 0;
                d31 := 0;


                if Ene then mm := '01';
                if Ene then Mes := 'Enero';
                if Feb then mm := '02';
                if Feb then Mes := 'Febrero';
                if Mar then mm := '03';
                if Mar then Mes := 'Marzo';
                if Abr then mm := '04';
                if Abr then Mes := 'Abril';
                if May then mm := '05';
                if May then Mes := 'Mayo';
                if Jun then mm := '06';
                if Jun then Mes := 'Junio';
                if Jul then mm := '07';
                if Jul then Mes := 'Julio';
                if Ago then mm := '08';
                if Ago then Mes := 'Agosto';
                if Set then mm := '09';
                if Set then Mes := 'Septiembre';
                if Oct then mm := '10';
                if Oct then Mes := 'Octubre';
                if Nov then mm := '11';
                if Nov then Mes := 'Noviembre';
                if Dic then mm := '12';
                if Dic then Mes := 'Diciembre';

                if a2003 then aa := '2003';
                if a2004 then aa := '2004';
                if a2005 then aa := '2005';
                if a2006 then aa := '2006';

                FechaText := '01' + mm + aa;
                Evaluate(Fecha0, FechaText);
                Fecha2 := Fecha0 - 1;
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
    }

    var
        PuntPlanta: Record "Produccion Planta";
        VarFechaProd: Date;
        dd: Text[30];
        mm: Text[30];
        aa: Text[30];
        d1: Decimal;
        d2: Decimal;
        d3: Decimal;
        d4: Decimal;
        d5: Decimal;
        d6: Decimal;
        d7: Decimal;
        d8: Decimal;
        d9: Decimal;
        d10: Decimal;
        d11: Decimal;
        d12: Decimal;
        d13: Decimal;
        d14: Decimal;
        d15: Decimal;
        d16: Decimal;
        d17: Decimal;
        d18: Decimal;
        d19: Decimal;
        d20: Decimal;
        d21: Decimal;
        d22: Decimal;
        d23: Decimal;
        d24: Decimal;
        d25: Decimal;
        d26: Decimal;
        d27: Decimal;
        d28: Decimal;
        d29: Decimal;
        d30: Decimal;
        d31: Decimal;
        Ene: Boolean;
        Feb: Boolean;
        Mar: Boolean;
        Abr: Boolean;
        May: Boolean;
        Jun: Boolean;
        Jul: Boolean;
        Ago: Boolean;
        Set: Boolean;
        Oct: Boolean;
        Nov: Boolean;
        Dic: Boolean;
        a2003: Boolean;
        a2004: Boolean;
        a2005: Boolean;
        a2006: Boolean;
        Movproducto1: Record "Item Ledger Entry";
        VarFechaProd1: Date;
        FechaText: Text[30];
        mm1: Text[30];
        Fecha0: Date;
        aa1: Text[30];
        FechaText1: Text[30];
        Fecha1: Date;
        NumDoc1: Code[10];
        NumDoc2: Code[10];
        ddd: Decimal;
        PuntPlanta1: Record "Produccion Planta";
        Fecha2: Date;
        PyOrigen: Code[30];
        PyDestino: Code[30];
        "Descripción": Text[100];
        "Mov. producto": Record "Item Ledger Entry";
        Mes: Text[30];
        Filtro: Text[100];
        "Año": Text[6];
        CurrReport_PAGENOCaptionLbl: Label 'página';
        "DescripciónCaptionLbl": Label 'Descripción';
        V1CaptionLbl: Label '1';
        V2CaptionLbl: Label '2';
        V3CaptionLbl: Label '3';
        V4CaptionLbl: Label '4';
        V5CaptionLbl: Label '5';
        V6CaptionLbl: Label '6';
        V7CaptionLbl: Label '7';
        V8CaptionLbl: Label '8';
        V9CaptionLbl: Label '9';
        V10CaptionLbl: Label '10';
        V11CaptionLbl: Label '11';
        V12CaptionLbl: Label '12';
        V13CaptionLbl: Label '13';
        V14CaptionLbl: Label '14';
        V15CaptionLbl: Label '15';
        V16CaptionLbl: Label '16';
        V17CaptionLbl: Label '17';
        V18CaptionLbl: Label '18';
        V19CaptionLbl: Label '19';
        V20CaptionLbl: Label '20';
        V21CaptionLbl: Label '21';
        V22CaptionLbl: Label '22';
        V23CaptionLbl: Label '23';
        V24CaptionLbl: Label '24';
        V25CaptionLbl: Label '25';
        V26CaptionLbl: Label '26';
        V27CaptionLbl: Label '27';
        V28CaptionLbl: Label '28';
        V29CaptionLbl: Label '29';
        V30CaptionLbl: Label '30';
        V31CaptionLbl: Label '31';
        deCaptionLbl: Label 'de';
        V31Caption_Control11Lbl: Label '31';
        V30Caption_Control12Lbl: Label '30';
        V29Caption_Control13Lbl: Label '29';
        V28Caption_Control20Lbl: Label '28';
        V27Caption_Control44Lbl: Label '27';
        V26Caption_Control45Lbl: Label '26';
        V25Caption_Control80Lbl: Label '25';
        V24Caption_Control82Lbl: Label '24';
        V23Caption_Control83Lbl: Label '23';
        CurrReport_PAGENO_Control84CaptionLbl: Label 'página';
        V22Caption_Control86Lbl: Label '22';
        V21Caption_Control87Lbl: Label '21';
        V20Caption_Control88Lbl: Label '20';
        V19Caption_Control90Lbl: Label '19';
        V18Caption_Control91Lbl: Label '18';
        V17Caption_Control92Lbl: Label '17';
        V16Caption_Control93Lbl: Label '16';
        V15Caption_Control94Lbl: Label '15';
        V14Caption_Control95Lbl: Label '14';
        V13Caption_Control96Lbl: Label '13';
        V12Caption_Control97Lbl: Label '12';
        V11Caption_Control98Lbl: Label '11';
        V10Caption_Control99Lbl: Label '10';
        V9Caption_Control100Lbl: Label '9';
        V8Caption_Control101Lbl: Label '8';
        V7Caption_Control102Lbl: Label '7';
        V6Caption_Control103Lbl: Label '6';
        V5Caption_Control104Lbl: Label '5';
        V4Caption_Control105Lbl: Label '4';
        V3Caption_Control106Lbl: Label '3';
        V2Caption_Control107Lbl: Label '2';
        V1Caption_Control108Lbl: Label '1';
        "DescripciónCaption_Control109Lbl": Label 'Descripción';
        deCaption_Control118Lbl: Label 'de';
}

