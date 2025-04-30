table 50500 Mensajeria
{
    // IBdos Argentina - USS - Adición Arbumasa


    fields
    {
        field(1; "No. Linea"; Integer)
        {
            NotBlank = false;
        }
        field(2; "Destinatario/Grupo"; Code[40])
        {
            TableRelation = User;
            ValidateTableRelation = false;
        }
        field(3; Asunto; Text[250])
        {
        }
        field(4; Remitente; Code[40])
        {
        }
        field(5; Fecha; Date)
        {
        }
        field(6; Recibido; Boolean)
        {
        }
        field(7; Hora; Time)
        {
        }
        field(8; "Tipo Documento"; Text[40])
        {
            TableRelation = "Tipos documento";
        }
        field(9; "No. documento"; Code[30])
        {
        }
        field(10; Estado; Text[50])
        {
            TableRelation = Estados;
        }
        field(11; "Fecha recepcion"; Date)
        {
        }
        field(12; "Hora recepcion"; Time)
        {
        }
        field(13; "Fecha ultima modificacion"; Date)
        {
        }
        field(14; "Hora ultima modificacion"; Time)
        {
        }
        field(15; "Usuario que modifico"; Code[50])
        {
        }
        field(16; "Tipo movimiento"; Option)
        {
            OptionMembers = Mensaje,Seguimiento,"Mensaje con Seguimiento",Alerta,"Flujo documentos","Seguimiento flujo documentos";
        }
        field(17; "1er Nivel"; Code[20])
        {
        }
        field(18; "2er Nivel"; Code[20])
        {
        }
        field(19; "No. Mensaje"; Code[30])
        {
            NotBlank = true;
        }
        field(20; Subdepartamento; Code[20])
        {
        }
        field(21; "5to Nivel"; Code[20])
        {
        }
        field(22; "6to Nivel"; Code[20])
        {
        }
        field(23; "Mes costo"; Code[20])
        {
        }
        field(24; "Fecha aprobacion"; Date)
        {
        }
        field(25; Hipervinculo; Text[240])
        {
        }
        field(26; "Documentos vinculados"; Integer)
        {
            CalcFormula = Count("Vinculación documentos" WHERE("No. mensaje" = FIELD("No. Mensaje")));
            FieldClass = FlowField;

        }
        field(27; Detalle; Text[120])
        {
            CalcFormula = Lookup("Detalle mensajería".Mensaje WHERE("No. mensaje" = FIELD(UPPERLIMIT("No. Mensaje"))));
            FieldClass = FlowField;
        }
        field(100; "Tipo documento digital"; Code[20])
        {
        }
        field(101; "Fecha digitalizacion"; Date)
        {
        }
        field(102; Departamento; Code[20])
        {
        }
        field(103; "Codigo vinculante"; Code[20])
        {
        }
        field(104; Usuario; Code[50])
        {
            TableRelation = User."User Name";

            trigger OnValidate()
            begin
                Clear(rstConfUsu);
                if rstConfUsu.Get(Usuario) then begin

                    Ciudad := rstConfUsu.Ciudad;

                end;
            end;
        }
        field(105; Ciudad; Code[10])
        {
            TableRelation = "Entry/Exit Point".Code WHERE("Descripción 2" = FILTER(<> ''));
        }
        field(106; Indentar; Integer)
        {
        }
        field(107; Cantidad; Integer)
        {
        }
        field(108; "Importe pendiente"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Outstanding Amt. Ex. VAT (LCY)" WHERE("Document No." = FIELD("No. documento")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No. Linea")
        {
            Clustered = true;
        }
        key(Key2; Recibido, "Destinatario/Grupo", "Tipo movimiento")
        {
        }
        key(Key3; "Tipo Documento", "No. documento")
        {
        }
        key(Key4; "Tipo movimiento", "Tipo Documento", "No. documento")
        {
        }
        key(Key5; "No. Mensaje", "Destinatario/Grupo")
        {
        }
        key(Key6; "Tipo Documento", "No. documento", "Tipo movimiento")
        {
        }
        key(Key7; "No. documento")
        {
        }
        key(Key8; "Estado")
        {
        }
        key(Key9; Ciudad, "Destinatario/Grupo", "Tipo Documento")
        {
        }
    }

    fieldgroups
    {
    }

    var
        InfoEmpresa: Record "Company Information";
        rstVinculacionDocumentos: Record "Vinculación documentos";
        rstInfoEmpresa: Record "Company Information";
        rstConfUsu: Record "User Setup";
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        rstDocDigit: Record "Documentos digitalizados";
        rstDocVin: Record "Vinculación documentos";
        rstHRCompra: Record "Purch. Rcpt. Header";
        FormNavegar: Page Navigate;

    [Scope('OnPrem')]
    procedure Navegar()
    begin
        FormNavegar.SetDoc(0D, "No. documento");
        FormNavegar.Run;
    end;
}

