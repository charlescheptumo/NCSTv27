#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57122 "Audit activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Finance Cue";

    layout
    {
        area(content)
        {
            cuegroup(Payments)
            {
                Caption = 'Payments';
                field("Posted Payment Vouchers"; Rec."Posted Payment Vouchers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Payment Vouchers';
                    DrillDownPageID = "Posted Payment Vouchers";
                }
            }
            cuegroup(Receivables)
            {
                Caption = 'Receivables';
                field("Posted Surrenders"; Rec."Posted Surrenders")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Imprest Voucher Lines";
                }
            }
            // cuegroup(Approvals)
            // {
            //     Caption = 'Approvals';
            //     field("Requests Sent for Approval"; Rec. )
            //     {
            //         ApplicationArea = Basic;
            //         DrillDownPageID = "Approval Entries";
            //     }
            //     field("Requests to Approve"; Rec."Requests to Approve")
            //     {
            //         ApplicationArea = Basic;
            //         DrillDownPageID = "Requests to Approve";
            //     }
            // }
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

        Rec.SetFilter(Rec."Due Date Filter", '<=%1', WorkDate);
        Rec.SetFilter(Rec."Overdue Date Filter", '<%1', WorkDate);

    end;
}
