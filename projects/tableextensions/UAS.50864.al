tableextension 50864 tableextension50864 extends "Inventory Posting Setup"
{
    fields
    {
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Invt. Posting Group Code")
        {
            Caption = 'Invt. Posting Group Code';
        }
        modify("Inventory Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 20)".

            Caption = 'Description';
        }
        modify("View All Accounts on Lookup")
        {
            Caption = 'View All Accounts on Lookup';
        }
        modify("Material Variance Account")
        {
            Caption = 'Material Variance Account';
        }
        modify("Capacity Variance Account")
        {
            Caption = 'Capacity Variance Account';
        }
        modify("Mfg. Overhead Variance Account")
        {
            Caption = 'Mfg. Overhead Variance Account';
        }
        modify("Cap. Overhead Variance Account")
        {
            Caption = 'Cap. Overhead Variance Account';
        }

        //Unsupported feature: Code Modification on ""Inventory Account"(Field 6).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Inventory Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Inventory Account",GLAccountCategory."Account Category"::Assets,GLAccountCategoryMgt.GetInventory);

        Validate("Inventory Account");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //++ARbu
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Inventory Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Inventory Account",GLAccountCategory."Account Category"::Assets,GLAccountCategoryMgt.GetInventory);
        }
        //--ARbu
        Validate("Inventory Account");
        */
        //end;


        //Unsupported feature: Code Modification on ""Inventory Account"(Field 6).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Inventory Account",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount(
            "Inventory Account",false,false,GLAccountCategory."Account Category"::Assets,GLAccountCategoryMgt.GetInventory);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //++Arbu
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Inventory Account",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount(
            "Inventory Account",FALSE,FALSE,GLAccountCategory."Account Category"::Assets,GLAccountCategoryMgt.GetInventory);
            }
        //--Arbu
        */
        //end;


        //Unsupported feature: Code Modification on ""Inventory Account (Interim)"(Field 5800).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Inventory Account (Interim)")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Inventory Account (Interim)",GLAccountCategory."Account Category"::Assets,GLAccountCategoryMgt.GetInventory);

        Validate("Inventory Account (Interim)");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //++Arbu
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Inventory Account (Interim)")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Inventory Account (Interim)",GLAccountCategory."Account Category"::Assets,GLAccountCategoryMgt.GetInventory);
        }
        //--Arbu
        Validate("Inventory Account (Interim)");
        */
        //end;


        //Unsupported feature: Code Modification on ""Inventory Account (Interim)"(Field 5800).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Inventory Account (Interim)",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount(
            "Inventory Account (Interim)",false,false,GLAccountCategory."Account Category"::Assets,GLAccountCategoryMgt.GetInventory);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //++Arbu
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Inventory Account (Interim)",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount(
            "Inventory Account (Interim)",FALSE,FALSE,GLAccountCategory."Account Category"::Assets,GLAccountCategoryMgt.GetInventory);
            }
        //--Arbu
        */
        //end;
    }
}

