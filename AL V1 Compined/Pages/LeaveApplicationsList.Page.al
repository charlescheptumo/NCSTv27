#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69206 "Leave Applications List"
{
    ApplicationArea = Basic;
    Caption = 'Leave Applications ';
    CardPageID = "Leave Application Card";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Leave Application";
    SourceTableView = where(Status = filter(Open | "Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application No';
                    StyleExpr = true;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755006; "HR Leave Applications Factbox")
            {
                SubPageLink = "No." = field("Employee No");
            }
            systempart(Control1102755004; Outlook)
            {
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
                        DocumentType := Documenttype::"Leave Application";
                        /*
                        ApprovalComments.Setfilters(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        ApprovalComments.SetUpLine(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        ApprovalComments.RUN;
                        */

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
                    begin
                        DocumentType := Documenttype::"Leave Application";
                        ApprovalEntries.SetRecordfilters(Database::"HR Leave Application", DocumentType, Rec."Application Code");
                        ApprovalEntries.Run;
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        /*//cc//if ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(Rec) THEN
                          //cc//ApprovalsMgmt.OnSendLeaveAppForApproval(Rec);*/

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(Rec);
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HRLeaveApp.Reset;
                        HRLeaveApp.SetRange(HRLeaveApp."Application Code", Rec."Application Code");
                        if HRLeaveApp.Find('-') then
                            Report.Run(69115, true, true, HRLeaveApp);
                    end;
                }
                action("Create Leave Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Leave Ledger Entries';
                    Image = CreateLinesFromJob;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.CreateLeaveLedgerEntries;
                        Rec.Reset;
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Leave Application")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Application';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject =Report UnknownReport39005587;
            }
            action("Leave Reimbursements")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Reimbursements';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject =Report UnknownReport39005601;
            }
            action("Leave Applications List")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Applications List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject =Report UnknownReport39005604;
            }
            action("Leave Statement")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Statement';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject =Report UnknownReport39005599;
            }
            action("Leave Statistics")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Statistics';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "HR Leave Statistics";

                trigger OnAction()
                begin
                    HREmp.Reset;
                    HREmp.SetRange(HREmp."User ID", UserId);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin

        Rec.SetRange(Rec."Requester ID", UserId);
    end;

    var
        ApprovalEntries: Page "Approval Entries";
        ApprovalComments: Page "Approval Comments";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application";
        HRLeaveApp: Record "HR Leave Application";
        HREmp: Record Employee;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;


    procedure TESTFIELDS()
    begin
        Rec.TestField(Rec."Leave Type");
        Rec.TestField(Rec."Days Applied");
        Rec.TestField(Rec."Start Date");
        Rec.TestField(Rec.Reliever);
        Rec.TestField(Rec.Tests);
    end;


    procedure TestLeaveFamily()
    var
        LeaveFamily: Record "HR Leave Family Groups";
        LeaveFamilyEmployees: Record "HR Leave Family Employees";
        Employees: Record Employee;
    begin
        LeaveFamilyEmployees.SetRange(LeaveFamilyEmployees."Employee No", Rec."Employee No");
        if LeaveFamilyEmployees.FindSet then //find the leave family employee is associated with
            repeat
                LeaveFamily.SetRange(LeaveFamily.Code, LeaveFamilyEmployees.Family);
                LeaveFamily.SetFilter(LeaveFamily."Max Employees On Leave", '>0');
                if LeaveFamily.FindSet then //find the status other employees on the same leave family
                  begin
                    Employees.SetRange(Employees."No.", LeaveFamilyEmployees."Employee No");
                    Employees.SetRange(Employees."Leave Status", Employees."leave status"::" ");
                    if Employees.Count > LeaveFamily."Max Employees On Leave" then
                        Error('The Maximum number of employees on leave for this family has been exceeded, Contact th HR manager for more information');
                end
            until LeaveFamilyEmployees.Next = 0;
    end;
}
