table 50513 "Hist. Cab. solicitud"
{
    // IBdos Argentina - USS - 111102 - Adición Arbumasa
    // 
    // IBdos Argentina - USS - 191202 - Modificación Arbumasa
    //  a) Adición de función Navegar
    // 
    // IBdos Argentina - USS - 261202 - Modificación Arbumasa
    //  a) Ampliación del campo "No. documento" a Code 20
    // 
    // IBdos Argentina - USS - 160403 - Modificación Arbumasa
    //  a) Si el histórico no está aprobado, permite modificar la solicitud
    // 
    // IBdos Argentina - USS - 280503 - Modificación Arbumasa
    //  a) Agregué el código de seguimiento de documentos en la tabla

    DataCaptionFields = "Nombre libro Solicitud", "No. Documento";

    fields
    {
        field(1; "Nombre libro Solicitud"; Code[10])
        {
            Caption = 'Nombre libro Solicitud';
            ToolTip = 'Specifies the value of the Nombre libro Solicitud field.';
            NotBlank = true;
            TableRelation = "Req. Wksh. Template";

            trigger OnValidate()
            begin
                LibroDeman.SetRange(Name, "Nombre libro Solicitud");
                if LibroDeman.Find('-') then;
                "No. serie" := LibroDeman."No. Serie";
            end;
        }
        field(2; "Tipo documento"; Text[50])
        {
            Caption = 'Document Type';
            ToolTip = 'Specifies the value of the Document Type field.';
            TableRelation = "Tipos documento";
        }
        field(3; "Descripción"; Text[199])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(50000; "No. Documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
            NotBlank = true;
        }
        field(50001; Aprobado; Boolean)
        {
            Caption = 'Aprobado';
            ToolTip = 'Specifies the value of the Aprobado field.';

            trigger OnValidate()
            begin
                Clear(rstSeguridad);
                Clear(rstSeguridadUsuario);

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Aprobar solicitudes")) then
                    Error('Usted no está habilitado para aprobar solicitudes');
            end;
        }
        field(50002; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            ToolTip = 'Specifies the value of the Fecha registro field.';
        }
        field(50003; Usuario; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User."User Name";
        }
        field(50004; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50005; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50006; "Global Dimension 3"; Code[10])
        {
            Caption = 'Global Dimension 3';
            ToolTip = 'Specifies the value of the Global Dimension 3 field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cód. 3oNivel"));
            end;
        }
        field(50007; "Global Dimension 4"; Code[10])
        {
            Caption = 'Global Dimension 4';
            ToolTip = 'Specifies the value of the Global Dimension 4 field.';
            CaptionClass = '1,2,4';

        }
        field(50008; "Global Dimension 5"; Code[10])
        {
            Caption = 'Global Dimension 5';
            ToolTip = 'Specifies the value of the Global Dimension 5 field.';
            CaptionClass = '1,2,5';

        }
        field(50009; "Global Dimension 6"; Code[10])
        {
            Caption = 'Global Dimension 6';
            ToolTip = 'Specifies the value of the Global Dimension 6 field.';
            CaptionClass = '1,2,6';

        }
        field(50010; "Global Dimension 7"; Code[10])
        {
            Caption = 'Global Dimension 7';
            ToolTip = 'Specifies the value of the Global Dimension 7 field.';
            CaptionClass = '1,2,7';

        }
        field(50011; "No. serie"; Code[10])
        {
            Caption = 'No. serie';
            ToolTip = 'Specifies the value of the No. serie field.';
            TableRelation = "No. Series";
        }
        field(50012; "Fecha Entrega"; Date)
        {
            Caption = 'Fecha Entrega';
            ToolTip = 'Specifies the value of the Fecha Entrega field.';
        }
        field(50013; Importancia; Option)
        {
            Caption = 'Importancia';
            ToolTip = 'Specifies the value of the Importancia field.';
            OptionMembers = Normal,Urgente;
        }
        field(50014; Procedencia; Option)
        {
            Caption = 'Procedencia';
            ToolTip = 'Specifies the value of the Procedencia field.';
            OptionMembers = Importado,Nacional;
        }
        field(50015; "Usuario Aprobación"; Code[20])
        {
            Caption = 'Usuario Aprobación';
            ToolTip = 'Specifies the value of the Usuario Aprobación field.';
        }
        field(50016; Observaciones; Text[250])
        {
            Caption = 'Observaciones';
            ToolTip = 'Specifies the value of the Observaciones field.';
        }
        field(50017; "Rechazado por motivo"; Text[250])
        {
            Caption = 'Rechazado por motivo';
            ToolTip = 'Specifies the value of the Rechazado por motivo field.';

            trigger OnValidate()
            begin
                Clear(rstSeguridad);
                Clear(rstSeguridadUsuario);

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Aprobar solicitudes")) then
                    Error('Usted no está habilitado para rechazar solicitudes');
            end;
        }
        field(50018; "Fecha pedido"; Date)
        {
            Caption = 'Fecha pedido';
            ToolTip = 'Specifies the value of the Fecha pedido field.';
        }
        field(50019; "Fecha aprobación"; Date)
        {
            Caption = 'Approval Date';
            ToolTip = 'Specifies the value of the Approval Date field.';
        }
        field(50020; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. Documento")));
            FieldClass = FlowField;
        }
        field(50021; "Concepto proyecto"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
        }
        field(50597; "Fecha anulación"; Date)
        {
            Caption = 'Fecha anulación';
            ToolTip = 'Specifies the value of the Fecha anulación field.';
        }
        field(50598; "Usuario anulación"; Code[20])
        {
            Caption = 'Usuario anulación';
            ToolTip = 'Specifies the value of the Usuario anulación field.';
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';

        }
    }

    keys
    {
        key(Key1; "Nombre libro Solicitud", "No. Documento")
        {
            Clustered = true;
        }
        key(Key2; "No. Documento")
        {
        }
        key(Key3; "Fecha registro")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        linhoja.Reset;
        linhoja.SetRange("Nombre libro Solicitud", "Nombre libro Solicitud");
        linhoja.SetRange("No. Documento", "No. Documento");
        linhoja.DeleteAll;

    end;

    trigger OnInsert()
    begin
        Usuario := UserId;
    end;

    var
        LibroDeman: Record "Req. Wksh. Template";
        LinDema: Record "Requisition Line";
        rstConfUsuario: Record "User Setup";
        rstSeguridad: Record Seguridad;
        linhoja: Record "Hist. Cab. solicitud";
        rstMensajeria: Record Mensajeria;
        blnAprobar: Boolean;
        rstSeguridadUsuario: Record "Seguridad por usuario";

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        //IBdos Argentina - USS - 191202 - Inicio Modificación Arbumasa
        //Adición de función Navegar

        FormNavegar.SetDoc("Fecha registro", "No. Documento");
        FormNavegar.Run;

        //IBdos Argentina - USS - 191202 - Fin Modificación Arbumasa
    end;
}

