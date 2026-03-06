#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50070 pageextension50070 extends "Purchase Agent Activities"
{
    layout
    {
        modify("Post Arrival Follow-up")
        {
            Caption = 'Purchase Requisitions';

            //Unsupported feature: Property Modification (Name) on ""Post Arrival Follow-up"(Control 10)".

        }
        modify(OutstandingOrders)
        {
            Caption = 'Approved Purchase Orders';
        }
        modify("Purchase Return Orders - All")
        {

            //Unsupported feature: Property Modification (SourceExpr) on ""Purchase Return Orders - All"(Control 14)".

            DrillDownPageID = "Purchase Requisitions";

            //Unsupported feature: Property Modification (Name) on ""Purchase Return Orders - All"(Control 14)".

            Caption = 'Open Purchase Requisitions';
        }
        modify("Purchase Orders - Authorize for Payment")
        {
            Caption = 'Store/Inventory Management ';

            //Unsupported feature: Property Modification (Name) on ""Purchase Orders - Authorize for Payment"(Control 18)".

        }

        //Unsupported feature: Property Insertion (Visible) on "NotInvoiced(Control 19)".


        //Unsupported feature: Property Insertion (Visible) on "PartiallyInvoiced(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase Return Orders - All"(Control 14)".

        addafter(OutstandingOrders)
        {
            field("Approved POs"; Rec."Approved POs")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        addafter("Purchase Return Orders - All")
        {
            field("PRNS Pending approval"; Rec."Pending PRNs")
            {
                ApplicationArea = Basic;
                Caption = 'PRNS Pending approval';
                DrillDownPageID = "Purchase Requisitions";
                ToolTip = 'Specifies in real time upcoming Purchase Requisitions that are yet to be fully approved but are in the process';
            }
            field("Approved purchase Requisitions"; Rec."Approved PRNs")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Approved Purchase Requisition";
            }
            field("Archived PRNs"; Rec."Archived PRNs")
            {
                ApplicationArea = Basic;
                Caption = 'Intiated Purchase Requisition';
                DrillDownPageID = "Archived Purchase Requisition";
            }
        }
        addafter(PartiallyInvoiced)
        {
            field("Open S11"; Rec."Open S11")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Store Requisitions";
                ToolTip = 'Specifies upcoming S11s that have not been sent for Approval yet but in the process';
            }
            field("Approved S11"; Rec."Approved S11")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Approved Store Requisitions";
                ToolTip = 'Specifies Appproved S11s but the requested items have not been issued to the user';
            }
            field("Issued S11"; Rec."Issued S11")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Posted Store Requisitions";
                ToolTip = 'Specifies Appproved S11s and issued';
            }
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Requests to Approve";
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approval Entries";
                }
            }
        }
    }
}
