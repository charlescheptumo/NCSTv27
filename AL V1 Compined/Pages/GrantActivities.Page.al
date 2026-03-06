#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65134 "Grant Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Grants Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup("Actual Amounts(LCY)")
            {
                Caption = 'Actual Amounts(LCY)';
                field("Anouncement Amount(LCY)"; Rec."Anouncement Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Announcements';
                }
                field("Successfull Proposals(LCY)"; Rec."Successfull Proposals(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("UnSuccessful Proposals(LCY)"; Rec."UnSuccessful Proposals(LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
            cuegroup("Funding Announcements")
            {
                Caption = 'Funding Announcements';
                field("Funding Accouncement-Open"; Rec."Funding Accouncement-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open Funding Announcements';
                }
                field("Funding Accouncement-Closed"; Rec."Funding Accouncement-Closed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Funding Announcements';
                }
            }
            cuegroup("Grant Proposals")
            {
                Caption = 'Grant Proposals';
                field("Grant Proposal-Approved"; Rec."Grant Proposal-Approved")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Grant Proposals';
                }
                field("Grant Proposal-InProgress"; Rec."Grant Proposal-InProgress")
                {
                    ApplicationArea = Basic;
                    Caption = 'InProgress Grant Proposals';
                }
                field("Grant Proposal-Succesful"; Rec."Grant Proposal-Succesful")
                {
                    ApplicationArea = Basic;
                    Caption = 'successful Grant Proposals';
                }
                field("Grant Proposal-NotSuccesful"; Rec."Grant Proposal-NotSuccesful")
                {
                    ApplicationArea = Basic;
                    Caption = 'UnSuccessful Grant Proposals';
                }

                actions
                {
                    action("New Research Proposals")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Research Proposals';
                        Image = Document;
                        RunObject = Page "My Research Proposals";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup(Projects)
            {
                Caption = 'Projects';
                field("Project-Ongoing"; Rec."Project-Ongoing")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ongoing Projects';
                }
                field("Project Closed"; Rec."Project Closed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Projects';
                }
            }
            cuegroup(Approvals)
            {
                Caption = 'Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the number of approval requests that require your approval.';
                }
            }
            cuegroup("My User Tasks")
            {
                Caption = 'My User Tasks';
                field("UserTaskManagement.GetMyPendingUserTasksCount"; UserTaskManagement.GetMyPendingUserTasksCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pending User Tasks';
                    Image = Checklist;
                    ToolTip = 'Specifies the number of pending tasks that are assigned to you or to a group that you are a member of.';

                    trigger OnDrillDown()
                    var
                        UserTaskList: Page "User Task List";
                    begin
                        UserTaskList.SetPageToShowMyPendingUserTasks;
                        UserTaskList.Run;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        //SetRespCenterFilter;
        Rec.SetRange(Rec."Date Filter", 0D, WorkDate);
        Rec.SetFilter(Rec."User ID Filter", '=%1', UserId);
    end;

    var
        UserTaskManagement: Codeunit "User Task Management";
}
