#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59020 "Pending Requisition Card"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Transport Requisition";
    SourceTableView = where(Status = filter("Pending Approval"));
    ApplicationArea = All;

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
                field(Commencement; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Allocated by"; Rec."Vehicle Allocated by")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Loaded to WorkTicket"; Rec."Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                }
                field("Time Requested"; Rec."Time Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Authorized  By"; Rec."Authorized  By")
                {
                    ApplicationArea = Basic;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Purpose)
            {
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Capacity';
                }
            }
            part("Transport Requisition Staff"; "Travel Requisition Staff")
            {
                SubPageLink = "Req No" = field("Transport Requisition No");
            }
        }
    }

    actions
    {
    }

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


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            TransportReqEditable := false;
            CommencementEditable := true;
            DensitationEditable := true;
            VehicleEditable := true;
            DriverEditable := true;
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
            authorisedEditable := false;
            line := true;
        end;
        if Rec.Status = Rec.Status::"Pending Approval" then begin
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
            JourneyEditable := false;
            openingMileageEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            authorisedEditable := false;
        end;
        if Rec.Status = Rec.Status::Approved then begin
            TransportReqEditable := false;
            CommencementEditable := false;
            DensitationEditable := false;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := false;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := true;
            workticketEditable := true;
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
            line := false;
        end;

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
            JourneyEditable := false;
            openingMileageEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            NoofDaysEditable := false;
            purposeEditable := false;
            authorisedEditable := false;
            line := false;
        end
    end;
}
