table 50533 "Maestro validaciones"
{
    DrillDownPageID = "Lista Maestro de Validaciones";
    LookupPageID = "Lista Maestro de Validaciones";

    fields
    {
        field(1; "Cód. validación"; Code[50])
        {
        }
        field(2; Tabla; Integer)
        {
            TableRelation = Object.ID WHERE(Type = CONST(Table));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = true;
            /*
            trigger OnLookup()
            begin
                Clear(frmObjeto);
                Clear(rstObjeto);
                frmObjeto.LookupMode := true;
                rstObjeto.SetRange(Type, rstObjeto.Type::Table);
                frmObjeto.SetTableView(rstObjeto);
                if frmObjeto.RunModal = ACTION::LookupOK then begin

                    frmObjeto.GetRecord(rstObjeto);
                    Tabla := rstObjeto.ID;

                end;
                rstRecordRef.GetTable(Rec);
                Validar(rstRecordRef, rstRecordRef.GetPosition());
            end;
            */
            trigger OnValidate()
            begin
                rstRecordRef.GetTable(Rec);
                Validar(rstRecordRef, rstRecordRef.GetPosition());
            end;
        }
        field(3; "Descripción"; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Cód. validación")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        rstObjeto: Record "Object";
        rstField: Record "Field";
        rstRecordRef: RecordRef;
        rstFieldRef: FieldRef;
        flrFieldRef: FieldRef;
        rstValidaciones: Record Validaciones;

    [Scope('OnPrem')]
    procedure Validar(rstRecord: RecordRef; strPosition: Text[250])
    begin
        rstRecord.SetPosition(strPosition);
    end;

    [Scope('OnPrem')]
    procedure ValidarCampo(rstRecord: RecordRef; strPosition: Text[250]; intCampo: Integer)
    begin
        rstRecord.SetPosition(strPosition);
        Message('%1', rstRecord.Name);
        Message('%1', flrFieldRef.Number);
        Message('%1', flrFieldRef.Value);
    end;
}

