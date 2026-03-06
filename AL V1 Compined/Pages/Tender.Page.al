#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70036 Tender
{
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(Tender));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan No"; Rec."Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Type"; Rec."Tender Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field("Validity Period"; Rec."Validity Period")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Closing Date"; Rec."Tender Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Opening Date"; Rec."Tender Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Extended Date"; Rec."Extended Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Status"; Rec."Tender Status")
                {
                    ApplicationArea = Basic;
                }
                field("No of Tender Documents"; Rec."No of Tender Documents")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Amount"; Rec."Tender Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000019; "Procurement Request Lines")
            {
                SubPageLink = "Requisition No" = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Tender)
            {
                Caption = 'Tender';
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements';
                    RunObject = Page "Tender Mandatory Requirements";
                    RunPageLink = "Tender No" = field(No);
                }
                action("Technical Specifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Technical Specifications';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Tender Specifications";
                    RunPageLink = "Requisition No" = field(No);
                }
                action("Close Tender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Close Tender';

                    trigger OnAction()
                    begin
                        Rec.Closed := true;
                        Rec.Modify;
                    end;
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page Bidders;
                    RunPageLink = "Ref No." = field(No);
                }
                action("Tender Opening Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Opening Summary';
                    RunObject = Page "Tender Bidders Summary";
                    RunPageLink = "Ref No." = field(No);
                }
                action("<Send Approval Request>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page Bidders;
                    RunPageLink = "Ref No." = field(No);

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalMgt.SendProcApprovalRequest(Rec);
                    end;
                }
                action("<Page Supplier Selection>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Selection';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Tender Supplier";
                    RunPageLink = "Reference No." = field(No);
                    RunPageView = sorting("Reference No.", "Supplier No");
                }
                action("Cost Comparison Sheet")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison Sheet';

                    trigger OnAction()
                    begin
                        TenderBids.Reset;
                        TenderBids.SetFilter(TenderBids."Requisition No", Rec.No);
                        Report.Run(70003, true, true, TenderBids);
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Process Type" := Rec."process type"::Tender;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Process Type" := Rec."process type"::Tender;
    end;

    var
        TenderBids: Record "Tender Bids";
}
