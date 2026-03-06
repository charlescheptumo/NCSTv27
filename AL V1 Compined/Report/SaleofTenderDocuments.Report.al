#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70005 "Sale of Tender Documents"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Sale of Tender Documents.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Bidders; Bidders)
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(RefNo_Bidders1; Bidders."Ref No.")
            {
            }
            column(Name_Bidders1; Bidders.Name)
            {
            }
            column(PostalAddress_Bidders1; Bidders."Postal Address")
            {
            }
            column(Email_Bidders1; Bidders."E-mail")
            {
            }
            column(TelephoneNo_Bidders1; Bidders."Telephone No")
            {
            }
            column(KBABankCode_Bidders1; Bidders."KBA Bank Code")
            {
            }
            column(KBABranchCode_Bidders1; Bidders."KBA Branch Code")
            {
            }
            column(BankaccountNo_Bidders1; Bidders."Bank account No")
            {
            }
            column(TenderAmount_Bidders1; Bidders."Tender Amount")
            {
            }
            column(BidSecurityAmount_Bidders1; Bidders."Bid Security Amount")
            {
            }
            column(BidExpiryDate_Bidders1; Bidders."Bid Expiry Date")
            {
            }
            column(ChequeNo_Bidders1; Bidders."Cheque No")
            {
            }
            column(TenderDocReceiptDate_Bidders1; Bidders."Tender Doc Receipt Date")
            {
            }
            column(ReceiptNo_Bidders1; Bidders."Receipt No.")
            {
            }
            column(Date; Date)
            {
            }
            column(Department; Department)
            {
            }
            column(Title; Title)
            {
            }

            trigger OnAfterGetRecord()
            begin
                ReceiptHeader.Reset;
                if ReceiptHeader.Get(Bidders."Receipt No.") then begin

                    Date := ReceiptHeader.Date;

                    DimensionValue.Reset;
                    if DimensionValue.Get('DEPARTMENT', ReceiptHeader."Global Dimension 2 Code") then
                        Department := DimensionValue.Name;

                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLines: Record "Receipt Lines1";
        Date: Date;
        Department: Text[100];
        DimensionValue: Record "Dimension Value";
        Title: label 'Sale of Tender Documents';
}
