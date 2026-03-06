#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56074 "ICT Helpdesk Status List"
{
    Caption = 'ICT Helpdesk Status';
    CardPageID = "ICT Helpdesk Historyyy";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "ICT Helpdesk";

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

    trigger OnAfterGetCurrRecord()
    begin
        Rec.SetFilter(Rec.Status, '<>%1', Rec.Status::" ");
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.SetFilter(Rec.Status, '<>%1', Rec.Status::" ");
    end;

    trigger OnOpenPage()
    begin
        //SETFILTER("Requesting Officer",UPPERCASE(USERID));
        Rec.SetFilter(Rec.Status, '<>%1', Rec.Status::" ");
    end;
}
