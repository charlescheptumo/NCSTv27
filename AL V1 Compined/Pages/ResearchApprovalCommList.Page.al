#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65027 "Research Approval Comm List"
{
    ApplicationArea = Basic;
    CardPageID = "Research Approval Comm Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Approval Committee";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contact  ID"; Rec."Contact  ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Core Mandate"; Rec."Core Mandate")
                {
                    ApplicationArea = Basic;
                }
                field("No of Research Submissions"; Rec."No of Research Submissions")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup8)
            {
                action("GFO Approval Comm Entry List")
                {
                    ApplicationArea = Basic;
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "GFO Approval Comm Entry List";
                    RunPageLink = "RAC ID" = field("Contact  ID");
                }
                action("Contact Card")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Contact Card";
                    RunPageLink = "No." = field("Contact  ID");
                }
                action("Research Submissions")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Message('Test');
                    end;
                }
            }
        }
    }
}
