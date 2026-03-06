#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69056 "Payroll Cost Analysis"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Cost Analysis.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(EarningsX; EarningsX)
        {
            DataItemTableView = sorting(Code) where("Non-Cash Benefit" = const(false));
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CompName; CompInfo.Name)
            {
            }
            column(Address; CompInfo.Address)
            {
            }
            column(Address2; CompInfo."Address 2")
            {
            }
            column(City; CompInfo.City)
            {
            }
            column(PhoneNum; CompInfo."Phone No.")
            {
            }
            column(Logo; CompInfo.Picture)
            {
            }
            column(Code_EarningsX; EarningsX.Code)
            {
            }
            column(Description_EarningsX; EarningsX.Description)
            {
            }
            column(DateSpecified; DateSpecified)
            {
            }
            column(DateSpecified2; DateSpecified2)
            {
            }
            column(CompanyInfoName; CompInfo.Name)
            {
            }
            column(CompanyInfoPicture; CompInfo.Picture)
            {
            }
            column(EarningsX_TotalAmount; EarningsX."Total Amount")
            {
            }
            column(EarningsRec_TotalAmount; EarningsRec."Total Amount")
            {
            }
            column(NoofEntries_EarningsX; EarningsX."No of Entries")
            {
            }
            column(NoofEntries_EarningsRec; EarningsRec."No of Entries")
            {
            }
            column(BasicSalaryCode_EarningsX; EarningsX."Basic Salary Code")
            {
            }
            column(PreparedBy; Approver[1])
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup1.Picture)
            {
            }
            column(CheckedBy; Approver[2])
            {
            }
            column(DateChecked; ApproverDate[2])
            {
            }
            column(CheckedBy_Signature; UserSetup2.Picture)
            {
            }
            column(AuthorizedBy; Approver[3])
            {
            }
            column(DateAuthorized; ApproverDate[3])
            {
            }
            column(AuthorizedBy_Signature; UserSetup2.Picture)
            {
            }
            column(AuditedBy; Approver[4])
            {
            }
            column(DateAudited; ApproverDate[4])
            {
            }
            column(AuditedBy_Signature; UserSetup3.Picture)
            {
            }
            column(ApprovedBy; Approver[5])
            {
            }
            column(DateApproved; ApproverDate[5])
            {
            }
            column(ApprovedBy_Signature; UserSetup4.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                EarningsRec.Copy(EarningsX);
                EarningsRec.SetRange("Pay Period Filter", DateSpecified2);
                EarningsRec.CalcFields("Total Amount", "No of Entries");
                EarningsX.SetRange("Pay Period Filter", DateSpecified);
                EarningsX.CalcFields("Total Amount", "No of Entries");

                if (EarningsRec."Total Amount" = 0) and (EarningsX."Total Amount" = 0) then
                    CurrReport.Skip;

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69000);
                ApprovalEntries.SetRange("Document No.", Format(DateSpecified));
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
                            if UserSetup4.Get(Approver[5]) then
                                UserSetup4.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
            end;
        }
        dataitem(DeductionsX; DeductionsX)
        {
            DataItemTableView = sorting(Code);
            column(ReportForNavId_1000000001; 1000000001)
            {
            }
            column(Code_DeductionsX; DeductionsX.Code)
            {
            }
            column(Description_DeductionsX; DeductionsX.Description)
            {
            }
            column(TotalAmount_DeductionsX; DeductionsX."Total Amount")
            {
            }
            column(TotalAmount_DeductionsRec; DeductionsRec."Total Amount")
            {
            }
            column(NoofEntries_DeductionsX; DeductionsX."No of Entries")
            {
            }
            column(NoofEntries_DeductionsRec; DeductionsRec."No of Entries")
            {
            }
            column(PensionScheme_DeductionsX; DeductionsX."Pension Scheme")
            {
            }
            column(TotalAmountEmployer_DeductionsX; Abs(DeductionsX."Total Amount Employer"))
            {
            }
            column(TotalAmountEmployer_DeductionsRec; Abs(DeductionsRec."Total Amount Employer"))
            {
            }
            column(Statutory_DeductionsX; DeductionsX.Statutory)
            {
            }

            trigger OnAfterGetRecord()
            begin
                DeductionsRec.Copy(DeductionsX);
                DeductionsRec.SetRange("Pay Period Filter", DateSpecified2);
                DeductionsRec.CalcFields("Total Amount", "No of Entries", "Total Amount Employer");
                DeductionsX.SetRange("Pay Period Filter", DateSpecified);
                DeductionsX.CalcFields("Total Amount", "No of Entries", "Total Amount Employer");

                if (DeductionsRec."Total Amount" = 0) and (DeductionsX."Total Amount" = 0) then
                    CurrReport.Skip;
            end;
        }
        dataitem(Employee; Employee)
        {
            column(ReportForNavId_1000000048; 1000000048)
            {
            }
            column(NetPay; TotalNetPay[1])
            {
            }
            column(NetPay2; TotalNetPay[2])
            {
            }
            column(TotalEmployees; TotalEmployees[1])
            {
            }
            column(TotalEmployees2; TotalEmployees[2])
            {
            }

            trigger OnAfterGetRecord()
            begin
                Clear(NetPay);
                EmpRec.Copy(Employee);
                Employee.SetRange("Pay Period Filter", DateSpecified);
                Employee.CalcFields("Total Allowances", "Total Deductions");
                EmpRec.SetRange("Pay Period Filter", DateSpecified2);
                EmpRec.CalcFields("Total Allowances", "Total Deductions");
                NetPay[1] := Employee."Total Allowances" + Employee."Total Deductions";
                NetPay[2] := EmpRec."Total Allowances" + EmpRec."Total Deductions";
                if NetPay[1] <> 0 then
                    TotalEmployees[1] := TotalEmployees[1] + 1;
                if NetPay[2] <> 0 then
                    TotalEmployees[2] := TotalEmployees[2] + 1;
                TotalNetPay[1] := TotalNetPay[1] + NetPay[1];
                TotalNetPay[2] := TotalNetPay[2] + NetPay[2];
            end;

            trigger OnPreDataItem()
            begin
                Clear(TotalEmployees);
            end;
        }
        dataitem("Payroll Pay Mode"; "Payroll Pay Mode")
        {
            column(ReportForNavId_1000000024; 1000000024)
            {
            }
            column(Code_PayrollPayMode; "Payroll Pay Mode".Code)
            {
            }
            column(Description_PayrollPayMode; "Payroll Pay Mode".Description)
            {
            }
            column(NetPay_PayrollPayMode; "Payroll Pay Mode"."Total Earnings" - "Payroll Pay Mode"."Total Deductions")
            {
            }
            column(NetPay_PayrollPayRec; PayModeRec."Total Earnings" - PayModeRec."Total Deductions")
            {
            }
            column(TotalDeductions_PayrollPayMode; "Payroll Pay Mode"."Total Deductions")
            {
            }
            column(TotalDeductions_PayModeRec; PayModeRec."Total Deductions")
            {
            }
            column(Counter; Counter)
            {
            }
            column(Counter2; Counter2)
            {
            }

            trigger OnAfterGetRecord()
            begin
                PayModeRec.Copy("Payroll Pay Mode");
                "Payroll Pay Mode".SetRange("Pay Period Filter", DateSpecified);
                "Payroll Pay Mode".CalcFields("Total Earnings", "Total Deductions");
                PayModeRec.SetRange("Pay Period Filter", DateSpecified2);
                PayModeRec.CalcFields("Total Earnings", "Total Deductions");

                Counter := 0;
                EarningRec.Reset;
                EarningRec.SetRange("Pay Mode Filter", "Payroll Pay Mode".Code);
                EarningRec.SetRange("Pay Period Filter", DateSpecified);
                if EarningRec.Find('-') then
                    repeat
                        EarningRec.CalcFields("No of Entries");
                        if EarningRec."No of Entries" <> 0 then begin
                            if EarningRec."No of Entries" > Counter then
                                Counter := EarningRec."No of Entries";
                        end;
                    until
                     EarningRec.Next = 0;

                Counter2 := 0;
                EarningRec.Reset;
                EarningRec.SetRange("Pay Mode Filter", "Payroll Pay Mode".Code);
                EarningRec.SetRange("Pay Period Filter", DateSpecified2);
                if EarningRec.Find('-') then
                    repeat
                        EarningRec.CalcFields("No of Entries");
                        if EarningRec."No of Entries" <> 0 then begin
                            if EarningRec."No of Entries" > Counter2 then
                                Counter2 := EarningRec."No of Entries";
                        end;
                    until
                     EarningRec.Next = 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1000000000)
                {
                    field("Period 1"; DateSpecified)
                    {
                        ApplicationArea = Basic;
                        TableRelation = "Payroll PeriodX";
                    }
                    field("Period 2"; DateSpecified2)
                    {
                        ApplicationArea = Basic;
                        TableRelation = "Payroll PeriodX";
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        PayrollAnalysis = 'Employee Payroll Analysis';
    }

    trigger OnPreReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(Picture);
    end;

    var
        CompInfo: Record "Company Information";
        DateSpecified: Date;
        DateSpecified2: Date;
        EarningsRec: Record EarningsX;
        DeductionsRec: Record DeductionsX;
        PayModeRec: Record "Payroll Pay Mode";
        EmpRec: Record Employee;
        Counter: Integer;
        Counter2: Integer;
        EarningRec: Record EarningsX;
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[20];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        UserSetup4: Record "User Setup";
        NetPay: array[2] of Decimal;
        TotalEmployees: array[2] of Integer;
        TotalNetPay: array[2] of Decimal;


    procedure GetDateFilters(StartDate: Date; EndDate: Date)
    begin
        DateSpecified := StartDate;
        DateSpecified2 := EndDate;
    end;
}
