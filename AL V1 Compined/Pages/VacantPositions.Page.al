#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69114 "Vacant Positions"
{
    ApplicationArea = Basic;
    CardPageID = Position;
    Editable = false;
    PageType = List;
    SourceTable = "Company Jobs";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = Basic;
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    ApplicationArea = Basic;
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Links)
            {
            }
            systempart(Control1000000009; Notes)
            {
            }
            systempart(Control1000000010; Outlook)
            {
            }
            systempart(Control1000000011; MyNotes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin

        Rec.Reset;
        if Rec.Find('-') then begin
            repeat
                Rec.CalcFields(Rec."Occupied Positions");
                // MESSAGE('%1',"Occupied Position");
                Rec."Vacant Positions" := Rec."No of Posts" - Rec."Occupied Positions";
                Rec.Modify;
            until Rec.Next = 0;
        end;
        Rec.Reset;
        Rec.SetCurrentkey(Rec."Vacant Positions");
        Rec.SetFilter(Rec."Vacant Positions", '>%1', 0);
    end;
}
