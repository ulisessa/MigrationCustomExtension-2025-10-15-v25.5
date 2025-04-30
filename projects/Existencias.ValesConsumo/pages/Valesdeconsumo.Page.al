page 50542 "Vales de consumo"
{
    // IBdos Argentina - USS - 040403 - Modificación Arbumasa
    //  a) Botón para imprimir
    // 
    // IBdos Argentina - USS - 200503 - Modificación Arbumasa
    //  a) No se puede ingresar una descripción con cantidad

    AutoSplitKey = false;
    CardPageID = "Vale de consumo";
    DeleteAllowed = false;
    PageType = List;
    RefreshOnActivate = true;
    SaveValues = true;
    SourceTable = "Cab. Vale consumo";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000004)
            {
                ShowCaption = false;
                field("Nombre Libro Consumo"; "Nombre Libro Consumo")
                {

                    trigger OnValidate()
                    var
                        LibroDeman: Record "Req. Wksh. Template";
                        GestNoSerie: Codeunit "No. Series";
                    begin
                        LibroDeman.SetRange(Name, "Nombre Libro Consumo");
                        if LibroDeman.Find('-') then;
                        "No. Serie" := LibroDeman."No. Serie";
                        "No. documento" := GestNoSerie.GetNextNo(LibroDeman."No. Serie", Today, true);
                    end;
                }
                field("No. documento"; "No. documento")
                {
                }
                field("Fecha registro"; "Fecha registro")
                {
                }
                field("Descripción"; Descripción)
                {
                }
                field(Usuario; Usuario)
                {
                }
                field(Estado; Estado)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Imprimir")
            {
                Caption = '&Imprimir';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Process;
                RunPageOnRec = true;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        rstSegUsu: Record "Seguridad cambio estados";
    begin
    end;

    var
        linhoja: Record "Lín. solicitud";
        HistCabDem: Record Solicitud;
        HistLinDem: Record "Lín. solicitud";
        Mensaje: Text[250];
        ConfUsu: Record "User Setup";
        Tipo: Option " ","Solicitud (compras)","Cotización (compras)","Pedido (compras)","Factura (compras)","Reparto (ventas)","Factura (ventas)","Vale de consumo","Vale de consumo en tránsito";
        Estado: Option " ","A aprobar","A confirmar",Abierta,Abierto,Aprobada,"Aprobada y registrada","Aprobado y registrado",Completada,Eliminada,Eliminado,"En factura","En proceso",Promovida,"Promovido a tránsito",Rechazada,Recibida,Recirculado,Registrada,"Registrado a proyecto";
        PunMensajeria: Record Mensajeria;
        PunTipoDocumento: Record "Tipos documento";
        ImprSol: Report "Solicitud Provisoria";
        CodeMens: Codeunit "Mensajería";
        PunLins: Record "Lín. solicitud";
        CodeSerie: Codeunit "No. Series";
        Infoempresa: Record "Company Information";
        PunSeguimiento: Record Mensajeria;
        rstCambioEstado: Record "Seguridad cambio estados";
        rstMensajeria: Record Mensajeria;
        frmCambioEst: Page "Cambiar estado documento";
        blnHabilitarRegistro: Boolean;
}

