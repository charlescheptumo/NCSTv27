#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69011 "Earnings Mass Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Earnings Mass Update.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(FirstName_Employee; Employee."First Name")
            {
            }
            column(MiddleName_Employee; Employee."Middle Name")
            {
            }
            column(LastName_Employee; Employee."Last Name")
            {
            }

            trigger OnAfterGetRecord()
            begin

                PayrollRun.DefaultAssignment(Employee);
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
        Direction: Option " ",Increase,Decrease;
        UpdateType: Option " ",Percentage,FlatAmount;
        FlatAmount: Decimal;
        Percentage: Decimal;
        ActionType: Option " ",Add,Modify;
        Assignmat: Record "Assignment Matrix-X";
        EarningRec: Record EarningsX;
        PayPeriod: Record "Payroll PeriodX";
        BeginDate: Date;
        PayrollRun: Report "Payroll Run";


    procedure GetEarnings(var EarnRec: Record EarningsX)
    begin
        EarningRec := EarnRec;
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
        end;
    end;
}
