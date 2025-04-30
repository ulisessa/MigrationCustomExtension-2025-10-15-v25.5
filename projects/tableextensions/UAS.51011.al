tableextension 51011 tableextension51011 extends "Error Message"
{
    fields
    {
        modify("Field Number")
        {
            Caption = 'Field Number';
        }
        modify("Message Type")
        {
            OptionCaption = 'Error,Warning,Information';
        }
        modify("Additional Information")
        {
            Caption = 'Additional Information';
        }
        modify("Table Number")
        {
            Caption = 'Table Number';
        }
        modify("Context Field Number")
        {
            Caption = 'Context Field Number';
        }
        modify("Context Table Number")
        {
            Caption = 'Context Table Number';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "IfLengthExceededErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //IfLengthExceededErr : @@@="%1=caption of a field, %2=key of record, %3=integer, %4=integer";ENU=The maximum length of '%1' in '%2' is %3 characters. The actual length is %4.;ESP=La longitud máxima de '%1' de '%2' es de %3 caracteres. La longitud real es de %4.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IfLengthExceededErr : @@@="%1=caption of a field, %2=key of record, %3=integer, %4=integer";ENU=The maximum length of '%1' in '%2' is %3 characters. The actual length is %4.;ESP=La longitud máxima de '%1' de '%2' es de %3 caracteres. La longitud real es de %4.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "IfInvalidCharactersErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //IfInvalidCharactersErr : @@@="%1=caption of a field, %2=key of record";ENU='%1' in '%2' contains characters that are not valid.;ESP='%1' en '%2' contiene caracteres no válidos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IfInvalidCharactersErr : @@@="%1=caption of a field, %2=key of record";ENU='%1' in '%2' contains characters that are not valid.;ESP='%1' en '%2' contiene caracteres no válidos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "IfOutsideRangeErr(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //IfOutsideRangeErr : @@@="%1=caption of a field, %2=key of record, %3=integer, %4=integer";ENU='%1' in '%2' is outside of the permitted range from %3 to %4.;ESP='%1' de '%2' está fuera del intervalo permitido de %3 a %4.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IfOutsideRangeErr : @@@="%1=caption of a field, %2=key of record, %3=integer, %4=integer";ENU='%1' in '%2' is outside of the permitted range from %3 to %4.;ESP='%1' de '%2' está fuera del intervalo permitido de %3 a %4.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "HasErrorsMsg(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //HasErrorsMsg : ENU=One or more errors were found. You must resolve all the errors before you can proceed.;ESP=Se han encontrado uno o más errores. Debe resolver todos los errores para poder continuar.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //HasErrorsMsg : ENU=One or more errors were found. You must resolve all the errors before you can proceed.;ESP=Se han encontrado uno o más errores. Debe resolver todos los errores para poder continuar.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DevMsgNotTemporaryErr(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //DevMsgNotTemporaryErr : ENU=This function can only be used when the record is temporary.;ESP=Esta función solo se puede usar cuando el registro es temporal.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DevMsgNotTemporaryErr : ENU=This function can only be used when the record is temporary.;ESP=Esta función solo se puede usar cuando el registro es temporal.;
    //Variable type has not been exported.
}

