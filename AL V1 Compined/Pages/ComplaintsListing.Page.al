#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56035 "Complaints Listing"
{
    ApplicationArea = Basic;
    CardPageID = "Complaints Card Page";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Complaints Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Complain ID"; Rec."Complain ID")
                {
                    ApplicationArea = Basic;
                }
                field("Complaint Type"; Rec."Complaint Type")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Name"; Rec."Complainant Name")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Phone No"; Rec."Complainant Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Investigating Officer"; Rec."Investigating Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Investigating officer  Name"; Rec."Investigating officer  Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Action"; Rec.Action)
                {
                    ApplicationArea = Basic;
                }
                field(Responsiblity; Rec.Responsiblity)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Expected Resolution Date"; Rec."Expected Resolution Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Resolution Date"; Rec."Actual Resolution Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
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
                field("Case file No"; Rec."Case file No")
                {
                    ApplicationArea = Basic;
                }
                field("Case description"; Rec."Case description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control24; Outlook)
            {
            }
            systempart(Control25; Notes)
            {
            }
            systempart(Control26; Links)
            {
            }
        }
    }

    actions
    {
    }
}
