tableextension 51278 tableextension51278 extends "Vendor Posting Group"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Payables Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Service Charge Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Payment Disc. Debit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Invoice Rounding Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Debit Curr. Appln. Rndg. Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Credit Curr. Appln. Rndg. Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Debit Rounding Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Credit Rounding Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Payment Disc. Credit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Payment Tolerance Debit Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Payment Tolerance Credit Acc.")
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
        modify("Bills Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Bills in Payment Order Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Invoices in  Pmt. Ord. Acc.")
        {
            TableRelation = "G/L Account"."No.";
        }

        //Unsupported feature: Code Modification on ""Payables Account"(Field 2).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payables Account")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Payables Account",GLAccountCategory."Account Category"::Liabilities,GLAccountCategoryMgt.GetCurrentLiabilities);

        Validate("Payables Account");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payables Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Payables Account",GLAccountCategory."Account Category"::Liabilities,GLAccountCategoryMgt.GetCurrentLiabilities);
            }
        Validate("Payables Account");
        */
        //end;


        //Unsupported feature: Code Modification on ""Payables Account"(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payables Account",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount(
            "Payables Account",false,false,GLAccountCategory."Account Category"::Liabilities,GLAccountCategoryMgt.GetCurrentLiabilities);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payables Account",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount(
            "Payables Account",FALSE,FALSE,GLAccountCategory."Account Category"::Liabilities,GLAccountCategoryMgt.GetCurrentLiabilities);
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Service Charge Acc."(Field 7).OnLookup".

        //trigger "(Field 7)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Service Charge Acc.")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Service Charge Acc.",GLAccountCategory."Account Category"::Liabilities,GLAccountCategoryMgt.GetFeesExpense);

        Validate("Service Charge Acc.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Service Charge Acc.")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Service Charge Acc.",GLAccountCategory."Account Category"::Liabilities,GLAccountCategoryMgt.GetFeesExpense);
            }
        Validate("Service Charge Acc.");
        */
        //end;


        //Unsupported feature: Code Modification on ""Service Charge Acc."(Field 7).OnValidate".

        //trigger "(Field 7)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Service Charge Acc.",true,true)
        else
          GLAccountCategoryMgt.CheckGLAccount(
            "Service Charge Acc.",true,true,GLAccountCategory."Account Category"::Liabilities,GLAccountCategoryMgt.GetFeesExpense);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Service Charge Acc.",TRUE,TRUE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount(
            "Service Charge Acc.",TRUE,TRUE,GLAccountCategory."Account Category"::Liabilities,GLAccountCategoryMgt.GetFeesExpense);
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Disc. Debit Acc."(Field 8).OnLookup".

        //trigger  Debit Acc()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payment Disc. Debit Acc.")
        else
          GLAccountCategoryMgt.LookupGLAccount("Payment Disc. Debit Acc.",GLAccountCategory."Account Category"::Income,'');

        Validate("Payment Disc. Debit Acc.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          'GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payment Disc. Debit Acc.")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount("Payment Disc. Debit Acc.",GLAccountCategory."Account Category"::Income,'');
          }
        Validate("Payment Disc. Debit Acc.");
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Disc. Debit Acc."(Field 8).OnValidate".

        //trigger  Debit Acc()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payment Disc. Debit Acc.",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount("Payment Disc. Debit Acc.",false,false,GLAccountCategory."Account Category"::Income,'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payment Disc. Debit Acc.",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount("Payment Disc. Debit Acc.",FALSE,FALSE,GLAccountCategory."Account Category"::Income,'');
          }
        */
        //end;


        //Unsupported feature: Code Modification on ""Invoice Rounding Account"(Field 9).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Invoice Rounding Account")
        else
          GLAccountCategoryMgt.LookupGLAccount("Invoice Rounding Account",GLAccountCategory."Account Category"::Expense,'');

        Validate("Invoice Rounding Account");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Invoice Rounding Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount("Invoice Rounding Account",GLAccountCategory."Account Category"::Expense,'');
          }
        Validate("Invoice Rounding Account");
        */
        //end;


        //Unsupported feature: Code Modification on ""Invoice Rounding Account"(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Invoice Rounding Account",true,false)
        else
          GLAccountCategoryMgt.CheckGLAccount("Invoice Rounding Account",true,false,GLAccountCategory."Account Category"::Expense,'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Invoice Rounding Account",TRUE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount("Invoice Rounding Account",TRUE,FALSE,GLAccountCategory."Account Category"::Expense,'');
          }
        */
        //end;


        //Unsupported feature: Code Modification on ""Debit Curr. Appln. Rndg. Acc."(Field 10).OnLookup".

        //trigger  Appln()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Debit Curr. Appln. Rndg. Acc.")
        else
          GLAccountCategoryMgt.LookupGLAccount("Debit Curr. Appln. Rndg. Acc.",GLAccountCategory."Account Category"::Income,'');

        Validate("Debit Curr. Appln. Rndg. Acc.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Debit Curr. Appln. Rndg. Acc.")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount("Debit Curr. Appln. Rndg. Acc.",GLAccountCategory."Account Category"::Income,'');
          }
        Validate("Debit Curr. Appln. Rndg. Acc.");
        */
        //end;


        //Unsupported feature: Code Modification on ""Debit Curr. Appln. Rndg. Acc."(Field 10).OnValidate".

        //trigger  Appln()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Debit Curr. Appln. Rndg. Acc.",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount(
            "Debit Curr. Appln. Rndg. Acc.",false,false,GLAccountCategory."Account Category"::Income,'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Debit Curr. Appln. Rndg. Acc.",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount(
            "Debit Curr. Appln. Rndg. Acc.",FALSE,FALSE,GLAccountCategory."Account Category"::Income,'');
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Credit Curr. Appln. Rndg. Acc."(Field 11).OnLookup".

        //trigger  Appln()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Credit Curr. Appln. Rndg. Acc.")
        else
          GLAccountCategoryMgt.LookupGLAccount("Credit Curr. Appln. Rndg. Acc.",GLAccountCategory."Account Category"::Income,'');

        Validate("Credit Curr. Appln. Rndg. Acc.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Credit Curr. Appln. Rndg. Acc.")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount("Credit Curr. Appln. Rndg. Acc.",GLAccountCategory."Account Category"::Income,'');
          }
        Validate("Credit Curr. Appln. Rndg. Acc.");
        */
        //end;


        //Unsupported feature: Code Modification on ""Credit Curr. Appln. Rndg. Acc."(Field 11).OnValidate".

        //trigger  Appln()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Credit Curr. Appln. Rndg. Acc.",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount(
            "Credit Curr. Appln. Rndg. Acc.",false,false,GLAccountCategory."Account Category"::Income,'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Credit Curr. Appln. Rndg. Acc.",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount(
            "Credit Curr. Appln. Rndg. Acc.",FALSE,FALSE,GLAccountCategory."Account Category"::Income,'');
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Debit Rounding Account"(Field 12).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Debit Rounding Account")
        else
          GLAccountCategoryMgt.LookupGLAccount("Debit Rounding Account",GLAccountCategory."Account Category"::Expense,'');

        Validate("Debit Rounding Account");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Debit Rounding Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount("Debit Rounding Account",GLAccountCategory."Account Category"::Expense,'');
          }
        Validate("Debit Rounding Account");
        */
        //end;


        //Unsupported feature: Code Modification on ""Debit Rounding Account"(Field 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Debit Rounding Account",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount("Debit Rounding Account",false,false,GLAccountCategory."Account Category"::Expense,'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Debit Rounding Account",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount("Debit Rounding Account",FALSE,FALSE,GLAccountCategory."Account Category"::Expense,'');
          }
        */
        //end;


        //Unsupported feature: Code Modification on ""Credit Rounding Account"(Field 13).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Credit Rounding Account")
        else
          GLAccountCategoryMgt.LookupGLAccount("Credit Rounding Account",GLAccountCategory."Account Category"::Expense,'');

        Validate("Credit Rounding Account");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Credit Rounding Account")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount("Credit Rounding Account",GLAccountCategory."Account Category"::Expense,'');
          }
        Validate("Credit Rounding Account");
        */
        //end;


        //Unsupported feature: Code Modification on ""Credit Rounding Account"(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Credit Rounding Account",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount("Credit Rounding Account",false,false,GLAccountCategory."Account Category"::Expense,'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Credit Rounding Account",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount("Credit Rounding Account",FALSE,FALSE,GLAccountCategory."Account Category"::Expense,'');
          }
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Disc. Credit Acc."(Field 16).OnLookup".

        //trigger  Credit Acc()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payment Disc. Credit Acc.")
        else
          GLAccountCategoryMgt.LookupGLAccount("Payment Disc. Credit Acc.",GLAccountCategory."Account Category"::Income,'');

        Validate("Payment Disc. Credit Acc.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payment Disc. Credit Acc.")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount("Payment Disc. Credit Acc.",GLAccountCategory."Account Category"::Income,'');
          }
        Validate("Payment Disc. Credit Acc.");
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Disc. Credit Acc."(Field 16).OnValidate".

        //trigger  Credit Acc()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payment Disc. Credit Acc.",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount("Payment Disc. Credit Acc.",false,false,GLAccountCategory."Account Category"::Income,'');
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payment Disc. Credit Acc.",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount("Payment Disc. Credit Acc.",FALSE,FALSE,GLAccountCategory."Account Category"::Income,'');
          }
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Tolerance Debit Acc."(Field 17).OnLookup".

        //trigger "(Field 17)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payment Tolerance Debit Acc.")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Payment Tolerance Debit Acc.",GLAccountCategory."Account Category"::Income,GLAccountCategoryMgt.GetIncomeInterest);

        Validate("Payment Tolerance Debit Acc.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payment Tolerance Debit Acc.")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Payment Tolerance Debit Acc.",GLAccountCategory."Account Category"::Income,GLAccountCategoryMgt.GetIncomeInterest);
            }
        Validate("Payment Tolerance Debit Acc.");
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Tolerance Debit Acc."(Field 17).OnValidate".

        //trigger "(Field 17)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payment Tolerance Debit Acc.",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount(
            "Payment Tolerance Debit Acc.",false,false,
            GLAccountCategory."Account Category"::Income,GLAccountCategoryMgt.GetIncomeInterest);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payment Tolerance Debit Acc.",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount(
            "Payment Tolerance Debit Acc.",FALSE,FALSE,
            GLAccountCategory."Account Category"::Income,GLAccountCategoryMgt.GetIncomeInterest);
            }
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Tolerance Credit Acc."(Field 18).OnLookup".

        //trigger "(Field 18)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payment Tolerance Credit Acc.")
        else
          GLAccountCategoryMgt.LookupGLAccount(
            "Payment Tolerance Credit Acc.",GLAccountCategory."Account Category"::Income,GLAccountCategoryMgt.GetIncomeInterest);

        Validate("Payment Tolerance Credit Acc.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.LookupGLAccountWithoutCategory("Payment Tolerance Credit Acc.")
        ELSE
          GLAccountCategoryMgt.LookupGLAccount(
            "Payment Tolerance Credit Acc.",GLAccountCategory."Account Category"::Income,GLAccountCategoryMgt.GetIncomeInterest);
            }
        Validate("Payment Tolerance Credit Acc.");
        */
        //end;


        //Unsupported feature: Code Modification on ""Payment Tolerance Credit Acc."(Field 18).OnValidate".

        //trigger "(Field 18)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "View All Accounts on Lookup" then
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payment Tolerance Credit Acc.",false,false)
        else
          GLAccountCategoryMgt.CheckGLAccount(
            "Payment Tolerance Credit Acc.",false,false,
            GLAccountCategory."Account Category"::Income,GLAccountCategoryMgt.GetIncomeInterest);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {IF "View All Accounts on Lookup" THEN
          GLAccountCategoryMgt.CheckGLAccountWithoutCategory("Payment Tolerance Credit Acc.",FALSE,FALSE)
        ELSE
          GLAccountCategoryMgt.CheckGLAccount(
            "Payment Tolerance Credit Acc.",FALSE,FALSE,
            GLAccountCategory."Account Category"::Income,GLAccountCategoryMgt.GetIncomeInterest);
            }
        */
        //end;
        field(50090; "Cta. provisión compras"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
    }
}

