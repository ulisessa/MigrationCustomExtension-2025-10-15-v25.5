codeunit 50519 "Completar variables"
{

    trigger OnRun()
    begin
    end;

    var
        Error0001: Label 'Debe completar todos los parámetros del cálculo';
        rstObjeto: Record "Object";
        rstField: Record "Field";
        rstRecordRef: RecordRef;
        rstFieldRef: FieldRef;
        flrFieldRef: FieldRef;
        rstMaestroValidaciones: Record "Maestro validaciones";
        flrFieldRef2: FieldRef;
        i: Integer;
        j: Integer;
        rstCliente: Record Customer;
        rstProveedor: Record Vendor;
        rstProyecto: Record Job;
        exrstValidaciones: Record Validaciones;
        rstMValidaciones: Record "Maestro validaciones";
        rstPersonalEmbarcado: Record "Personal embarcado";
        rstRecursos: Record Resource;
        rstProductos: Record Item;
        Text50001: Label 'El valor del campo %1 debe ser %2 a %3';
        codFormula: Code[20];

    [Scope('OnPrem')]
    procedure fntVerificarFormula(codFormula: Code[20])
    var
        rstFormValid: Record "Formulas por Validación";
    begin
        Clear(rstFormValid);
        rstFormValid.SetRange("Cód. fórmula", codFormula);
        if rstFormValid.FindSet then
            repeat

                fntCompletarVariables(rstFormValid.Validación);

            until rstFormValid.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure fntCompletarVariables(codMaestro: Code[30])
    var
        l_rstValidacion: Record Validaciones;
        frmValidaciones: Page "Lista validaciones";
    begin
        Clear(l_rstValidacion);
        l_rstValidacion.SetRange("Cód. fórmula", codMaestro);
        l_rstValidacion.SetRange(Tipo, l_rstValidacion.Tipo::Condicionante, l_rstValidacion.Tipo::Condicionar);
        l_rstValidacion.SetRange("Tipo de valor", l_rstValidacion."Tipo de valor"::"Entrada variable");
        if l_rstValidacion.FindFirst then begin

            //Presenta el formulario para cargar las variables

            Clear(frmValidaciones);
            frmValidaciones.LookupMode := true;
            frmValidaciones.SetTableView(l_rstValidacion);
            if not (frmValidaciones.RunModal = ACTION::LookupOK) then
                Error(Error0001)
            else begin

                Clear(l_rstValidacion);
                l_rstValidacion.SetRange("Cód. fórmula", codMaestro);
                l_rstValidacion.SetRange("Tipo de valor", l_rstValidacion."Tipo de valor"::"Entrada variable");
                l_rstValidacion.SetRange(Campo, 0);
                if l_rstValidacion.FindFirst then
                    Error(Error0001)

            end;

        end;
    end;
}

