#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75218 "EOI Response List"
{
    ApplicationArea = Basic;
    CardPageID = "EOI Response Card";
    PageType = List;
    SourceTable = "RFI Response";
    SourceTableView = where("Document Type" = const("EOI Response"));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Representative Name"; Rec."Vendor Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Repr Designation"; Rec."Vendor Repr Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address 2"; Rec."Vendor Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Vendor"; Rec."Special Group Vendor")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Category"; Rec."Special Group Category")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Score"; Rec."Final Evaluation Score")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Date Submitted"; Rec."Date Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
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
