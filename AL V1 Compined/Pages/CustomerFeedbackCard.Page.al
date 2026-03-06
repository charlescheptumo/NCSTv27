#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56201 "Customer Feedback Card"
{
    Caption = 'Customer Feedback';
    PageType = Card;
    SourceTable = "Customer FeedbackS";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Feedback Date"; Rec."Feedback Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date created"; Rec."Date created")
                {
                    ApplicationArea = Basic;
                }
                field("Time created"; Rec."Time created")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                }
                field(Organization; Rec.Organization)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(Reception; Rec.Reception)
                {
                    ApplicationArea = Basic;
                }
                field("Prompt Services"; Rec."Prompt Services")
                {
                    ApplicationArea = Basic;
                }
                field("Reception Facilities"; Rec."Reception Facilities")
                {
                    ApplicationArea = Basic;
                }
                field(Professionalism; Rec.Professionalism)
                {
                    ApplicationArea = Basic;
                }
                field("General Presentation"; Rec."General Presentation")
                {
                    ApplicationArea = Basic;
                }
                field(Efficiency; Rec.Efficiency)
                {
                    ApplicationArea = Basic;
                }
                field(Quality; Rec.Quality)
                {
                    ApplicationArea = Basic;
                }
                field(Knowledge; Rec.Knowledge)
                {
                    ApplicationArea = Basic;
                }
                field("Recommendation Likelihood"; Rec."Recommendation Likelihood")
                {
                    ApplicationArea = Basic;
                }
                field("Services Sought"; Rec."Services Sought")
                {
                    ApplicationArea = Basic;
                }
                field("Any Problems"; Rec."Any Problems")
                {
                    ApplicationArea = Basic;
                }
                field("Overall satisfaction"; Rec."Overall satisfaction")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Improvement; Rec.Improvement)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //DocPrint.PrintPurchHeader(Rec);


                    Rec.SetRange(Rec.No, Rec.No);
                    Report.Run(56200, true, true, Rec)
                end;
            }
        }
    }
}
