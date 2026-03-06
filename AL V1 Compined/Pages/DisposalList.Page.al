#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70110 "Disposal List"
{
    ApplicationArea = Basic;
    CardPageID = "Disposal Header";
    PageType = List;
    SourceTable = "Disposal Header";
    SourceTableView = where(Status = const(Open));
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
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Disposal"; Rec."Reason For Disposal")
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
