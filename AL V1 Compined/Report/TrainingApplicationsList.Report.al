#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69121 "Training Applications List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Training Applications List.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Training Applications"; "Training Requests")
        {
            RequestFilterFields = "Code";
            column(ReportForNavId_6373; 6373)
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
            column(HR_Training_Applications__Application_No_; "HR Training Applications".Code)
            {
            }
            column(HR_Training_Applications__Application_Date_; "HR Training Applications"."Application Date")
            {
            }
            column(HR_Training_Applications__Employee_No__; "HR Training Applications"."Employee No.")
            {
            }
            column(HR_Training_Applications__Employee_Name_; "HR Training Applications"."Employee Name")
            {
            }
            column(HR_Training_Applications__Employee_Department_; "HR Training Applications"."Employee Department")
            {
            }
            column(Activity; "HR Training Applications"."Global Dimension 1 Code")
            {
            }
            column(Branch; "HR Training Applications"."Global Dimension 2 Code")
            {
            }
            column(ResponsibilityCenter; "HR Training Applications"."Responsibility Center")
            {
            }
            column(HR_Training_Applications__Course_Title_; "HR Training Applications"."Course Title")
            {
            }
            column(HR_Training_Applications__Purpose_of_Training_; "HR Training Applications"."Purpose of Training")
            {
            }
            column(Cost; "HR Training Applications".Cost)
            {
            }
            column(HR_Training_ApplicationsCaption; HR_Training_ApplicationsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl)
            {
            }
            column(Training_Applications_ListCaption; Training_Applications_ListCaptionLbl)
            {
            }
            column(HR_Training_Applications__Application_No_Caption; "HR Training Applications".FieldCaption("HR Training Applications".Code))
            {
            }
            column(HR_Training_Applications__Application_Date_Caption; "HR Training Applications".FieldCaption("HR Training Applications"."Application Date"))
            {
            }
            column(HR_Training_Applications__Employee_No__Caption; "HR Training Applications".FieldCaption("HR Training Applications"."Employee No."))
            {
            }
            column(HR_Training_Applications__Employee_Name_Caption; "HR Training Applications".FieldCaption("HR Training Applications"."Employee Name"))
            {
            }
            column(HR_Training_Applications__Employee_Department_Caption; "HR Training Applications".FieldCaption("HR Training Applications"."Employee Department"))
            {
            }
            column(HR_Training_Applications__Course_Title_Caption; "HR Training Applications".FieldCaption("HR Training Applications"."Course Title"))
            {
            }
            column(HR_Training_Applications__Purpose_of_Training_Caption; "HR Training Applications".FieldCaption("HR Training Applications"."Purpose of Training"))
            {
            }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
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
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HR_Training_ApplicationsCaptionLbl: label 'HR Training Applications';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        P_O__BoxCaptionLbl: label 'P.O. Box';
        Training_Applications_ListCaptionLbl: label 'Training Applications List';
}
