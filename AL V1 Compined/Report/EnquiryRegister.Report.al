#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69132 "Enquiry Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Enquiry Register.rdlc';
    UsageCategory = Tasks;
    ApplicationArea = All;

    dataset
    {
        dataitem("Cases Management"; "Cases Management")
        {
            DataItemTableView = where(Enquiry = filter(true));
            RequestFilterFields = Status;
            column(ReportForNavId_1; 1)
            {
            }
            column(Name; CompanyInfo.Name)
            {
            }
            column(Logo; CompanyInfo.Picture)
            {
            }
            column(EnquiryNumber_CasesManagement; "Cases Management"."Enquiry Number")
            {
            }
            column(DateofComplaint_CasesManagement; "Cases Management"."Date of Complaint")
            {
            }
            column(Typeofcases_CasesManagement; "Cases Management"."Type of cases")
            {
            }
            column(RecommendedAction_CasesManagement; "Cases Management"."Recommended Action")
            {
            }
            column(CaseDescription_CasesManagement; "Cases Management"."Case Description")
            {
            }
            column(Accuser_CasesManagement; "Cases Management".Accuser)
            {
            }
            column(Resource1_CasesManagement; "Cases Management"."Resource#1")
            {
            }
            column(Resource2_CasesManagement; "Cases Management"."Resource #2")
            {
            }
            column(ActionTaken_CasesManagement; "Cases Management"."Action Taken")
            {
            }
            column(DateToSettleCase_CasesManagement; "Cases Management"."Date To Settle Case")
            {
            }
            column(DocumentLink_CasesManagement; "Cases Management"."Document Link")
            {
            }
            column(SolutionRemarks_CasesManagement; "Cases Management"."Solution Remarks")
            {
            }
            column(Comments_CasesManagement; "Cases Management".Comments)
            {
            }
            column(CaseSolved_CasesManagement; "Cases Management"."Case Solved")
            {
            }
            column(BodyHandlingTheComplaint_CasesManagement; "Cases Management"."Body Handling The Complaint")
            {
            }
            column(Recomendations_CasesManagement; "Cases Management".Recomendations)
            {
            }
            column(Implications_CasesManagement; "Cases Management".Implications)
            {
            }
            column(SupportDocuments_CasesManagement; "Cases Management"."Support Documents")
            {
            }
            column(PolicyGuidlinesInEffect_CasesManagement; "Cases Management"."Policy Guidlines In Effect")
            {
            }
            column(Status_CasesManagement; "Cases Management".Status)
            {
            }
            column(ModeofLodgingtheComplaint_CasesManagement; "Cases Management"."Mode of Lodging the Complaint")
            {
            }
            column(NoSeries_CasesManagement; "Cases Management"."No. Series")
            {
            }
            column(ResourceAssigned_CasesManagement; "Cases Management"."Resource Assigned")
            {
            }
            column(Selected_CasesManagement; "Cases Management".Selected)
            {
            }
            column(ClosedBy_CasesManagement; "Cases Management"."Closed By")
            {
            }
            column(CallerRefferedTo_CasesManagement; "Cases Management"."Caller Reffered To")
            {
            }
            column(ReceivedFrom_CasesManagement; "Cases Management"."Received From")
            {
            }
            column(DateSent_CasesManagement; "Cases Management"."Date Sent")
            {
            }
            column(TimeSent_CasesManagement; "Cases Management"."Time Sent")
            {
            }
            column(SentBy_CasesManagement; "Cases Management"."Sent By")
            {
            }
            column(SLA_CasesManagement; "Cases Management".SLA)
            {
            }
            column(CaseReceivedDate_CasesManagement; "Cases Management"."Case Received  Date")
            {
            }
            column(ResponsibilityCenter_CasesManagement; "Cases Management"."Responsibility Center")
            {
            }
            column(FOSAAccount_CasesManagement; "Cases Management"."FOSA Account.")
            {
            }
            column(AccountName_CasesManagement; "Cases Management"."Account Name.")
            {
            }
            column(LoanNo_CasesManagement; "Cases Management"."Loan No")
            {
            }
            column(ReceiveUser_CasesManagement; "Cases Management"."Receive User")
            {
            }
            column(Receivedate_CasesManagement; "Cases Management"."Receive date")
            {
            }
            column(ReceiveTime_CasesManagement; "Cases Management"."Receive Time")
            {
            }
            column(ResolvedUser_CasesManagement; "Cases Management"."Resolved User")
            {
            }
            column(ResolvedDate_CasesManagement; "Cases Management"."Resolved Date")
            {
            }
            column(ResolvedTime_CasesManagement; "Cases Management"."Resolved Time")
            {
            }
            column(CompanyNo_CasesManagement; "Cases Management"."Company No")
            {
            }
            column(CompanyName_CasesManagement; "Cases Management"."Company Name")
            {
            }
            column(CompanyAddress_CasesManagement; "Cases Management"."Company Address")
            {
            }
            column(Companypostalcode_CasesManagement; "Cases Management"."Company postal code")
            {
            }
            column(CompanyTelephone_CasesManagement; "Cases Management"."Company Telephone")
            {
            }
            column(CompanyEmail_CasesManagement; "Cases Management"."Company Email")
            {
            }
            column(Companywebsite_CasesManagement; "Cases Management"."Company website")
            {
            }
            column(EmploymentInfo_CasesManagement; "Cases Management"."Employment Info")
            {
            }
            column(OthersDetails_CasesManagement; "Cases Management"."Others Details")
            {
            }
            column(EmploymentTerms_CasesManagement; "Cases Management"."Employment Terms")
            {
            }
            column(EmployerType_CasesManagement; "Cases Management"."Employer Type")
            {
            }
            column(EmployerAddress_CasesManagement; "Cases Management"."Employer Address")
            {
            }
            column(DateofEmployment_CasesManagement; "Cases Management"."Date of Employment")
            {
            }
            column(PositionHeld_CasesManagement; "Cases Management"."Position Held")
            {
            }
            column(ExpectedMonthlyIncome_CasesManagement; "Cases Management"."Expected Monthly Income")
            {
            }
            column(NatureOfBusiness_CasesManagement; "Cases Management"."Nature Of Business")
            {
            }
            column(Industry_CasesManagement; "Cases Management".Industry)
            {
            }
            column(BusinessName_CasesManagement; "Cases Management"."Business Name")
            {
            }
            column(PhysicalBusinessLocation_CasesManagement; "Cases Management"."Physical Business Location")
            {
            }
            column(YearofCommence_CasesManagement; "Cases Management"."Year of Commence")
            {
            }
            column(JobTaskNo_CasesManagement; "Cases Management"."Job Task No")
            {
            }
            column(EmployerName_CasesManagement; "Cases Management"."Employer Name")
            {
            }
            column(TermsofEmployment_CasesManagement; "Cases Management"."Terms of Employment")
            {
            }
            column(Occupation_CasesManagement; "Cases Management".Occupation)
            {
            }
            column(Department_CasesManagement; "Cases Management".Department)
            {
            }
            column(RefereeMemberNo_CasesManagement; "Cases Management"."Referee Member No")
            {
            }
            column(RefereeName_CasesManagement; "Cases Management"."Referee Name")
            {
            }
            column(RefereeIDNo_CasesManagement; "Cases Management"."Referee ID No")
            {
            }
            column(RefereeMobilePhoneNo_CasesManagement; "Cases Management"."Referee Mobile Phone No")
            {
            }
            column(LeadStatus_CasesManagement; "Cases Management"."Lead Status")
            {
            }
            column(CapturedBy_CasesManagement; "Cases Management"."Captured By")
            {
            }
            column(CapturedOn_CasesManagement; "Cases Management"."Captured On")
            {
            }
            column(LeadRegion_CasesManagement; "Cases Management"."Lead Region")
            {
            }
            column(PhysicalMeetingLocation_CasesManagement; "Cases Management"."Physical Meeting Location")
            {
            }
            column(DateofEscalation_CasesManagement; "Cases Management"."Date of Escalation")
            {
            }
            column(TimeofEscalation_CasesManagement; "Cases Management"."Time of Escalation")
            {
            }
            column(DateResolved_CasesManagement; "Cases Management"."Date Resolved")
            {
            }
            column(TimeResolved_CasesManagement; "Cases Management"."Time Resolved")
            {
            }
            column(MemberNo_CasesManagement; "Cases Management"."Member No")
            {
            }
            column(MemberName_CasesManagement; "Cases Management"."Member Name")
            {
            }
            column(PayrollNo_CasesManagement; "Cases Management"."Payroll No")
            {
            }
            column(LoanBalance_CasesManagement; "Cases Management"."Loan Balance")
            {
            }
            column(CurrentDeposits_CasesManagement; "Cases Management"."Current Deposits")
            {
            }
            column(HolidaySavings_CasesManagement; "Cases Management"."Holiday Savings")
            {
            }
            column(Description_CasesManagement; "Cases Management".Description)
            {
            }
            column(ShareCapital_CasesManagement; "Cases Management"."Share Capital")
            {
            }
            column(IDNo_CasesManagement; "Cases Management"."ID No")
            {
            }
            column(Gender_CasesManagement; "Cases Management".Gender)
            {
            }
            column(EscalatedUserEmail_CasesManagement; "Cases Management"."Escalated User Email")
            {
            }
            column(Priority_CasesManagement; "Cases Management".Priority)
            {
            }
            column(FollowupAction_CasesManagement; "Cases Management"."Follow up Action")
            {
            }
            column(ComplaintNo_CasesManagement; "Cases Management"."Complaint No")
            {
            }
            column(CustomerType_CasesManagement; "Cases Management"."Customer Type")
            {
            }
            column(CustomerGroupCode_CasesManagement; "Cases Management"."Customer Group Code")
            {
            }
            column(ReceivingOfficer_CasesManagement; "Cases Management"."Receiving Officer")
            {
            }
            column(ModeofLodgingComplaintsCod_CasesManagement; "Cases Management"."Mode of Lodging Complaints Cod")
            {
            }
            column(CustomerGroup_CasesManagement; "Cases Management"."Customer Group")
            {
            }
            column(ModeofLodgingComplaints_CasesManagement; "Cases Management"."Mode of Lodging Complaints")
            {
            }
            column(AssignedOfficerEmail_CasesManagement; "Cases Management"."Assigned Officer Email")
            {
            }
            column(AssignedOfficerName_CasesManagement; "Cases Management"."Assigned Officer Name")
            {
            }
            column(AssignedOfficer_CasesManagement; "Cases Management"."Assigned Officer")
            {
            }
            column(SubmittedBy_CasesManagement; "Cases Management"."Submitted By")
            {
            }
            column(DateSubmitted_CasesManagement; "Cases Management"."Date Submitted")
            {
            }
            column(TimeSubmitted_CasesManagement; "Cases Management"."Time Submitted")
            {
            }
            column(CreatedBy_CasesManagement; "Cases Management"."Created By")
            {
            }
            column(DateCreated_CasesManagement; "Cases Management"."Date Created")
            {
            }
            column(TimeCreated_CasesManagement; "Cases Management"."Time Created")
            {
            }
            column(Enquiry_CasesManagement; "Cases Management".Enquiry)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if CompanyInfo.Get then
                    CompanyInfo.CalcFields(CompanyInfo.Picture);
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
