tableextension 50365 tableextension50365 extends "General Posting Setup"
{
    Caption = 'General Posting Setup';
    fields
    {
        modify("Sales Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Sales Line Disc. Account")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Sales Line Disc. Account';
        }
        modify("Sales Inv. Disc. Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purch. Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purch. Line Disc. Account")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Purch. Line Disc. Account';
        }
        modify("Purch. Inv. Disc. Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purch. Pmt. Disc. Credit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("COGS Account")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'COGS Account';
        }
        modify("Inventory Adjmt. Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Job Sales Adjmt. Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Job Cost Adjmt. Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Sales Credit Memo Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purch. Credit Memo Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Sales Pmt. Disc. Credit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purch. Pmt. Disc. Debit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Sales Pmt. Tol. Debit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Sales Pmt. Tol. Credit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purch. Pmt. Tol. Debit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purch. Pmt. Tol. Credit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Sales Prepayments Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purch. Prepayments Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("View All Accounts on Lookup")
        {
            Caption = 'View All Accounts on Lookup';
        }
        modify("Purch. FA Disc. Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Invt. Accrual Acc. (Interim)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("COGS Account (Interim)")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Direct Cost Applied Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Overhead Applied Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Purchase Variance Account")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Purchase Variance Account';
        }

        //Unsupported feature: Code Modification on ""Sales Account"(Field 10).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Sales Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Sales Account",GLAccountCategory."Account Category"::Income,
            StrSubstNo('%1|%2',GLAccountCategoryMgt.GetIncomeProdSales,GLAccountCategoryMgt.GetIncomeService));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Sales Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Sales Account",GLAccountCategory."Account Category"::Income,
            STRSUBSTNO('%1|%2',GLAccountCategoryMgt.GetIncomeProdSales,GLAccountCategoryMgt.GetIncomeService));
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Sales Line Disc. Account"(Field 11).OnLookup".

        //trigger  Account"(Field 11)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Sales Line Disc. Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Sales Line Disc. Account",GLAccountCategory."Account Category"::Income,
            GLAccountCategoryMgt.GetIncomeSalesDiscounts);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Sales Line Disc. Account")
        ELSE
        #4..6
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Sales Inv. Disc. Account"(Field 12).OnLookup".

        //trigger  Disc()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Sales Inv. Disc. Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Sales Inv. Disc. Account",GLAccountCategory."Account Category"::Income,
            GLAccountCategoryMgt.GetIncomeSalesDiscounts);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Sales Inv. Disc. Account")
        ELSE
        #4..6
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Purch. Account"(Field 14).OnLookup".

        //trigger  Account"(Field 14)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Purch. Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Purch. Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            StrSubstNo('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Purch. Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Purch. Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            STRSUBSTNO('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Purch. Line Disc. Account"(Field 15).OnLookup".

        //trigger  Line Disc()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Purch. Line Disc. Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Purch. Line Disc. Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            GLAccountCategoryMgt.GetCOGSDiscountsGranted);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Purch. Line Disc. Account")
        ELSE
        #4..6
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Purch. Inv. Disc. Account"(Field 16).OnLookup".

        //trigger  Inv()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Purch. Inv. Disc. Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Purch. Inv. Disc. Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            GLAccountCategoryMgt.GetCOGSDiscountsGranted);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Purch. Inv. Disc. Account")
        ELSE
        #4..6
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""COGS Account"(Field 18).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("COGS Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "COGS Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            StrSubstNo('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("COGS Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "COGS Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            STRSUBSTNO('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Inventory Adjmt. Account"(Field 19).OnLookup".

        //trigger  Account"(Field 19)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Inventory Adjmt. Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Inventory Adjmt. Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            StrSubstNo('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Inventory Adjmt. Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Inventory Adjmt. Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            STRSUBSTNO('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Sales Credit Memo Account"(Field 27).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Sales Credit Memo Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Sales Credit Memo Account",GLAccountCategory."Account Category"::Income,
            StrSubstNo('%1|%2',GLAccountCategoryMgt.GetIncomeProdSales,GLAccountCategoryMgt.GetIncomeService));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Sales Credit Memo Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Sales Credit Memo Account",GLAccountCategory."Account Category"::Income,
            STRSUBSTNO('%1|%2',GLAccountCategoryMgt.GetIncomeProdSales,GLAccountCategoryMgt.GetIncomeService));
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Purch. Credit Memo Account"(Field 28).OnLookup".

        //trigger  Credit Memo Account"(Field 28)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Purch. Credit Memo Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Purch. Credit Memo Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            StrSubstNo('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Purch. Credit Memo Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Purch. Credit Memo Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            STRSUBSTNO('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Invt. Accrual Acc. (Interim)"(Field 5801).OnLookup".

        //trigger  Accrual Acc()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Inventory Adjmt. Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Inventory Adjmt. Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            StrSubstNo('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Inventory Adjmt. Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Inventory Adjmt. Account",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            STRSUBSTNO('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""COGS Account (Interim)"(Field 5803).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("COGS Account (Interim)")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "COGS Account (Interim)",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            StrSubstNo('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("COGS Account (Interim)")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "COGS Account (Interim)",GLAccountCategory."Account Category"::"Cost of Goods Sold",
            STRSUBSTNO('%1|%2',GLAccountCategoryMgt.GetCOGSMaterials,GLAccountCategoryMgt.GetCOGSLabor));
            }
        */
        //end;
        field(50000; "Cta. provisión compras"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                CheckGLAcc("Cta. provisión compras");
            end;
        }
    }
}

