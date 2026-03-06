#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56066 "Internal Memo"
{
    PageType = Card;
    SourceTable = "Internal Memos";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(RE; Rec.RE)
                {
                    ApplicationArea = Basic;
                }
                field("Employee UserID"; Rec."Employee UserID")
                {
                    ApplicationArea = Basic;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                }
                field("To CEO"; Rec."To CEO")
                {
                    ApplicationArea = Basic;
                }
                field(Through; Rec.Through)
                {
                    ApplicationArea = Basic;
                }
                field("Paragraph 1"; Rec."Paragraph 1")
                {
                    ApplicationArea = Basic;
                }
                field("Paragraph 2"; Rec."Paragraph 2")
                {
                    ApplicationArea = Basic;
                }
                field("Prepared By Date"; Rec."Prepared By Date")
                {
                    ApplicationArea = Basic;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                }
                field("CEO Approval"; Rec."CEO Approval")
                {
                    ApplicationArea = Basic;
                }
                field("Approved By Date"; Rec."Approved By Date")
                {
                    ApplicationArea = Basic;
                }
                field("CEO Approval Date"; Rec."CEO Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("CEO Comments"; Rec."CEO Comments")
                {
                    ApplicationArea = Basic;
                }
                field("HOD ID"; Rec."HOD ID")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control21; "Memo Lines")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange(Rec.Code, Rec.Code);
                    Report.Run(56237, true, true, Rec);
                end;
            }
        }
    }
}
