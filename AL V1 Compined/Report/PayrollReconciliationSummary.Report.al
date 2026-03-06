#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69055 "Payroll Reconciliation Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Reconciliation Summary.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(EarningsX; EarningsX)
        {
            PrintOnlyIfDetail = false;
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
            column(ThisMonthVal; ThisMonthVal)
            {
            }
            column(LastMonthVal; LastMonthVal)
            {
            }
            column(Difference; Difference)
            {
            }
            column(Thismonth; Thismonth)
            {
            }
            column(Lastmonth; Lastmonth)
            {
            }
            column(SerialNo1; SerialNo)
            {
            }
            column(TotalEmployees; TotalEmployees)
            {
            }
            column(TotalEmployeesLastMonth; TotalEmployeesLastMonth)
            {
            }
            column(NetPayThisMonth; NetPayThisMonth)
            {
            }
            column(NetPayLastMonth; NetPayLastMonth)
            {
            }
            column(Difference2; Difference)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number);
                MaxIteration = 1;
                column(ReportForNavId_1000000027; 1000000027)
                {
                }
                column(CompanyInfoName; CompanyInfo.Name)
                {
                }
                column(CompanyInfoPicture; CompanyInfo.Picture)
                {
                }

                trigger OnPreDataItem()
                begin
                    // Integer.SETRANGE(Number,1,i);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //SerialNo:=0;
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);

                if EarningsX."Non-Cash Benefit" = true then
                    CurrReport.Skip;


                //Earn.RESET;
                //earningsx.SETRANGE(earningsx.Code,EarningsX.Code);
                EarningsX.SetRange(EarningsX."Pay Period Filter", Thismonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Earn.SETRANGE(Earn."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF EarningsX.FINDFIRST THEN
                EarningsX.CalcFields(EarningsX."Total Amount");
                ThisMonthVal := EarningsX."Total Amount";
                TotalEarnThisMonth := TotalEarnThisMonth + ThisMonthVal;

                //Earn.RESET;
                //Earn.SETRANGE(Earn.Code,EarningsX.Code);
                EarningsX.SetRange(EarningsX."Pay Period Filter", Lastmonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Earn.SETRANGE(Earn."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF EarningsX.FINDFIRST THEN
                EarningsX.CalcFields(EarningsX."Total Amount");

                LastMonthVal := EarningsX."Total Amount";
                TotalEarnLastMonth := TotalEarnLastMonth + LastMonthVal;

                Difference := ThisMonthVal - LastMonthVal;

                //IF  (ThisMonthVal=0) AND (LastMonthVal=0) THEN

                /*IF  (Difference=0) THEN
                CurrReport.SKIP;*/

                SerialNo := SerialNo + 1;

            end;

            trigger OnPreDataItem()
            begin
                TotalEmployees := 0;
                TotalEmployeesLastMonth := 0;
                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Thismonth);

                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        if Employee1."Total Allowances1" > 0 then
                            TotalEmployees := TotalEmployees + 1;
                    until Employee1.Next = 0;
                end;

                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Lastmonth);

                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        if Employee1."Total Allowances1" > 0 then
                            TotalEmployeesLastMonth := TotalEmployeesLastMonth + 1;
                    until Employee1.Next = 0;
                end;

                NetPayThisMonth := 0;
                NetPayLastMonth := 0;
                Difference := 0;

                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);


                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Thismonth);

                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        NetPayThisMonth := NetPayThisMonth + Employee1."Total Allowances1" + Employee1."Total Deductions";
                    until Employee1.Next = 0;
                end;

                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Lastmonth);

                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        NetPayLastMonth := NetPayLastMonth + Employee1."Total Allowances1" + Employee1."Total Deductions";
                    until Employee1.Next = 0;
                end;

                Difference := NetPayThisMonth - NetPayLastMonth;
            end;
        }
        dataitem(DeductionsX; DeductionsX)
        {
            PrintOnlyIfDetail = false;
            column(ReportForNavId_1000000002; 1000000002)
            {
            }
            column(DeductionsX_Code; DeductionsX.Code)
            {
            }
            column(DeductionsX_Description; DeductionsX.Description)
            {
            }
            column(ThisMonthVal1; ThisMonthVal)
            {
            }
            column(LastMonthVal1; LastMonthVal)
            {
            }
            column(Difference1; Difference)
            {
            }
            column(SerialNo2; SerialNo2)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //SerialNo2:=0;

                LastMonthVal := 0;
                ThisMonthVal := 0;
                Difference := 0;
                //Ded.RESET;
                //Ded.SETRANGE(Ded.Code,DeductionsX.Code);
                DeductionsX.SetRange(DeductionsX."Pay Period Filter", Thismonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Ded.SETRANGE(Ded."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF Ded.FINDFIRST THEN
                DeductionsX.CalcFields(DeductionsX."Total Amount");
                ThisMonthVal := DeductionsX."Total Amount";
                TotalDedThisMonth := TotalDedThisMonth + ThisMonthVal;

                //Ded.RESET;
                //Ded.SETRANGE(Ded.Code,DeductionsX.Code);
                DeductionsX.SetRange(DeductionsX."Pay Period Filter", Lastmonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Ded.SETRANGE(Ded."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF Ded.FINDFIRST THEN
                DeductionsX.CalcFields(DeductionsX."Total Amount");

                LastMonthVal := DeductionsX."Total Amount";
                TotalDedLastMonth := TotalDedLastMonth + LastMonthVal;

                Difference := ThisMonthVal - LastMonthVal;

                //IF  (ThisMonthVal=0) AND (LastMonthVal=0) THEN

                if (Difference = 0) then
                    CurrReport.Skip;

                SerialNo2 := SerialNo2 + 1;
            end;

            trigger OnPostDataItem()
            begin
                //SerialNo:=0;
            end;

            trigger OnPreDataItem()
            begin
                //SerialNo:=0;
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

        Thismonth := EarningsX.GetRangeMin(EarningsX."Pay Period Filter");
        Lastmonth := CalcDate('-1M', Thismonth);
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
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
        NetPayThisMonth: Decimal;
        NetPayLastMonth: Decimal;
        CompanyInfo: Record "Company Information";
        SerialNo: Integer;
        SerialNo2: Integer;
        SerialNo3: Integer;
        Earn: Record EarningsX;
        TotalEarnThisMonth: Decimal;
        TotalDedThisMonth: Decimal;
        TotalEarnLastMonth: Decimal;
        TotalDedLastMonth: Decimal;
        Ded: Record DeductionsX;
        EarningFilter: Text[200];
        TotalEmployees: Integer;
        TotalEmployeesLastMonth: Integer;
        Employee1: Record Employee;
}
