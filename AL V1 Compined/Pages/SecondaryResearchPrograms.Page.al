#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65125 "Secondary Research Programs"
{
    PageType = List;
    SourceTable = "Secondary Research Program";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("GFA No"; Rec."GFA No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Research Program"; Rec."Research Program")
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
