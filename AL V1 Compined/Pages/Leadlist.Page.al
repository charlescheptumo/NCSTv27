#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69510 "Lead list"
{
    ApplicationArea = Basic;
    CardPageID = "Lead card";
    Editable = false;
    PageType = List;
    SourceTable = "General Equiries.";
    SourceTableView = where(Send = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field(SurName; Rec.SurName)
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Status"; Rec."Lead Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}
