#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69300 "CRM Cases Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CRM Cases Report.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("HR Job Requirements"; "HR Job Requirements")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Job Id", "Qualification Code";
            column(ReportForNavId_4645; 4645)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(Company_Name; Company.Name)
            {
            }
            column(Company_Address; Company.Address)
            {
            }
            column(Company_Address_2; Company."Address 2")
            {
            }
            column(Company_Phone_No; Company."Phone No.")
            {
            }
            column(Company_Fax_No; Company."Fax No.")
            {
            }
            column(Company_Picture; Company.Picture)
            {
            }
            column(Company_Email; Company."E-Mail")
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(VarCount; VarCount)
            {
            }
            // column(CallerRefferedTo_CasesManagement; "HR Job Requirements"."Caller Reffered To")
            // {
            // }
            column(CaseNumber_CasesManagement; "HR Job Requirements"."Job Id")
            {
            }
            column(DateofComplaint_CasesManagement; Format("HR Job Requirements"."Qualification Code"))
            {
            }
            // column(Typeofcases_CasesManagement; "HR Job Requirements"."Type of cases")
            // {
            // }
            // column(RecommendedAction_CasesManagement; "HR Job Requirements"."Recommended Action")
            // {
            // }
            column(CaseDescription_CasesManagement; "HR Job Requirements".Priority)
            {
            }
            // column(Status_CasesManagement; "HR Job Requirements".Status)
            // {
            // }
            // column(ModeofLodgingtheComplaint_CasesManagement; "HR Job Requirements"."Mode of Lodging the Complaint")
            // {
            // }
            // column(MemberNo_CasesManagement; "HR Job Requirements"."Member No")
            // {
            // }
            // column(MemberName_CasesManagement; "HR Job Requirements"."Member Name")
            // {
            // }
            // column(Description_CasesManagement; "HR Job Requirements".Description)
            // {
            // }
            // column(IDNo_CasesManagement; "HR Job Requirements"."ID No")
            // {
            // }
            // column(Gender_CasesManagement; "HR Job Requirements".Gender)
            // {
            // }
            // column(DateResolved_CasesManagement; Format("HR Job Requirements"."Date Resolved"))
            // {
            // }
            // column(DateofEscalation_CasesManagement; "HR Job Requirements"."Date of Escalation")
            // {
            // }

            trigger OnAfterGetRecord()
            begin
                VarCount := VarCount + 1;
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

    trigger OnInitReport()
    begin
        Company.Get();
        Company.CalcFields(Company.Picture);
    end;

    var
        Company: Record "Company Information";
        ClosingBalPreviousDay: Decimal;
        TotalDeposits: Decimal;
        TotalWithdrawals: Decimal;
        ClosingBalToday: Decimal;
        GLAccountNo: Code[20];
        VendorPostingGroups: Record "Vendor Posting Group";
        StartDate: Date;
        PreviousDay: Date;
        CurrDate: Date;
        GLAccounts: Record "G/L Account";
        CurrDateFilter: Text;
        PrevDateFilter: Text;
        GLEntry: Record "G/L Entry";
        ASAT: Date;
        TransactedAccounts: Integer;
        GLEntries: Record "G/L Entry";
        VarDepositLimit: Decimal;
        VarWithdrawalLimit: Decimal;
        VarCurrAccountBal: Decimal;
        VarAccountName: Code[50];
        VarAccountType: Code[20];
        ObjVendor: Record Vendor;
        VarDepositCriteriaTrue: Boolean;
        VarWithdrawalCriteriaTrue: Boolean;
        ObjVendorLedg: Record "Vendor Ledger Entry";
        VarDepCount: Integer;
        VarWithCount: Integer;
        VarCount: Integer;
}
