#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69001 "Salary Payment Vouchers"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Salary Payment Vouchers.rdlc';

    dataset
    {
        dataitem("Payroll Header"; "Payroll Header")
        {
            RequestFilterFields = "No.", "Payroll Period";
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
            column(No_PayrollHeader; "Payroll Header"."No.")
            {
            }
            column(DocumentDate_PayrollHeader; Format("Payroll Header"."Document Date", 0, 4))
            {
            }
            column(PayrollPeriod_PayrollHeader; Format("Payroll Header"."Payroll Period", 0, 4))
            {
            }
            column(AccountType_PayrollHeader; "Payroll Header"."Account Type")
            {
            }
            column(AccountNo_PayrollHeader; "Payroll Header"."Account No.")
            {
            }
            column(ReceivableAccountName_PayrollHeader; "Payroll Header"."Receivable Account Name")
            {
            }
            column(GrossPay_PayrollHeader; "Payroll Header"."Gross Pay")
            {
            }
            column(NetPay_PayrollHeader; "Payroll Header"."Net Pay")
            {
            }
            column(Posted_PayrollHeader; "Payroll Header".Posted)
            {
            }
            column(NoSeries_PayrollHeader; "Payroll Header"."No. Series")
            {
            }
            column(PensionAdministrator_PayrollHeader; "Payroll Header"."Pension Administrator")
            {
            }
            column(Status_PayrollHeader; "Payroll Header".Status)
            {
            }
            column(PostedBy_PayrollHeader; "Payroll Header"."Posted By")
            {
            }
            column(TimePosted_PayrollHeader; "Payroll Header"."Time Posted")
            {
            }
            column(Description_PayrollHeader; "Payroll Header".Description)
            {
            }
            column(TotalDeductions_PayrollHeader; "Payroll Header"."Total Deductions")
            {
            }
            column(Authorize_PayrollHeader; "Payroll Header".Authorize)
            {
            }
            column(payrollMonth_PayrollHeader; "Payroll Header"."payroll Month")
            {
            }
            column(AcitvityCode_PayrollHeader; "Payroll Header"."Acitvity Code")
            {
            }
            column(BranchCode_PayrollHeader; "Payroll Header"."Branch Code")
            {
            }
            column(ChequeDate_PayrollHeader; "Payroll Header"."Cheque Date")
            {
            }
            column(GlobalDimension1Code_PayrollHeader; "Payroll Header"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_PayrollHeader; "Payroll Header"."Global Dimension 2 Code")
            {
            }
            column(ShortcutDimension1Code_PayrollHeader; "Payroll Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PayrollHeader; "Payroll Header"."Shortcut Dimension 2 Code")
            {
            }
            column(DimensionSetID_PayrollHeader; "Payroll Header"."Dimension Set ID")
            {
            }
            column(DocumentType_PayrollHeader; "Payroll Header"."Document Type")
            {
            }
            column(ChannelID_PayrollHeader; "Payroll Header"."Channel ID")
            {
            }
            column(AllocationPeriod_PayrollHeader; "Payroll Header"."Allocation Period")
            {
            }
            column(Currency_PayrollHeader; "Payroll Header".Currency)
            {
            }
            column(CreatedBy_PayrollHeader; "Payroll Header"."Created By")
            {
            }
            column(DateCreated_PayrollHeader; "Payroll Header"."Date Created")
            {
            }
            column(TimeCreated_PayrollHeader; "Payroll Header"."Time Created")
            {
            }
            column(InterestAmount_PayrollHeader; "Payroll Header"."Interest Amount")
            {
            }
            column(Number_In_Words; NumberText[1])
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateApproved; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            column(Approved_By; usersetup4."Employee Name")
            {
            }
            column(DateApprove; ApproverDate[5])
            {
            }
            column(Signature; usersetup4.Picture)
            {
            }
            column(Reversed_PayrollHeader; "Payroll Header".Reversed)
            {
            }
            dataitem("Payroll Lines"; "Payroll Lines")
            {
                DataItemLink = "Payroll Period" = field("Payroll Period"), "Payroll Header" = field("No.");
                column(ReportForNavId_1000000036; 1000000036)
                {
                }
                column(LineNo_PayrollLines; "Payroll Lines"."Line No")
                {
                }
                column(PersonalNo_PayrollLines; "Payroll Lines"."Personal No.")
                {
                }
                column(EmployeeName_PayrollLines; "Payroll Lines"."Employee Name")
                {
                }
                column(BasicSalary_PayrollLines; "Payroll Lines"."Basic Salary")
                {
                }
                column(BasicArrears_PayrollLines; "Payroll Lines"."Basic Arrears")
                {
                }
                column(GrossPay_PayrollLines; "Payroll Lines"."Gross Pay")
                {
                }
                column(TotalDeduction_PayrollLines; "Payroll Lines"."Total Deduction")
                {
                }
                column(Netpay_PayrollLines; "Payroll Lines".Netpay)
                {
                }
                column(PayrollHeader_PayrollLines; "Payroll Lines"."Payroll Header")
                {
                }
                column(PayrollPeriod_PayrollLines; "Payroll Lines"."Payroll Period")
                {
                }
                column(PayrollGroup_PayrollLines; "Payroll Lines"."Payroll Group")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin

                PaymentMgt.InitTextVariable;
                PaymentMgt.FormatNoText(NumberText, "Payroll Header"."Net Pay", CurrencyCodeText);

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69030);
                ApprovalEntries.SetRange("Document No.", "Payroll Header"."No.");
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
                        if i = 4 then begin
                            Approver[5] := ApprovalEntries."Approver ID";
                            ApproverDate[5] := ApprovalEntries."Last Date-Time Modified";
                            if usersetup4.Get(Approver[5]) then
                                usersetup4.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

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

    trigger OnInitReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CheckReport: Report Check;
        NumberText: array[2] of Text[150];
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
        usersetup4: Record "User Setup";
}
