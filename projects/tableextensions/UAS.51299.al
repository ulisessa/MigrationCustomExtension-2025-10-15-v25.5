tableextension 51299 tableextension51299 extends "Custom Report Layout"
{
    Caption = 'Custom Report Layout';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Layout")
        {
            Caption = 'Layout';
        }
        modify("Last Modified")
        {
            Caption = 'Last Modified';
        }
        modify("Last Modified by User")
        {
            Caption = 'Last Modified by User';
        }
        modify("File Extension")
        {
            Caption = 'File Extension';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("App ID")
        {
            Caption = 'App ID';
        }
        modify("Layout Last Updated")
        {
            Caption = 'Last Modified';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "ImportRdlcTxt(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //ImportRdlcTxt : ENU=Import Report Layout;ESP=Importar diseño de informe;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ImportRdlcTxt : ENU=Import Report Layout;ESP=Importar diseño de informe;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoRecordsErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoRecordsErr : ENU=There is no record in the list.;ESP=No hay ningún registro en la lista.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoRecordsErr : ENU=There is no record in the list.;ESP=No hay ningún registro en la lista.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BuiltInTxt(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //BuiltInTxt : ENU=Built-in layout;ESP=Diseñado integrado;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BuiltInTxt : ENU=Built-in layout;ESP=Diseñado integrado;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NewLayoutTxt(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //NewLayoutTxt : ENU=New layout;ESP=Nueva disposición;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NewLayoutTxt : ENU=New layout;ESP=Nueva disposición;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ErrorInLayoutErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //ErrorInLayoutErr : @@@="%1=a name, %2=a number, %3=a sentence/error description.";ENU=The following issue has been found in the layout %1 for report ID  %2:\%3.;ESP=Se encontró el problema siguiente en el diseño %1 para el id. de informe %2:\%3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ErrorInLayoutErr : @@@="%1=a name, %2=a number, %3=a sentence/error description.";ENU=The following issue has been found in the layout %1 for report ID  %2:\%3.;ESP=Se encontró el problema siguiente en el diseño %1 para el id. de informe %2:\%3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TemplateValidationQst(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //TemplateValidationQst : @@@="%1 = an error message.";ENU=The RDLC layout does not comply with the current report design (for example, fields are missing or the report ID is wrong).\The following errors were detected during the layout validation:\%1\Do you want to continue?;ESP=El diseño de RDLC no cumple con el diseño del informe actual (por ejemplo, faltan campos o el id. de informe no es válido).\Se detectaron los siguientes errores durante la validación del diseño:\%1\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TemplateValidationQst : @@@="%1 = an error message.";ENU=The RDLC layout does not comply with the current report design (for example, fields are missing or the report ID is wrong).\The following errors were detected during the layout validation:\%1\Do you want to continue?;ESP=El diseño de RDLC no cumple con el diseño del informe actual (por ejemplo, faltan campos o el id. de informe no es válido).\Se detectaron los siguientes errores durante la validación del diseño:\%1\?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TemplateValidationErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //TemplateValidationErr : ENU=The RDLC layout does not comply with the current report design (for example, fields are missing or the report ID is wrong).\The following errors were detected during the document validation:\%1\You must update the layout to match the current report design.;ESP=El diseño de RDLC no cumple con el diseño del informe actual (por ejemplo, faltan campos o el id. de informe no es válido).\Se detectaron los siguientes errores durante la validación del documento:\%1\Debe actualizar el diseño para que coincida con el diseño del informe actual.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TemplateValidationErr : ENU=The RDLC layout does not comply with the current report design (for example, fields are missing or the report ID is wrong).\The following errors were detected during the document validation:\%1\You must update the layout to match the current report design.;ESP=El diseño de RDLC no cumple con el diseño del informe actual (por ejemplo, faltan campos o el id. de informe no es válido).\Se detectaron los siguientes errores durante la validación del documento:\%1\Debe actualizar el diseño para que coincida con el diseño del informe actual.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AbortWithValidationErr(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //AbortWithValidationErr : ENU=The RDLC layout action has been canceled because of validation errors.;ESP=La acción de diseño de RDLC se ha cancelado por errores de validación.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AbortWithValidationErr : ENU=The RDLC layout action has been canceled because of validation errors.;ESP=La acción de diseño de RDLC se ha cancelado por errores de validación.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ModifyBuiltInLayoutQst(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //ModifyBuiltInLayoutQst : ENU=This is a built-in custom report layout, and it cannot be modified.\\Do you want to modify a copy of the custom report layout instead?;ESP=Este es un diseño de informe personalizado integrado y no puede modificarse.\\¿Desea modificar una copia del diseño de informe personalizado en su lugar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ModifyBuiltInLayoutQst : ENU=This is a built-in custom report layout, and it cannot be modified.\\Do you want to modify a copy of the custom report layout instead?;ESP=Este es un diseño de informe personalizado integrado y no puede modificarse.\\?Desea modificar una copia del diseño de informe personalizado en su lugar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoLayoutSelectedMsg(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoLayoutSelectedMsg : ENU=You must specify if you want to insert a Word layout or an RDLC layout for the report.;ESP=Especifique si desea insertar un diseño de Word o un diseño de RDLC para el informe.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoLayoutSelectedMsg : ENU=You must specify if you want to insert a Word layout or an RDLC layout for the report.;ESP=Especifique si desea insertar un diseño de Word o un diseño de RDLC para el informe.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DeleteBuiltInLayoutErr(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteBuiltInLayoutErr : ENU=This is a built-in custom report layout, and it cannot be deleted.;ESP=Este es un diseño de informe personalizado integrado y no se puede eliminar.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteBuiltInLayoutErr : ENU=This is a built-in custom report layout, and it cannot be deleted.;ESP=Este es un diseño de informe personalizado integrado y no se puede eliminar.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ModifyBuiltInLayoutErr(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //ModifyBuiltInLayoutErr : ENU=This is a built-in custom report layout, and it cannot be modified.;ESP=Este es un diseño de informe personalizado integrado y no se puede modificar.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ModifyBuiltInLayoutErr : ENU=This is a built-in custom report layout, and it cannot be modified.;ESP=Este es un diseño de informe personalizado integrado y no se puede modificar.;
    //Variable type has not been exported.
}

