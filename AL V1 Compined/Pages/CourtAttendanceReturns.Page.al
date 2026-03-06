#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56040 "Court Attendance Returns"
{
    ApplicationArea = Basic;
    CardPageID = "Court Attendance Return Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Document registration";
    SourceTableView = where(RegistrationType = const(Return));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Registration Entry No"; Rec."Registration Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Next Court Date"; Rec."Court Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prosecutor No."; Rec."Prosecutor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Next Cause of Action"; Rec."Next Cause of Action")
                {
                    ApplicationArea = Basic;
                }
                field("Court Attendance Date"; Rec."Court Attendance Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Court Attendance Date';
                }
                field("Start time"; Rec."Start time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time"; Rec."End Time")
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
            systempart(Control21; Notes)
            {
            }
            systempart(Control22; Links)
            {
            }
        }
    }

    actions
    {
    }
}
