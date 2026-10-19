table 50550 "Ruta digitalizacion depto/espe"
{

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
        }
        field(2; Departamento; Code[20])
        {
            Caption = 'Departamento';
            ToolTip = 'Specifies the value of the Departamento field.';
            TableRelation = Seguridad;
        }
        field(3; Especifico; Text[250])
        {
            Caption = 'Especifico';
            ToolTip = 'Specifies the value of the Especifico field.';

            trigger OnValidate()
            begin
                /*IF COPYSTR(Especifico,STRLEN(Especifico),1) <> '\' THEN
                  Especifico := Especifico+'\';
                  */

            end;
        }
        field(4; Documento; Text[250])
        {
            Caption = 'Documento';
            ToolTip = 'Specifies the value of the Documento field.';
        }
        field(5; Tabla; Integer)
        {
            Caption = 'Tabla';
            ToolTip = 'Specifies the value of the Tabla field.';
            TableRelation = "Table Information"."Table No.";
        }
        field(6; "Nombre tabla"; Text[50])
        {
            Caption = 'Nombre tabla';
            ToolTip = 'Specifies the value of the Nombre tabla field.';
            CalcFormula = Lookup("Table Information"."Table Name" WHERE("Table No." = FIELD(Tabla)));
            FieldClass = FlowField;
        }
        field(7; Ruta; Text[250])
        {
            Caption = 'Ruta';
            ToolTip = 'Specifies the value of the Ruta field.';
        }
        field(8; "Niveles por ruta"; Integer)
        {
            Caption = 'Niveles por ruta';
            ToolTip = 'Specifies the value of the Niveles por ruta field.';
            CalcFormula = Count("Específicos por ruta" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(9; "Tipo documento"; Option)
        {
            Caption = 'Document Type';
            ToolTip = 'Specifies the value of the Document Type field.';
            OptionMembers = " ",Remito,Factura,"Débito","Crédito",Recibo,"Factura pronto vencimiento","Déb.Vto.";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Departamento)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*CLEAR(cduGestionNoSerie);
        CLEAR(rstInfoEmpresa);
        rstInfoEmpresa.GET();
        "No." := cduGestionNoSerie.GetNextNo(rstInfoEmpresa."No. Serie digitalización",TODAY,TRUE);
        CLEAR(rstNivelesEspecificos);
        CLEAR(rstNiveles);
        
        rstNiveles.SETRANGE(Requerido,TRUE);
        IF rstNiveles.FIND('-') THEN
        REPEAT
        
          i += 10000;
          CLEAR(rstNivelesEspecificos);
          rstNivelesEspecificos."No." := "No.";
          rstNivelesEspecificos."No. línea" := i;
          rstNivelesEspecificos.Nivel := rstNiveles."Cód. Nivel";
          rstNivelesEspecificos."Descripción nivel" := rstNiveles."Descripción Nivel";
          rstNivelesEspecificos.INSERT;
        
        UNTIL rstNiveles.NEXT = 0;
        */

    end;

    var
        rstInfoEmpresa: Record "Company Information";
        rstNivelesEspecificos: Record "Específicos por ruta";
        rstNiveles: Record "Niveles de archivo";
        i: Integer;
        cduFileManager: Codeunit "File Management";
        strRuta: Text;
}

