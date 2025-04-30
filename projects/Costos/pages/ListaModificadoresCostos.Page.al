page 50033 "Lista Modificadores Costos"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Modificadores Costos";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Tipo registro"; "Tipo registro")
                {
                }
                field(Proyecto; Proyecto)
                {
                }
                field(Buque; Buque)
                {
                }
                field(Actividad; Actividad)
                {
                }
                field(Marea; Marea)
                {
                }
                field("Forma de reparto"; "Forma de reparto")
                {
                }
                field("Criterio de reparto"; "Criterio de reparto")
                {
                }
                field("Starting date"; "Starting date")
                {
                }
                field("Ending date"; "Ending date")
                {
                }
                field("Kilos capturados"; "Kilos capturados")
                {
                }
                field("USD a proyecto"; "USD a proyecto")
                {
                }
                field("No. cuenta"; "No. cuenta")
                {
                }
                field("No. documento"; "No. documento")
                {
                }
                field("Nombre de cuenta"; "Nombre de cuenta")
                {
                }
                field("Grupo de cuenta"; "Grupo de cuenta")
                {
                }
                field("Denominación de costos"; "Denominación de costos")
                {
                }
                field("USD registrados"; "USD registrados")
                {
                }
                field("Días de marea proyecto"; "Días de marea proyecto")
                {
                }
                field("Días de marea anuales"; "Días de marea anuales")
                {
                }
                field("Fecha modificada"; "Fecha modificada")
                {
                }
                field("Año modificado"; "Año modificado")
                {
                }
                field("Automático"; Automático)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ac&ciones")
            {
                Caption = 'Ac&ciones';
                action("Copiar año anterior")
                {
                    Caption = 'Copiar año anterior';

                    trigger OnAction()
                    begin
                        Clear(rstPresupuesto);
                        rstPresupuesto.Find('+');

                        intUltimoMov := rstPresupuesto."Tipo registro";

                        if Confirm('Desea generar una copia de los registros del año pasado?') then begin

                            Clear(Rec);
                            SetCurrentKey("Año modificado");
                            SetRange("Año modificado", Date2DMY(Today, 3) - 1);
                            if Find('-') then
                                repeat

                                    intUltimoMov += 1;
                                    Clear(rstPresupuesto);
                                    rstPresupuesto := Rec;
                                    rstPresupuesto."Tipo registro" := intUltimoMov;
                                    rstPresupuesto."Año modificado" := Date2DMY(Today, 3);
                                    rstPresupuesto.Insert;

                                until Next = 0;

                        end;

                        Clear(Rec);
                        Message('Proceso finalizado');
                    end;
                }
                action("Copiar otro proyecto")
                {
                    Caption = 'Copiar otro proyecto';

                    trigger OnAction()
                    var
                        frmAcciones: Page "Acciones presupuesto costos";
                    begin
                        Clear(frmAcciones);
                        SetRecFilter();
                        frmAcciones.fntProyPres(Rec);
                        frmAcciones.RunModal;
                        Clear(Rec);
                    end;
                }
            }
        }
    }

    var
        intUltimoMov: Integer;
        rstPresupuesto: Record "Modificadores Costos";
}

