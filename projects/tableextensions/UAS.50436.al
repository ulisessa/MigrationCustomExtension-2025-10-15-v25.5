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
            TableRelation = Job;
        }
        field(50001; "Proyecto Ajuste Negativo"; Code[20])
        {
            TableRelation = Job;
        }
        field(50002; "Libro Transferencias Planta"; Code[10])
        {
        }
        field(50003; "Sección Transferencias Planta"; Code[10])
        {
            TableRelation = "Job Journal Batch".Name;
        }
        field(50004; "Libro Ajustes"; Code[10])
        {
            TableRelation = "Job Journal Batch";
        }
        field(50005; "Sección Ajustes"; Code[10])
        {
            TableRelation = "Job Journal Batch".Name;
        }
        field(50006; "Sección Cancelaciones"; Code[10])
        {
            TableRelation = "Job Journal Batch".Name;
        }
        field(50007; "Libro diario proyecto impo"; Code[10])
        {
            TableRelation = "Job Journal Batch";
        }
        field(50008; "Sección diario proyecto impo"; Code[10])
        {
            TableRelation = "Job Journal Batch".Name WHERE("Journal Template Name" = FIELD("Libro diario proyecto impo"));
        }
        field(50009; "Calcular Lote Origen para"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Planta,Cliente,Buque,Estructura,Tercero;
        }
        field(50010; "Job task default line"; Integer)
        {
            Caption = 'Ln. pred. tarea proyecto';
            DataClassification = ToBeClassified;
            InitValue = 1000;
        }
        field(50011; "Stock invoicing journal"; Code[10])
        {
            Caption = 'Libro diario facturación stock';
            DataClassification = ToBeClassified;
            TableRelation = "Job Journal Template".Name;
        }
        field(50012; "Stock invoicing section"; Code[10])
        {
            Caption = 'Sección diario facturación stock';
            DataClassification = ToBeClassified;
            TableRelation = "Job Journal Batch".Name WHERE("Journal Template Name" = FIELD("Stock invoicing journal"));
        }
    }
}

