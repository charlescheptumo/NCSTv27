#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56214 "Employee service Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Service Cue";

    layout
    {
        area(content)
        {
            cuegroup("Imprest Applications & Processing")
            {
                Caption = 'Imprest Applications & Processing';
                // field("Imprest Request-Inprocess"; "Imprest Request-Inprocess")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Imprest Requisitions";
                // }
                // field("Imprest Request-P"; "Imprest Request-P")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Posted Imprest Requisitions';
                // }

                actions
                {
                    action("New Imprest Memo")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Imprest Memo';
                        Image = Document;
                        RunObject = Page "Imprest Memo";
                        RunPageMode = Create;
                    }
                    action("New Imprest Surrender Memo")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Imprest Surrender Memo';
                        RunObject = Page "Imprest Surr Memo card";
                        RunPageMode = Create;
                        Visible = false;
                    }
                }
            }
            cuegroup("Leave Applications ")
            {
                Caption = 'Leave Applications ';
                // field("Leave Application-Inprocess"; "Leave Application-Inprocess")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Leave Applications";
                // }

                actions
                {
                    action("New Imprest Surrender")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Imprest Surrender';
                        Image = Document;
                        RunObject = Page "Imprest Surrender";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                // field("Requests to Approve"; "Requests to Approve")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Requests to Approve";
                // }
                // field("Requests Sent for Approval"; "Requests Sent for Approval")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Approval Entries";
                // }

                actions
                {
                    action("New Purchase Requisition")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Purchase Requisition';
                        RunObject = Page "Purchase Requisition";
                        RunPageMode = Create;
                    }
                    action("New Leave Application")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Leave Application';
                        RunObject = Page "Leave Application Card";
                        RunPageMode = Create;
                    }
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

        Rec.SetRespCenterFilter;
        Rec.SetRange(Rec."Date Filter", 0D, WorkDate);
        Rec.SetFilter(Rec."User ID Filter", '=%1', UserId);
    end;
}
