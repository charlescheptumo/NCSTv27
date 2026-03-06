#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65025 "Research Activities Card"
{
    PageType = Card;
    SourceTable = "Research Output Activities";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Research Output ID"; Rec."Research Output ID")
                {
                    ApplicationArea = Basic;
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Priority; Rec.Priority)
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
