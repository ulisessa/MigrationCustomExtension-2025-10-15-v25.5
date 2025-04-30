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
            TableRelation = "Tipos documento";
        }
        field(3; "Descripción"; Text[199])
        {
        }
        field(50000; "No. Documento"; Code[30])
        {
            NotBlank = true;
        }
        field(50001; Aprobado; Boolean)
        {

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
        }
        field(50003; Usuario; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(50004; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50005; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50006; "Global Dimension 3"; Code[10])
        {
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cód. 3oNivel"));
            end;
        }
        field(50007; "Global Dimension 4"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50008; "Global Dimension 5"; Code[10])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50009; "Global Dimension 6"; Code[10])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50010; "Global Dimension 7"; Code[10])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50011; "No. serie"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50012; "Fecha Entrega"; Date)
        {
        }
        field(50013; Importancia; Option)
        {
            OptionMembers = Normal,Urgente;
        }
        field(50014; Procedencia; Option)
        {
            OptionMembers = Importado,Nacional;
        }
        field(50015; "Usuario Aprobación"; Code[20])
        {
        }
        field(50016; Observaciones; Text[250])
        {
        }
        field(50017; "Rechazado por motivo"; Text[250])
        {

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
        }
        field(50019; "Fecha aprobación"; Date)
        {
        }
        field(50020; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. Documento")));
            FieldClass = FlowField;
        }
        field(50021; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Concepto proyecto";
        }
        field(50597; "Fecha anulación"; Date)
        {
        }
        field(50598; "Usuario anulación"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {

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

