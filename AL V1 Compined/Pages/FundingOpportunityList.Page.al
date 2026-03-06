#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65043 "Funding Opportunity List"
{
    ApplicationArea = Basic;
    Caption = 'Funding Opportunity Announcement List';
    CardPageID = "Funding Opportunity Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Funding Opportunity";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Call No."; Rec."Call No.")
                {
                    ApplicationArea = Basic;
                }
                field("Organization ID"; Rec."Organization ID")
                {
                    ApplicationArea = Basic;
                }
                field("Issuing Organization"; Rec."Issuing Organization")
                {
                    ApplicationArea = Basic;
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                }
                field("External Announcement No"; Rec."External Announcement No")
                {
                    ApplicationArea = Basic;
                }
                field("Release Date"; Rec."Release Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Due Date"; Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application date"; Rec."Application date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Home Page"; Rec."Home Page")
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
}
