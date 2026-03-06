#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59060 "M&E  Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Finance Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                // field("Requests to Approve"; Rec."Requests to Approve")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Requests to Approve";
                // }
                // field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                // {
                //     ApplicationArea = Basic;
                //     DrillDownPageID = "Approval Entries";
                // }
            }
            cuegroup("Incoming Documents")
            {
                Caption = 'Incoming Documents';
                field("New Incoming Documents"; Rec."New Incoming Documents")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDownPageID = "Incoming Documents";
                    ToolTip = 'Specifies the number of new incoming documents in the company. The documents are filtered by today''s date.';
                }
                field("Approved Incoming Documents"; Rec."Approved Incoming Documents")
                {
                    ApplicationArea = Suite;
                    DrillDownPageID = "Incoming Documents";
                    ToolTip = 'Specifies the number of approved incoming documents in the company. The documents are filtered by today''s date.';
                }

                actions
                {
                    action(CheckForOCR)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Receive from OCR Service';
                        RunObject = Codeunit "OCR - Receive from Service";
                        RunPageMode = View;
                        ToolTip = 'Process new incoming electronic documents that have been created by the OCR service and that you can convert to, for example, purchase invoices.';
                        Visible = ShowCheckForOCR;
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


        // Rec.SetFilter(Rec."User ID Filter", UserId);

        // Rec.SetFilter(Rec."User ID Filter", '=%1', UserId);
        ShowCheckForOCR := OCRServiceMgt.OcrServiceIsEnable;
    end;

    var
        OCRServiceMgt: Codeunit "OCR Service Mgt.";
        ShowCheckForOCR: Boolean;
}
