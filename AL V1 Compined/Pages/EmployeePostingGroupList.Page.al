#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69042 "Employee Posting Group List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Employee Posting GroupX";
    ApplicationArea = All;

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
                field("Overtime Base Hrs"; Rec."Overtime Base Hrs")
                {
                    ApplicationArea = Basic;
                }
                field("Guards Wages Daily Rate"; Rec."Guards Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Drivers Wages Daily Rate"; Rec."Drivers Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Working Days"; Rec."Monthly Working Days")
                {
                    ApplicationArea = Basic;
                }
                field("Interest on advance rate"; Rec."Interest on advance rate")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Group"; Rec."Payroll Group")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Leave Days"; Rec."Annual Leave Days")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000012; Notes)
            {
            }
            systempart(Control1000000013; MyNotes)
            {
            }
            systempart(Control1000000014; Links)
            {
            }
        }
    }

    actions
    {
    }
}
