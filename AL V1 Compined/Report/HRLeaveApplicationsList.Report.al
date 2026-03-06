#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69117 "HR Leave Applications List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave Applications List.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("HR Leave Application"; "HR Leave Application")
        {
            RequestFilterFields = "Application Code", "Application Date", Status;
            column(ReportForNavId_3725; 3725)
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
            column(HR_Leave_Application__Application_Code_; "HR Leave Application"."Application Code")
            {
            }
            column(HR_Leave_Application__Application_Date_; "HR Leave Application"."Application Date")
            {
            }
            column(HR_Leave_Application__Employee_No_; "HR Leave Application"."Employee No")
            {
            }
            column(EmployeeName_HRLeaveApplication; "HR Leave Application"."Employee Name")
            {
            }
            column(HR_Leave_Application__Job_Tittle_; "HR Leave Application"."Job Tittle")
            {
            }
            column(HR_Leave_Application_Supervisor; "HR Leave Application".Tests)
            {
            }
            column(HR_Leave_Application__Leave_Type_; "HR Leave Application"."Leave Type")
            {
            }
            column(HR_Leave_Application__Days_Applied_; "HR Leave Application"."Days Applied")
            {
            }
            column(HR_Leave_Application__Start_Date_; "HR Leave Application"."Start Date")
            {
            }
            column(HR_Leave_Application__Return_Date_; "HR Leave Application"."Return Date")
            {
            }
            column(HR_Leave_Application_Reliever; "HR Leave Application".Reliever)
            {
            }
            column(HR_Leave_Application__Reliever_Name_; "HR Leave Application"."Reliever Name")
            {
            }
            column(Status_HRLeaveApplication; "HR Leave Application".Status)
            {
            }
            column(HR_Leave_ApplicationCaption; HR_Leave_ApplicationCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(HR_Leave_Application__Application_Code_Caption; "HR Leave Application".FieldCaption("HR Leave Application"."Application Code"))
            {
            }
            column(HR_Leave_Application__Application_Date_Caption; "HR Leave Application".FieldCaption("HR Leave Application"."Application Date"))
            {
            }
            column(HR_Leave_Application__Employee_No_Caption; "HR Leave Application".FieldCaption("HR Leave Application"."Employee No"))
            {
            }
            column(HR_Leave_Application__Job_Tittle_Caption; "HR Leave Application".FieldCaption("HR Leave Application"."Job Tittle"))
            {
            }
            column(HR_Leave_Application_SupervisorCaption; "HR Leave Application".FieldCaption("HR Leave Application".Tests))
            {
            }
            column(HR_Leave_Application__Leave_Type_Caption; "HR Leave Application".FieldCaption("HR Leave Application"."Leave Type"))
            {
            }
            column(HR_Leave_Application__Days_Applied_Caption; "HR Leave Application".FieldCaption("HR Leave Application"."Days Applied"))
            {
            }
            column(HR_Leave_Application__Start_Date_Caption; "HR Leave Application".FieldCaption("HR Leave Application"."Start Date"))
            {
            }
            column(HR_Leave_Application__Return_Date_Caption; "HR Leave Application".FieldCaption("HR Leave Application"."Return Date"))
            {
            }
            column(HR_Leave_Application_RelieverCaption; "HR Leave Application".FieldCaption("HR Leave Application".Reliever))
            {
            }
            column(HR_Leave_Application__Reliever_Name_Caption; "HR Leave Application".FieldCaption("HR Leave Application"."Reliever Name"))
            {
            }
            column(Picture; CI.Picture)
            {
            }
            column(Department; Dept)
            {
            }

            trigger OnAfterGetRecord()
            begin
                EMp.Reset;
                EMp.SetRange(EMp."No.", "HR Leave Application"."Employee No");
                if EMp.Find('-') then begin
                    Dept := EMp."Department Name"
                end
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
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        HR_Leave_ApplicationCaptionLbl: label 'HR Leave Application';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        CI: Record "Company Information";
        Dept: Text;
        EMp: Record Employee;
}
