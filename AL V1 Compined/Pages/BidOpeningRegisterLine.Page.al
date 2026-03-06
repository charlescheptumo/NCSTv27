#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75156 "Bid Opening Register Line"
{
    PageType = ListPart;
    SourceTable = "Bid Opening Register Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("External Bid Reference No"; Rec."External Bid Reference No")
                {
                    ApplicationArea = Basic;
                }
                field("Valid Bid Security Provided"; Rec."Valid Bid Security Provided")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Issuer"; Rec."Bid Security Issuer")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Amount (LCY)"; Rec."Bid Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Amount Pass"; Rec."Bid Security Amount Pass")
                {
                    ApplicationArea = Basic;
                }
                field("Total Tender Price (LCY)"; Rec."Total Tender Price (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Complete Bid Doc Submitted"; Rec."Complete Bid Doc Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Late Bid"; Rec."Late Bid")
                {
                    ApplicationArea = Basic;
                }
                field("Late Bid Submission Time"; Rec."Late Bid Submission Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Withdrawal Notice No."; Rec."Bid Withdrawal Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Modification Notice No."; Rec."Bid Modification Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Withdrawal Exists"; Rec."Bid Withdrawal Exists")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Modification Exists"; Rec."Bid Modification Exists")
                {
                    ApplicationArea = Basic;
                }
                field("Final Bid Opening Result"; Rec."Final Bid Opening Result")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Opening Com Remarks"; Rec."Tender Opening Com Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Representatives"; Rec."No. of Representatives")
                {
                    ApplicationArea = Basic;
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                }
                field("Date/Time Notified"; Rec."Date/Time Notified")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Bidder Attendance")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Bid Opening Bidder Attendance";
                    RunPageLink = Code = field(Code),
                                  "IFS Code" = field("IFS Code"),
                                  "Vendor No." = field("Vendor No.");
                }
                action("Technical Attachments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachments';
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Filed Document";
                    RunPageLink = "Vendor No" = field("Vendor No.");
                }
            }
        }
    }
}
