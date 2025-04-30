page 50057 "Copy Resource"
{
    Caption = 'Copy Resource';
    PageType = StandardDialog;
    SourceTable = Resource;

    layout
    {
        area(content)
        {
            group("Copiar desde")
            {
                Caption = 'Copy from';
                Visible = not blnNuevo;
                field(SourceJobNo; SourceJobNo)
                {
                    Caption = 'Job No.';
                    Editable = false;
                    TableRelation = Job;
                }
            }
            group("Copiar a")
            {
                Caption = 'Copy to';
                Visible = NOT blnNuevo;
                field(TargetJobNo; TargetJobNo)
                {
                    Caption = 'Job No.';
                }
                field(TargetJobDescription; TargetJobDescription)
                {
                    Caption = 'Descripción';
                }
            }
            group(New)
            {
                Caption = 'Nuevo';
                Visible = blnNuevo;
                field(Species; codEspecie)
                {
                    Caption = 'Especie';

                    trigger OnAssistEdit()
                    var
                        pgeDV: Page "Dimension Values";
                    begin
                        Clear(rstGLS);
                        Clear(rstDimV);
                        Clear(pgeDV);

                        rstGLS.Get();

                        rstDimV.SetRange("Dimension Code", rstGLS."Global Dimension 2 Code");
                        pgeDV.SetTableView(rstDimV);
                        pgeDV.LookupMode(true);
                        if pgeDV.RunModal = ACTION::LookupOK then begin

                            pgeDV.GetRecord(rstDimV);
                            codEspecie := rstDimV."Short code";

                        end;
                    end;

                    trigger OnValidate()
                    begin
                        fntArmarCodigo
                    end;
                }
                field(Prod_Level; optNivelProduccion)
                {
                    Caption = 'Nivel producción';
                    OptionCaption = ' ,Materia Prima,Producto Terminado,Semielaborado';

                    trigger OnValidate()
                    begin
                        case optNivelProduccion of
                            optNivelProduccion::"Materia Prima":
                                codNivelProduccion := 'P';
                            optNivelProduccion::"Producto Terminado":
                                codNivelProduccion := 'T';
                            optNivelProduccion::Semielaborado:
                                codNivelProduccion := 'S';
                        end;
                        fntArmarCodigo
                    end;
                }
                field(Source; optProcedencia)
                {
                    Caption = 'Procedencia';
                    OptionCaption = ' ,Buque,Planta';

                    trigger OnValidate()
                    begin
                        case optProcedencia of
                            optProcedencia::Buque:
                                codProcedencia := 'B';
                            optProcedencia::Planta:
                                codProcedencia := 'P';
                        end;
                        fntArmarCodigo
                    end;
                }
                field(Propriety; optPropiedad)
                {
                    Caption = 'Propiedad';
                    OptionCaption = ' ,Propio,Comprado,Tercero';

                    trigger OnValidate()
                    begin
                        case optPropiedad of
                            optPropiedad::Propio:
                                codPropiedad := 'P';
                            optPropiedad::Comprado:
                                codPropiedad := 'C';
                            optPropiedad::Tercero:
                                codPropiedad := 'T';
                        end;
                        fntArmarCodigo
                    end;
                }
                field("Order"; codOrden)
                {
                    Caption = 'Orden';

                    trigger OnValidate()
                    begin
                        fntArmarCodigo
                    end;
                }
                field(Specific; codEspecífico)
                {
                    Caption = 'Específico';

                    trigger OnValidate()
                    begin
                        fntArmarCodigo
                    end;
                }
                field("No. Producto"; strCodigoyLargo)
                {
                    Caption = 'Job No.';
                    Editable = false;
                }
                field(Description; TargetJobDescription)
                {
                    Caption = 'Descripción';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Copiar)
            {
            }
        }
    }

    trigger OnOpenPage()
    var
        dlgSelect: Dialog;
        Text000: Label '&Receive,&Invoice,Receive &and Invoice';
    begin
        Selection := StrMenu(Text000, 3);
        if Selection = 0 then
            exit;
        if Selection = 2 then begin

            SourceJobNo := "No.";
            TargetJobNo := "No.";
            TargetJobDescription := Name;
            blnNuevo := false;

        end
        else begin

            codOrden := 'CA01';
            blnNuevo := true;

        end;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        rstItem: Record Resource;
        rstIUM: Record "Resource Unit of Measure";
        rstItemNew: Record Resource;
        rstIUMNew: Record "Resource Unit of Measure";
        pgeItem: Page "Resource Card";
    begin
        if CloseAction in [ACTION::OK, ACTION::LookupOK] then begin
            Clear(rstItem);
            if Selection = 2 then
                rstItem.Get("No.");

            Clear(rstItemNew);
            rstItemNew := rstItem;
            rstItemNew."No." := TargetJobNo;
            rstItemNew.Validate(Name, TargetJobDescription);
            //rstItemNew.Usuario := USERID;
            rstItemNew.Insert;

            if rstItem."No." <> '' then begin

                Clear(rstIUM);
                rstIUM.SetRange("Resource No.", "No.");
                if rstIUM.FindSet then
                    repeat

                        Clear(rstIUMNew);
                        rstIUMNew := rstIUM;
                        rstIUMNew."Resource No." := TargetJobNo;
                        if not rstIUMNew.Insert then;

                    until rstIUM.Next = 0;
            end;
        end;

        if rstItemNew."No." <> '' then begin

            Clear(pgeItem);
            pgeItem.SetRecord(rstItemNew);
            pgeItem.Run;

        end;
    end;

    var
        SourceJobNo: Code[30];
        TargetJobNo: Code[30];
        TargetJobDescription: Text[200];
        Text001: Label 'The job was successfully copied.';
        Text002: Label 'Job No. %1 will be assigned to the new Job. Do you want to continue?';
        Text003: Label '%1 %2 does not exist.', Comment = 'Job Task 1000 does not exist.';
        Text004: Label 'Provide a valid source %1.';
        Selection: Integer;
        codEspecie: Code[10];
        optNivelProduccion: Option " ","Materia Prima","Producto Terminado",Semielaborado;
        codNivelProduccion: Code[10];
        optProcedencia: Option " ",Buque,Planta;
        codProcedencia: Code[10];
        optPropiedad: Option " ",Propio,Comprado,Tercero;
        codPropiedad: Code[10];
        codOrden: Code[10];
        "codEspecífico": Code[10];
        blnNuevo: Boolean;
        strCodigoyLargo: Code[40];
        rstDimV: Record "Dimension Value";
        rstGLS: Record "General Ledger Setup";

    local procedure ValidateUserInput()
    var
        JobsSetup: Record "Jobs Setup";
        NoSeriesManagement: Codeunit "No. Series";
    begin
    end;

    local procedure ValidateSource()
    begin
    end;

    local procedure fntArmarCodigo()
    begin
        TargetJobNo := codEspecie +
                        codNivelProduccion +
                        codProcedencia +
                        codPropiedad +
                        '-' +
                        codOrden +
                        '-' +
                        codEspecífico;
        strCodigoyLargo := TargetJobNo + '  (' + Format(StrLen(TargetJobNo)) + ')';
        if StrLen(TargetJobNo) > 20 then
            Error('El código no puede exceder los 20 caracteres. El actual consta de %1', StrLen(TargetJobNo));
    end;
}

