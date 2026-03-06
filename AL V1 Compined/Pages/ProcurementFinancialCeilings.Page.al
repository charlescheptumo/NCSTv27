#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70011 "Procurement Financial Ceilings"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Financial ceilings";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Method of Procurement"; Rec."Method of Procurement")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Ceiling"; Rec."Minimum Ceiling")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Ceiling"; Rec."Maximum Ceiling")
                {
                    ApplicationArea = Basic;
                }
                field("Procument Description"; Rec."Procument Description")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Class"; Rec."Procurement Class")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Effective date"; Rec."Effective date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Effective Date';
                }
            }
        }
    }

    actions
    {
    }
}
