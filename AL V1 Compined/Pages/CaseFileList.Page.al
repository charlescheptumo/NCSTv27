#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56037 "Case File List"
{
    ApplicationArea = Basic;
    CardPageID = "Case File Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Case File";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("Main Investigator No"; Rec."Main Investigator No")
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Case Types"; Rec."Case Types")
                {
                    ApplicationArea = Basic;
                }
                field("Court Rank"; Rec."Court Rank")
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
                field("Case No"; Rec."Case No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Removed"; Rec."Date Removed")
                {
                    ApplicationArea = Basic;
                }
                field("Date brought back"; Rec."Date brought back")
                {
                    ApplicationArea = Basic;
                }
                field("Final Disposal Date"; Rec."Final Disposal Date")
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
            }
        }
    }

    actions
    {
    }
}
