#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75102 "Project Role Code"
{
    PageType = List;
    SourceTable = "Project Role Code";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Role Code"; Rec."Project Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Title/Designation Description"; Rec."Title/Designation Description")
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
