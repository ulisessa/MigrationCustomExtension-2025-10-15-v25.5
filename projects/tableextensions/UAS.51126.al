tableextension 51126 tableextension51126 extends "Item Attribute Value Selection"
{
    Caption = 'Item Attribute Value Selection';
    fields
    {
        modify("Attribute Type")
        {
            OptionCaption = 'Option,Text,Integer,Decimal,Date';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "AttributeBlockedErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //AttributeBlockedErr : @@@=%1 - arbitrary name;ENU=The item attribute '%1' is blocked.;ESP=El atributo de producto '%1' está bloqueado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AttributeBlockedErr : @@@=%1 - arbitrary name;ENU=The item attribute '%1' is blocked.;ESP=El atributo de producto '%1' está bloqueado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AttributeValueBlockedErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //AttributeValueBlockedErr : @@@=%1 - arbitrary name;ENU=The item attribute value '%1' is blocked.;ESP=El valor del atributo de producto '%1' está bloqueado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AttributeValueBlockedErr : @@@=%1 - arbitrary name;ENU=The item attribute value '%1' is blocked.;ESP=El valor del atributo de producto '%1' está bloqueado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AttributeValueAlreadySpecifiedErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //AttributeValueAlreadySpecifiedErr : @@@=%1 - attribute name;ENU=You have already specified a value for item attribute '%1'.;ESP=Ya especificó un valor para el atributo de producto '%1'.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AttributeValueAlreadySpecifiedErr : @@@=%1 - attribute name;ENU=You have already specified a value for item attribute '%1'.;ESP=Ya especificó un valor para el atributo de producto '%1'.;
    //Variable type has not been exported.
}

