#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69024 "Scale Benefits"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Scale Benefits";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("ED Code"; Rec."ED Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("ED Description"; Rec."ED Description")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009; Outlook)
            {
            }
            systempart(Control1000000010; Notes)
            {
            }
            systempart(Control1000000011; MyNotes)
            {
            }
            systempart(Control1000000012; Links)
            {
            }
        }
    }

    actions
    {
    }
}
