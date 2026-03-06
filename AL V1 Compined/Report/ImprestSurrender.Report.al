#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 57005 "Imprest Surrender"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Imprest Surrender.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(Payments; Payments)
        {
            DataItemTableView = where("Payment Type" = const(Surrender));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.", Date, "Cheque No", "Bank Code", Payee;
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(No_Payments; Payments."No.")
            {
            }
            column(Date_Payments; Payments.Date)
            {
            }
            column(PaymentsNarration; Payments."Payment Narration")
            {
            }
            column(Type_Payments; Payments.Type)
            {
            }
            column(JobNo_Payments; Payments.Project)
            {
            }
            column(JobDescription_Payments; Payments."Project Description")
            {
            }
            column(BankName_Payments; Payments."Bank Name")
            {
            }
            column(PayMode_Payments; Payments."Pay Mode")
            {
            }
            column(ChequeNo_Payments; Payments."Cheque No")
            {
            }
            column(ChequeDate_Payments; Payments."Cheque Date")
            {
            }
            column(BankCode_Payments; Payments."Bank Code")
            {
            }
            column(Payee_Payments; Payments.Payee)
            {
            }
            column(Onbehalfof_Payments; Payments."On behalf of")
            {
            }
            column(CreatedBy_Payments; Payments."Created By")
            {
            }
            column(Posted_Payments; Payments.Posted)
            {
            }
            column(PostedBy_Payments; Payments."Posted By")
            {
            }
            column(PostedDate_Payments; Payments."Posted Date")
            {
            }
            column(GlobalDimension1Code_Payments; Payments."Shortcut Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Payments; Payments."Shortcut Dimension 2 Code")
            {
            }
            column(TimePosted_Payments; Payments."Time Posted")
            {
            }
            column(TotalAmount_Payments; Payments."Total Amount")
            {
            }
            column(PayingBankAccount_Payments; Payments."Paying Bank Account")
            {
            }
            column(Status_Payments; Payments.Status)
            {
            }
            column(PaymentType_Payments; Payments."Payment Type")
            {
            }
            column(Currency_Payments; Payments."Currency Code")
            {
            }
            column(NoSeries_Payments; Payments."No. Series")
            {
            }
            column(AccountType_Payments; Payments."Account Type")
            {
            }
            column(AccountNo_Payments; Payments."Account No.")
            {
            }
            column(AccountName_Payments; Payments."Account Name")
            {
            }
            column(ImprestAmount_Payments; Payments."Imprest Amount")
            {
            }
            column(Surrendered_Payments; Payments.Surrendered)
            {
            }
            column(AppliesToDocNo_Payments; Payments."Applies- To Doc No.")
            {
            }
            column(PettyCashAmount_Payments; Payments."Petty Cash Amount")
            {
            }
            column(OriginalDocument_Payments; Payments."Original Document")
            {
            }
            column(PVCreationDateTime_Payments; Payments."PV Creation DateTime")
            {
            }
            column(PVCreatorID_Payments; Payments."PV Creator ID")
            {
            }
            column(RemainingAmount_Payments; Payments."Remaining Amount")
            {
            }
            column(ReceiptCreated_Payments; Payments."Receipt Created")
            {
            }
            column(ImprestDeadline_Payments; Payments."Imprest Deadline")
            {
            }
            column(ImprestSurrenderDate_Payments; Payments."Surrender Date")
            {
            }
            column(DateFilter_Payments; Payments."Date Filter")
            {
            }
            column(ImprestType_Payments; Payments."Imprest Type")
            {
            }
            column(ProjectBudget_Payments; Payments."Project Budget")
            {
            }
            column(UsageCosts_Payments; Payments."Actual Project Costs")
            {
            }
            column(TotalCommitments_Payments; Payments."Total Budget Commitments")
            {
            }
            column(AvailableFunds_Payments; Payments."Available Funds")
            {
            }
            column(Payments_Actual_Amount_Spent; Payments."Actual Amount Spent")
            {
            }
            column(Number_In_Words; NumberText[1])
            {
            }
            column(PreparedBy; Approver[1])
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; Approver[2])
            {
            }
            column(DateApproved; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; Approver[3])
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; Approver[4])
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            dataitem("Imprest Lines"; "Imprest Lines")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = sorting(No, "Line No");
                column(ReportForNavId_1000000024; 1000000024)
                {
                }
                column(No_ImprestLines; "Imprest Lines".No)
                {
                }
                column(LineNo_ImprestLines; "Imprest Lines"."Line No")
                {
                }
                column(AccountType_ImprestLines; "Imprest Lines"."Account Type")
                {
                }
                column(AccountNo_ImprestLines; "Imprest Lines"."Account No.")
                {
                }
                column(AccountName_ImprestLines; "Imprest Lines"."Account Name")
                {
                }
                column(Description_ImprestLines; "Imprest Lines".Description)
                {
                }
                column(Amount_ImprestLines; "Imprest Lines".Amount)
                {
                }
                column(AppliestoDocNo_ImprestLines; "Imprest Lines"."Applies- to Doc. No.")
                {
                }
                column(GlobalDimension1Code_ImprestLines; "Imprest Lines"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_ImprestLines; "Imprest Lines"."Global Dimension 2 Code")
                {
                }
                column(ActualSpent_ImprestLines; "Imprest Lines"."Actual Spent")
                {
                }
                column(RemainingAmount_ImprestLines; "Imprest Lines"."Remaining Amount")
                {
                }
                column(Committed_ImprestLines; "Imprest Lines".Committed)
                {
                }
                column(AdvanceType_ImprestLines; "Imprest Lines"."Advance Type")
                {
                }
                column(CurrencyCode_ImprestLines; "Imprest Lines"."Currency Code")
                {
                }
                column(CurrencyFactor_ImprestLines; "Imprest Lines"."Currency Factor")
                {
                }
                column(AmountLCY_ImprestLines; "Imprest Lines"."Amount LCY")
                {
                }
                column(ExpenseType_ImprestLines; "Imprest Lines"."Expense Type")
                {
                }
                column(WorkType_ImprestLines; "Imprest Lines"."Work Type")
                {
                }
                column(ResourceNo_ImprestLines; "Imprest Lines"."Resource No.")
                {
                }
                column(TaskNo_ImprestLines; "Imprest Lines"."Task No.")
                {
                }
                column(Project_ImprestLines; "Imprest Lines".Project)
                {
                }
                column(DueDate_ImprestLines; "Imprest Lines"."Due Date")
                {
                }
                column(ImprestHolder_ImprestLines; "Imprest Lines"."Imprest Holder")
                {
                }
                column(JobNo_ImprestLines; "Imprest Lines"."Job No.")
                {
                }
                column(Purpose_ImprestLines; "Imprest Lines".Purpose)
                {
                }
                column(BudgetaryControlAC_ImprestLines; "Imprest Lines"."Budgetary Control A/C")
                {
                }
                column(Destination_ImprestLines; "Imprest Lines".Destination)
                {
                }
                column(DailyRate_ImprestLines; "Imprest Lines"."Daily Rate")
                {
                }
                column(NoofDays_ImprestLines; "Imprest Lines"."No. of Days")
                {
                }
                column(Subsistence_ImprestLines; "Imprest Lines".Subsistence)
                {
                }
                column(JobTaskNo_ImprestLines; "Imprest Lines"."Job Task No.")
                {
                }
                column(JobQuantity_ImprestLines; "Imprest Lines"."Job Quantity")
                {
                }
                column(Status_ImprestLines; "Imprest Lines".Status)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin

                PaymentMgt.InitTextVariable;
                PaymentMgt.FormatNoText(NumberText, "Actual Amount Spent", CurrencyCodeText);



                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 57000);
                ApprovalEntries.SetRange("Document No.", Payments."No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
            end;

            trigger OnPreDataItem()
            begin
                Payments.CalcFields(Payments."Bank Name", Payments."Project Description", Payments."Imprest Amount", Payments."Actual Amount Spent");
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
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CheckReport: Report Check;
        NumberText: array[2] of Text[80];
        TTotal: Decimal;
        PaymentMgt: Codeunit "Payments-Post";
        CurrencyCodeText: Code[10];
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[20];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
}
