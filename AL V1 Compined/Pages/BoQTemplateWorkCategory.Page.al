#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75117 "BoQ Template Work Category"
{
    PageType = List;
    SourceTable = "BoQ Template Work Category";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("BoQ Template Code"; Rec."BoQ Template Code")
                {
                    ApplicationArea = Basic;
                }
                field("Works Category Code"; Rec."Works Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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
