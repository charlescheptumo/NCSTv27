#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56038 "Case File Card"
{
    PageType = Card;
    SourceTable = "Case File";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Court Case no"; Rec."Court Case no")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = Basic;
                }
                field("Case Brief"; Rec."Case Brief")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Year of the Case"; Rec."Year of the Case")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Name"; Rec."Accused Name")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Address"; Rec."Accused Address")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Phone No"; Rec."Accused Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Name"; Rec."Complainant Name")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Address"; Rec."Complainant Address")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Phone No"; Rec."Complainant Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Court Station"; Rec."Court Station")
                {
                    ApplicationArea = Basic;
                }
                field("Court Rank"; Rec."Court Rank")
                {
                    ApplicationArea = Basic;
                }
                field("Main Investigator No"; Rec."Main Investigator No")
                {
                    ApplicationArea = Basic;
                }
                field("Main Investigator Name"; Rec."Main Investigator Name")
                {
                    ApplicationArea = Basic;
                }
                field("Arresting Officer No"; Rec."Arresting Officer No")
                {
                    ApplicationArea = Basic;
                }
                field("Arresting Officer Name"; Rec."Arresting Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Case Types"; Rec."Case Types")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit No"; Rec."Exhibit No")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit Details"; Rec."Exhibit Details")
                {
                    ApplicationArea = Basic;
                }
                field("Current Case File Location"; Rec."Current Case File Location")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Offence"; Rec."Nature of Offence")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of cause of action"; Rec."Nature of cause of action")
                {
                    ApplicationArea = Basic;
                }
                field("Case Outcome"; Rec."Case Outcome")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit Disposed"; Rec."Exhibit Disposed")
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
            group(Payments)
            {
                Caption = 'Payments';
                field("Decretal Amount"; Rec."Decretal Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Amount"; Rec."Awarded Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Amount"; Rec."Payment Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control31; Outlook)
            {
            }
            systempart(Control32; Notes)
            {
            }
            systempart(Control33; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Investigators)
            {
                ApplicationArea = Basic;
                Caption = 'Investigators';
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Investigators Listing";
                RunPageLink = "Case No" = field("Case ID");
            }
            action(Witnesses)
            {
                ApplicationArea = Basic;
                Caption = 'Witnesses';
                Image = PostingEntries;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page Witnesses;
                RunPageLink = "Case No" = field("Case ID");
            }
            action("Registered Documents")
            {
                ApplicationArea = Basic;
                Caption = 'Registered Documents';
                Image = Database;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Document Registration List";
                RunPageLink = "Case ID" = field("Case ID");
            }
        }
    }
}
