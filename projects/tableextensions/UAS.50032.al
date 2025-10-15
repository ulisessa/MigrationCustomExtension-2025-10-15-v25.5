tableextension 50032 "AEAT Transf. Format XML Ext." extends "AEAT Transference Format XML"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Indentation Level")
        {
            Caption = 'Indentation Level';
        }
        modify("Parent Line No.")
        {
            Caption = 'Parent Line No.';
        }
        modify("Line Type")
        {
            Caption = 'Line Type';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text1100000(Variable 1100003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100000 : ENU=It is not possible to insert a value and a box at the same time. The data that will appear in this label in the XML file must either come from a Box in the VAT Statement or be introduced manually in the Value field.;ESP=No es posible insertar un valor y una casilla al mismo tiempo. Los datos que aparecerán en esta etiqueta en el archivo XML deben proceder de una Casilla de Declaración IVA o deben insertarse manualmente en el campo Valor.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100000 : ENU=It is not possible to insert a value and a box at the same time. The data that will appear in this label in the XML file must either come from a Box in the VAT Statement or be introduced manually in the Value field.;ESP=No es posible insertar un valor y una casilla al mismo tiempo. Los datos que aparecerán en esta etiqueta en el archivo XML deben proceder de una Casilla de Declaración IVA o deben insertarse manualmente en el campo Valor.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100001(Variable 1100004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100001 : ENU=If a value is introduced in the Box field, you must specify the format you want for the amounts that will be shown in this line. This means, you must select a format different than blank in the field Value Type.;ESP=Si se introduce un valor en el campo Casilla, debe especificar el formato que desea para las cantidades que se mostrarán en esta línea. Esto significa que debe seleccionar un formato diferente de vacío en el campo Tipo de valor.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100001 : ENU=If a value is introduced in the Box field, you must specify the format you want for the amounts that will be shown in this line. This means, you must select a format different than blank in the field Value Type.;ESP=Si se introduce un valor en el campo Casilla, debe especificar el formato que desea para las cantidades que se mostrarán en esta línea. Esto significa que debe seleccionar un formato diferente de vacío en el campo Tipo de valor.;
    //Variable type has not been exported.
}

