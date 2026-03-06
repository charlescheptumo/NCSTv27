#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75053 "Bid Evaluation Requirement"
{
    PageType = ListPart;
    SourceTable = "Bid Score Requirement";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Group ID"; Rec."Criteria Group ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement ID"; Rec."Requirement ID")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Target Value"; Rec."Target Value")
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
                action("Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = CreditMemo;

                    trigger OnAction()
                    var
                        BidscoreGuide: Record "Bid Score Guide";
                        BidscoreGuides: Page "Bid Score Guide";
                    begin
                        Rec.TestField(Rec."Template ID");

                        BidscoreGuide.FilterGroup(2);
                        BidscoreGuide.SetRange("Template ID", Rec."Template ID");
                        BidscoreGuide.SetRange("Criteria Group ID", Rec."Criteria Group ID");
                        BidscoreGuide.SetRange("Requirement ID", Rec."Requirement ID");
                        BidscoreGuide.FilterGroup(0);
                        BidscoreGuides.SetTableview(BidscoreGuide);
                        BidscoreGuides.Editable := true;
                        BidscoreGuides.Run;
                    end;
                }
            }
        }
    }
}
