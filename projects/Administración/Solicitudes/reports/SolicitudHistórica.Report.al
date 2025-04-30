report 50087 "Solicitud Histórica"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Administración/Solicitudes/reports/SolicitudHistórica.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("<Cab. solicitud>"; Solicitud)
        {
            DataItemTableView = SORTING("Nombre Libro Solicitud", "No. documento");
            RequestFilterFields = "Nombre Libro Solicitud", "No. documento";
            column(Cab__solicitud__N__Documento_; "No. documento")
            {
            }
            column(Cab__solicitud__Fecha_registro_; "Fecha registro")
            {
            }
            column(Cab__solicitud_Usuario; Usuario)
            {
            }
            column(NombreEmpresa; CompanyName)
            {
            }
            column(Logo; empres."Logo path")
            {
            }
            column(Cab__solicitud__Global_Dimension_1_; "Global Dimension 1")
            {
            }
            column(Cab__solicitud__Global_Dimension_3_; "Global Dimension 3")
            {
            }
            column(Cab__solicitud__Fecha_Entrega_; "Fecha Entrega")
            {
            }
            column(Cab__solicitud_Importancia; Importancia)
            {
            }
            column(Cab__solicitud_Observaciones; Observaciones)
            {
            }
            column(empres_Picture; empres.Picture)
            {
            }
            column(Solicitud_N__Caption; Solicitud_N__CaptionLbl)
            {
            }
            column(Fecha_de_registro_Caption; Fecha_de_registro_CaptionLbl)
            {
            }
            column(Usuario_Caption; Usuario_CaptionLbl)
            {
            }
            column(Buque_Caption; Buque_CaptionLbl)
            {
            }
            column(Marea_Caption; Marea_CaptionLbl)
            {
            }
            column(Divisa; "<Cab. solicitud>"."Currency Code")
            {
            }
            column(Fecha_de_Entrega_Caption; Fecha_de_Entrega_CaptionLbl)
            {
            }
            column(Importancia_Caption; Importancia_CaptionLbl)
            {
            }
            column(PROVISORIOCaption; PROVISORIOCaptionLbl)
            {
            }
            column(REF__Caption; REF__CaptionLbl)
            {
            }
            column(Cab__solicitud_Nombre_Libro_Solicitud; "Nombre Libro Solicitud")
            {
            }
            dataitem("Lín. solicitud"; "Lín. solicitud")
            {
                DataItemLink = "Nombre libro Solicitud" = FIELD("Nombre Libro Solicitud"), "No. Documento" = FIELD("No. documento");
                column("Hist__Lín__solicitud___N__"; "No.")
                {
                }
                column("Hist__Lín__solicitud__Descripción"; Descripcion)
                {
                }
                column("Hist__Lín__solicitud__Cantidad"; Cantidad)
                {
                }
                column("Hist__Lín__solicitud___Cód__unidad_medida_"; "Cod. unidad medida")
                {
                }
                column("N__línea__10000"; "No. linea" / 10000)
                {
                }
                column("N__líneaCaption"; N__líneaCaptionLbl)
                {
                }
                column("CódigoCaption"; CódigoCaptionLbl)
                {
                }
                column("Hist__Lín__solicitud__DescripciónCaption"; FieldCaption(Descripcion))
                {
                }
                column("Hist__Lín__solicitud__CantidadCaption"; FieldCaption(Cantidad))
                {
                }
                column(Unidad_de_medidaCaption; Unidad_de_medidaCaptionLbl)
                {
                }
                column("Hist__Lín__solicitud__Nombre_libro_Solicitud"; "Nombre libro Solicitud")
                {
                }
                column("Hist__Lín__solicitud__N__Documento"; "No. Documento")
                {
                }
                column("Hist__Lín__solicitud__N__línea"; "No. linea")
                {
                }
                column(Pendiente; "Lín. solicitud"."Cantidad pendiente recibir")
                {
                }
                column(Precio; "Lín. solicitud"."Precio unitario neto")
                {
                }
                column(Importe; "Lín. solicitud"."Importe neto")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("No. documento");
                Clear(empres);
                empres.Get;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        empres.Get;
        empres.CalcFields(Picture);
    end;

    var
        Pag: Label 'página';
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        empres: Record "Company Information";
        Solicitud_N__CaptionLbl: Label 'Solicitud Nº:';
        Fecha_de_registro_CaptionLbl: Label 'Fecha de registro:';
        Usuario_CaptionLbl: Label 'Usuario:';
        Buque_CaptionLbl: Label 'Buque:';
        Marea_CaptionLbl: Label 'Marea:';
        Fecha_de_Entrega_CaptionLbl: Label 'Fecha de Entrega:';
        Importancia_CaptionLbl: Label 'Importancia:';
        PROVISORIOCaptionLbl: Label 'PROVISORIO';
        REF__CaptionLbl: Label 'REF.:';
        "N__líneaCaptionLbl": Label 'Nº línea';
        "CódigoCaptionLbl": Label 'Código';
        Unidad_de_medidaCaptionLbl: Label 'Unidad de medida';
}

