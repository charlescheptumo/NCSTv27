#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56041 "Court Attendance Return Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Document registration";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Registration Entry No"; Rec."Registration Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Before Type"; Rec."Before Type")
                {
                    ApplicationArea = Basic;
                }
                field("Before Name"; Rec."Before Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prosecutor No."; Rec."Prosecutor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Court Attendance Date"; Rec."Court Attendance Date")
                {
                    ApplicationArea = Basic;
                }
                field("Start time"; Rec."Start time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit produced in court"; Rec."Exhibit produced in court")
                {
                    ApplicationArea = Basic;
                }
                field("Outcome of Proceedings"; Rec."Outcome of Proceedings")
                {
                    ApplicationArea = Basic;
                }
                field("Next Court Date"; Rec."Court Date")
                {
                    ApplicationArea = Basic;
                }
                field("Next Cause of Action"; Rec."Next Cause of Action")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Counsel"; Rec."Accused Counsel")
                {
                    ApplicationArea = Basic;
                }
                field("Intrested Party Counsel"; Rec."Intrested Party Counsel")
                {
                    ApplicationArea = Basic;
                }
                field("Nature Of Application"; Rec."Nature Of Application")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = Basic;
                }
                field("Court Rank"; Rec."Court Rank")
                {
                    ApplicationArea = Basic;
                }
                field("Court Station"; Rec."Court Station")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Name"; Rec."Accused Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
            }
            systempart(Control21; Links)
            {
            }
            systempart(Control22; Notes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.RegistrationType := Rec.Registrationtype::Return
    end;
}
