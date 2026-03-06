#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69092 "Director Ledger Entries"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Director Ledger Entry";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Director No"; Rec."Director No")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Meeting"; Rec."Date of Meeting")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000028; Outlook)
            {
            }
            systempart(Control1000000029; Notes)
            {
            }
            systempart(Control1000000030; MyNotes)
            {
            }
            systempart(Control1000000031; Links)
            {
            }
        }
    }

    actions
    {
    }
}
