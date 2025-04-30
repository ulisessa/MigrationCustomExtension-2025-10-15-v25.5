page 50037 "MEP Ledger Entry"
{
    AutoSplitKey = true;
    PageType = Worksheet;
    SourceTable = "MEP Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry no."; "Entry no.")
                {
                    Editable = false;
                }
                field("Registro ID"; "Registro ID")
                {
                    Editable = false;
                }
                field("PO Reference"; "PO Reference")
                {
                }
                field("Payment reason"; "Payment reason")
                {
                }
                field("Order execution date"; "Order execution date")
                {
                }
                field("Payment type"; "Payment type")
                {
                    Editable = false;
                }
                field("Payment amount"; "Payment amount")
                {
                }
                field("Payment currency"; "Payment currency")
                {
                    Editable = false;
                }
                field("CHPD due date"; "CHPD due date")
                {
                }
                field("Request official recipt"; "Request official recipt")
                {
                }
                field("No a la orden"; "No a la orden")
                {
                }
                field("Include signature in cheques"; "Include signature in cheques")
                {
                }
                field("Attachment accompanies"; "Attachment accompanies")
                {
                    Editable = false;
                }
                field("Referral text #1"; "Referral text #1")
                {
                }
                field("Referral text #2"; "Referral text #2")
                {
                }
                field("Referral text #3"; "Referral text #3")
                {
                }
                field("Instructions for Bank CS"; "Instructions for Bank CS")
                {
                }
                field("Beneficiary No."; "Beneficiary No.")
                {
                }
                field("Beneficiary name"; "Beneficiary name")
                {
                }
                field("Beneficiary document type"; "Beneficiary document type")
                {
                }
                field("Beneficiary document no."; "Beneficiary document no.")
                {
                }
                field("Beneficiary address"; "Beneficiary address")
                {
                }
                field("Beneficiary PC"; "Beneficiary PC")
                {
                }
                field("Beneficiary email"; "Beneficiary email")
                {
                }
                field("Beneficiary fax"; "Beneficiary fax")
                {
                }
                field("Beneficiary communication form"; "Beneficiary communication form")
                {
                }
                field("Beneficiary CBU"; "Beneficiary CBU")
                {
                }
                field("Beneficiary account system"; "Beneficiary account system")
                {
                }
                field("Beneficiary account currency"; "Beneficiary account currency")
                {
                }
                field("Cheque delivery method"; "Cheque delivery method")
                {
                }
                field(Sucursal; Sucursal)
                {
                }
                field("Bank Code"; "Bank Code")
                {
                }
                field("Adherent CBU to be debited"; "Adherent CBU to be debited")
                {
                }
                field("Adherent account system"; "Adherent account system")
                {
                }
                field("Adherent account currency"; "Adherent account currency")
                {
                }
            }
        }
    }

    actions
    {
    }
}

