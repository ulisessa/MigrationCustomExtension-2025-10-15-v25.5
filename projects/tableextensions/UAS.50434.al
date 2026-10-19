tableextension 50434 tableextension50434 extends "Inventory Setup"
{
    fields
    {
        modify("Automatic Cost Posting")
        {
            Caption = 'Automatic Cost Posting';
        }
        modify("Location Mandatory")
        {
            Caption = 'Location Mandatory';
        }
        modify("Item Nos.")
        {
            Caption = 'Item Nos.';
        }
        modify("Automatic Cost Adjustment")
        {
            Caption = 'Automatic Cost Adjustment';
        }
        modify("Copy Item Descr. to Entries")
        {
            Caption = 'Copy Item Descr. to Entries';
        }
        modify("Transfer Order Nos.")
        {
            Caption = 'Transfer Order Nos.';
        }
        modify("Posted Transfer Shpt. Nos.")
        {
            Caption = 'Posted Transfer Shpt. Nos.';
        }
        modify("Posted Transfer Rcpt. Nos.")
        {
            Caption = 'Posted Transfer Rcpt. Nos.';
        }
        modify("Nonstock Item Nos.")
        {
            Caption = 'Catalog Item Nos.';
        }
        modify("Default Costing Method")
        {
            Caption = 'Default Costing Method';
        }
        modify("Average Cost Calc. Type")
        {
            Caption = 'Average Cost Calc. Type';
        }
        modify("Average Cost Period")
        {
            OptionCaption = ' ,Day,Week,Month,Quarter,Year,Accounting Period';
        }
        modify("Phys. Invt. Order Nos.")
        {
            Caption = 'Phys. Invt. Order Nos.';
        }
        modify("Posted Phys. Invt. Order Nos.")
        {
            Caption = 'Posted Phys. Invt. Order Nos.';
        }
        modify("Item Group Dimension Code")
        {
            Caption = 'Item Group Dimension Code';
        }
        modify("Inventory Put-away Nos.")
        {
            Caption = 'Inventory Put-away Nos.';
        }
        modify("Inventory Pick Nos.")
        {
            Caption = 'Inventory Pick Nos.';
        }
        modify("Posted Invt. Put-away Nos.")
        {
            Caption = 'Posted Invt. Put-away Nos.';
        }
        modify("Posted Invt. Pick Nos.")
        {
            Caption = 'Posted Invt. Pick Nos.';
        }
        modify("Inventory Movement Nos.")
        {
            Caption = 'Inventory Movement Nos.';
        }
        modify("Registered Invt. Movement Nos.")
        {
            Caption = 'Registered Invt. Movement Nos.';
        }
        modify("Internal Movement Nos.")
        {
            Caption = 'Internal Movement Nos.';
        }
        field(50000; "Inventario contable permanente"; Boolean)
        {
            Caption = 'Inventario contable permanente';
            ToolTip = 'Specifies the value of the Inventario contable permanente field.';
        }
        field(50001; "Diario Descarga"; Code[10])
        {
            Caption = 'Diario Descarga';
            ToolTip = 'Specifies the value of the Diario Descarga field.';
            TableRelation = "Item Journal Template".Name;
        }
        field(50002; "No. Serie anulación producción"; Code[30])
        {
            Caption = 'No. Serie anulación producción';
            ToolTip = 'Specifies the value of the No. Serie anulación producción field.';
            TableRelation = "Item Journal Template";
        }
        field(50003; "Diario Ajustes ventas"; Code[10])
        {
            Caption = 'Diario Ajustes ventas';
            ToolTip = 'Specifies the value of the Diario Ajustes ventas field.';
            TableRelation = "Item Journal Template".Name;
        }
        field(50004; "Sección ajustes ventas"; Code[10])
        {
            Caption = 'Sección ajustes ventas';
            ToolTip = 'Specifies the value of the Sección ajustes ventas field.';
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Diario descontinuación prod."));
        }
        field(50005; "Concepto ajuste Ventas"; Code[10])
        {
            Caption = 'Concepto ajuste Ventas';
            ToolTip = 'Specifies the value of the Concepto ajuste Ventas field.';
            TableRelation = "AFIP Interface Register"."Entry no.";
        }
        field(50006; "Ratios rounding precision"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Ratios rounding precision';
            ToolTip = 'Specifies the value of the Ratios rounding precision field.';
            InitValue = 0.01;
        }
        field(50007; "Production journal"; Code[10])
        {
            Caption = 'Diario producción';
            ToolTip = 'Specifies the value of the Diario producción field.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Template".Name;
        }
        field(50008; "Unloading journal"; Code[10])
        {
            Caption = 'Diario descarga';
            ToolTip = 'Specifies the value of the Diario descarga field.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Template".Name;
        }
        field(50009; "Purchasing journal"; Code[10])
        {
            Caption = 'Diario compra';
            ToolTip = 'Specifies the value of the Diario compra field.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Template".Name;
        }
        field(50013; "Formato codificacion pallet"; Option)
        {
            Caption = 'Formato codificacion pallet';
            ToolTip = 'Specifies the value of the Formato codificacion pallet field.';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Correlativo por año,Juliano ordenado';
            OptionMembers = " ","Correlativo por año","Juliano ordenado";
        }
        field(50014; "Formato codificacion lote"; Option)
        {
            Caption = 'Formato codificacion lote';
            ToolTip = 'Specifies the value of the Formato codificacion lote field.';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Departamento+Marea+Pallet+Día+Máster,Departamento+Día+Pallet+Depto. origen+Marea origen+Máster';
            OptionMembers = " ","Departamento+Marea+Pallet+Día+Máster","Departamento+Día+Pallet+Depto. origen+Marea origen+Máster";
        }
        field(50015; "Fishing Activity Dimension"; Code[20])
        {
            Caption = 'Fishing Activity Dimension';
            ToolTip = 'Specifies the value of the Fishing Activity Dimension field.';
            DataClassification = ToBeClassified;
        }
        field(50500; "No serie trasferencia alm."; Code[10])
        {
            Caption = 'No serie trasferencia alm.';
            ToolTip = 'Specifies the value of the No serie trasferencia alm field.';
        }
        field(50501; "No serie vale consumo proy."; Code[10])
        {
            Caption = 'No serie vale consumo proy.';
            ToolTip = 'Specifies the value of the No serie vale consumo proy field.';
        }
        field(50502; "No serie embarque"; Code[10])
        {
            Caption = 'No serie embarque';
            ToolTip = 'Specifies the value of the No serie embarque field.';
        }
        field(50503; "L-Producto 1"; Code[20])
        {
            Caption = 'L-Producto 1';
            ToolTip = 'Specifies the value of the L-Producto 1 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50504; "L-Producto 2"; Code[20])
        {
            Caption = 'L-Producto 2';
            ToolTip = 'Specifies the value of the L-Producto 2 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50505; "L-Producto 3"; Code[20])
        {
            Caption = 'L-Producto 3';
            ToolTip = 'Specifies the value of the L-Producto 3 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50506; "L-Producto 4"; Code[20])
        {
            Caption = 'L-Producto 4';
            ToolTip = 'Specifies the value of the L-Producto 4 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50507; "L-Producto 5"; Code[20])
        {
            Caption = 'L-Producto 5';
            ToolTip = 'Specifies the value of the L-Producto 5 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50508; "L-Producto 6"; Code[20])
        {
            Caption = 'L-Producto 6';
            ToolTip = 'Specifies the value of the L-Producto 6 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50509; "L-Producto 7"; Code[20])
        {
            Caption = 'L-Producto 7';
            ToolTip = 'Specifies the value of the L-Producto 7 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50510; "L-Producto 8"; Code[20])
        {
            Caption = 'L-Producto 8';
            ToolTip = 'Specifies the value of the L-Producto 8 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50511; "L-Producto 9"; Code[20])
        {
            Caption = 'L-Producto 9';
            ToolTip = 'Specifies the value of the L-Producto 9 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50512; "L-Producto 10"; Code[20])
        {
            Caption = 'L-Producto 10';
            ToolTip = 'Specifies the value of the L-Producto 10 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50513; "L-Producto 11"; Code[20])
        {
            Caption = 'L-Producto 11';
            ToolTip = 'Specifies the value of the L-Producto 11 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50514; "L-Producto 12"; Code[20])
        {
            Caption = 'L-Producto 12';
            ToolTip = 'Specifies the value of the L-Producto 12 field.';
            TableRelation = Item WHERE("Tipo producto" = FILTER(Pesca),
                                        Familia = FILTER('PT'));
        }
        field(50515; "Subfamilia CAL Vaina"; Code[20])
        {
            Caption = 'Subfamilia CAL Vaina';
            ToolTip = 'Specifies the value of the Subfamilia CAL Vaina field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50516; "Subfamilia CAL Aletas"; Code[20])
        {
            Caption = 'Subfamilia CAL Aletas';
            ToolTip = 'Specifies the value of the Subfamilia CAL Aletas field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50517; "Subfamilia CAL Rejos"; Code[20])
        {
            Caption = 'Subfamilia CAL Rejos';
            ToolTip = 'Specifies the value of the Subfamilia CAL Rejos field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50518; "Subfamilia LAN Entero PT"; Code[20])
        {
            Caption = 'Subfamilia LAN Entero PT';
            ToolTip = 'Specifies the value of the Subfamilia LAN Entero PT field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50519; "Subfamilia LAN Cola PT"; Code[20])
        {
            Caption = 'Subfamilia LAN Cola PT';
            ToolTip = 'Specifies the value of the Subfamilia LAN Cola PT field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50520; "Subfamilia LAN Pelado PT"; Code[20])
        {
            Caption = 'Subfamilia LAN Pelado PT';
            ToolTip = 'Specifies the value of the Subfamilia LAN Pelado PT field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50521; "Subfamilia MER Entera"; Code[20])
        {
            Caption = 'Subfamilia MER Entera';
            ToolTip = 'Specifies the value of the Subfamilia MER Entera field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50522; "Subfamilia MER Fil CP/Espina"; Code[20])
        {
            Caption = 'Subfamilia MER Fil CP/Espina';
            ToolTip = 'Specifies the value of the Subfamilia MER Fil CP/Espina field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50523; "No. Serie Planilleras CRV"; Code[30])
        {
            Caption = 'No. Serie Planilleras CRV';
            ToolTip = 'Specifies the value of the No. Serie Planilleras CRV field.';
            TableRelation = "Subfamilia producto";
        }
        field(50524; "No. Serie Planilleras PD"; Code[30])
        {
            Caption = 'No. Serie Planilleras PD';
            ToolTip = 'Specifies the value of the No. Serie Planilleras PD field.';
            TableRelation = "Subfamilia producto";
        }
        field(50525; "Subfamilia CAL Residuos"; Code[20])
        {
            Caption = 'Subfamilia CAL Residuos';
            ToolTip = 'Specifies the value of the Subfamilia CAL Residuos field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50526; "Subfamilia CAL Entero MP"; Code[20])
        {
            Caption = 'Subfamilia CAL Entero MP';
            ToolTip = 'Specifies the value of the Subfamilia CAL Entero MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50527; "Subfamilia CAL Vaina MP"; Code[20])
        {
            Caption = 'Subfamilia CAL Vaina MP';
            ToolTip = 'Specifies the value of the Subfamilia CAL Vaina MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50528; "Subfamilia CAL Aleta MP"; Code[20])
        {
            Caption = 'Subfamilia CAL Aleta MP';
            ToolTip = 'Specifies the value of the Subfamilia CAL Aleta MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50529; "Subfamilia CAL Rejo MP"; Code[20])
        {
            Caption = 'Subfamilia CAL Rejo MP';
            ToolTip = 'Specifies the value of the Subfamilia CAL Rejo MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50530; "Familia MP Propia"; Code[3])
        {
            Caption = 'Familia MP Propia';
            ToolTip = 'Specifies the value of the Familia MP Propia field.';
            TableRelation = "Familia producto".Code;
        }
        field(50531; "Familia MP Tercero"; Code[3])
        {
            Caption = 'Familia MP Tercero';
            ToolTip = 'Specifies the value of the Familia MP Tercero field.';
            TableRelation = "Familia producto".Code;
        }
        field(50532; "Familia PT Propia"; Code[3])
        {
            Caption = 'Familia PT Propia';
            ToolTip = 'Specifies the value of the Familia PT Propia field.';
            TableRelation = "Familia producto".Code;
        }
        field(50533; "Familia PT Tercero"; Code[3])
        {
            Caption = 'Familia PT Tercero';
            ToolTip = 'Specifies the value of the Familia PT Tercero field.';
            TableRelation = "Familia producto".Code;
        }
        field(50534; "Subfamilia MER Carioca"; Code[20])
        {
            Caption = 'Subfamilia MER Carioca';
            ToolTip = 'Specifies the value of the Subfamilia MER Carioca field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50535; "Subf. MER Descarte Entera"; Code[20])
        {
            Caption = 'Subf. MER Descarte Entera';
            ToolTip = 'Specifies the value of the Subf. MER Descarte Entera field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50536; "Subfamilia MER Fil S/Espina"; Code[20])
        {
            Caption = 'Subfamilia MER Fil S/Espina';
            ToolTip = 'Specifies the value of the Subfamilia MER Fil S/Espina field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50537; "Subf. MER Descarte S/Espina"; Code[20])
        {
            Caption = 'Subf. MER Descarte S/Espina';
            ToolTip = 'Specifies the value of the Subf. MER Descarte S/Espina field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50538; "Subf. MER Descarte C/Espina"; Code[20])
        {
            Caption = 'Subf. MER Descarte C/Espina';
            ToolTip = 'Specifies the value of the Subf. MER Descarte C/Espina field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50539; "Subf. MER Descarte Carioca"; Code[20])
        {
            Caption = 'Subf. MER Descarte Carioca';
            ToolTip = 'Specifies the value of the Subf. MER Descarte Carioca field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50540; "Subfamilia CAL Vaina 3ros"; Code[20])
        {
            Caption = 'Subfamilia CAL Vaina 3ros';
            ToolTip = 'Specifies the value of the Subfamilia CAL Vaina 3ros field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50541; "Subfamilia CAL Aletas 3ros"; Code[20])
        {
            Caption = 'Subfamilia CAL Aletas 3ros';
            ToolTip = 'Specifies the value of the Subfamilia CAL Aletas 3ros field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50542; "Subfamilia CAL Rejos 3ros"; Code[20])
        {
            Caption = 'Subfamilia CAL Rejos 3ros';
            ToolTip = 'Specifies the value of the Subfamilia CAL Rejos 3ros field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50543; "Subfamilia CAL Residuos 3ros"; Code[20])
        {
            Caption = 'Subfamilia CAL Residuos 3ros';
            ToolTip = 'Specifies the value of the Subfamilia CAL Residuos 3ros field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50544; "Subfamilia CAL Entero MP3"; Code[20])
        {
            Caption = 'Subfamilia CAL Entero MP3';
            ToolTip = 'Specifies the value of the Subfamilia CAL Entero MP3 field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50545; "Subfamilia CAL Vaina MP3"; Code[20])
        {
            Caption = 'Subfamilia CAL Vaina MP3';
            ToolTip = 'Specifies the value of the Subfamilia CAL Vaina MP3 field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50546; "Subfamilia CAL Aleta MP3"; Code[20])
        {
            Caption = 'Subfamilia CAL Aleta MP3';
            ToolTip = 'Specifies the value of the Subfamilia CAL Aleta MP3 field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50547; "Subfamilia CAL Rejo MP3"; Code[20])
        {
            Caption = 'Subfamilia CAL Rejo MP3';
            ToolTip = 'Specifies the value of the Subfamilia CAL Rejo MP3 field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50548; "Subfamilia CAL Vaina SE"; Code[20])
        {
            Caption = 'Subfamilia CAL Vaina SE';
            ToolTip = 'Specifies the value of the Subfamilia CAL Vaina SE field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50549; "Subfamilia CAL Rejo SE"; Code[20])
        {
            Caption = 'Subfamilia CAL Rejo SE';
            ToolTip = 'Specifies the value of the Subfamilia CAL Rejo SE field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50550; "Subfamilia CAL Ent S/Clas"; Code[20])
        {
            Caption = 'Subfamilia CAL Ent S/Clas';
            ToolTip = 'Specifies the value of the Subfamilia CAL Ent S/Clas field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50551; "Subfamilia CAL Roto"; Code[20])
        {
            Caption = 'Subfamilia CAL Roto';
            ToolTip = 'Specifies the value of the Subfamilia CAL Roto field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50552; "Familia CAL SE"; Code[20])
        {
            Caption = 'Familia CAL SE';
            ToolTip = 'Specifies the value of the Familia CAL SE field.';
            TableRelation = "Familia producto";
        }
        field(50553; "Subfamilia ANC Entero"; Code[20])
        {
            Caption = 'Subfamilia ANC Entero';
            ToolTip = 'Specifies the value of the Subfamilia ANC Entero field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50554; "Subfamilia MER HG MP"; Code[20])
        {
            Caption = 'Subfamilia MER HG MP';
            ToolTip = 'Specifies the value of the Subfamilia MER HG MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50555; "Subfamilia MER Carioca HG MP"; Code[20])
        {
            Caption = 'Subfamilia MER Carioca HG MP';
            ToolTip = 'Specifies the value of the Subfamilia MER Carioca HG MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50556; "Subfamilia MER HG Descarte"; Code[20])
        {
            Caption = 'Subfamilia MER HG Descarte';
            ToolTip = 'Specifies the value of the Subfamilia MER HG Descarte field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50557; "Subfamilia MER Carioca HG Des"; Code[20])
        {
            Caption = 'Subfamilia MER Carioca HG Des';
            ToolTip = 'Specifies the value of the Subfamilia MER Carioca HG Des field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50558; "% Diferencia Capitán-Descarga"; Decimal)
        {
            Caption = '% Diferencia Capitán-Descarga';
            ToolTip = 'Specifies the value of the % Diferencia Capitán-Descarga field.';
        }
        field(50559; "Diario descontinuación prod."; Code[10])
        {
            Caption = 'Diario descontinuación prod.';
            ToolTip = 'Specifies the value of the Diario descontinuación prod field.';
            TableRelation = "Item Journal Template".Name;
        }
        field(50560; "Sección descontinuación prod."; Code[10])
        {
            Caption = 'Sección descontinuación prod.';
            ToolTip = 'Specifies the value of the Sección descontinuación prod field.';
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Diario descontinuación prod."));
        }
        field(50561; "Concepto descontinuación prod."; Code[10])
        {
            Caption = 'Concepto descontinuación prod.';
            ToolTip = 'Specifies the value of the Concepto descontinuación prod field.';
        }
        field(50562; "Fecha descontinuación prod."; Date)
        {
            Caption = 'Fecha descontinuación prod.';
            ToolTip = 'Specifies the value of the Fecha descontinuación prod field.';
        }
        field(50563; "No. documento desc. prod."; Code[20])
        {
            Caption = 'No. documento desc. prod.';
            ToolTip = 'Specifies the value of the No. documento desc. prod field.';
        }
        field(50564; "Ratio cálculo Entero x Tubo"; Decimal)
        {
            Caption = 'Ratio cálculo Entero x Tubo';
            ToolTip = 'Specifies the value of the Ratio cálculo Entero x Tubo field.';
        }
        field(50565; "Ajuste por siniestro en KN"; Decimal)
        {
            Caption = 'Ajuste por siniestro en KN';
            ToolTip = 'Specifies the value of the Ajuste por siniestro en KN field.';
        }
        field(50566; "Subfamilia CAL Rejo Sucio MP"; Code[10])
        {
            Caption = 'Subfamilia CAL Rejo Sucio MP';
            ToolTip = 'Specifies the value of the Subfamilia CAL Rejo Sucio MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50567; "Subfamilia CAL Rejo Sucio PT"; Code[10])
        {
            Caption = 'Subfamilia CAL Rejo Sucio PT';
            ToolTip = 'Specifies the value of the Subfamilia CAL Rejo Sucio PT field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50568; "Nombre libro diario consumos"; Code[10])
        {
            Caption = 'Nombre libro diario consumos';
            ToolTip = 'Specifies the value of the Nombre libro diario consumos field.';
            TableRelation = "Item Journal Template".Name;
        }
        field(50569; "Sección libro diario consumos"; Code[10])
        {
            Caption = 'Sección libro diario consumos';
            ToolTip = 'Specifies the value of the Sección libro diario consumos field.';
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre libro diario consumos"));
        }
        field(50570; "Calcular valores en lista"; Boolean)
        {
            Caption = 'Calcular valores en lista';
            ToolTip = 'Specifies the value of the Calcular valores en lista field.';
        }
        field(50571; "Familia LAN SE 3ros"; Code[10])
        {
            Caption = 'Familia LAN SE 3ros';
            ToolTip = 'Specifies the value of the Familia LAN SE 3ros field.';
            TableRelation = "Subfamilia producto";
        }
        field(50572; "Subfamilia LAN Entero MP"; Code[20])
        {
            Caption = 'Subfamilia LAN Entero MP';
            ToolTip = 'Specifies the value of the Subfamilia LAN Entero MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50573; "Subfamilia LAN Cola MP"; Code[20])
        {
            Caption = 'Subfamilia LAN Cola MP';
            ToolTip = 'Specifies the value of the Subfamilia LAN Cola MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50574; "Subfamilia LAN Pelado MP"; Code[20])
        {
            Caption = 'Subfamilia LAN Pelado MP';
            ToolTip = 'Specifies the value of the Subfamilia LAN Pelado MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50575; "Subfamilia LAN Residuos"; Code[10])
        {
            Caption = 'Subfamilia LAN Residuos';
            ToolTip = 'Specifies the value of the Subfamilia LAN Residuos field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50576; "Subfamilia LAN Roto MP"; Code[20])
        {
            Caption = 'Subfamilia LAN Roto MP';
            ToolTip = 'Specifies the value of the Subfamilia LAN Roto MP field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50577; "Subfamilia LAN P&D PT"; Code[10])
        {
            Caption = 'Subfamilia LAN P&D PT';
            ToolTip = 'Specifies the value of the Subfamilia LAN P&D PT field.';
            TableRelation = "Subfamilia producto".Code;
        }
        field(50578; "Familia SE Propia"; Code[10])
        {
            Caption = 'Familia SE Propia';
            ToolTip = 'Specifies the value of the Familia SE Propia field.';
            DataClassification = ToBeClassified;
            TableRelation = "Familia producto".Code;
        }
        field(50579; "Familia SE Tercero"; Code[10])
        {
            Caption = 'Familia SE Tercero';
            ToolTip = 'Specifies the value of the Familia SE Tercero field.';
            DataClassification = ToBeClassified;
            TableRelation = "Familia producto".Code;
        }
        field(50580; "Categoria productos pesca"; Code[10])
        {
            Caption = 'Categoria productos pesca';
            ToolTip = 'Specifies the value of the Categoria productos pesca field.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Category";
        }
        field(50581; "Categoria productos consumo"; Code[10])
        {
            Caption = 'Categoria productos consumo';
            ToolTip = 'Specifies the value of the Categoria productos consumo field.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Category";
        }
        field(50582; "Produccion Mix"; Code[10])
        {
            Caption = 'Produccion Mix';
            ToolTip = 'Specifies the value of the Produccion Mix field.';
            CaptionClass = '1,2,3';
            DataClassification = ToBeClassified;

        }
        field(50583; "Dimensión FAO"; Code[10])
        {
            Caption = 'Dimensión FAO';
            ToolTip = 'Specifies the value of the Dimensión FAO field.';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50584; "DCL Series"; Code[10])
        {
            Caption = 'No. serie DCL';
            ToolTip = 'Specifies the value of the No. serie DCL field.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50585; "% dif. kilos en lote"; Decimal)
        {
            Caption = '% dif. kilos en lote';
            ToolTip = 'Specifies the value of the % dif. kilos en lote field.';
            DataClassification = ToBeClassified;
        }
        field(50586; "Verify origin lot in transfers"; Boolean)
        {
            Caption = 'Verificar lote origen en transferencias';
            ToolTip = 'Specifies the value of the Verificar lote origen en transferencias field.';
            DataClassification = ToBeClassified;
        }
        field(50587; "Cantidad etiquetas por pallet"; Integer)
        {
            Caption = 'Cantidad etiquetas por pallet';
            ToolTip = 'Specifies the value of the Cantidad etiquetas por pallet field.';
            DataClassification = ToBeClassified;
            InitValue = 2;
        }
        field(50588; "Avoid rounding valid. invent."; Boolean)
        {
            Caption = 'Evitar validaciones redondeo coste';
            ToolTip = 'Specifies the value of the Evitar validaciones redondeo coste field.';
            DataClassification = ToBeClassified;
        }
        field(50589; "Ticket Pesaje"; Boolean)
        {
            Caption = 'Ticket Pesaje';
            ToolTip = 'Specifies the value of the Ticket Pesaje field.';
            DataClassification = ToBeClassified;
        }
        field(50590; "Weighing Ticket Serie"; Code[10])
        {
            Caption = 'Numerador Ticket Pesada';
            ToolTip = 'Specifies the value of the Numerador Ticket Pesada field.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50591; "No internal warehouse entries"; Boolean)
        {
            Caption = 'No hay movimientos de almacén internos';
            ToolTip = 'Specifies the value of the No hay movimientos de almacén internos field.';
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Some unadjusted value entries will not be covered with the new setting. You must run the Adjust Cost - Item Entries batch job once to adjust these.;ESP=La nueva configuración no cubrirá algunos movs. valor sin ajustar. Debe ejecutar el trabajo por lotes Valorar stock - movs. producto una vez para ajustarlos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Some unadjusted value entries will not be covered with the new setting. You must run the Adjust Cost - Item Entries batch job once to adjust these.;ESP=La nueva configuración no cubrir? algunos movs. valor sin ajustar. Debe ejecutar el trabajo por lotes Valorar stock - movs. producto una vez para ajustarlos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=The program has cancelled the change that would have caused an adjustment of all items.;ESP=El programa ha cancelado el cambio que habría causado un ajuste de todos los productos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=The program has cancelled the change that would have caused an adjustment of all items.;ESP=El programa ha cancelado el cambio que habr?a causado un ajuste de todos los productos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=%1 has been changed to %2. You should now run %3.;ESP=Se ha cambiado %1 a %2. Ahora debería ejecutar %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=%1 has been changed to %2. You should now run %3.;ESP=Se ha cambiado %1 a %2. Ahora debería ejecutar %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=The field %1 should not be set to %2 if field %3 in %4 table is set to %5 because of possibility of deadlocks.;ESP=El campo %1 no debe estar establecido en %2 si el campo %3 de la tabla %4 está definido en %5 debido a la posibilidad de bloqueos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=The field %1 should not be set to %2 if field %3 in %4 table is set to %5 because of possibility of deadlocks.;ESP=El campo %1 no debe estar establecido en %2 si el campo %3 de la tabla %4 está definido en %5 debido a la posibilidad de bloqueos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ItemEntriesAdjustQst(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //ItemEntriesAdjustQst : @@@=%1 - field caption;ENU=If you change the %1, the program must adjust all item entries.The adjustment of all entries can take several hours.\Do you really want to change the %1?;ESP=Si cambia %1, el programa debe ajustar todos los movimientos de producto. El ajuste de todos los movimientos puede tardar varias horas.\¿Realmente desea cambiar %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemEntriesAdjustQst : @@@=%1 - field caption;ENU=If you change the %1, the program must adjust all item entries.The adjustment of all entries can take several hours.\Do you really want to change the %1?;ESP=Si cambia %1, el programa debe ajustar todos los movimientos de producto. El ajuste de todos los movimientos puede tardar varias horas.\?Realmente desea cambiar %1?;
    //Variable type has not been exported.
}

