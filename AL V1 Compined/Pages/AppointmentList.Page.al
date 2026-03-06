#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70047 "Appointment List"
{
    ApplicationArea = Basic;
    CardPageID = "Commitee Creation";
    Editable = false;
    PageType = List;
    SourceTable = "Tender Commitee Appointment1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Appointment No"; Rec."Appointment No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender/Quotation No"; Rec."Tender/Quotation No")
                {
                    ApplicationArea = Basic;
                }
                field("Committee ID"; Rec."Committee ID")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Name"; Rec."Committee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
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
