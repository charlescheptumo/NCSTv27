#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75095 "Bid Selection Method"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Bid Selection Method";
    UsageCategory = Administration;

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Overview; Rec.Overview)
                {
                    ApplicationArea = Basic;
                }
                field("Applies To Goods"; Rec."Applies To Goods")
                {
                    ApplicationArea = Basic;
                }
                field("Applies To Works"; Rec."Applies To Works")
                {
                    ApplicationArea = Basic;
                }
                field("Applies To Services"; Rec."Applies To Services")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Invitations For Supply"; Rec."No. of Invitations For Supply")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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
