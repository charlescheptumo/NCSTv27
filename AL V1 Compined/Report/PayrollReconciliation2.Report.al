#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 99082 "Payroll Reconciliation2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Reconciliation2.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(EarningsX; EarningsX)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Pay Period Filter", "Posting Group Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(EarningsX_Code; EarningsX.Code)
            {
            }
            column(EarningsX_Description; EarningsX.Description)
            {
            }
            dataitem(Employee; Employee)
            {
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(EmployeeNo; Employee."No.")
                {
                }
                column(ThisMonthVal; ThisMonthVal)
                {
                }
                column(EmpName; EmpName)
                {
                }
                column(LastMonthVal; LastMonthVal)
                {
                }
                column(Difference; Difference)
                {
                }
                column(ThisMonth; Thismonth)
                {
                }
                column(LastMonth; Lastmonth)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    // IF Emp.GET("Assignment Matrix-X"."Employee No") THEN
                    // BEGIN
                    EmpName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    // END;
                    ThisMonthVal := 0;
                    LastMonthVal := 0;
                    Difference := 0;

                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                    Assignmat.SetRange(Assignmat.Code, EarningsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                    if PostingGrp <> '' then
                        Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.FindFirst then
                        ThisMonthVal := Assignmat.Amount;
                    /*
                    
                       ELSE
                       BEGIN
                       Assignmat.RESET;
                       Assignmat.SETRANGE(Assignmat."Employee No","Assignment Matrix-X"."Employee No");
                       Assignmat.SETRANGE(Assignmat.Type,"Assignment Matrix-X".Type);
                       Assignmat.SETRANGE(Assignmat.Code,"Assignment Matrix-X".Code);
                       Assignmat.SETRANGE(Assignmat."Payroll Period",Lastmonth);
                       IF Assignmat.FIND('+') THEN
                       LastMonthVal:=Assignmat.Amount;
                    
                       END;
                    
                    */
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                    Assignmat.SetRange(Assignmat.Code, EarningsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                    if PostingGrp <> '' then
                        Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.FindFirst then
                        LastMonthVal := Assignmat.Amount;

                    Difference := ThisMonthVal - LastMonthVal;
                    if Difference = 0 then
                        CurrReport.Skip;

                end;
            }
        }
        dataitem(DeductionsX; DeductionsX)
        {
            PrintOnlyIfDetail = true;
            column(ReportForNavId_1000000002; 1000000002)
            {
            }
            column(DeductionsX_Code; DeductionsX.Code)
            {
            }
            column(DeductionsX_Description; DeductionsX.Description)
            {
            }
            dataitem(Employee1; Employee)
            {
                column(ReportForNavId_1000000003; 1000000003)
                {
                }
                column(EmployeeNo1; Employee1."No.")
                {
                }
                column(ThisMonthVal1; ThisMonthVal)
                {
                }
                column(EmpName1; EmpName)
                {
                }
                column(LastMonthVal1; LastMonthVal)
                {
                }
                column(Difference1; Difference)
                {
                }
                column(ThisMonth1; Thismonth)
                {
                }
                column(LastMonth1; Lastmonth)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    EmpName := Employee1."First Name" + ' ' + Employee1."Middle Name" + ' ' + Employee1."Last Name";
                    // END;
                    ThisMonthVal := 0;
                    LastMonthVal := 0;
                    Difference := 0;

                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee1."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, DeductionsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                    if PostingGrp <> '' then
                        Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.Find('-') then
                        ThisMonthVal := Assignmat.Amount;
                    /*
                    
                       ELSE
                       BEGIN
                       Assignmat.RESET;
                       Assignmat.SETRANGE(Assignmat."Employee No","Assignment Matrix-X"."Employee No");
                       Assignmat.SETRANGE(Assignmat.Type,"Assignment Matrix-X".Type);
                       Assignmat.SETRANGE(Assignmat.Code,"Assignment Matrix-X".Code);
                       Assignmat.SETRANGE(Assignmat."Payroll Period",Lastmonth);
                       IF Assignmat.FIND('+') THEN
                       LastMonthVal:=Assignmat.Amount;
                    
                       END;
                    
                    */
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee1."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, DeductionsX.Code);
                    Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                    if PostingGrp <> '' then
                        Assignmat.SetRange(Assignmat."Posting Group Filter", PostingGrp);
                    if Assignmat.Find('-') then
                        LastMonthVal := Assignmat.Amount;

                    Difference := ThisMonthVal - LastMonthVal;

                    if Difference = 0 then
                        CurrReport.Skip;

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
    }

    trigger OnPreReport()
    begin

        Thismonth := EarningsX.GetRangeMin(EarningsX."Pay Period Filter");
        Lastmonth := CalcDate('-1M', Thismonth);
    end;

    var
        EmpName: Text[230];
        Emp: Record Employee;
        Assignmat: Record "Assignment Matrix-X";
        Thismonth: Date;
        Lastmonth: Date;
        LastMonthVal: Decimal;
        Difference: Decimal;
        PostingGrp: Code[100];
        ThisMonthVal: Decimal;
        Thismonth1: Date;
        Lastmonth1: Date;
        LastMonthVal1: Decimal;
        Difference1: Decimal;
        ThisMonthVal1: Decimal;
        EmpName1: Text;
}
