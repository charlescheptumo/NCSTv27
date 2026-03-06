#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59132 "Assigned File List"
{
    ApplicationArea = Basic;
    CardPageID = "File Receiving Card";
    Editable = false;
    PageType = List;
    SourceTable = "File Receiving Header";
    SourceTableView = where(Status = const(Assigned));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Received From/Sent To"; Rec."Received From/Sent To")
                {
                    ApplicationArea = Basic;
                }
                field("Existing File"; Rec."Existing File")
                {
                    ApplicationArea = Basic;
                }
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                }
                field("Folio No"; Rec."Folio No")
                {
                    ApplicationArea = Basic;
                }
                field("Folio Name"; Rec."Folio Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned To Name"; Rec."Assigned To Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned to Employee No"; Rec."Assigned to Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Employee Email"; Rec."Assigned Employee Email")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
            }
            systempart(Control21; Notes)
            {
            }
            systempart(Control22; MyNotes)
            {
            }
            systempart(Control23; Links)
            {
            }
        }
    }

    actions
    {
    }
}
