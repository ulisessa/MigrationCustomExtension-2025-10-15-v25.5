tableextension 50125 tableextension50125 extends "Text-to-Account Mapping"
{
    Caption = 'Text-to-Account Mapping';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Debit Acc. No.")
        {
            Caption = 'Debit Acc. No.';
        }
        modify("Credit Acc. No.")
        {
            Caption = 'Credit Acc. No.';
        }
        modify("Bal. Source No.")
        {
            Caption = 'Bal. Source No.';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "AlreadyExistErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //AlreadyExistErr : @@@=%1 is the value currently inserted.;ENU="Entry with Mapping Text='%1' already exists.";ESP="La entrada con asignación de texto = '%1' ya existe.";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AlreadyExistErr : @@@=%1 is the value currently inserted.;ENU="Entry with Mapping Text='%1' already exists.";ESP="La entrada con asignación de texto = '%1' ya existe.";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BalAccountNoQst(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //BalAccountNoQst : @@@=%1 is option: Vendor or Customer and %2 is the record value in this field.;ENU=The Bal. Account No. field must have a value if the Bal. Source Type field contains %1.\\Affected Mapping Text: %2. Do you want to quit without saving the data?;ESP=El campo Cta. contrapartida debe tener un valor si el campo Tipo origen contr. contiene %1.\\Texto de asignación afectado: %2. ¿Confirma que desea salir sin guardar los datos?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BalAccountNoQst : @@@=%1 is option: Vendor or Customer and %2 is the record value in this field.;ENU=The Bal. Account No. field must have a value if the Bal. Source Type field contains %1.\\Affected Mapping Text: %2. Do you want to quit without saving the data?;ESP=El campo Cta. contrapartida debe tener un valor si el campo Tipo origen contr. contiene %1.\\Texto de asignación afectado: %2. ?Confirma que desea salir sin guardar los datos?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "GLAccountNoQst(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //GLAccountNoQst : @@@=%1 is option: G/L Account and %2 is the record value in this field.;ENU=The Debit Acc. No. field or the Credit Acc. No. field must have a value if the Bal. Source Type field contains %1.\\Affected Mapping Text: %2. Do you want to quit without saving the data?;ESP=El campo N.º cta. débito o N.º cta. crédito debe tener un valor si el campo Tipo origen contr. contiene %1.\\Texto de asignación afectado: %2. ¿Confirma que desea salir sin guardar los datos?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GLAccountNoQst : @@@=%1 is option: G/L Account and %2 is the record value in this field.;ENU=The Debit Acc. No. field or the Credit Acc. No. field must have a value if the Bal. Source Type field contains %1.\\Affected Mapping Text: %2. Do you want to quit without saving the data?;ESP=El campo No. cta. Débito o No. cta. Crédito debe tener un valor si el campo Tipo origen contr. contiene %1.\\Texto de asignación afectado: %2. ?Confirma que desea salir sin guardar los datos?;
    //Variable type has not been exported.
}

