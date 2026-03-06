#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69122 "Employment History"
{
    PageType = List;
    SourceTable = "Employment History";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = Basic;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Key Experience"; Rec."Key Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Salary On Leaving"; Rec."Salary On Leaving")
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Leaving"; Rec."Reason For Leaving")
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
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
