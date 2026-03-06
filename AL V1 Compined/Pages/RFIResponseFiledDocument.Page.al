#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75050 "RFI Response Filed Document"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "RFI Response Filed Document";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filed"; Rec."Date Filed")
                {
                    ApplicationArea = Basic;
                }
                field("Document Link"; Rec."Document Link")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Document Type ID"; Rec."Procurement Document Type ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Description"; Rec."Document Description")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate No."; Rec."Certificate No.")
                {
                    ApplicationArea = Basic;
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Process"; Rec."Procurement Process")
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
