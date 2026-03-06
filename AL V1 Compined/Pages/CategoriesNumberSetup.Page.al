#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56059 "Categories Number Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Categories Number Setup";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("copyright Category Code"; Rec."copyright Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Category Description"; Rec."Copyright Category Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("no series"; Rec."no series")
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
