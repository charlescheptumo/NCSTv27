#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69118 "HR Leave Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave Statement.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_6075; 6075)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(CI_Picture; CI.Picture)
            {
            }
            column(CI_City; CI.City)
            {
            }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code")
            {
            }
            column(CI_Address; CI.Address)
            {
            }
            column(HR_Employees__No__; Employee."No.")
            {
            }
            column(HR_Employees__FullName; Employee."First Name" + ' ' + Employee."Middle Name")
            {
            }
            column(HR_Employees__HR_Employees___Leave_Balance_; Employee."Leave Balance")
            {
            }
            column(EmployeeCaption; EmployeeCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee_Leave_StatementCaption; Employee_Leave_StatementCaptionLbl)
            {
            }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl)
            {
            }
            column(HR_Employees__No__Caption; Employee.FieldCaption(Employee."No."))
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Leave_BalanceCaption; Leave_BalanceCaptionLbl)
            {
            }
            column(Day_s_Caption; Day_s_CaptionLbl)
            {
            }
            column(No; No)
            {
            }
            dataitem("HR Leave Ledger Entries"; "HR Leave Ledger Entries")
            {
                DataItemLink = "Staff No." = field("No.");
                DataItemTableView = sorting("Entry No.");
                column(ReportForNavId_4961; 4961)
                {
                }
                column(HR_Leave_Ledger_Entries__Leave_Period_; "HR Leave Ledger Entries"."Leave Period")
                {
                }
                column(HR_Leave_Ledger_Entries__Leave_Entry_Type_; "HR Leave Ledger Entries"."Leave Entry Type")
                {
                }
                column(HR_Leave_Ledger_Entries__Leave_Type_; "HR Leave Ledger Entries"."Leave Type")
                {
                }
                column(HR_Leave_Ledger_Entries__No__of_days_; "HR Leave Ledger Entries"."No. of days")
                {
                }
                column(HR_Leave_Ledger_Entries__Leave_Posting_Description_; "HR Leave Ledger Entries"."Leave Posting Description")
                {
                }
                column(HR_Leave_Ledger_Entries__Posting_Date_; "HR Leave Ledger Entries"."Posting Date")
                {
                }
                column(HR_Leave_Ledger_Entries__Leave_Entry_Type_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."Leave Entry Type"))
                {
                }
                column(HR_Leave_Ledger_Entries__Leave_Type_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."Leave Type"))
                {
                }
                column(HR_Leave_Ledger_Entries__No__of_days_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."No. of days"))
                {
                }
                column(HR_Leave_Ledger_Entries__Leave_Posting_Description_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."Leave Posting Description"))
                {
                }
                column(HR_Leave_Ledger_Entries__Posting_Date_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."Posting Date"))
                {
                }
                column(HR_Leave_Ledger_Entries__Leave_Period_Caption; "HR Leave Ledger Entries".FieldCaption("HR Leave Ledger Entries"."Leave Period"))
                {
                }
                column(HR_Leave_Ledger_Entries_Entry_No_; "HR Leave Ledger Entries"."Entry No.")
                {
                }
                column(HR_Leave_Ledger_Entries_Staff_No_; "HR Leave Ledger Entries"."Staff No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    No := No + 1;
                end;

                trigger OnPreDataItem()
                begin
                    //"HR Leave Ledger Entries".SETFILTER("HR Leave Ledger Entries"."Leave Type",
                    //"HR-Employee".GETFILTER("HR-Employee"."Leave Type Filter"));
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //"HR Employees".VALIDATE("HR Employees"."Allocated Leave Days");
                //LeaveBalance:="HR Employees"."Leave Balance";
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
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        LeaveBalance: Decimal;
        EmployeeCaptionLbl: label 'Employee';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Employee_Leave_StatementCaptionLbl: label 'Employee Leave Statement';
        P_O__BoxCaptionLbl: label 'P.O. Box';
        NameCaptionLbl: label 'Name';
        Leave_BalanceCaptionLbl: label 'Leave Balance';
        Day_s_CaptionLbl: label 'Day(s)';
        No: Decimal;
}
