#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69130 "Training Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Training Plan.rdlc';

    dataset
    {
        dataitem("Training Needs"; "Training Needs")
        {
            DataItemTableView = where(Planned = filter(true));
            RequestFilterFields = "No.", "Date Created", "Type of Training", "Start Date", "End Date";
            column(ReportForNavId_1; 1)
            {
            }
            column(Name; CompanyInfo.Name)
            {
            }
            column(Logo; CompanyInfo.Picture)
            {
            }
            column(No_TrainingNeeds; "Training Needs"."No.")
            {
            }
            column(Description_TrainingNeeds; "Training Needs".Description)
            {
            }
            column(StartDate_TrainingNeeds; "Training Needs"."Start Date")
            {
            }
            column(EndDate_TrainingNeeds; "Training Needs"."End Date")
            {
            }
            column(DurationUnits_TrainingNeeds; "Training Needs"."Duration Units")
            {
            }
            column(Duration_TrainingNeeds; "Training Needs".Duration)
            {
            }
            column(CostOfTraining_TrainingNeeds; "Training Needs"."Cost Of Training")
            {
            }
            column(Location_TrainingNeeds; "Training Needs".Location)
            {
            }
            column(Qualification_TrainingNeeds; "Training Needs".Qualification)
            {
            }
            column(ReAssessmentDate_TrainingNeeds; "Training Needs"."Re-Assessment Date")
            {
            }
            column(Source_TrainingNeeds; "Training Needs".Source)
            {
            }
            column(NeedSource_TrainingNeeds; "Training Needs"."Need Source")
            {
            }
            column(Provider_TrainingNeeds; "Training Needs".Provider)
            {
            }
            column(Post_TrainingNeeds; "Training Needs".Post)
            {
            }
            column(Posted_TrainingNeeds; "Training Needs".Posted)
            {
            }
            column(GlobalDimension1Code_TrainingNeeds; "Training Needs"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_TrainingNeeds; "Training Needs"."Global Dimension 2 Code")
            {
            }
            column(Closed_TrainingNeeds; "Training Needs".Closed)
            {
            }
            column(QualificationCode_TrainingNeeds; "Training Needs"."Qualification Code")
            {
            }
            column(QualificationType_TrainingNeeds; "Training Needs"."Qualification Type")
            {
            }
            column(QualificationDescription_TrainingNeeds; "Training Needs"."Qualification Description")
            {
            }
            column(TrainingApplicants_TrainingNeeds; "Training Needs"."Training Applicants")
            {
            }
            column(TrainingApplicantsPassed_TrainingNeeds; "Training Needs"."Training Applicants (Passed)")
            {
            }
            column(TrainingApplicantsFailed_TrainingNeeds; "Training Needs"."Training Applicants (Failed)")
            {
            }
            column(ProviderName_TrainingNeeds; "Training Needs"."Provider Name")
            {
            }
            column(Jobid_TrainingNeeds; "Training Needs"."Job id")
            {
            }
            column(ResponsibilityCenter_TrainingNeeds; "Training Needs"."Responsibility Center")
            {
            }
            column(BudgetControlled_TrainingNeeds; "Training Needs"."Budget Controlled")
            {
            }
            column(GLAccount_TrainingNeeds; "Training Needs"."G/L Account")
            {
            }
            column(GLAccountName_TrainingNeeds; "Training Needs"."G/L Account Name")
            {
            }
            column(ExpenseCode_TrainingNeeds; "Training Needs"."Expense Code")
            {
            }
            column(BondageRequired_TrainingNeeds; "Training Needs"."Bondage Required")
            {
            }
            column(Status_TrainingNeeds; "Training Needs".Status)
            {
            }
            column(CurrencyCode_TrainingNeeds; "Training Needs"."Currency Code")
            {
            }
            column(EarlyBondedExit_TrainingNeeds; "Training Needs"."Early Bonded Exit?")
            {
            }
            column(BondageStartDate_TrainingNeeds; "Training Needs"."Bondage Start Date")
            {
            }
            column(BondageDuration_TrainingNeeds; "Training Needs"."Bondage Duration")
            {
            }
            column(BondageReleaseDate_TrainingNeeds; "Training Needs"."Bondage Release Date")
            {
            }
            column(InclusiveofNonWorkingDays_TrainingNeeds; "Training Needs"."Inclusive of Non Working Days")
            {
            }
            column(NoofTrainingCostItems_TrainingNeeds; "Training Needs"."No. of Training Cost Items")
            {
            }
            column(TotalCost_TrainingNeeds; "Training Needs"."Total Cost")
            {
            }
            column(DepartmentCode_TrainingNeeds; "Training Needs"."Department Code")
            {
            }
            column(NoSeries_TrainingNeeds; "Training Needs"."No. Series")
            {
            }
            column(Committee_TrainingNeeds; "Training Needs".Committee)
            {
            }
            column(CommitteeVerdict_TrainingNeeds; "Training Needs"."Committee Verdict")
            {
            }
            column(CommitteeName_TrainingNeeds; "Training Needs"."Committee Name")
            {
            }
            column(UpdatedBy_TrainingNeeds; "Training Needs"."Updated By")
            {
            }
            column(DateUpdated_TrainingNeeds; "Training Needs"."Date Updated")
            {
            }
            column(TimeUpdated_TrainingNeeds; "Training Needs"."Time Updated")
            {
            }
            column(CategoryCode_TrainingNeeds; "Training Needs"."Category Code")
            {
            }
            column(CategoryDescription_TrainingNeeds; "Training Needs"."Category Description")
            {
            }
            column(CadreCode_TrainingNeeds; "Training Needs"."Cadre Code")
            {
            }
            column(CadreDescription_TrainingNeeds; "Training Needs"."Cadre Description")
            {
            }
            column(NotobeTrained_TrainingNeeds; "Training Needs"."No to be Trained")
            {
            }
            column(PrioritizedTraining_TrainingNeeds; "Training Needs"."Prioritized Training")
            {
            }
            column(SkillforCurrentJob_TrainingNeeds; "Training Needs"."Skill for Current Job")
            {
            }
            column(SkillforCareerProgression_TrainingNeeds; "Training Needs"."Skill for Career Progression")
            {
            }
            column(TrainingDates_TrainingNeeds; "Training Needs"."Training Dates")
            {
            }
            column(TypeofTraining_TrainingNeeds; "Training Needs"."Type of Training")
            {
            }
            column(Planned_TrainingNeeds; "Training Needs".Planned)
            {
            }
            column(PlannedBy_TrainingNeeds; "Training Needs"."Planned By")
            {
            }
            column(DatePlanned_TrainingNeeds; "Training Needs"."Date Planned")
            {
            }
            column(TimePlanned_TrainingNeeds; "Training Needs"."Time Planned")
            {
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
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
        CompanyInfo: Record "Company Information";
}
