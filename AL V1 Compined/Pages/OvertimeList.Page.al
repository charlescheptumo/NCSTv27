#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69132 "Overtime List"
{
    ApplicationArea = Basic;
    CardPageID = "Overtime Header Page";
    PageType = List;
    SourceTable = "Overtime Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("EMp No."; Rec."EMp No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Convert to pay"; Rec."Convert to pay")
                {
                    ApplicationArea = Basic;
                }
                field("Convert to Leave"; Rec."Convert to Leave")
                {
                    ApplicationArea = Basic;
                }
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
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
