#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65039 "Project Research Team Card"
{
    CardPageID = "Project Research Team List";
    PageType = Card;
    SourceTable = "Project Research Team";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Researcher ID"; Rec."Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Role"; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Role Description"; Rec."Role Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Default Payment Mentod"; Rec."Default Payment Mentod")
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
