#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65007 "Research Infrastructure List"
{
    CardPageID = "Research Infrastructure Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Center Infrastructure";

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
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Infrastructure Category"; Rec."Infrastructure Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Asset No"; Rec."Fixed Asset No")
                {
                    ApplicationArea = Basic;
                }
                field("External Refference No"; Rec."External Refference No")
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
