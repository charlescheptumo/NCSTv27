#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70122 "Procurement Requests"
{
    PageType = List;
    SourceTable = "Procurement Request";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                }
                field("No.Series"; Rec."No.Series")
                {
                    ApplicationArea = Basic;
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Opening Date"; Rec."Tender Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Status"; Rec."Tender Status")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Closing Date"; Rec."Tender Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field(Addedum; Rec.Addedum)
                {
                    ApplicationArea = Basic;
                }
                field(SiteView; Rec.SiteView)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                }
                field("Return Time"; Rec."Return Time")
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
                field("No of Tender Documents"; Rec."No of Tender Documents")
                {
                    ApplicationArea = Basic;
                }
                field("Extended Date"; Rec."Extended Date")
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
                field("Validity Period"; Rec."Validity Period")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
                field("RFQ Sent"; Rec."RFQ Sent")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Amount"; Rec."Procurement Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Generate Multiple LPO"; Rec."Generate Multiple LPO")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Committee"; Rec."Tender Committee")
                {
                    ApplicationArea = Basic;
                }
                field("Minutes Path"; Rec."Minutes Path")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Started?"; Rec."Evaluation Started?")
                {
                    ApplicationArea = Basic;
                }
                field("Technical started?"; Rec."Technical started?")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Started?"; Rec."Financial Started?")
                {
                    ApplicationArea = Basic;
                }
                field("Technical Score"; Rec."Technical Score")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Score"; Rec."Financial Score")
                {
                    ApplicationArea = Basic;
                }
                field("Award Started"; Rec."Award Started")
                {
                    ApplicationArea = Basic;
                }
                field(minutesbeforeproceedtoaward; Rec.minutesbeforeproceedtoaward)
                {
                    ApplicationArea = Basic;
                }
                field(minutesafterproceedtoaward; Rec.minutesafterproceedtoaward)
                {
                    ApplicationArea = Basic;
                }
                field("Awarded?"; Rec."Awarded?")
                {
                    ApplicationArea = Basic;
                }
                field("Successful Bidder"; Rec."Successful Bidder")
                {
                    ApplicationArea = Basic;
                }
                field("Select Bidder Vendor No"; Rec."Select Bidder Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Selected Bidder Name"; Rec."Selected Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Admin"; Rec."Evaluation Admin")
                {
                    ApplicationArea = Basic;
                }
                field("Mandatory started?"; Rec."Mandatory started?")
                {
                    ApplicationArea = Basic;
                }
                field("Mandatory in progress?"; Rec."Mandatory in progress?")
                {
                    ApplicationArea = Basic;
                }
                field("Technical in Progress?"; Rec."Technical in Progress?")
                {
                    ApplicationArea = Basic;
                }
                field("Financial in Progress?"; Rec."Financial in Progress?")
                {
                    ApplicationArea = Basic;
                }
                field("Awarding in Progress?"; Rec."Awarding in Progress?")
                {
                    ApplicationArea = Basic;
                }
                field("LPO Generated"; Rec."LPO Generated")
                {
                    ApplicationArea = Basic;
                }
                field("Current Budget"; Rec."Current Budget")
                {
                    ApplicationArea = Basic;
                }
                field("TOR Attached"; Rec."TOR Attached")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Path"; Rec."Approval Path")
                {
                    ApplicationArea = Basic;
                }
                field("TOR File Name"; Rec."TOR File Name")
                {
                    ApplicationArea = Basic;
                }
                field("Quotation Pending Opening"; Rec."Quotation Pending Opening")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 1"; Rec."Opening Person 1")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 2"; Rec."Opening Person 2")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 3"; Rec."Opening Person 3")
                {
                    ApplicationArea = Basic;
                }
                field("Asigned User"; Rec."Asigned User")
                {
                    ApplicationArea = Basic;
                }
                field("Quotation Evaluation"; Rec."Quotation Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("In Financial?"; Rec."In Financial?")
                {
                    ApplicationArea = Basic;
                }
                field("In Technical?"; Rec."In Technical?")
                {
                    ApplicationArea = Basic;
                }
                field("In Award?"; Rec."In Award?")
                {
                    ApplicationArea = Basic;
                }
                field("Pending LPO?"; Rec."Pending LPO?")
                {
                    ApplicationArea = Basic;
                }
                field("Minutes File"; Rec."Minutes File")
                {
                    ApplicationArea = Basic;
                }
                field("Quotation Finished?"; Rec."Quotation Finished?")
                {
                    ApplicationArea = Basic;
                }
                field("Technical Minutes"; Rec."Technical Minutes")
                {
                    ApplicationArea = Basic;
                }
                field("Does Not Require TOR"; Rec."Does Not Require TOR")
                {
                    ApplicationArea = Basic;
                }
                field("Justification Memo"; Rec."Justification Memo")
                {
                    ApplicationArea = Basic;
                }
                field("Direct?"; Rec."Direct?")
                {
                    ApplicationArea = Basic;
                }
                field("PO Type"; Rec."PO Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
