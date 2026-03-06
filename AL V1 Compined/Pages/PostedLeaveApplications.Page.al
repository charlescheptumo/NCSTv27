#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69073 "Posted Leave Applications"
{
    Caption = 'Posted Leave Applications';
    CardPageID = "Posted Leave Applications";
    Editable = false;
    PageType = List;
    SourceTable = 69205;
    SourceTableView = where(Status = filter(Released));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                }
                field("Current Balance"; Rec."Current Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Taken"; Rec."Total Taken")
                {
                    ApplicationArea = Basic;
                }
                field("E-mail Address"; Rec."E-mail Address")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date Filter"; Rec."Start Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field("Request Leave Allowance"; Rec."Request Leave Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Allowance Entittlement"; Rec."Leave Allowance Entittlement")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Allowance Amount"; Rec."Leave Allowance Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Details of Examination"; Rec."Details of Examination")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Exam"; Rec."Date of Exam")
                {
                    ApplicationArea = Basic;
                }
                field(Reliever; Rec.Reliever)
                {
                    ApplicationArea = Basic;
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(testss; Rec.testss)
                {
                    ApplicationArea = Basic;
                }
                field("Number of Previous Attempts"; Rec."Number of Previous Attempts")
                {
                    ApplicationArea = Basic;
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Tests; Rec.Tests)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Approved days"; Rec."Approved days")
                {
                    ApplicationArea = Basic;
                }
                field(RelieverAddress; Rec.RelieverAddress)
                {
                    ApplicationArea = Basic;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Resumption Date"; Rec."Resumption Date")
                {
                    ApplicationArea = Basic;
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ///ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
                        /*ApprovalEntries.Setfilters(DATABASE::"Purchase Header",14,"No.");
                        ApprovalEntries.RUN;*/

                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                }
            }
        }
        area(processing)
        {
            group(General)
            {
                Caption = 'General';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    // //RunObject =Report UnknownReport69117;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Enabled = false;
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Enabled = false;
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1102601023)
                {
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = false;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*IF ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);*/

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        //
    end;

    trigger OnOpenPage()
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        //SetSecurityFilterOnRespCenter;

        JobQueueActive := PurchasesPayablesSetup.JobQueueActive;

        //SETRANGE("Requester ID",USERID);
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        [InDataSet]
        JobQueueActive: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        /*OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);*/

    end;
}
