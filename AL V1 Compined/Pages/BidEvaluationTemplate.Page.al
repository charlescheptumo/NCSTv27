#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75051 "Bid Evaluation Template"
{
    ApplicationArea = Basic;
    CardPageID = "Bid Evaluation Template Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bid Scoring Template";
    UsageCategory = Tasks;

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
                field("Template type"; Rec."Template type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Default Procurement Type"; Rec."Default Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Total Preliminary Checks Score"; Rec."Total Preliminary Checks Score")
                {
                    ApplicationArea = Basic;
                }
                field("Total Technical Evaluation %"; Rec."Total Technical Evaluation %")
                {
                    ApplicationArea = Basic;
                }
                field("Total Financial Evaluation"; Rec."Total Financial Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("Total Assigned Score/Weight %"; Rec."Total Assigned Score/Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Default YES Bid Rating Score %"; Rec."Default YES Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                }
                field("NO Bid Rating Response Value"; Rec."NO Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Default NO Bid Rating Score %"; Rec."Default NO Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                }
                field("1-POOR Option Text Bid Score %"; Rec."1-POOR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("2-FAIR Option Text Bid Score %"; Rec."2-FAIR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("3-GOOD Option Text Bid Score %"; Rec."3-GOOD Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("4-VERY GOOD  Text Bid Score %"; Rec."4-VERY GOOD  Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field("5-EXCELLENT Text Bid Score %"; Rec."5-EXCELLENT Text Bid Score %")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
            }
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
            systempart(Control14; Links)
            {
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            // }
        }
    }

    actions
    {
    }
}
