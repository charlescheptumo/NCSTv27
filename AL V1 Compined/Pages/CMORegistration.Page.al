#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56056 "CMO Registration"
{
    PageType = Card;
    SourceTable = "CMO Registration";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Name of society"; Rec."Name of society")
                {
                    ApplicationArea = Basic;
                }
                field("Address of society"; Rec."Address of society")
                {
                    ApplicationArea = Basic;
                }
                field("Physical address"; Rec."Physical address")
                {
                    ApplicationArea = Basic;
                }
                field("Name of Agent"; Rec."Name of Agent")
                {
                    ApplicationArea = Basic;
                }
                field("Address of agent"; Rec."Address of agent")
                {
                    ApplicationArea = Basic;
                }
                field("Date of registration"; Rec."Date of registration")
                {
                    ApplicationArea = Basic;
                }
                field("Number of registration"; Rec."Number of registration")
                {
                    ApplicationArea = Basic;
                }
                field("Number of members"; Rec."Number of members")
                {
                    ApplicationArea = Basic;
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = Basic;
                }
                field("Reasons for making the request"; Rec."Reasons for making the request")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Time"; Rec."Submission Time")
                {
                    ApplicationArea = Basic;
                }
                field("Submitted By"; Rec."Submitted By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22; Notes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Registration;
    end;
}
