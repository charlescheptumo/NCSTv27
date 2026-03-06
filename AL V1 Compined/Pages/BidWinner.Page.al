#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70086 "Bid Winner"
{
    PageType = List;
    SourceTable = Bidders;
    SourceTableView = where("Failed Mandatory" = const(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Recommended Winner"; Rec."Recommended Winner")
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
