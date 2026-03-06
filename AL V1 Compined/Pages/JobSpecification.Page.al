#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69108 "Job Specification"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Company Jobs";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                }
                field("Total Score"; Rec."Total Score")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000010; "Job Requirement Lines")
            {
                SubPageLink = "Job Id" = field("Job ID");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000006; Links)
            {
            }
            systempart(Control1000000007; MyNotes)
            {
            }
            systempart(Control1000000008; Notes)
            {
            }
            systempart(Control1000000009; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}
