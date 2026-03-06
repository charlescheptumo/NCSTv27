#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51003 "Inspection Approval Entries"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Goods & Services Inspection";
    SourceTableView = sorting("No.", "User ID")
                      order(ascending)
                      where(Approved = filter(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Committee Role"; Rec."Committee Role")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Decision; Rec.Decision)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009; Notes)
            {
            }
            systempart(Control1000000010; MyNotes)
            {
            }
            systempart(Control1000000011; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Approve)
            {
                ApplicationArea = Basic;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;

                trigger OnAction()
                var
                    WarehouseInspection: Record "Goods & Services Inspection";
                begin

                    CurrPage.SetSelectionFilter(WarehouseInspection);
                    WarehouseInspection.MarkedOnly(true);
                    if WarehouseInspection.FindSet then begin
                        if WarehouseInspection."User ID" <> UserId then
                            Error('Document %1 can only be Approved by %2, Please check!', WarehouseInspection."No.", WarehouseInspection."User ID");
                        WarehouseInspection.TestField(WarehouseInspection.Comments);
                        WarehouseInspection.Approved := true;
                        WarehouseInspection."Date-Time Sent for Approval" := CurrentDatetime;
                        WarehouseInspection.Decision := WarehouseInspection.Decision::Approved;
                        WarehouseInspection.Modify;
                    end;
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;

                trigger OnAction()
                var
                    WarehouseInspection: Record "Goods & Services Inspection";
                begin
                    CurrPage.SetSelectionFilter(WarehouseInspection);
                    WarehouseInspection.MarkedOnly(true);

                    if WarehouseInspection.FindSet then begin
                        if WarehouseInspection."User ID" <> UserId then
                            Error('Document %1 can only be Approved by %2, Please check!', WarehouseInspection."No.", WarehouseInspection."User ID");
                        WarehouseInspection.TestField(WarehouseInspection.Comments);
                        WarehouseInspection.Approved := true;
                        WarehouseInspection."Date-Time Sent for Approval" := CurrentDatetime;
                        WarehouseInspection.Decision := WarehouseInspection.Decision::Rejected;
                        WarehouseInspection.Modify;

                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Usersetup.Get(UserId) then
            if not Usersetup."Approval Administrator" then begin
                Rec.FilterGroup(2);
                Rec.SetCurrentkey(Rec."User ID");
                Rec.SetFilter(Rec."User ID", '=%1', Usersetup."User ID");
                Rec.FilterGroup(0);
            end;
    end;

    var
        Usersetup: Record "User Setup";
}
