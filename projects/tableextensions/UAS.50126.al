tableextension 50126 "Bank Pmt. Appl. Rule Ext." extends "Bank Pmt. Appl. Rule"
{
    fields
    {
        modify("Doc. No./Ext. Doc. No. Matched")
        {
            Caption = 'Doc. No./Ext. Doc. No. Matched';
            OptionCaption = 'Not Considered,Yes,No,Yes - Multiple';
        }
        modify("Amount Incl. Tolerance Matched")
        {
            OptionCaption = 'Not Considered,One Match,Multiple Matches,No Matches';
        }
        modify("Direct Debit Collect. Matched")
        {
            OptionCaption = 'Not Considered,Yes,No';
        }
        modify(Score)
        {
            Caption = 'Score';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "WrongPriorityNoErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //WrongPriorityNoErr : @@@=%1 - Table field with caption Priority. %2 and %3 are numbers presenting a range - e.g. 1 and 999;ENU=The %1 you entered is invalid. The %1 must be between %2 and %3.;ESP=El valor %1 que especificó no es válido. El valor %1 debe estar entre %2 y %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WrongPriorityNoErr : @@@=%1 - Table field with caption Priority. %2 and %3 are numbers presenting a range - e.g. 1 and 999;ENU=The %1 you entered is invalid. The %1 must be between %2 and %3.;ESP=El valor %1 que especificó no es válido. El valor %1 debe estar entre %2 y %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "LoadRulesOnlyOnTempRecordsErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //LoadRulesOnlyOnTempRecordsErr : @@@=Description to developers, should not be seen by users;ENU=Programming error: The LoadRules function can only be called from temporary records.;ESP=Error de programación: la función LoadRules solo se puede llamar desde registros temporales.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LoadRulesOnlyOnTempRecordsErr : @@@=Description to developers, should not be seen by users;ENU=Programming error: The LoadRules function can only be called from temporary records.;ESP=Error de programación: la función LoadRules solo se puede llamar desde registros temporales.;
    //Variable type has not been exported.
}

