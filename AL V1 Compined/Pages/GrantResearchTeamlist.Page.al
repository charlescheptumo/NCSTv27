#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65038 "Grant Research Team list"
{
    CardPageID = "Grant Research Team Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grant Research Team";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Grant Opportunity ID"; Rec."Grant Opportunity ID")
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
                }
                field("Primary Role"; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Role Description"; Rec."Role Description")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Name"; Rec."Grant Name")
                {
                    ApplicationArea = Basic;
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
