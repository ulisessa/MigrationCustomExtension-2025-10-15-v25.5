table 50102 "Cab. Vale consumo"
{


    fields
    {
        field(1; "Nombre Libro Consumo"; Code[20])
        {
            Caption = 'Nombre Libro Consumo';
            ToolTip = 'Specifies the value of the Nombre Libro Consumo field.';
            NotBlank = true;
            TableRelation = "Req. Wksh. Template";

            trigger OnValidate()
            var
                LibroDeman: Record "Req. Wksh. Template";
            begin
                LibroDeman.SetRange(Name, "Nombre Libro Consumo");
                if LibroDeman.Find('-') then;
                "No. Serie" := LibroDeman."No. Serie";
                "No. documento" := GestNoSerie.GetNextNo(LibroDeman."No. serie consumo", Today, true);

                //US.ARBU - 20040524 - Inicio Modificación Arbumasa para el seguimiento de documentos



                //US.ARBU - 20040524 - Fin Modificación Arbumasa para el seguimiento de documentos
            end;
        }
        field(2; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
            NotBlank = true;
        }
        field(3; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            ToolTip = 'Specifies the value of the Fecha registro field.';
        }
        field(4; "Descripción"; Text[199])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(5; Usuario; Code[30])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = "User Setup";
        }
        field(6; "No. Serie"; Code[10])
        {
            Caption = 'No. Serie';
            ToolTip = 'Specifies the value of the No. Serie field.';
            TableRelation = "No. Series";
        }
        field(7; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. documento"),
                                                          "Tipo Documento" = CONST('Vale de consumo')));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Nombre Libro Consumo", "No. documento")
        {
            Clustered = true;
        }
        key(Key2; "No. documento")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //US.ARBU - 20040524 - Inicio Modificación Arbumasa para el seguimiento de documentos
        if (Estado <> 'Abierto') and (Estado <> '') then
            Error('No se puede eliminar un vale registrado');



        //US.ARBU - 20040524 - Fin Modificación Arbumasa para el seguimiento de documentos
    end;

    trigger OnInsert()
    begin
        "Fecha registro" := WorkDate;
        Usuario := UserId;
    end;

    trigger OnRename()
    begin
        Error('No se puede renombrar esta tabla.');
    end;

    var
        GestNoSerie: Codeunit "No. Series";
        ConfExis: Record "Inventory Setup";
        Lin: Record "Lín. vale consumo";
        PunProy: Record Job;
        PunAlm: Record Location;
        PunDep: Record Dimension;
        rstMensajeria: Record Mensajeria;

        rstConfUsu: Record "User Setup";
        rstLinVC: Record "Lín. vale consumo";

    [Scope('OnPrem')]
    procedure Navigate()
    var
        NavigateForm: Page Navigate;
    begin
        NavigateForm.SetDoc("Fecha registro", "No. documento");
        NavigateForm.Run;
    end;
}

