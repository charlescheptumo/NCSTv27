#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69100 "Overtime Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Overtime Report.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Overtime Header"; "Overtime Header")
        {
            RequestFilterFields = "EMp No.", "Application Code", "Application Date";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(OvertimeNo; "Overtime Header"."Application Code")
            {
            }
            column(EmployeeNo; "Overtime Header"."EMp No.")
            {
            }
            column(EmployeeName; "Overtime Header".Name)
            {
            }
            column(DepartmentName; DeptName)
            {
            }
            column(DateApplied; "Overtime Header"."Application Date")
            {
            }
            column(HoursWorked; "Overtime Header"."Total Hours")
            {
            }
            column(Picture; CI.Picture)
            {
            }
            column(Amount; Amount)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Amount := 0;
                HREmp.Reset;
                if HREmp.Get("Overtime Header"."EMp No.") then
                    DeptName := HREmp."Department Name";

                HRSetup.Reset;
                if HRSetup.Get(HRSetup."Overtime Payroll Code") then
                    PeriodTrans.Reset;
                PeriodTrans.SetRange(PeriodTrans."Employee No", "Overtime Header"."EMp No.");
                PeriodTrans.SetRange(PeriodTrans.Code, HRSetup."Overtime Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Reference No", "Overtime Header"."Application Code");
                if PeriodTrans.Find('-') then begin
                    Amount := PeriodTrans.Amount;
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

    trigger OnPreReport()
    begin
        CI.Reset;
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        DeptName: Text[50];
        CI: Record "Company Information";
        HREmp: Record Employee;
        HRSetup: Record "Human Resources Setup";
        PeriodTrans: Record "Assignment Matrix-X";
        Amount: Decimal;
}
