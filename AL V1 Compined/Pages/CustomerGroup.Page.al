#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56087 "Customer Group"
{
    PageType = List;
    SourceTable = "Customer Group &  Mode";
    SourceTableView = where("Customer Group" = filter(true));

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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Customer Group"; Rec."Customer Group")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Customer Group" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Customer Group" := true;
    end;
}
