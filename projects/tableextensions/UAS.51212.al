tableextension 51212 tableextension51212 extends "Config. Setup"
{
    Caption = 'Config. Setup';
    fields
    {
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Phone No. 2")
        {
            Caption = 'Phone No. 2';
        }
        modify("Telex No.")
        {
            Caption = 'Telex No.';
        }
        modify("Fax No.")
        {
            Caption = 'Fax No.';
        }
        modify("Giro No.")
        {
            Caption = 'Giro No.';
        }
        modify("Bank Branch No.")
        {
            Caption = 'Bank Branch No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Payment Routing No.")
        {
            Caption = 'Payment Routing No.';
        }
        modify("Customs Permit No.")
        {
            Caption = 'Customs Permit No.';
        }
        modify("Registration No.")
        {
            Caption = 'Registration No.';
        }
        modify("Telex Answer Back")
        {
            Caption = 'Telex Answer Back';
        }
        modify("Ship-to Name")
        {
            Caption = 'Ship-to Name';
        }
        modify("Ship-to Name 2")
        {
            Caption = 'Ship-to Name 2';
        }
        modify("Ship-to Address")
        {
            Caption = 'Ship-to Address';
        }
        modify("Ship-to Address 2")
        {
            Caption = 'Ship-to Address 2';
        }
        modify("Ship-to City")
        {
            Caption = 'Ship-to City';
        }
        modify("Ship-to Contact")
        {
            Caption = 'Ship-to Contact';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify("Ship-to Post Code")
        {
            Caption = 'Ship-to Post Code';
        }
        modify("Ship-to County")
        {
            Caption = 'Ship-to County';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Ship-to Country/Region Code")
        {
            Caption = 'Ship-to Country/Region Code';
        }
        modify("SWIFT Code")
        {
            Caption = 'SWIFT Code';
        }
        modify("Industrial Classification")
        {
            Caption = 'Industrial Classification';
        }
        modify("Logo Position on Documents")
        {
            Caption = 'Logo Position on Documents';
        }
        modify("Check-Avail. Period Calc.")
        {
            Caption = 'Check-Avail. Period Calc.';
        }
        modify("Check-Avail. Time Bucket")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year';
        }
        modify("Base Calendar Code")
        {
            Caption = 'Base Calendar Code';
        }
        modify("Package Code")
        {
            Caption = 'Package Code';
        }
        modify("Product Version")
        {
            Caption = 'Product Version';
        }
        modify("Your Profile Code")
        {
            Caption = 'Your Profile Code';
        }
        modify("Your Profile App ID")
        {
            Caption = 'Your Profile App ID';
        }
        modify("Your Profile Scope")
        {
            Caption = 'Your Profile Scope';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "PackageAlreadyExistsQst(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //PackageAlreadyExistsQst : ENU=The imported package already exists. Do you want to import another package?;ESP=El paquete importado ya existe. ¿Desea importar otro paquete?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PackageAlreadyExistsQst : ENU=The imported package already exists. Do you want to import another package?;ESP=El paquete importado ya existe. ?Desea importar otro paquete?;
    //Variable type has not been exported.
}

