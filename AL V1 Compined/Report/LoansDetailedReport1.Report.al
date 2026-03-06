#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69046 "Loans Detailed Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Loans Detailed Report1.rdlc';

    dataset
    {
        dataitem("For Master Roll"; "For Master Roll")
        {
            RequestFilterFields = "Employee Code", PeriodFilter;
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(PeriodFilter_ForMasterRoll; "For Master Roll".PeriodFilter)
            {
            }
            column(EmployeeCode_ForMasterRoll; "For Master Roll"."Employee Code")
            {
            }
            column(NormalCoopLoan_ForMasterRoll; "For Master Roll"."Normal Co-op Loan")
            {
            }
            column(EmployeeName_ForMasterRoll; "For Master Roll"."Employee Name")
            {
            }
            column(SubsidiaryLoan_ForMasterRoll; "For Master Roll"."Subsidiary Loan")
            {
            }
            column(SchoolFeesCoopLoan_ForMasterRoll; "For Master Roll"."School Fees Co-op Loan")
            {
            }
            column(EmergencyCoopLoan_ForMasterRoll; "For Master Roll"."Emergency Co-op Loan")
            {
            }
            column(InstantLoan_ForMasterRoll; "For Master Roll"."Instant Loan")
            {
            }
            column(reportmonth2; reportmonth2)
            {
            }
            column(reportyear; reportyear)
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

                normalc += "For Master Roll"."Normal Co-op Loan";
                subs += "For Master Roll"."Subsidiary Loan";
                sch += "For Master Roll"."School Fees Co-op Loan";
                emer += "For Master Roll"."Emergency Co-op Loan";
                insta += "For Master Roll"."Instant Loan";
                /*
                IF "For Master Roll"."Normal Co-op Loan"=0 THEN BEGIN a:=TRUE; END;
                IF "For Master Roll"."Emergency Co-op Loan"=0 THEN BEGIN b:=TRUE;  END;
                IF "For Master Roll"."School Fees Co-op Loan"<>0 THEN BEGIN c:=TRUE; END;
                IF "For Master Roll"."Subsidiary Loan"=0 THEN BEGIN d:=TRUE;   END;
                IF "For Master Roll"."Instant Loan"<>0 THEN BEGIN e:=TRUE;   END;
                
                IF (c=FALSE)  THEN
                CurrReport.SKIP
                 */

                if ((normalc = 0) and (subs = 0) and (sch = 0) and (emer = 0) and (insta = 0)) then
                    CurrReport.Skip;

            end;

            trigger OnPreDataItem()
            begin

                filterr := "For Master Roll".GetFilters;
                monthh := CopyStr(filterr, StrPos(filterr, ':') + 1);
                //message('%1',monthh);

                Evaluate(reportdate, monthh);
                //Message('%1',reportdate);

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
                //..........................................
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
        normalc: Decimal;
        subs: Decimal;
        sch: Decimal;
        emer: Decimal;
        insta: Decimal;
        a: Boolean;
        b: Boolean;
        c: Boolean;
        d: Boolean;
        e: Boolean;
        filterr: Text[100];
        monthh: Text[100];
        reportdate: Date;
        reportmonth: Integer;
        reportmonth2: Text[100];
        reportyear: Integer;
}
