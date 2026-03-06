#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59119 "Registry File Entries"
{
    PageType = List;
    SourceTable = "Registry File  Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Custody; Rec.Custody)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Employee"; Rec."Assigned Employee")
                {
                    ApplicationArea = Basic;
                }
                field("File No"; Rec."File No")
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
