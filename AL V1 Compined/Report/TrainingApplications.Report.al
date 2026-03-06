#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69122 "Training Applications"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Training Applications.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("HR Training Applications"; "Training Requests")
        {
            DataItemTableView = sorting(Code);
            RequestFilterFields = "Code";
            column(ReportForNavId_6373; 6373)
            {
            }
            column(CourseTitle_HRTrainingApplications; "HR Training Applications"."Course Title")
            {
                IncludeCaption = true;
            }
            column(FromDate_HRTrainingApplications; "HR Training Applications"."Start DateTime")
            {
                IncludeCaption = true;
            }
            column(ToDate_HRTrainingApplications; "HR Training Applications"."End DateTime")
            {
                IncludeCaption = true;
            }
            column(DurationUnits_HRTrainingApplications; "HR Training Applications"."Duration Units")
            {
                IncludeCaption = true;
            }
            column(Duration_HRTrainingApplications; "HR Training Applications".Duration)
            {
                IncludeCaption = true;
            }
            column(CostOfTraining_HRTrainingApplications; "HR Training Applications".Cost)
            {
                IncludeCaption = true;
            }
            column(Location_HRTrainingApplications; "HR Training Applications".Location)
            {
                IncludeCaption = true;
            }
            column(ApplicationNo_HRTrainingApplications; "HR Training Applications".Code)
            {
                IncludeCaption = true;
            }
            column(EmployeeNo_HRTrainingApplications; "HR Training Applications"."Employee No.")
            {
                IncludeCaption = true;
            }
            column(EmployeeName_HRTrainingApplications; "HR Training Applications"."Employee Name")
            {
                IncludeCaption = true;
            }
            column(ApplicationDate_HRTrainingApplications; "HR Training Applications"."Application Date")
            {
                IncludeCaption = true;
            }
            column(EmployeeDepartment_HRTrainingApplications; "HR Training Applications"."Employee Department")
            {
                IncludeCaption = true;
            }
            column(Description_HRTrainingApplications; "HR Training Applications".Description)
            {
            }
            column(PurposeofTraining_HRTrainingApplications; "HR Training Applications"."Purpose of Training")
            {
            }
            column(Activity; "HR Training Applications"."Global Dimension 1 Code")
            {
            }
            column(Branch; "HR Training Applications"."Global Dimension 2 Code")
            {
            }
            column(Department; "HR Training Applications"."Employee Department")
            {
            }
            column(ResponsibilityCenter; "HR Training Applications"."Responsibility Center")
            {
            }
            column(Participants; "HR Training Applications"."No. of Participants")
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
            dataitem("Training Participants"; "Training Participants")
            {
                DataItemLink = "Training Code" = field("Course Title");
                column(ReportForNavId_1000000033; 1000000033)
                {
                }
                column(EmployeeCode; "Training Participants"."Employee Code")
                {
                }
                column(EmployeeName; "Training Participants"."Employee Name")
                {
                }
                column(JobTitle; "Training Participants"."Job Title")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //MESSAGE(FORMAT("Training Participants"."Employee Code"));
                end;
            }
            dataitem("Approval Comment Line"; "Approval Comment Line")
            {
                DataItemLink = "Document No." = field(Code);
                DataItemLinkReference = "HR Training Applications";
                DataItemTableView = sorting("Table ID", "Document Type", "Document No.");
                column(ReportForNavId_8731; 8731)
                {
                }
                column(UserID_ApprovalCommentLine; "Approval Comment Line"."User ID")
                {
                    IncludeCaption = true;
                }
                column(Comment_ApprovalCommentLine; "Approval Comment Line".Comment)
                {
                    IncludeCaption = true;
                }
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field(Code);
                DataItemLinkReference = "HR Training Applications";
                DataItemTableView = sorting("Table ID", "Document Type", "Document No.", "Sequence No.");
                column(ReportForNavId_1171; 1171)
                {
                }
                column(SenderID_ApprovalEntry; "Approval Entry"."Sender ID")
                {
                    IncludeCaption = true;
                }
                column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID")
                {
                    IncludeCaption = true;
                }
                column(DateTimeSentforApproval_ApprovalEntry; "Approval Entry"."Date-Time Sent for Approval")
                {
                    IncludeCaption = true;
                }
                dataitem("User Setup"; "User Setup")
                {
                    DataItemLink = "User ID" = field("Approver ID");
                    DataItemTableView = sorting("User ID");
                    column(ReportForNavId_7968; 7968)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    HREmp.Reset;
                    HREmp.SetRange(HREmp."User ID", "Approval Entry"."Approver ID");
                    if HREmp.Find('-') then
                        ApproverName := HREmp.FullName
                    else
                        ApproverName := '';
                end;
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
        HREmp: Record Employee;
        ApproverName: Text[30];
        HR_Training_ApplicationsCaptionLbl: label 'HR Training Applications';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        P_O__BoxCaptionLbl: label 'P.O. Box';
        Training_Application_FormCaptionLbl: label 'Training Application Form';
        Name_of_Training_CourseCaptionLbl: label 'Name of Training Course';
        From__Date_CaptionLbl: label 'From (Date)';
        Duration_CaptionLbl: label 'Duration ';
        To__Date_CaptionLbl: label 'To (Date)';
        Cost_of_TrainingCaptionLbl: label 'Cost of Training';
        How_the_Training_Course_Will_Complement_Enhance_my_Skills_in_Relation_to_the_Job_RequirementsCaptionLbl: label 'How the Training Course Will Complement/Enhance my Skills in Relation to the Job Requirements';
        Brief_Description_of_Training_CourseCaptionLbl: label 'Brief Description of Training Course';
        CommentsCaptionLbl: label 'Comments';
        Comments_By_CaptionLbl: label 'Comments By:';
        End_of_CommentsCaptionLbl: label 'End of Comments';
        Approved_ByCaptionLbl: label 'Approved By';
        ApprovalsCaptionLbl: label 'Approvals';
        SignatureCaptionLbl: label 'Signature';
}
