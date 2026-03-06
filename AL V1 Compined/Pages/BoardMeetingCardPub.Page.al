#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55010 "Board Meeting Card Pub"
{
    Caption = 'Published Board Meeting Card ';
    PageType = Card;
    SourceTable = "Board Meetings1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref No.';
                    Editable = false;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref. No:';
                    MultiLine = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Category';
                    Visible = false;
                }
                field("Type of Meeting"; Rec."Type of Meeting")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Type"; Rec."Meeting Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Date';
                }
                field("Start time"; Rec."Start time")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("End time"; Rec."End time")
                {
                    ApplicationArea = Basic;
                }
                field("Venue/Location"; Rec."Venue/Location")
                {
                    ApplicationArea = Basic;
                }
                field("Conference Venue"; Rec."Conference Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Tel. No"; Rec."Contact Tel. No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Status"; Rec."Meeting Status")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Parking Arrangement"; Rec."Parking Arrangement")
                {
                    ApplicationArea = Basic;
                    Caption = 'Logistics Arrangements';
                }
                field("Access requirement"; Rec."Access requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Convened by"; Rec."Convened by")
                {
                    ApplicationArea = Basic;
                    Caption = 'Convened by:';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control3; "Agenda Lines")
            {
                Caption = 'Agenda Information';
                SubPageLink = "Board Meeting No" = field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control1; Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup24)
            {
                action("Board Meeting Attendance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Attendance';
                    Image = Absence;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting Attendance";
                    RunPageLink = "Meeting Code" = field(No);
                }
                action("Meeting Agenda")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Agenda';
                    Image = Agreement;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Meeting Agenda";
                    RunPageLink = Description = field(No);
                    Visible = false;
                }
                action("In Attendance")
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting In-Attendance";
                }
                action("Meeting Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Comments';
                    Image = NewSum;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting Comments";
                    RunPageLink = "Meeting Code" = field(No);
                }
            }
            group(ActionGroup40)
            {
                action("<Cancel Meeting>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Meeting';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                }
                action("<Complete Meeting>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Complete Meeting';
                    Image = Route;
                    Promoted = true;
                    PromotedIsBig = true;
                }
                group(ActionGroup43)
                {
                }
                action("Cancel Meeting")
                {
                    ApplicationArea = Basic;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to cancel meeting No. ' + Rec.No + ' ?') = true then begin
                            if Boardmeetings1.Get(Rec.No) then begin
                                Boardmeetings1."Cancelled By" := UserId;
                                Boardmeetings1."Date Cancelled" := Today;
                                Boardmeetings1."Time Cancelled" := Time;
                                Boardmeetings1.Status := Boardmeetings1.Status::Cancelled;
                                Boardmeetings1.Modify;
                                Message('Cancelled Successfully');
                            end;
                        end;
                    end;
                }
                action("Completed Meeting")
                {
                    ApplicationArea = Basic;
                    Image = CheckList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        if Confirm('Are you sure you want to complete meeting No. ' + Rec.No + ' ?') = true then begin
                            if Boardmeetings1.Get(Rec.No) then begin
                                Boardmeetings1."Completed By" := UserId;
                                Boardmeetings1."Date Completed" := Today;
                                Boardmeetings1."Time Completed" := Time;
                                Boardmeetings1.Status := Boardmeetings1.Status::Completed;
                                Boardmeetings1.Modify;
                                Message('Completed successfully');
                            end;
                        end;
                    end;
                }
                action("Reschedule Meeting")
                {
                    ApplicationArea = Basic;
                    Image = ChangeTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Reschedule Board Meetings";
                    RunPageLink = No = field(No),
                                  "Venue/Location" = field("Venue/Location"),
                                  "Convened by" = field("Convened by"),
                                  "Contact Tel. No" = field("Contact Tel. No"),
                                  "Meeting group Code" = field("Meeting group Code"),
                                  "Meeting group" = field("Meeting group");
                }
            }
        }
    }

    var
        isCanceled: Boolean;
        Boardmeetings1: Record "Board Meetings1";
}
