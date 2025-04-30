tableextension 50648 tableextension50648 extends "Segment Interaction Language"
{
    Caption = 'Segment Interaction Language';
    fields
    {
        modify("Segment No.")
        {
            Caption = 'Segment No.';
        }
        modify("Segment Line No.")
        {
            Caption = 'Segment Line No.';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Attachment No.")
        {
            Caption = 'Attachment No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Replace existing attachment?;ESP=¿Sustituir el anexo actual?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Replace existing attachment?;ESP=?Sustituir el anexo actual?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=The import was canceled or the specified file could not be accessed. The import failed.;ESP=Se ha cancelado la importación o no se ha podido obtener acceso al archivo especificado. Error en la importación.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=The import was canceled or the specified file could not be accessed. The import failed.;ESP=Se ha cancelado la importación o no se ha podido obtener acceso al archivo especificado. Error en la importación.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=You have modified %1.\\Do you want to update the segment lines with the same Interaction Template Code and Language Code?;ESP=Ha modificado %1.\\Desea actualizar las líneas de segmento con el mismo código de plantilla de interacción y código de idioma?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=You have modified %1.\\Do you want to update the segment lines with the same Interaction Template Code and Language Code?;ESP=Ha modificado %1.\\Desea actualizar las líneas de segmento con el mismo código de plantilla de interacción y código de idioma?;
    //Variable type has not been exported.
}

