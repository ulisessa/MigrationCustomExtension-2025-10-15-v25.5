tableextension 50447 tableextension50447 extends "VAT Posting Setup"
{
    fields
    {
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Sales VAT Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Sales VAT Unreal. Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purchase VAT Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purch. VAT Unreal. Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Reverse Chrg. VAT Acc.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Reverse Chrg. VAT Acc.';
        }
        modify("Reverse Chrg. VAT Unreal. Acc.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Reverse Chrg. VAT Unreal. Acc.';
        }
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
        }
        modify("Tax Category")
        {
            Caption = 'Tax Category';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("No Taxable Type")
        {
            OptionCaption = ' ,Non Taxable Art 7-14 and others,Non Taxable Due To Localization Rules';
        }
        modify("Sales Special Scheme Code")
        {
            Caption = 'Sales Special Scheme Code';
        }
        modify("Purch. Special Scheme Code")
        {
            Caption = 'Purch. Special Scheme Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=%1 must be entered on the tax jurisdiction line when %2 is %3.;ESP=Se debe indicar %1 en línea jurisdicción fiscal cuando %2 es %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=%1 must be entered on the tax jurisdiction line when %2 is %3.;ESP=Se debe indicar %1 en línea jurisdicción fiscal cuando %2 es %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "RequiredFieldNotActivatedErr(Variable 1100004)".

    //var
    //>>>> ORIGINAL VALUE:
    //RequiredFieldNotActivatedErr : ENU=You cannot change %1 because %2 is empty.;ESP=No puede cambiar %1 porque %2 está vacío.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RequiredFieldNotActivatedErr : ENU=You cannot change %1 because %2 is empty.;ESP=No puede cambiar %1 porque %2 está vacío.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "InconsitencyOfRegimeCodeAndVATClauseErr(Variable 1100000)".

    //var
    //>>>> ORIGINAL VALUE:
    //InconsitencyOfRegimeCodeAndVATClauseErr : ENU=If the sales special scheme code is 01 General, the SII exemption code of the VAT clause must not be equal to E2 or E3.;ESP=Si el código de esquema especial de ventas es 01 General, el código de exención SII de la cláusula de IVA no debe ser igual a E2 o E3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InconsitencyOfRegimeCodeAndVATClauseErr : ENU=If the sales special scheme code is 01 General, the SII exemption code of the VAT clause must not be equal to E2 or E3.;ESP=Si el código de esquema especial de ventas es 01 General, el código de exención SII de la cláusula de IVA no debe ser igual a E2 o E3.;
    //Variable type has not been exported.
}

