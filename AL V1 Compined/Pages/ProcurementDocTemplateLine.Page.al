#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75025 "Procurement Doc Template Line"
{
    Caption = 'Procurement Document Template Line';
    PageType = List;
    SourceTable = "Procurement Doc Template Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Process"; Rec."Procurement Process")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Document Type"; Rec."Procurement Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
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
