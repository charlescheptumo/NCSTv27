#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56051 "Authentication Application"
{
    ApplicationArea = Basic;
    CardPageID = "Authentication Card";
    PageType = List;
    SourceTable = "Authentication Device Applicat";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Applicant No."; Rec."Applicant No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Works"; Rec."Copyright Works")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Name"; Rec."Applicant Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Copyright Title"; Rec."Copyright Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Authentication Item"; Rec."Authentication Item")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Authentication Description"; Rec."Authentication Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount Due"; Rec."Amount Due")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Minimum Quantity"; Rec."Minimum Quantity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("Captured by"; Rec."Captured by")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}
