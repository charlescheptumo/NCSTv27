#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51000 "Goods & Services Inspection"
{
    ApplicationArea = Basic;
    Caption = 'Goods & Services Inspection';
    Editable = false;
    PageType = List;
    SourceTable = "Goods & Services Inspection";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Shipment No.';
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Role"; Rec."Committee Role")
                {
                    ApplicationArea = Basic;
                }
                field(Decision; Rec.Decision)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Assigned By"; Rec."Assigned By")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Date-Time"; Rec."Assignment Date-Time")
                {
                    ApplicationArea = Basic;
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009; Notes)
            {
            }
            systempart(Control1000000010; MyNotes)
            {
            }
            systempart(Control1000000011; Links)
            {
            }
        }
    }

    actions
    {
    }
}
