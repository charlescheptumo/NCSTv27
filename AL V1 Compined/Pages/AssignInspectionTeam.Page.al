#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51001 "Assign Inspection Team"
{
    PageType = List;
    SourceTable = "Goods & Services Inspection";
    SourceTableView = sorting("No.", "User ID")
                      order(ascending)
                      where(Decision = filter(" "));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Role"; Rec."Committee Role")
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
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned By"; Rec."Assigned By")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Date-Time"; Rec."Assignment Date-Time")
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
