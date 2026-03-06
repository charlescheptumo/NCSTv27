#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69221 "Training Application Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Show';
    SourceTable = "Training Requests";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = "Application NoEditable";
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date of First Appointment"; Rec."Date of First Appointment")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    Editable = "Course TitleEditable";
                    TableRelation = "Training Needs";
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Purpose of Training"; Rec."Purpose of Training")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    MultiLine = false;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Tentative Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Tentative End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field("Duration Units"; Rec."Duration Units")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Cost"; Rec."Approved Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Mode of study"; Rec."Mode of study")
                {
                    ApplicationArea = Basic;
                }
                field("Bondage Period"; Rec."Bondage Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Bond Period';
                }
                field("Bondage End Date"; Rec."Bondage End Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = "Responsibility CenterEditable";
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755004; "Trainings Factbox")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    begin
                        DocumentType := Documenttype::"Training Application";

                        /*ApprovalComments.Setfilters(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.SetUpLine(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalComments.RUN;*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        /*DocumentType:=DocumentType::"Training Application";
                        ApprovalEntries.SetRecordfilters(DATABASE::"HR Training Applications",DocumentType,Code);
                        ApprovalEntries.RUN;*/

                    end;
                }
                action("&Send Approval &Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval &Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*TESTFIELDS;
                        
                        //cc//if ApprovalsMgmt.CheckTrainingAppApprovalsWorkflowEnabled(Rec) THEN
                          //cc//ApprovalsMgmt.OnSendTrainingAppForApproval(Rec);
                        */

                        Rec.Status := Rec.Status::Approved;
                        Rec.Modify;

                    end;
                }
                action("&Cancel Approval request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                        //ApprovalMgt.CancelTrainingAppApprovalReq(Rec,TRUE,TRUE);
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Approved);

                        HRTrainingApplications.SetRange(HRTrainingApplications.Code, Rec.Code);
                        if HRTrainingApplications.Find('-') then
                            Report.Run(69122, true, true, HRTrainingApplications);
                    end;
                }
                action("<A ction1102755042>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        OpenDoc.ReleaseTrainingApp(Rec)
                    end;
                }
                action("Training Participants")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Participants';
                    Image = PersonInCharge;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Training Participants List";
                    RunPageLink = "Training Code" = field("Course Title");
                }
                action(ImportParticipants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Participants';

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetFilter(Rec.Code, Rec.Code);
                        Report.Run(69120, true, true, Rec);
                        Rec.Reset;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if Rec.Status = Rec.Status::Open then begin
            "Responsibility CenterEditable" := true;
            "Application NoEditable" := true;
            "Employee No.Editable" := true;
            "Employee NameEditable" := true;
            "Employee DepartmentEditable" := true;
            "Purpose of TrainingEditable" := true;
            "Course TitleEditable" := true;
        end else begin
            "Responsibility CenterEditable" := false;
            "Application NoEditable" := false;
            "Employee No.Editable" := false;
            "Employee NameEditable" := false;
            "Employee DepartmentEditable" := false;
            "Purpose of TrainingEditable" := false;
            "Course TitleEditable" := false;
        end;
    end;

    trigger OnInit()
    begin
        "Course TitleEditable" := true;
        "Purpose of TrainingEditable" := true;
        "Employee DepartmentEditable" := true;
        "Employee NameEditable" := true;
        "Employee No.Editable" := true;
        "Application NoEditable" := true;
        "Responsibility CenterEditable" := true;
    end;

    var
        HREmp: Record Employee;
        EmpNames: Text[40];
        sDate: Date;
        HRTrainingApplications: Record "Training Requests";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        ApprovalComments: Page "Approval Comments";
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Application NoEditable": Boolean;
        [InDataSet]
        "Employee No.Editable": Boolean;
        [InDataSet]
        "Employee NameEditable": Boolean;
        [InDataSet]
        "Employee DepartmentEditable": Boolean;
        [InDataSet]
        "Purpose of TrainingEditable": Boolean;
        [InDataSet]
        "Course TitleEditable": Boolean;
        HRTrainingNeed: Record "Training Needs";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenDoc: Codeunit "Release Approval Document";


    procedure TESTFIELDS()
    begin
        Rec.TestField(Rec."Course Title");
        Rec.TestField(Rec."Start DateTime");
        Rec.TestField(Rec."End DateTime");
        //TESTFIELD("Duration Units");
        Rec.TestField(Rec.Duration);
        Rec.TestField(Rec."Approved Cost");
        Rec.TestField(Rec.Location);
        Rec.TestField(Rec.Provider);
        Rec.TestField(Rec."Purpose of Training");
    end;
}
