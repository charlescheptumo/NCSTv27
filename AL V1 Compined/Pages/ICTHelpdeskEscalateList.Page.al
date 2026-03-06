#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56118 "ICT Helpdesk Escalate List"
{
    ApplicationArea = Basic;
    Caption = 'ICT Helpdesk Attend';
    CardPageID = "ICT Helpdesk Escalated";
    PageType = List;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Escalated));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Physical Station"; Rec."Physical Station")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Service"; Rec."Nature of Service")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Attended By"; Rec."Attended By")
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

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Rec."Assigned To", UpperCase(UserId));
    end;
}
