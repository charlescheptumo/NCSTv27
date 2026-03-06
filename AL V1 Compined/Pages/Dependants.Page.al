#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69135 Dependants
{
    PageType = List;
    SourceTable = "Employee Beneficiaries";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(SurName; Rec.SurName)
                {
                    ApplicationArea = Basic;
                }
                field("Other Names"; Rec."Other Names")
                {
                    ApplicationArea = Basic;
                }
                field(Relationship; Rec.Relationship)
                {
                    ApplicationArea = Basic;
                }
                field("Office Tel No"; Rec."Office Tel No")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Home Tel No"; Rec."Home Tel No")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("ID No/Passport No"; Rec."ID No/Passport No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Occupation; Rec.Occupation)
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
