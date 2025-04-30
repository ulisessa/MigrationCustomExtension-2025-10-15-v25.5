page 50701 MoveToShipment
{
    PageType = StandardDialog;
    ApplicationArea = All;
    Caption = 'Ingrese el nuevo No. de remito';
    Extensible = false;
    SourceTable = "Cab. remito ventas";

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("No. de Remito"; codRemito)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Insert new shipment number', ESP = 'Inserte nuevo número de remito';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(OK)
            {
                Caption = 'OK';
                ApplicationArea = All;
                Trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }
    var
        codRemito: Code[20];

    procedure GetShipmentNo(): Code[20]
    begin
        exit(codRemito);
    end;

    procedure SetShipmentNo(l_codRemito: Code[20]): Code[20]
    begin
        codRemito:=l_codRemito;
    end;
}
