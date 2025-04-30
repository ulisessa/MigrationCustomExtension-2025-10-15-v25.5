page 50559 "Vista de Solicitudes aprobadas"
{
    Editable = false;
    PageType = List;
    SourceTable = Mensajeria;
    SourceTableView = SORTING ("Tipo movimiento", "Tipo Documento", Estado)
                      ORDER(Ascending)
                      WHERE ("Tipo Documento" = FILTER ('Solicitud (compras)'),
                            Estado = FILTER ('Aprobado y registrado'),
                            "Tipo movimiento" = FILTER ("Mensaje con Seguimiento"));
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No. documento"; "No. documento")
                {
                    Lookup = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(PunCabSolicitud);
                        PunCabSolicitud.SetRange("No. documento", "No. documento");
                        PAGE.Run(50514, PunCabSolicitud);
                    end;
                }
                field("Fecha aprobacion"; "Fecha aprobacion")
                {
                }
                field(UsuarioAprob; UsuarioAprob)
                {
                    Caption = 'Aprobó';
                }
                field(FechaPEdido; FechaPEdido)
                {
                    Caption = 'Fecha pedido';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Clear(PunCabSolicitud);
        PunCabSolicitud.SetRange(PunCabSolicitud."No. documento", "No. documento");
        if PunCabSolicitud.Find('-') then begin

            UsuarioAprob := PunCabSolicitud."Usuario Aprobacion";
            FechaPEdido := PunCabSolicitud."Fecha registro";

        end;
    end;

    var
        PunCabSolicitud: Record Solicitud;
        PunUsuarioAprob: Text[50];
        UsuarioAprob: Text[50];
        FechaPEdido: Date;
}

