tableextension 50824 tableextension50824 extends "G/L Account Category"
{
    Caption = 'G/L Account Category';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Parent Entry No.")
        {
            Caption = 'Parent Entry No.';
        }
        modify("Sibling Sequence No.")
        {
            Caption = 'Sibling Sequence No.';
        }
        modify("Presentation Order")
        {
            Caption = 'Presentation Order';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Account Category")
        {
            Caption = 'Account Category';
            OptionCaption = ',Assets,Liabilities,Equity,Income,Cost of Goods Sold,Expense';
        }
        modify("Additional Report Definition")
        {
            Caption = 'Additional Report Definition';
            OptionCaption = ' ,Operating Activities,Investing Activities,Financing Activities,Cash Accounts,Retained Earnings,Distribution to Shareholders';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteSystemGeneratedErr(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteSystemGeneratedErr : @@@="%1 = a category value, e.g. ""Assets""";ENU=%1 is a system generated category and cannot be deleted.;ESP=%1 es una categoría generada por el sistema y no se puede eliminar.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteSystemGeneratedErr : @@@="%1 = a category value, e.g. ""Assets""";ENU=%1 is a system generated category and cannot be deleted.;ESP=%1 es una Categoría generada por el sistema y no se puede eliminar.;
    //Variable type has not been exported.
}

