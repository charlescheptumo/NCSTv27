#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65037 "Grant Research Team Card"
{
    PageType = Card;
    SourceTable = "Grant Research Team";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Grant Opportunity ID"; Rec."Grant Opportunity ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Name"; Rec."Grant Name")
                {
                    ApplicationArea = Basic;
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
                field(Grantor; Rec.Grantor)
                {
                    ApplicationArea = Basic;
                }
                field("Funding Decision"; Rec."Funding Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Amount(LCY)"; Rec."Requested Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Amount(LCY)"; Rec."Awarded Amount(LCY)")
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
