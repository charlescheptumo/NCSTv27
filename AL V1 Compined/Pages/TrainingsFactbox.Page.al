#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69222 "Trainings Factbox"
{
    PageType = CardPart;
    SourceTable = "Training Requests";

    layout
    {
        area(content)
        {
            group(Control1102755018)
            {
                label(Control1102755019)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text1;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Duration Units"; Rec."Duration Units")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        Text1: label 'Training Details';
        // Text2: ;
        // Text3: ;
}

