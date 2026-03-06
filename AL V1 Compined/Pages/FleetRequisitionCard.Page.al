#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59012 "Fleet Requisition Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Transport Requisition";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(From; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                    Editable = CommencementEditable;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    Editable = DensitationEditable;
                }
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = VehicleEditable;
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = DriverEditable;
                    LookupPageID = "Fleet Drivers List";
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = DriverNameEditable;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    Editable = Requestedby;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Editable = PositionEditable;
                }
                field("Vehicle Allocated by"; Rec."Vehicle Allocated by")
                {
                    ApplicationArea = Basic;
                    Editable = allocatedbyEditable;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = DepartmentEditable;
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    Editable = DaterequestedEditable;
                }
                field("Time Requested"; Rec."Time Requested")
                {
                    ApplicationArea = Basic;
                    Editable = TimeRequestedEditable;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = DateofTripEditable;
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    Editable = TimeoutEditable;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    Editable = TimeInEditable;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    Editable = JourneyEditable;
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = openingMileageEditable;
                    Visible = false;
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = closingMileageEditable;
                    Visible = false;
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                    Editable = NoofDaysEditable;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Loaded to WorkTicket"; Rec."Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                    Editable = loadedEditable;
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    Editable = workticketEditable;
                    LookupPageID = "Daily Work Ticket List";
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                }
                field("Added On"; Rec."Added On")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Purpose)
            {
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = purposeEditable;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Capacity';
                    Editable = commentsEditable;
                }
            }
            part("Transport Requisition Staff"; "Travel Requisition Staff")
            {
                Editable = line;
                SubPageLink = "Req No" = field("Transport Requisition No");
                Visible = false;
            }
            systempart(Control10; Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Open);
                    Rec.TestField(Rec.Commencement);
                    Rec.TestField(Rec.Destination);
                    Rec.TestField(Rec."Date of Trip");
                    Rec.TestField(Rec."Purpose of Trip");

                    //cc//if ApprovalsMgmt.CheckFleetApprovalsWorkflowEnabled(Rec) then
                    //cc//ApprovalsMgmt.OnSendFleetForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::"Pending Approval" then
           ;             //ApprovalsMgmt.OnCancelFleetApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Send SMS to Driver")
            {
                ApplicationArea = Basic;
                Image = Start;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*IF Status<>Status::Approved THEN BEGIN
                    ERROR('The status must be approved for you to notify the driver');
                    END ELSE BEGIN

                   SMSMessages.RESET;
                   IF SMSMessages.FIND('+') THEN BEGIN
                   iEntryNo:=SMSMessages."Entry No";
                   iEntryNo:=iEntryNo+1;
                   END ELSE BEGIN
                   iEntryNo:=1;
                   END;

                   SMSMessages.INIT;
                   SMSMessages."Com:=iEntryNo;
                   SMSMessages."Global Dimension 2":="Transport Requisition No";
                   SMSMessages.Account:=TODAY;
                   SMSMessages."Committed Amount":=TIME;
                   SMSMessages."Commitment Date":='DRIVERNOT';
                   SMSMessages.User:=USERID;
                   SMSMessages."Account Name":=TRUE;
                   SMSMessages."Account No.":="Transport Requisition No";
                   SMSMessages.InvoiceNo:=SMSMessages.InvoiceNo::"0";
                   SMSMessages."Document No":='Dear '+"Driver Name"+' you have a job to '+Destination+' on '+FORMAT("Date of Trip")+' at '+FORMAT("Time Requested");
                   IF HR.GET("Driver Allocated") THEN BEGIN
                   IF HR."Cellular Phone Number"<> '' THEN
                   SMSMessages."Commitment Type":=HR."Cellular Phone Number";
                   END;
                   SMSMessages.INSERT;

                   END;
                   */

                    Message('SMS Message sent succesfully');

                end;
            }
            group("&Customer")
            {
                Caption = '&Customer';
                Image = Customer;
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Customer),
                                  "No." = field("No. Series");
                    ToolTip = 'View or add comments for the record.';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols();
    end;

    var
        TransportReqEditable: Boolean;
        CommencementEditable: Boolean;
        DensitationEditable: Boolean;
        VehicleEditable: Boolean;
        DriverEditable: Boolean;
        DriverNameEditable: Boolean;
        allocatedbyEditable: Boolean;
        DepartmentEditable: Boolean;
        DaterequestedEditable: Boolean;
        TimeRequestedEditable: Boolean;
        DateofTripEditable: Boolean;
        TimeoutEditable: Boolean;
        TimeInEditable: Boolean;
        JourneyEditable: Boolean;
        openingMileageEditable: Boolean;
        closingMileageEditable: Boolean;
        NoofDaysEditable: Boolean;
        loadedEditable: Boolean;
        workticketEditable: Boolean;
        purposeEditable: Boolean;
        authorisedEditable: Boolean;
        lines: Record "Travel Requisition Staff";
        line: Boolean;
        Requestedby: Boolean;
        PositionEditable: Boolean;
        commentsEditable: Boolean;
        RespEditable: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SMSMessages: Record "Committment Entries";
        iEntryNo: Integer;
        HR: Record Employee;


    procedure updatecontrols()
    begin

        if Rec.Status = Rec.Status::Open then begin
            TransportReqEditable := false;
            CommencementEditable := true;
            DensitationEditable := true;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := false;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := false;
            workticketEditable := false;
            DaterequestedEditable := true;
            TimeRequestedEditable := true;
            DateofTripEditable := true;
            TimeoutEditable := true;
            JourneyEditable := true;
            openingMileageEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            Requestedby := true;
            PositionEditable := true;
            authorisedEditable := false;
            line := true;
            commentsEditable := true;
            RespEditable := true;
        end else
            if Rec.Status = Rec.Status::"Pending Approval" then begin
                TransportReqEditable := false;
                CommencementEditable := false;
                DensitationEditable := false;
                VehicleEditable := true;
                DriverEditable := true;
                allocatedbyEditable := true;
                closingMileageEditable := false;
                DriverNameEditable := true;
                DepartmentEditable := false;
                loadedEditable := false;
                workticketEditable := false;
                DaterequestedEditable := false;
                TimeRequestedEditable := false;
                DateofTripEditable := false;
                TimeoutEditable := false;
                JourneyEditable := false;
                openingMileageEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                authorisedEditable := false;
                Requestedby := false;
                PositionEditable := false;
                commentsEditable := false;
                RespEditable := false;
                line := false;
            end else
                if Rec.Status = Rec.Status::Approved then begin
                    TransportReqEditable := false;
                    CommencementEditable := false;
                    DensitationEditable := false;
                    VehicleEditable := true;
                    DriverEditable := true;
                    allocatedbyEditable := false;
                    closingMileageEditable := true;
                    DriverNameEditable := false;
                    DepartmentEditable := false;
                    loadedEditable := false;
                    workticketEditable := false;
                    DaterequestedEditable := false;
                    TimeRequestedEditable := false;
                    DateofTripEditable := false;
                    TimeoutEditable := false;
                    TimeInEditable := true;
                    JourneyEditable := false;
                    openingMileageEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    authorisedEditable := false;
                    Requestedby := false;
                    PositionEditable := false;
                    commentsEditable := false;
                    RespEditable := false;

                    line := false;
                end else

                    if Rec.Status = Rec.Status::Rejected then begin
                        TransportReqEditable := false;
                        CommencementEditable := false;
                        DensitationEditable := false;
                        VehicleEditable := false;
                        DriverEditable := false;
                        allocatedbyEditable := false;
                        closingMileageEditable := false;
                        DriverNameEditable := false;
                        DepartmentEditable := false;
                        loadedEditable := false;
                        workticketEditable := false;
                        DaterequestedEditable := false;
                        TimeRequestedEditable := false;
                        DateofTripEditable := false;
                        TimeoutEditable := false;
                        TimeInEditable := false;
                        JourneyEditable := false;
                        openingMileageEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        authorisedEditable := false;
                        line := false;
                        Requestedby := false;
                        PositionEditable := false;
                        commentsEditable := false;
                        RespEditable := false;
                    end
    end;
}
