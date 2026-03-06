#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59015 "Daily Work Ticket Card"
{
    SourceTable = "Dialy Work Ticket Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    Editable = DateofRequestEditable;
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = CommentsEditable;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = DepartmentEditable;
                }
                field("Closed by"; Rec."Closed by")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = DateClosedEditable;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part("Daily Work Ticket Lines"; "Daily Work Ticket Lines")
            {
                Editable = lines;
                SubPageLink = "Daily Work Ticket" = field("Daily Work Ticket");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Load transport Requests")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin

                    if TicketLines.FindLast then
                        EntryN := TicketLines.EntryNo;
                    DeleteExisting := false;
                    if not Confirm(Text0006, false) then
                        DeleteExisting := false
                    else
                        DeleteExisting := true;
                    TransportReq.Reset;
                    TransportReq.SetRange(TransportReq.Status, TransportReq.Status::Approved);
                    TransportReq.SetRange(TransportReq."Date of Trip", Rec."Date of Request");
                    TransportReq.SetRange("Driver Allocated", Rec."Driver Allocated");
                    TransportReq.SetRange("Loaded to WorkTicket", false);
                    if TransportReq.Find('-') then begin
                        repeat
                            //Check whether entry exists
                            TicketLines.Reset;
                            TicketLines.SetRange(TicketLines."Transport Requisition No", TransportReq."Transport Requisition No");
                            if TicketLines.Find('-') then begin
                                if TicketLines."Daily Work Ticket" <> Rec."Daily Work Ticket" then
                                    Error(Text0005, TicketLines."Transport Requisition No", Rec."Date of Request", TicketLines."Daily Work Ticket")
                                else begin
                                    if DeleteExisting then
                                        TicketLines.Delete;

                                end;
                            end;
                            //End Checking whether entry exists
                            EntryN += 1;

                            //Enter the Workticket lines
                            TicketLines2.Init;
                            TicketLines2."Daily Work Ticket" := Rec."Daily Work Ticket";
                            TicketLines2.EntryNo := EntryN;
                            TicketLines2."Transport Requisition No" := TransportReq."Transport Requisition No";
                            TicketLines2.Commencement := TransportReq.Commencement;
                            TicketLines2.Destination := TransportReq.Destination;
                            TicketLines2."Vehicle Allocated" := TransportReq."Vehicle Allocated";
                            TicketLines2."Driver Allocated" := TransportReq."Driver Allocated";
                            TicketLines2."Date of Request" := TransportReq."Date of Request";
                            TicketLines2."Opening Odometer Reading" := TransportReq."Opening Odometer Reading";
                            TicketLines2."Time out" := TransportReq."Time out";
                            TicketLines2."Time In" := TransportReq."Time In";
                            TicketLines2."Authorized By" := TransportReq."Authorized  By";
                            TicketLines2.Position := TransportReq.Position;
                            TicketLines2."Driver Name" := TransportReq."Driver Name";
                            //Only insert if doesn't exist
                            TicketLines.Reset;
                            TicketLines.SetRange(TicketLines."Transport Requisition No", TransportReq."Transport Requisition No");
                            if not TicketLines.Find('-') then
                                TicketLines2.Insert(true);
                            TransportReq."Loaded to WorkTicket" := true;
                            TransportReq."Work Ticket No" := Rec."Daily Work Ticket";
                            TransportReq.Modify;
                        until TransportReq.Next = 0;
                    end;
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin
                    //ApprovalMgt.SendDailyWorkticketApprovalRequest(Rec);
                    /*IF ApprovalsMgmt.CheckDailyWorkTicketApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.OnSendDailyWorkTicketForApproval(Rec);*/
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify;

                    Message('Document has been automatically Approved');

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin
                    //ApprovalMgt.CancelDailyWorkticketRequest(Rec,TRUE,TRUE);
                    //ApprovalsMgmt.OnCancelDailyWorkTicketApprovalRequest(Rec)
                    if (Rec.Status = Rec.Status::"Pending Approval") then begin
                        Rec.Status := Rec.Status::Cancelled;
                        Rec.Modify;
                        Message('Document approval request has been cancelled');
                    end else
                        Error('Status must be pending approval');
                end;
            }
            action("Close Work Ticket ")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin

                    if not Confirm(Text0002, false) then
                        Error(Text0003);

                    TicketLines.Reset;
                    TicketLines.SetRange(TicketLines."Daily Work Ticket", Rec."Daily Work Ticket");
                    if TicketLines.Find('-') then begin
                        repeat
                            //TicketLines.TESTFIELD("Opening Odometer Reading");
                            //TicketLines.TESTFIELD("Closing Odometer Reading");
                            if TransportReq.Get(TicketLines."Transport Requisition No") then begin
                                //changed status from closed to Approved by Morris.
                                TransportReq.Status := TransportReq.Status::Closed;
                                TransportReq."Time out" := TicketLines."Time out";
                                TransportReq."Time In" := TicketLines."Time In";
                                TransportReq."Opening Odometer Reading" := TicketLines."Opening Odometer Reading";
                                TransportReq."Closing Odometer Reading" := TicketLines."Closing Odometer Reading";
                                TransportReq."Work Ticket No" := TicketLines."Daily Work Ticket";
                                TransportReq.Modify;
                            end;
                        until TicketLines.Next = 0;
                        //UPDATE The Vehicle Details
                        //TESTFIELD("Closing Odometer");
                        WshpFA.Reset;
                        WshpFA.SetRange(WshpFA."Registration No.", Rec."Vehicle Allocated");
                        if WshpFA.Find('-') then begin
                            WshpFA."Current Reading" := Rec."Closing Odometer";
                            WshpFA.Modify;
                        end;
                        Rec.Status := Rec.Status::Closed;
                        Rec."Date Closed" := Today;
                        Rec."Closed by" := UserId;
                        Rec.Modify;
                    end;

                    Message(Text0004);
                end;
            }
            action("Print Work Ticket")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."Daily Work Ticket", Rec."Daily Work Ticket");
                    Report.Run(65016, true, true);
                    Rec.Reset;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        updatecontrols
    end;

    trigger OnClosePage()
    begin
        updatecontrols
    end;

    trigger OnInit()
    begin
        updatecontrols
    end;

    trigger OnOpenPage()
    begin
        updatecontrols
    end;

    var
        FltUserSetup: Record "User Setup";
        TicketLines: Record "Daily Work Ticket Lines";
        TransportReq: Record 59003;
        TicketLines2: Record "Daily Work Ticket Lines";
        DeleteExisting: Boolean;
        UserSetup: Record "User Setup";
        EntryN: Integer;
        WshpFA: Record 59017;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VehicleAllocatedEditable: Boolean;
        DriverAllocatedEditable: Boolean;
        DateofRequestEditable: Boolean;
        CommentsEditable: Boolean;
        DepartmentEditable: Boolean;
        DriverNameEditable: Boolean;
        ClosedbyEditable: Boolean;
        DateClosedEditable: Boolean;
        OpeningOdometerEditable: Boolean;
        ClosingOdometerEditable: Boolean;
        DateCreatedEditable: Boolean;
        TimeCreatedEditable: Boolean;
        "TotalKm'sCoveredEditable": Boolean;
        lines: Boolean;
        createdbyEditable: Boolean;
        Text0001: label 'You have no been setup as a Fleet Management User Contact your Systems Administrator';
        Text0002: label 'Are you sure you want to close work ticket?';
        Text0003: label 'Process Aborted';
        Text0004: label 'Process Completed';
        Text0005: label 'Transport Request No %1  which falls on the specified date %2 appears to be in another WorkTicket %3';
        Text0006: label 'Do you want to DELETE all Exisitng Ticket Lines';


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            VehicleAllocatedEditable := true;
            DriverAllocatedEditable := true;
            CommentsEditable := true;
            DateClosedEditable := true;
            DateofRequestEditable := true;
            DepartmentEditable := true;
            DriverNameEditable := false;
            ClosedbyEditable := false;
            OpeningOdometerEditable := true;
            ClosingOdometerEditable := false;
            DateCreatedEditable := true;
            TimeCreatedEditable := true;
            lines := true;
        end;
        if Rec.Status = Rec.Status::"Pending Approval" then begin
            VehicleAllocatedEditable := false;
            DriverAllocatedEditable := false;
            CommentsEditable := false;
            DateClosedEditable := false;
            DateofRequestEditable := false;
            DepartmentEditable := false;
            DriverNameEditable := false;
            ClosedbyEditable := false;
            OpeningOdometerEditable := false;
            ClosingOdometerEditable := false;
            DateCreatedEditable := false;
            TimeCreatedEditable := false;
            lines := false;

        end;
        if Rec.Status = Rec.Status::Approved then begin
            VehicleAllocatedEditable := false;
            DriverAllocatedEditable := false;
            CommentsEditable := false;
            DateClosedEditable := false;
            DateofRequestEditable := false;
            DepartmentEditable := false;
            DriverNameEditable := false;
            ClosedbyEditable := true;
            OpeningOdometerEditable := false;
            ClosingOdometerEditable := true;
            DateCreatedEditable := false;
            TimeCreatedEditable := false;
            lines := true;
        end;
        if Rec.Status = Rec.Status::Rejected then begin
            VehicleAllocatedEditable := false;
            DriverAllocatedEditable := false;
            CommentsEditable := false;
            DateClosedEditable := false;
            DateofRequestEditable := false;
            DepartmentEditable := false;
            DriverNameEditable := false;
            ClosedbyEditable := false;
            OpeningOdometerEditable := true;
            ClosingOdometerEditable := false;
            DateCreatedEditable := false;
            TimeCreatedEditable := false;
            lines := false;
        end;
        if Rec.Status = Rec.Status::Closed then begin
            VehicleAllocatedEditable := false;
            DriverAllocatedEditable := false;
            CommentsEditable := false;
            DateClosedEditable := false;
            DateofRequestEditable := false;
            DepartmentEditable := false;
            DriverNameEditable := false;
            ClosedbyEditable := false;
            OpeningOdometerEditable := true;
            ClosingOdometerEditable := false;
            DateCreatedEditable := false;
            TimeCreatedEditable := false;
            lines := false;
        end;
    end;
}
