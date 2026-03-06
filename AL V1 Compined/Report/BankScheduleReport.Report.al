#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 57013 "Bank Schedule Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bank Schedule Report.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(Payments; Payments)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(ChequeNo; Payments."Cheque No")
            {
            }
            column(ChequeDate; Payments."Cheque Date")
            {
            }
            column(CompName2; CompName2)
            {
            }
            dataitem("Imprest Voucher Lines"; "Imprest Voucher Lines")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = where("Account Type" = const(Employee), Status = const(Released));
                column(ReportForNavId_2; 2)
                {
                }
                column(AccountNo_ImprestVoucherLines; "Imprest Voucher Lines"."Account No.")
                {
                }
                column(AccountName_ImprestVoucherLines; "Imprest Voucher Lines"."Account Name")
                {
                }
                column(Amount_ImprestVoucherLines; "Imprest Voucher Lines".Amount)
                {
                }
                column(No_ImprestVoucherLines; "Imprest Voucher Lines".No)
                {
                }
                column(LineNo_ImprestVoucherLines; "Imprest Voucher Lines"."Line No")
                {
                }
                column(BankAccountNo; BankAccountNo)
                {
                }
                column(BankName; BankName)
                {
                }
                column(BankBranch; BankBranch)
                {
                }
                column(BankBranchCode; BankBranchCode)
                {
                }
                column(Addressee; Addressee)
                {
                }
                column(Bank; Bank)
                {
                }
                column(Loc; Loc)
                {
                }
                column(City; City)
                {
                }
                column(RefTo; RefTo)
                {
                }
                column(Body1; Body1)
                {
                }
                column(Body2; Body2)
                {
                }
                column(Body3; Body3)
                {
                }
                column(DGAppName; DGAppName)
                {
                }
                column(DGAppDesig; DGAppDesig)
                {
                }
                column(FinanceAppName; FinanceAppName)
                {
                }
                column(FinanceAppDesig; FinanceAppDesig)
                {
                }
                column(FileNo; FileNo)
                {
                }
                column(Currency; Currency)
                {
                }
                column(AmountInWords; AmountInWords)
                {
                }
                dataitem(Employee; Employee)
                {
                    DataItemLink = "No." = field("Account No.");
                    column(ReportForNavId_37; 37)
                    {
                    }
                    column(BankName_Employee; Employee."Bank Name")
                    {
                    }
                    column(BankBranch_Employee; Employee."Bank Branch Name")
                    {
                    }
                    column(BankAccNumber_Employee; Employee."Bank Account Number")
                    {
                    }
                    column(BranchCode_Employee; Employee."Bank Branch")
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    CompInfo.Get;
                    CompName2 := CompInfo."Name 2";


                    ReportSetup.Get(1);
                    Addressee := ReportSetup.Addressee;
                    Bank := ReportSetup."Bank Name";
                    Loc := ReportSetup.Location;
                    City := ReportSetup.City;
                    RefTo := ReportSetup."Reference To";
                    Body1 := ReportSetup."Body Msg 1";
                    Body2 := ReportSetup."Body Msg 2";
                    Body3 := ReportSetup."Body Msg 3";
                    DGAppName := ReportSetup."DG Approver Name";
                    DGAppDesig := ReportSetup."DG  Approver Designation";
                    FinanceAppName := ReportSetup."Finance Approver Name";
                    FinanceAppDesig := ReportSetup."Finance Approver Designation";
                    FileNo := ReportSetup."File No";
                    Currency := ReportSetup.Currency;


                    ////Getting Amount in Words
                    ImpVLines.Reset;
                    ImpVLines.SetRange("Account No.", "Imprest Voucher Lines"."Account No.");
                    if ImpVLines.FindSet then begin
                        ImpVLines.CalcSums(Amount);
                        SumAmount := +ImpVLines.Amount;
                    end;
                    SumAmount2 := ROUND(SumAmount, 1, '=');
                    RepCheck.InitTextVariable;
                    RepCheck.FormatNoText(NoText, SumAmount2, ImpVLines."Currency Code");
                    AmountInWords := NoText[1];
                end;
            }
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
        Namelb = 'Name';
        AccNolb = 'Account Number';
        Banklb = 'Bank';
        Branchlb = 'Branch';
        Amountlb = 'Amount';
        BranchCodelb = 'Branch Code';
        Referencelb = 'Reference';
    }

    var
        ImpVLines: Record "Imprest Voucher Lines";
        BankAccountNo: Code[100];
        BankName: Text[80];
        BankBranch: Text[80];
        BankBranchCode: Code[100];
        CompInfo: Record "Company Information";
        CompName2: Text[79];
        ReportSetup: Record "Bank Schedule Setup";
        Addressee: Text[100];
        Bank: Text[100];
        Loc: Text[100];
        City: Text[100];
        RefTo: Text[100];
        Body1: Text[100];
        Body2: Text[100];
        Body3: Text[100];
        DGAppName: Text[100];
        DGAppDesig: Text[100];
        FinanceAppName: Text[100];
        FinanceAppDesig: Text[100];
        FileNo: Code[100];
        Currency: Text[10];
        RepCheck: Report Check;
        NoText: array[2] of Text;
        AmountInWords: Text[250];
        Amnt: Decimal;
        SumAmount: Decimal;
        SumAmount2: Decimal;
}
