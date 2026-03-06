#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69228 "Training Bonding List"
{
    PageType = List;
    SourceTable = "Training Bonding Conditions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Bonding Code"; Rec."Training Bonding Code")
                {
                    ApplicationArea = Basic;
                }
                field("Condition Type"; Rec."Condition Type")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        HRTrainingNeeds.Reset;
                        if HRTrainingNeeds.Get(Rec."Training Bonding Code") then begin
                            HRTrainingNeeds.TestField(HRTrainingNeeds."Early Bonded Exit?", true);
                        end;
                    end;
                }
                field("Condition Description"; Rec."Condition Description")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Amount"; Rec."Minimum Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Amount"; Rec."Maximum Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Outlook)
            {
            }
            systempart(Control1000000009; Notes)
            {
            }
        }
    }

    actions
    {
    }

    var
        HRTrainingNeeds: Record "Training Needs";
}
