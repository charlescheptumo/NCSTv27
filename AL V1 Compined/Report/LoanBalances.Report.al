#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69047 "Loan Balances"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Loan Balances.rdlc';

    dataset
    {
        dataitem("For Master Roll"; "For Master Roll")
        {
            DataItemTableView = where(BdInterest = filter(<> 0));
            RequestFilterFields = "Employee Code", "Loan Code", PeriodFilter;
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(PeriodFilter_ForMasterRoll; "For Master Roll".PeriodFilter)
            {
            }
            column(EmployeeCode_ForMasterRoll; "For Master Roll"."Employee Code")
            {
            }
            column(EmployeeName_ForMasterRoll; "For Master Roll"."Employee Name")
            {
            }
            column(BalCf_ForMasterRoll; "For Master Roll"."Bal Cf")
            {
            }
            column(Balbf_ForMasterRoll; "For Master Roll"."Bal bf")
            {
            }
            column(BalBf; BalBf)
            {
            }
            column(Recovery; Recovery)
            {
            }
            column(Balcf; Balcf)
            {
            }
            column(BdInterest_ForMasterRoll; "For Master Roll".BdInterest)
            {
            }
            column(totaldeducted; totaldeducted)
            {
            }
            column(reportmonth2; reportmonth2)
            {
            }
            column(reportyear; reportyear)
            {
            }
            column(LoanCode; LoanCode)
            {
            }
            column(LoanName; LoanName)
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(ReportForNavId_1000000009; 1000000009)
                {
                }
                column(Name_CompanyInformation; "Company Information".Name)
                {
                }
                column(Picture_CompanyInformation; "Company Information".Picture)
                {
                }

                trigger OnPreDataItem()
                begin
                    //MESSAGE('%1',getfilters);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                Recovery := "For Master Roll"."Bal bf" - "For Master Roll"."Bal Cf";
                Balcf := "For Master Roll"."Bal Cf";
                BalBf := "For Master Roll"."Bal bf";
                Intr += "For Master Roll".BdInterest;
                Dedu += Recovery;
                totaldeducted := Recovery - "For Master Roll".BdInterest;
                //MESSAGE('%1',totaldeducted);
                // MESSAGE('');
            end;

            trigger OnPreDataItem()
            begin

                filterr := "For Master Roll".GetFilters;
                LoanCode := CopyStr(filterr, StrPos(filterr, ':') + 23, 35);
                Monthh := CopyStr(filterr, StrPos(filterr, ':') + 2, 8);
                //MESSAGE('%1\%2',Monthh,LoanCode);
                Evaluate(reportdate, Monthh);
                //Message('%1',monthh);
                reportmonth := Date2dmy(reportdate, 2);
                reportyear := Date2dmy(reportdate, 3);
                //...........................................
                case reportmonth of
                    1:
                        reportmonth2 := 'January';
                    2:
                        reportmonth2 := 'February';
                    3:
                        reportmonth2 := 'March';
                    4:
                        reportmonth2 := 'April';
                    5:
                        reportmonth2 := 'May';
                    6:
                        reportmonth2 := 'June';
                    7:
                        reportmonth2 := 'July';
                    8:
                        reportmonth2 := 'August';
                    9:
                        reportmonth2 := 'September';
                    10:
                        reportmonth2 := 'October';
                    11:
                        reportmonth2 := 'November';
                    12:
                        reportmonth2 := 'December';
                    else
                        Error('The Date you Entered is wrong.\Please Enter a Correct Date.');
                end;
                //...........................................
                //MESSAGE('%1',LoanCode);
                deductionTB.SetFilter(deductionTB.Code, LoanCode);
                if deductionTB.FindFirst then begin
                    LoanName := deductionTB.Description;
                end;
                //...........................................
                //MESSAGE(LoanName);
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
        Recovery: Decimal;
        Balcf: Decimal;
        BalBf: Decimal;
        Intr: Decimal;
        Dedu: Decimal;
        LoanCode: Text[100];
        LoanName: Text[100];
        Monthh: Text[100];
        filterr: Text[100];
        reportdate: Date;
        reportmonth: Integer;
        reportmonth2: Text[50];
        reportyear: Integer;
        deductionTB: Record DeductionsX;
        totaldeducted: Decimal;
}
