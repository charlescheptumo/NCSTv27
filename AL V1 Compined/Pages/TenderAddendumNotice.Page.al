#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75245 "Tender Addendum Notice"
{
    ApplicationArea = Basic;
    CardPageID = "Tender Addendum Notice Card";
    Editable = false;
    PageType = List;
    SourceTable = "Tender Addendum Notice";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Addendum Notice No."; Rec."Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice No."; Rec."Invitation Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Addendum Instructions"; Rec."Addendum Instructions")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Addendum Type ID"; Rec."Primary Addendum Type ID")
                {
                    ApplicationArea = Basic;
                }
                field("Addendum Type Description"; Rec."Addendum Type Description")
                {
                    ApplicationArea = Basic;
                }
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("New Submission Start Date"; Rec."New Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission Start Date"; Rec."Original Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("New Submission Start Time"; Rec."New Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission Start Time"; Rec."Original Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("New Submission End Date"; Rec."New Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission End Date"; Rec."Original Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("New Submission End Time"; Rec."New Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Submission End Time"; Rec."Original Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Bid Opening Date"; Rec."Original Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("New Bid Opening Date"; Rec."New Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Bid Opening Time"; Rec."Original Bid Opening Time")
                {
                    ApplicationArea = Basic;
                }
                field("New Bid Opening Time"; Rec."New Bid Opening Time")
                {
                    ApplicationArea = Basic;
                }
                field("Original Prebid Meeting Date"; Rec."Original Prebid Meeting Date")
                {
                    ApplicationArea = Basic;
                }
                field("New Prebid Meeting Date"; Rec."New Prebid Meeting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
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
