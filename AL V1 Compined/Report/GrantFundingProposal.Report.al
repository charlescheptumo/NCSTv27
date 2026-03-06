#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65021 "Grant Funding Proposal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Grant Funding Proposal.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Grant Funding Application"; "Grant Funding Application")
        {
            RequestFilterFields = "Application No";
            column(ReportForNavId_106; 106)
            {
            }
            column(ApplicationNo_GrantFundingApplication; "Grant Funding Application"."Application No")
            {
            }
            column(DocumentDate_GrantFundingApplication; "Grant Funding Application"."Document Date")
            {
            }
            column(FOAID_GrantFundingApplication; "Grant Funding Application"."FOA ID")
            {
            }
            column(ExternalDocumentNo_GrantFundingApplication; "Grant Funding Application"."External Document No")
            {
            }
            column(Description_GrantFundingApplication; "Grant Funding Application".Description)
            {
            }
            column(OpportunityTitle_GrantFundingApplication; "Grant Funding Application"."Opportunity  Title")
            {
            }
            column(CallType_GrantFundingApplication; "Grant Funding Application"."Call Type")
            {
            }
            column(GrantType_GrantFundingApplication; "Grant Funding Application"."Grant Type")
            {
            }
            column(JustificationforApplication_GrantFundingApplication; "Grant Funding Application"."Justification for Application")
            {
            }
            column(ResearchCenter_GrantFundingApplication; "Grant Funding Application"."Research Center")
            {
            }
            column(PrimaryResearchProgramID_GrantFundingApplication; "Grant Funding Application"."Primary Research Program ID")
            {
            }
            column(PrimaryResearchArea_GrantFundingApplication; "Grant Funding Application"."Primary Research Area")
            {
            }
            column(NoSeries_GrantFundingApplication; "Grant Funding Application"."No. Series")
            {
            }
            column(PrincipalInvestigator_GrantFundingApplication; "Grant Funding Application"."Principal Investigator")
            {
            }
            column(CurrencyCode_GrantFundingApplication; "Grant Funding Application"."Currency Code")
            {
            }
            column(RequestedGrantAmount_GrantFundingApplication; "Grant Funding Application"."Requested Grant Amount")
            {
            }
            column(RequestedGrantAmountLCY_GrantFundingApplication; "Grant Funding Application"."Requested Grant Amount(LCY)")
            {
            }
            column(AwardedGrantAmount_GrantFundingApplication; "Grant Funding Application"."Awarded Grant Amount")
            {
            }
            column(AwardedGrantAmountLCY_GrantFundingApplication; "Grant Funding Application"."Awarded Grant Amount (LCY)")
            {
            }
            column(ApplicationStatus_GrantFundingApplication; "Grant Funding Application"."Application Status")
            {
            }
            column(ApprovalStatus_GrantFundingApplication; "Grant Funding Application"."Approval Status")
            {
            }
            column(GrantAdminTeamCode_GrantFundingApplication; "Grant Funding Application"."Grant Admin Team Code")
            {
            }
            column(CreatedBy_GrantFundingApplication; "Grant Funding Application"."Created By")
            {
            }
            column(CreatedOn_GrantFundingApplication; "Grant Funding Application"."Created On")
            {
            }
            column(ClosedDate_GrantFundingApplication; "Grant Funding Application"."Closed Date")
            {
            }
            column(GrantorNo_GrantFundingApplication; "Grant Funding Application"."Grantor No.")
            {
            }
            column(GrantorName_GrantFundingApplication; "Grant Funding Application"."Grantor Name")
            {
            }
            column(Address_GrantFundingApplication; "Grant Funding Application".Address)
            {
            }
            column(Address2_GrantFundingApplication; "Grant Funding Application".Address2)
            {
            }
            column(PostCode_GrantFundingApplication; "Grant Funding Application"."Post Code")
            {
            }
            column(City_GrantFundingApplication; "Grant Funding Application".City)
            {
            }
            column(PhoneNo_GrantFundingApplication; "Grant Funding Application"."Phone No")
            {
            }
            column(MobilePhoneNo_GrantFundingApplication; "Grant Funding Application"."Mobile Phone No")
            {
            }
            column(GrantorResearchContactID_GrantFundingApplication; "Grant Funding Application"."Grantor Research Contact ID")
            {
            }
            column(GrantorResearchReviewer_GrantFundingApplication; "Grant Funding Application"."Grantor Research Reviewer")
            {
            }
            column(GrantorAdminContactID_GrantFundingApplication; "Grant Funding Application"."Grantor Admin Contact ID")
            {
            }
            column(GrantorAdminName_GrantFundingApplication; "Grant Funding Application"."Grantor Admin Name")
            {
            }
            column(GrantorFinanceContactID_GrantFundingApplication; "Grant Funding Application"."Grantor Finance Contact ID")
            {
            }
            column(GrantorFinanceContact_GrantFundingApplication; "Grant Funding Application"."Grantor Finance Contact")
            {
            }
            column(ApplicationDueDate_GrantFundingApplication; "Grant Funding Application"."Application Due Date")
            {
            }
            column(ApplicationSubmittedDate_GrantFundingApplication; "Grant Funding Application"."Application Submitted Date")
            {
            }
            column(EstimatedAwardDate_GrantFundingApplication; "Grant Funding Application"."Estimated Award Date")
            {
            }
            column(CurrencyFactor_GrantFundingApplication; "Grant Funding Application"."Currency Factor")
            {
            }
            column(PostingDate_GrantFundingApplication; "Grant Funding Application"."Posting Date")
            {
            }
            column(GrantClass_GrantFundingApplication; "Grant Funding Application"."Grant Class")
            {
            }
            column(Closed_GrantFundingApplication; "Grant Funding Application".Closed)
            {
            }
            column(DateClosed_GrantFundingApplication; "Grant Funding Application"."Date Closed")
            {
            }
            dataitem("Grant Research Objectives"; "Grant Research Objectives")
            {
                DataItemLink = "Grant Application ID" = field("Application No");
                DataItemTableView = sorting("Grant Application ID");
                column(ReportForNavId_49; 49)
                {
                }
                column(EntryNo_GrantResearchObjectives; "Grant Research Objectives"."Entry No")
                {
                }
                column(GrantApplicationID_GrantResearchObjectives; "Grant Research Objectives"."Grant Application ID")
                {
                }
                column(ResearchObjective_GrantResearchObjectives; "Grant Research Objectives"."Research Objective")
                {
                }
                column(ResearchProgram_GrantResearchObjectives; "Grant Research Objectives"."Research Program")
                {
                }
                column(ProjectArea_GrantResearchObjectives; "Grant Research Objectives"."Project Area")
                {
                }
            }
            dataitem("Grant Budget Summary"; "Grant Budget Summary")
            {
                DataItemLink = "Grant Application ID" = field("Application No");
                column(ReportForNavId_55; 55)
                {
                }
                column(EntryNo_GrantBudgetSummary; "Grant Budget Summary"."Entry No")
                {
                }
                column(GrantApplicationID_GrantBudgetSummary; "Grant Budget Summary"."Grant Application ID")
                {
                }
                column(Code_GrantBudgetSummary; "Grant Budget Summary".Code)
                {
                }
                column(BudgetCurrency_GrantBudgetSummary; "Grant Budget Summary"."Budget Currency")
                {
                }
                column(BudgetAmount_GrantBudgetSummary; "Grant Budget Summary"."Budget Amount")
                {
                }
                column(BudgetAmountLCY_GrantBudgetSummary; "Grant Budget Summary"."Budget Amount(LCY)")
                {
                }
            }
            dataitem("Secondary Research Program"; "Secondary Research Program")
            {
                DataItemLink = "GFA No" = field("Application No");
                column(ReportForNavId_62; 62)
                {
                }
                column(GFANo_SecondaryResearchProgram; "Secondary Research Program"."GFA No")
                {
                }
                column(ResearchCenter_SecondaryResearchProgram; "Secondary Research Program"."Research Center")
                {
                }
                column(ResearchProgram_SecondaryResearchProgram; "Secondary Research Program"."Research Program")
                {
                }
            }
            dataitem("Grant Admin Tasks"; "Grant Admin Tasks")
            {
                DataItemLink = "Sourec Document No." = field("Application No");
                column(ReportForNavId_66; 66)
                {
                }
                column(No_GrantAdminTasks; "Grant Admin Tasks"."No.")
                {
                }
                column(SourceDocumentType_GrantAdminTasks; "Grant Admin Tasks"."Source Document Type")
                {
                }
                column(SourecDocumentNo_GrantAdminTasks; "Grant Admin Tasks"."Sourec Document No.")
                {
                }
                column(GrantAdminTeamCode_GrantAdminTasks; "Grant Admin Tasks"."Grant Admin Team Code")
                {
                }
                column(TeamName_GrantAdminTasks; "Grant Admin Tasks"."Team Name")
                {
                }
                column(ResearcherNo_GrantAdminTasks; "Grant Admin Tasks"."Researcher No")
                {
                }
                column(ResearcherName_GrantAdminTasks; "Grant Admin Tasks"."Researcher Name")
                {
                }
                column(ResearchCenter_GrantAdminTasks; "Grant Admin Tasks"."Research Center")
                {
                }
                column(ContactNo_GrantAdminTasks; "Grant Admin Tasks"."Contact No.")
                {
                }
                column(TaskType_GrantAdminTasks; "Grant Admin Tasks"."Task Type")
                {
                }
                column(Date_GrantAdminTasks; "Grant Admin Tasks".Date)
                {
                }
                column(Status_GrantAdminTasks; "Grant Admin Tasks".Status)
                {
                }
                column(Priority_GrantAdminTasks; "Grant Admin Tasks".Priority)
                {
                }
                column(ResearchProgram_GrantAdminTasks; "Grant Admin Tasks"."Research Program")
                {
                }
                column(ContactName_GrantAdminTasks; "Grant Admin Tasks"."Contact Name")
                {
                }
                column(Description_GrantAdminTasks; "Grant Admin Tasks".Description)
                {
                }
                column(Closed_GrantAdminTasks; "Grant Admin Tasks".Closed)
                {
                }
                column(DateClosed_GrantAdminTasks; "Grant Admin Tasks"."Date Closed")
                {
                }
                column(NoSeries_GrantAdminTasks; "Grant Admin Tasks"."No. Series")
                {
                }
                column(Comment_GrantAdminTasks; "Grant Admin Tasks".Comment)
                {
                }
                column(ResearchCenterDescription_GrantAdminTasks; "Grant Admin Tasks"."Research Center Description")
                {
                }
                column(ProgramDescription_GrantAdminTasks; "Grant Admin Tasks"."Program Description")
                {
                }
                column(ContactCompanyNo_GrantAdminTasks; "Grant Admin Tasks"."Contact Company No")
                {
                }
                column(ContactCompanyName_GrantAdminTasks; "Grant Admin Tasks"."Contact Company Name")
                {
                }
                column(Recurring_GrantAdminTasks; "Grant Admin Tasks".Recurring)
                {
                }
                column(RecurringDateInterval_GrantAdminTasks; "Grant Admin Tasks"."Recurring Date Interval")
                {
                }
                column(CalcDueDateFrom_GrantAdminTasks; "Grant Admin Tasks"."Calc. Due Date From")
                {
                }
                column(ApplicationTitle_GrantAdminTasks; "Grant Admin Tasks"."Application Title")
                {
                }
                column(StartTime_GrantAdminTasks; "Grant Admin Tasks"."Start Time")
                {
                }
                column(Duration_GrantAdminTasks; "Grant Admin Tasks".Duration)
                {
                }
                column(LastDateModified_GrantAdminTasks; "Grant Admin Tasks"."Last Date Modified")
                {
                }
                column(LastTimeModified_GrantAdminTasks; "Grant Admin Tasks"."Last Time Modified")
                {
                }
                column(AllDayEvent_GrantAdminTasks; "Grant Admin Tasks"."All Day Event")
                {
                }
                column(Location_GrantAdminTasks; "Grant Admin Tasks".Location)
                {
                }
                column(UnitCostLCY_GrantAdminTasks; "Grant Admin Tasks"."Unit Cost (LCY)")
                {
                }
                column(CompletedBy_GrantAdminTasks; "Grant Admin Tasks"."Completed By")
                {
                }
                column(EndingDate_GrantAdminTasks; "Grant Admin Tasks"."Ending Date")
                {
                }
                column(ReminderDueDateFormular_GrantAdminTasks; "Grant Admin Tasks"."Reminder Due Date Formular")
                {
                }
                column(ReminderDueDate_GrantAdminTasks; "Grant Admin Tasks"."Reminder Due Date")
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
}
