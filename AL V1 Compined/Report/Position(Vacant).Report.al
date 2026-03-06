#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69128 "Position (Vacant)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Position (Vacant).rdlc';
    Caption = 'HR Jobs (Vacant)';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Company Jobs"; "Company Jobs")
        {
            DataItemTableView = order(ascending) where("Vacant Positions" = filter(> 0));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Job ID";
            column(ReportForNavId_9002; 9002)
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
            column(HR_Jobs_UserID; "Company Jobs".UserID)
            {
            }
            column(CI_Picture; CI.Picture)
            {
            }
            column(CI_City; CI.City)
            {
            }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2")
            {
            }
            column(CI_Address; CI.Address)
            {
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
            }
            column(HR_Jobs__Job_ID_; "Company Jobs"."Job ID")
            {
            }
            column(HR_Jobs__Job_Description_; "Company Jobs"."Job Description")
            {
            }
            column(HR_Jobs__No_of_Posts_; "Company Jobs"."No of Posts")
            {
            }
            column(HR_Jobs__Position_Reporting_to_; "Company Jobs"."Position Reporting to")
            {
            }
            column(HR_Jobs__Occupied_Positions_; "Company Jobs"."Occupied Positions")
            {
            }
            column(HR_Jobs__Vacant_Positions_; "Company Jobs"."Vacant Positions")
            {
            }
            column(HR_JobsCaption; HR_JobsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Jobs_with_Vacant_PositionsCaption; Jobs_with_Vacant_PositionsCaptionLbl)
            {
            }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl)
            {
            }
            column(HR_Jobs__Job_ID_Caption; "Company Jobs".FieldCaption("Company Jobs"."Job ID"))
            {
            }
            column(HR_Jobs__Job_Description_Caption; "Company Jobs".FieldCaption("Company Jobs"."Job Description"))
            {
            }
            column(HR_Jobs__No_of_Posts_Caption; "Company Jobs".FieldCaption("Company Jobs"."No of Posts"))
            {
            }
            column(HR_Jobs__Position_Reporting_to_Caption; "Company Jobs".FieldCaption("Company Jobs"."Position Reporting to"))
            {
            }
            column(HR_Jobs__Occupied_Positions_Caption; "Company Jobs".FieldCaption("Company Jobs"."Occupied Positions"))
            {
            }
            column(HR_Jobs__Vacant_Positions_Caption; "Company Jobs".FieldCaption("Company Jobs"."Vacant Positions"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Company Jobs".Validate("Company Jobs"."Vacant Positions");
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
        //ERROR('');

        CI.Reset;
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HR_JobsCaptionLbl: label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Jobs_with_Vacant_PositionsCaptionLbl: label 'Jobs with Vacant Positions';
        P_O__BoxCaptionLbl: label 'P.O. Box';
        Userid: label 'USERID';
        HRJobs: Record "Company Jobs";
        JobIDDesc: Text;
}
