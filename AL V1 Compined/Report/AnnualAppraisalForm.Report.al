#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56205 "Annual Appraisal Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Annual Appraisal Form.rdlc';

    dataset
    {
        dataitem("Annual Appraisal"; "Annual Appraisal")
        {
            RequestFilterFields = No;
            column(ReportForNavId_1; 1)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(No_AnnualAppraisal; "Annual Appraisal".No)
            {
            }
            column(Datecreated_AnnualAppraisal; "Annual Appraisal"."Date created")
            {
            }
            column(TimeCreated_AnnualAppraisal; "Annual Appraisal"."Time Created")
            {
            }
            column(CreatedBy_AnnualAppraisal; "Annual Appraisal"."Created By")
            {
            }
            column(EmployeeNo_AnnualAppraisal; "Annual Appraisal"."Employee No")
            {
            }
            column(EmployeeName_AnnualAppraisal; "Annual Appraisal"."Employee Name")
            {
            }
            column(GlobalDimension1Code_AnnualAppraisal; "Annual Appraisal"."Department Name")
            {
            }
            column(GlobalDimension2Code_AnnualAppraisal; "Annual Appraisal"."Depot Name")
            {
            }
            column(Quarter_AnnualAppraisal; "Annual Appraisal".Quarter)
            {
            }
            column(FinancialYear_AnnualAppraisal; "Annual Appraisal"."Appraisal Period")
            {
            }
            column(OverallQuartelyscore_AnnualAppraisal; "Annual Appraisal"."Overall Quartely score")
            {
            }
            column(AdditionalAssignment_AnnualAppraisal; "Annual Appraisal"."Additional Assignment")
            {
            }
            column(Remarks_AnnualAppraisal; "Annual Appraisal".Remarks)
            {
            }
            column(SupervisorCode_AnnualAppraisal; "Annual Appraisal"."Supervisor Code")
            {
            }
            column(SupervisorName_AnnualAppraisal; "Annual Appraisal"."Supervisor Name")
            {
            }
            column(SupervisorDesignation_AnnualAppraisal; "Annual Appraisal"."Supervisor Designation")
            {
            }
            column(Status_AnnualAppraisal; "Annual Appraisal".Status)
            {
            }
            column(NoSeries_AnnualAppraisal; "Annual Appraisal"."No. Series")
            {
            }
            column(CurrentDesignation_AnnualAppraisal; "Annual Appraisal"."Current Designation")
            {
            }
            column(Termsofservice_AnnualAppraisal; "Annual Appraisal"."Terms of service")
            {
            }
            column(ActingAppointment_AnnualAppraisal; "Annual Appraisal"."Acting Appointment")
            {
            }
            column(Appraiseecomments_AnnualAppraisal; "Annual Appraisal"."Appraisee comments")
            {
            }
            column(SupervisorComments_AnnualAppraisal; "Annual Appraisal"."Supervisor Comments")
            {
            }
            column(RewardTypeRecommended_AnnualAppraisal; "Annual Appraisal"."Reward Type Recommended")
            {
            }
            column(OtherInterventions_AnnualAppraisal; "Annual Appraisal"."Other Interventions")
            {
            }
            column(Lengthofservice; "Annual Appraisal"."Length of service")
            {
            }
            column(Durationinpresentposition; "Annual Appraisal"."Duration in present position")
            {
            }
            column(FromDate; "Annual Appraisal"."From Date")
            {
            }
            column(ToDate; "Annual Appraisal"."To Date")
            {
            }
            column(Mission; "Annual Appraisal".Mission)
            {
            }
            column(Vision; "Annual Appraisal".Vision)
            {
            }
            column(Discussion; "Annual Appraisal"."Discussion take place")
            {
            }
            column(CoreValues; "Annual Appraisal"."Core Values")
            {
            }
            column(Discussionhelpyou_AnnualAppraisal; "Annual Appraisal"."Discussion help you")
            {
            }
            column(Otherrecommendation_AnnualAppraisal; "Annual Appraisal"."Other recommendation")
            {
            }
            column(Recommendation_AnnualAppraisal; "Annual Appraisal".Recommendation)
            {
            }
            column(Meetingheldon_AnnualAppraisal; "Annual Appraisal"."Meeting held on")
            {
            }
            column(MinutesNo_AnnualAppraisal; "Annual Appraisal"."Minutes No.")
            {
            }
            dataitem("Annual  Appraisal Lines"; "Annual  Appraisal Lines")
            {
                DataItemLink = "Appraisal No" = field(No);
                column(ReportForNavId_27; 27)
                {
                }
                column(AppraisalNo_AnnualAppraisalLines; "Annual  Appraisal Lines"."Appraisal No")
                {
                }
                column(LineNo_AnnualAppraisalLines; "Annual  Appraisal Lines"."Line No.")
                {
                }
                column(AgreedPerformanceTargets_AnnualAppraisalLines; "Annual  Appraisal Lines"."Performance Objectives")
                {
                }
                column(AcheivedTargetsofAnnual_AnnualAppraisalLines; "Annual  Appraisal Lines"."Achieved targets of annual")
                {
                }
                column(PerformanceIndicator_AnnualAppraisalLines; "Annual  Appraisal Lines"."Performance Indicator")
                {
                }
                column(PercentageCumulativeAchievem_AnnualAppraisalLines; "Annual  Appraisal Lines"."Performance Target (%)")
                {
                }
                column(AppraisalScore_AnnualAppraisalLines; "Annual  Appraisal Lines"."Rating Supervisor (%)")
                {
                }
                column(ActualAchieved_AnnualAppraisalLines; "Annual  Appraisal Lines"."Actual Achieved")
                {
                }
                column(RatingSelf_AnnualAppraisalLines; "Annual  Appraisal Lines"."Rating Self (%)")
                {
                }
                column(ActualofEighty_AnnualAppraisalLines; "Annual  Appraisal Lines"."Actual of Eighty")
                {
                }
                column(MidYear_AnnualAppraisalLines; "Annual  Appraisal Lines"."Mid Year")
                {
                }
                column(ActualAchieved; "Annual  Appraisal Lines"."Actual Achieved (%)")
                {
                }
                column(Targetschangedoradded_AnnualAppraisalLines; "Annual  Appraisal Lines"."Targets changed or added")
                {
                }
            }
            dataitem("Staff Training Appraisal"; "Staff Training Appraisal")
            {
                DataItemLink = "Appraisal No" = field(No);
                column(ReportForNavId_35; 35)
                {
                }
                column(AppraisalNo_StaffTrainingAppraisal; "Staff Training Appraisal"."Appraisal No")
                {
                }
                column(LineNo_StaffTrainingAppraisal; "Staff Training Appraisal"."Line No.")
                {
                }
                column(TrainingDevelopmentNeed_StaffTrainingAppraisal; "Staff Training Appraisal"."Training & Development Need")
                {
                }
                column(Durationoftraining_StaffTrainingAppraisal; "Staff Training Appraisal"."Duration of training")
                {
                }
                column(CommentsbyAppraisee_StaffTrainingAppraisal; "Staff Training Appraisal"."Comments by Appraisee")
                {
                }
                column(Commentsbysupervisor_StaffTrainingAppraisal; "Staff Training Appraisal"."Comments by supervisor")
                {
                }
            }
            dataitem("Departmental ObjectisAppraisal"; "Departmental ObjectisAppraisal")
            {
                DataItemLink = "Appraisal No" = field(No);
                column(ReportForNavId_48; 48)
                {
                }
                column(AppraisalNo_DepartmentalObjectisAppraisal; "Departmental ObjectisAppraisal"."Appraisal No")
                {
                }
                column(LineNo_DepartmentalObjectisAppraisal; "Departmental ObjectisAppraisal"."Line No.")
                {
                }
                column(Objectives_DepartmentalObjectisAppraisal; "Departmental ObjectisAppraisal".Objectives)
                {
                }
                column(Description_DepartmentalObjectisAppraisal; "Departmental ObjectisAppraisal".Description)
                {
                }
                column(Rating_DepartmentalObjectisAppraisal; "Departmental ObjectisAppraisal".Rating)
                {
                }
                column(RatingPercentage; "Departmental ObjectisAppraisal"."Rating %")
                {
                }
                column(Rate_DepartmentalObjectisAppraisal; "Departmental ObjectisAppraisal".Rate)
                {
                }
            }
            dataitem("Values Appraisal"; "Values Appraisal")
            {
                DataItemLink = "Appraisal No" = field(No);
                column(ReportForNavId_54; 54)
                {
                }
                column(AppraisalNo_ValuesAppraisal; "Values Appraisal"."Appraisal No")
                {
                }
                column(LineNo_ValuesAppraisal; "Values Appraisal"."Line No.")
                {
                }
                column(Demonstratedapplication_ValuesAppraisal; "Values Appraisal"."Demonstrated application")
                {
                }
                column(Description_ValuesAppraisal; "Values Appraisal".Description)
                {
                }
                column(Code_ValuesAppraisal; "Values Appraisal".Code)
                {
                }
                column(CompetencySkills_ValuesAppraisal; "Values Appraisal"."Competency/Skills")
                {
                }
                column(SelfRating_ValuesAppraisal; "Values Appraisal"."Self Rating")
                {
                }
                column(SupervisorRating_ValuesAppraisal; "Values Appraisal"."Supervisor Rating")
                {
                }
            }
            dataitem("Appraisal Comments"; "Appraisal Comments")
            {
                DataItemLink = "Appraisal No" = field(No);
                column(ReportForNavId_61; 61)
                {
                }
                column(AppraisalNo_AppraisalComments; "Appraisal Comments"."Appraisal No")
                {
                }
                column(LineNo_AppraisalComments; "Appraisal Comments"."Line No.")
                {
                }
                column(Comment_AppraisalComments; "Appraisal Comments".Comment)
                {
                }
                column(CommentBy_AppraisalComments; "Appraisal Comments"."Comment By")
                {
                }
                column(Commmentdate_AppraisalComments; "Appraisal Comments"."Commment date")
                {
                }
                column(Commenttime_AppraisalComments; "Appraisal Comments"."Comment time")
                {
                }
                column(Type_AppraisalComments; "Appraisal Comments".Type)
                {
                }
                column(Basedon3ab_AppraisalComments; "Appraisal Comments"."Based on 3a & b")
                {
                }
                column(BasedonTargets_AppraisalComments; "Appraisal Comments"."Based on Targets")
                {
                }
                column(OverallPerformance_AppraisalComments; "Appraisal Comments"."Overall Performance")
                {
                }
                column(MidYear_AppraisalComments; "Appraisal Comments"."Mid Year")
                {
                }
            }
            dataitem("Values Managerial competencies"; "Values Managerial competencies")
            {
                DataItemLink = "Appraisal No" = field(No);
                column(ReportForNavId_86; 86)
                {
                }
                column(LineNo_ValuesManagerialcompetencies; "Values Managerial competencies"."Line No.")
                {
                }
                column(Appraisalpositivecomments_ValuesManagerialcompetencies; "Values Managerial competencies"."Appraisal positive comments")
                {
                }
                column(Rating_ValuesManagerialcompetencies; "Values Managerial competencies".Rating)
                {
                }
                column(Appraisalnegativecomments_ValuesManagerialcompetencies; "Values Managerial competencies"."Appraisal negative comments")
                {
                }
                column(Competency_ValuesManagerialcompetencies; "Values Managerial competencies".Competency)
                {
                }
                column(Code_ValuesManagerialcompetencies; "Values Managerial competencies".Code)
                {
                }
                column(AppraisalNo_ValuesManagerialcompetencies; "Values Managerial competencies"."Appraisal No")
                {
                }
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

    trigger OnInitReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}
