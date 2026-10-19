tableextension 50436 tableextension50436 extends "Jobs Setup"
{
    fields
    {
        modify("Job Nos.")
        {
            Caption = 'Job Nos.';
        }
        modify("Apply Usage Link by Default")
        {
            Caption = 'Apply Usage Link by Default';
        }
        modify("Default WIP Method")
        {
            Caption = 'Default WIP Method';
        }
        modify("Default WIP Posting Method")
        {
            Caption = 'Default WIP Posting Method';
        }
        modify("Allow Sched/Contract Lines Def")
        {
            Caption = 'Allow Sched/Contract Lines Def';
        }
        modify("Logo Position on Documents")
        {
            Caption = 'Logo Position on Documents';
        }
        modify("Automatic Update Job Item Cost")
        {
            Caption = 'Automatic Update Job Item Cost';
        }
        field(50000; "Proyecto Ajuste Positivo"; Code[20])
        {
            Caption = 'Proyecto Ajuste Positivo';
            ToolTip = 'Specifies the value of the Proyecto Ajuste Positivo field.';
            TableRelation = Job;
        }
        field(50001; "Proyecto Ajuste Negativo"; Code[20])
        {
            Caption = 'Proyecto Ajuste Negativo';
            ToolTip = 'Specifies the value of the Proyecto Ajuste Negativo field.';
            TableRelation = Job;
        }
        field(50002; "Libro Transferencias Planta"; Code[10])
        {
            Caption = 'Libro Transferencias Planta';
            ToolTip = 'Specifies the value of the Libro Transferencias Planta field.';
        }
        field(50003; "Sección Transferencias Planta"; Code[10])
        {
            Caption = 'Sección Transferencias Planta';
            ToolTip = 'Specifies the value of the Sección Transferencias Planta field.';
            TableRelation = "Job Journal Batch".Name;
        }
        field(50004; "Libro Ajustes"; Code[10])
        {
            Caption = 'Libro Ajustes';
            ToolTip = 'Specifies the value of the Libro Ajustes field.';
            TableRelation = "Job Journal Batch";
        }
        field(50005; "Sección Ajustes"; Code[10])
        {
            Caption = 'Sección Ajustes';
            ToolTip = 'Specifies the value of the Sección Ajustes field.';
            TableRelation = "Job Journal Batch".Name;
        }
        field(50006; "Sección Cancelaciones"; Code[10])
        {
            Caption = 'Sección Cancelaciones';
            ToolTip = 'Specifies the value of the Sección Cancelaciones field.';
            TableRelation = "Job Journal Batch".Name;
        }
        field(50007; "Libro diario proyecto impo"; Code[10])
        {
            Caption = 'Libro diario proyecto impo';
            ToolTip = 'Specifies the value of the Libro diario proyecto impo field.';
            TableRelation = "Job Journal Batch";
        }
        field(50008; "Sección diario proyecto impo"; Code[10])
        {
            Caption = 'Sección diario proyecto impo';
            ToolTip = 'Specifies the value of the Sección diario proyecto impo field.';
            TableRelation = "Job Journal Batch".Name WHERE("Journal Template Name" = FIELD("Libro diario proyecto impo"));
        }
        field(50009; "Calcular Lote Origen para"; Option)
        {
            Caption = 'Calcular Lote Origen para';
            ToolTip = 'Specifies the value of the Calcular Lote Origen para field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Planta,Cliente,Buque,Estructura,Tercero;
        }
        field(50010; "Job task default line"; Integer)
        {
            Caption = 'Ln. pred. tarea proyecto';
            ToolTip = 'Specifies the value of the Ln. pred. tarea proyecto field.';
            DataClassification = ToBeClassified;
            InitValue = 1000;
        }
        field(50011; "Stock invoicing journal"; Code[10])
        {
            Caption = 'Libro diario facturación stock';
            ToolTip = 'Specifies the value of the Libro diario facturación stock field.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Journal Template".Name;
        }
        field(50012; "Stock invoicing section"; Code[10])
        {
            Caption = 'Sección diario facturación stock';
            ToolTip = 'Specifies the value of the Sección diario facturación stock field.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Journal Batch".Name WHERE("Journal Template Name" = FIELD("Stock invoicing journal"));
        }
        field(50013; "Vessel dimension"; Code[20])
        {
            Caption = 'Vessel dimension';
            ToolTip = 'Specifies the dimension used for vessels and plants specified for a Job.';
            TableRelation = "Dimension".Code;
        }
        field(50014; "Tide dimension"; Code[20])
        {
            Caption = 'Tide dimension';
            ToolTip = 'Specifies the tide dimension specified for a Job.';
            TableRelation = "Dimension".Code;
        }
    }
}

