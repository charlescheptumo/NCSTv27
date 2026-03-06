#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56019 "Copyright Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Copyright Setup";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Applicant Nos"; Rec."Applicant Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Complains Nos"; Rec."Complains Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Case Nos"; Rec."Case Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Court Attendance Nos"; Rec."Court Attendance Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Case File Movement Nos"; Rec."Case File Movement Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Document Registration Nos"; Rec."Document Registration Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Registration Nos."; Rec."Copyright Registration Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("CMO Registration Nos"; Rec."CMO Registration Nos")
                {
                    ApplicationArea = Basic;
                }
                field("CMO Renewal Nos"; Rec."CMO Renewal Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Memo Nos"; Rec."Internal Memo Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Customer FeedBack Nos"; Rec."Customer FeedBack Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Visitor Pass Nos"; Rec."Visitor Pass Nos")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Authentication Devices")
            {
                Caption = 'Authentication Devices';
                field("Authentication Nos"; Rec."Authentication Nos")
                {
                    ApplicationArea = Basic;
                }
                field("APSD Minimum Quantity"; Rec."APSD Minimum Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("APSD Default Unit Price"; Rec."APSD Default Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field("Default APSD Item"; Rec."Default APSD Item")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                field("Copyright Amount"; Rec."Copyright Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus Posting Group"; Rec."Gen. Bus Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Authorization)
            {
                Caption = 'Authorization';
                field("user id"; Rec."user id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Authorizing User Id';
                }
            }
        }
    }

    actions
    {
    }
}
