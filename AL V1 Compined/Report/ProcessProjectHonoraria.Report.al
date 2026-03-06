#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65014 "Process Project Honoraria"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Process Project Honoraria.rdlc';
    UsageCategory = Tasks;

    dataset
    {
        dataitem("Payroll PeriodX"; "Payroll PeriodX")
        {
            DataItemTableView = where(Closed = const(false));
            RequestFilterFields = "Starting Date";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Effort.Reset;
                Effort.SetRange(Blocked, false);
                Effort.SetFilter("Monthly Earned Amount(LCY)", '<>%1', 0);
                if Effort.Find('-') then begin
                    repeat
                        if (("Payroll PeriodX"."Starting Date" >= Effort."Starting Pay Period") and
                            ("Payroll PeriodX"."Starting Date" <= Effort."Ending Pay Period")) then begin
                            Effort.CalcFields("Employee No");
                            AssigntMatrix.Init;
                            AssigntMatrix."Employee No" := Effort."Employee No";
                            AssigntMatrix.Type := AssigntMatrix.Type::Payment;
                            AssigntMatrix.Code := Effort."Payroll Earning Code";
                            AssigntMatrix."Effective Start Date" := Effort."Starting Pay Period";
                            AssigntMatrix."Effective End Date" := Effort."Ending Pay Period";
                            AssigntMatrix."Payroll Period" := "Payroll PeriodX"."Starting Date";
                            AssigntMatrix.Amount := Effort."Monthly Earned Amount(LCY)";
                            AssigntMatrix.Description := Effort."Earning Description";
                            AssigntMatrix.Taxable := true;
                            AssigntMatrix."Job No" := Effort."Project No";
                            AssigntMatrix."Job Task No" := Effort."Task No";
                            AssigntMatrix.Insert(true);

                        end;
                    until Effort.Next = 0;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Project Honoraria processed successfully');
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
        Effort: Record "Effort & Payroll Matrix";
        AssigntMatrix: Record "Assignment Matrix-X";
        PayrollPeriod: Date;
}
