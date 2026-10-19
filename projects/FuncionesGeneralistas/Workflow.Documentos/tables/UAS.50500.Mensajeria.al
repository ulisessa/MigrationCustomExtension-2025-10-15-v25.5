table 50500 Mensajeria
{
    // IBdos Argentina - USS - Adición Arbumasa


    fields
    {
        field(1; "No. Linea"; Integer)
        {
            Caption = 'No. Linea';
            ToolTip = 'Specifies the value of the No. Linea field.';
            NotBlank = false;
        }
        field(2; "Destinatario/Grupo"; Code[40])
        {
            Caption = 'Destinatario/Grupo';
            ToolTip = 'Specifies the value of the Destinatario/Grupo field.';
            TableRelation = User;
            ValidateTableRelation = false;
        }
        field(3; Asunto; Text[250])
        {
            Caption = 'Asunto';
            ToolTip = 'Specifies the value of the Asunto field.';
        }
        field(4; Remitente; Code[40])
        {
            Caption = 'Remitente';
            ToolTip = 'Specifies the value of the Remitente field.';
        }
        field(5; Fecha; Date)
        {
            Caption = 'Fecha';
            ToolTip = 'Specifies the value of the Fecha field.';
        }
        field(6; Recibido; Boolean)
        {
            Caption = 'Recibido';
            ToolTip = 'Specifies the value of the Recibido field.';
        }
        field(7; Hora; Time)
        {
            Caption = 'Time';
            ToolTip = 'Specifies the value of the Time field.';
        }
        field(8; "Tipo Documento"; Text[40])
        {
            Caption = 'Document Type';
            ToolTip = 'Specifies the value of the Document Type field.';
            TableRelation = "Tipos documento";
        }
        field(9; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(10; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            TableRelation = Estados;
        }
        field(11; "Fecha recepcion"; Date)
        {
            Caption = 'Fecha recepcion';
            ToolTip = 'Specifies the value of the Fecha recepcion field.';
        }
        field(12; "Hora recepcion"; Time)
        {
            Caption = 'Hora recepcion';
            ToolTip = 'Specifies the value of the Hora recepcion field.';
        }
        field(13; "Fecha ultima modificacion"; Date)
        {
            Caption = 'Fecha ultima modificacion';
            ToolTip = 'Specifies the value of the Fecha ultima modificacion field.';
        }
        field(14; "Hora ultima modificacion"; Time)
        {
            Caption = 'Hora ultima modificacion';
            ToolTip = 'Specifies the value of the Hora ultima modificacion field.';
        }
        field(15; "Usuario que modifico"; Code[50])
        {
            Caption = 'Usuario que modifico';
            ToolTip = 'Specifies the value of the Usuario que modifico field.';
        }
        field(16; "Tipo movimiento"; Option)
        {
            Caption = 'Tipo movimiento';
            ToolTip = 'Specifies the value of the Tipo movimiento field.';
            OptionMembers = Mensaje,Seguimiento,"Mensaje con Seguimiento",Alerta,"Flujo documentos","Seguimiento flujo documentos";
        }
        field(17; "1er Nivel"; Code[20])
        {
            Caption = '1er Nivel';
            ToolTip = 'Specifies the value of the 1er Nivel field.';
        }
        field(18; "2er Nivel"; Code[20])
        {
            Caption = '2er Nivel';
            ToolTip = 'Specifies the value of the 2er Nivel field.';
        }
        field(19; "No. Mensaje"; Code[30])
        {
            Caption = 'No. Mensaje';
            ToolTip = 'Specifies the value of the No. Mensaje field.';
            NotBlank = true;
        }
        field(20; Subdepartamento; Code[20])
        {
            Caption = 'Subdepartamento';
            ToolTip = 'Specifies the value of the Subdepartamento field.';
        }
        field(21; "5to Nivel"; Code[20])
        {
            Caption = '5to Nivel';
            ToolTip = 'Specifies the value of the 5to Nivel field.';
        }
        field(22; "6to Nivel"; Code[20])
        {
            Caption = '6to Nivel';
            ToolTip = 'Specifies the value of the 6to Nivel field.';
        }
        field(23; "Mes costo"; Code[20])
        {
            Caption = 'Mes costo';
            ToolTip = 'Specifies the value of the Mes costo field.';
        }
        field(24; "Fecha aprobacion"; Date)
        {
            Caption = 'Fecha aprobacion';
            ToolTip = 'Specifies the value of the Fecha aprobacion field.';
        }
        field(25; Hipervinculo; Text[240])
        {
            Caption = 'Hipervinculo';
            ToolTip = 'Specifies the value of the Hipervinculo field.';
        }
        field(26; "Documentos vinculados"; Integer)
        {
            Caption = 'Documentos vinculados';
            ToolTip = 'Specifies the value of the Documentos vinculados field.';
            CalcFormula = Count("Vinculación documentos" WHERE("No. mensaje" = FIELD("No. Mensaje")));
            FieldClass = FlowField;

        }
        field(27; Detalle; Text[120])
        {
            Caption = 'Detalle';
            ToolTip = 'Specifies the value of the Detalle field.';
            CalcFormula = Lookup("Detalle mensajería".Mensaje WHERE("No. mensaje" = FIELD(UPPERLIMIT("No. Mensaje"))));
            FieldClass = FlowField;
        }
        field(100; "Tipo documento digital"; Code[20])
        {
            Caption = 'Tipo documento digital';
            ToolTip = 'Specifies the value of the Tipo documento digital field.';
        }
        field(101; "Fecha digitalizacion"; Date)
        {
            Caption = 'Fecha digitalizacion';
            ToolTip = 'Specifies the value of the Fecha digitalizacion field.';
        }
        field(102; Departamento; Code[20])
        {
            Caption = 'Departamento';
            ToolTip = 'Specifies the value of the Departamento field.';
        }
        field(103; "Codigo vinculante"; Code[20])
        {
            Caption = 'Codigo vinculante';
            ToolTip = 'Specifies the value of the Codigo vinculante field.';
        }
        field(104; Usuario; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
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
            Caption = 'Ciudad';
            ToolTip = 'Specifies the value of the Ciudad field.';
            TableRelation = "Entry/Exit Point".Code WHERE("Descripción 2" = FILTER(<> ''));
        }
        field(106; Indentar; Integer)
        {
            Caption = 'Indentation';
            ToolTip = 'Specifies the value of the Indentation field.';
        }
        field(107; Cantidad; Integer)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
        }
        field(108; "Importe pendiente"; Decimal)
        {
            Caption = 'Importe pendiente';
            ToolTip = 'Specifies the value of the Importe pendiente field.';
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

