#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69120 "Employee Qualification"
{
    PageType = List;
    SourceTable = "Employee Qualification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                }
                field("Course Grade"; Rec."Course Grade")
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000013; Notes)
            {
            }
            systempart(Control1000000014; MyNotes)
            {
            }
            systempart(Control1000000015; Links)
            {
            }
        }
    }

    actions
    {
    }
}
