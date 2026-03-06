#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75064 "Closed IFP"
{
    CardPageID = "IFP Card";
    PageType = List;
    SourceTable = "Request For Information";
    SourceTableView = where("Document Type" = const("Invitation For Prequalification"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Summary"; Rec."Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Target Vendor Cluster"; Rec."Primary Target Vendor Cluster")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Period Start Date"; Rec."Period Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Period End Date"; Rec."Period End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Box Location Code"; Rec."Tender Box Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Charge Code"; Rec."Prequalification Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Date"; Rec."Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Time"; Rec."Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Time"; Rec."Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submission"; Rec."No. of Submission")
                {
                    ApplicationArea = Basic;
                }
                field("Enforce Mandatory E-Receipt"; Rec."Enforce Mandatory E-Receipt")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Document Template"; Rec."Procurement Document Template")
                {
                    ApplicationArea = Basic;
                }
                field("Display Scoring Criteria Vendo"; Rec."Display Scoring Criteria Vendo")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Scoring Template"; Rec."RFI Scoring Template")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field("Summarized Terms & Conditions"; Rec."Summarized Terms & Conditions")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control42; Outlook)
            {
            }
            systempart(Control43; Notes)
            {
            }
            systempart(Control44; MyNotes)
            {
            }
            systempart(Control45; Links)
            {
            }
        }
    }

    actions
    {
    }
}
