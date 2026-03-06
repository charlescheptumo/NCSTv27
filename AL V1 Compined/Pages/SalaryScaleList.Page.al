#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69022 "Salary Scale List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Salary Scales";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Scale; Rec.Scale)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Pointer"; Rec."Minimum Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Pointer"; Rec."Maximum Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Allowance"; Rec."Responsibility Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Commuter Allowance"; Rec."Commuter Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("In Patient Limit"; Rec."In Patient Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Out Patient Limit"; Rec."Out Patient Limit")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000010; Outlook)
            {
            }
            systempart(Control1000000011; Notes)
            {
            }
            systempart(Control1000000012; MyNotes)
            {
            }
            systempart(Control1000000013; Links)
            {
            }
        }
    }

    actions
    {
    }
}
