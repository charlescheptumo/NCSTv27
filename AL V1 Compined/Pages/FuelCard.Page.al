#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59028 "Fuel Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel Card";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Vehicles List";
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Allocated Limit"; Rec."Total Allocated Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    LookupPageID = "Limit Types";
                }
                field("Total Amount Spend"; Rec."Total Amount Spend")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Balance"; Rec."Total Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Allocated vehicle Limit"; Rec."Allocated vehicle Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amt Spend per Vehicle"; Rec."Total Amt Spend per Vehicle")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Vehicle Balance"; Rec."Vehicle Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field(lowerlimit; Rec.lowerlimit)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000015; "Fuel Card Lines")
            {
                SubPageLink = "No." = field(No);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Request Approval")
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Open then
                        Error('Status must be open');
                    //ApprovalMgt.SendFuelCardApprovalRequest(Rec)
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify;
                    Message('Document Approved Successfully');
                end;
            }
            action("Cancel  Request Approval")
            {
                ApplicationArea = Basic;
                Image = approval;
                Promoted = true;

                trigger OnAction()
                begin
                    //ApprovalMgt.CancelFuelCardRequest(Rec,TRUE,TRUE);
                end;
            }
            action("Fuel Post")
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Approval Status MUST be Approved');

                    if Rec.Posted = true then
                        Error('This Fuel Card Record is Already Posted %1', Rec.No);
                    //check if amount to be posted is greator than allocated amount.
                    Rec.CalcFields(Rec.check);
                    CheckLimit := Rec."Total Amount Spend" + Rec.check;
                    if CheckLimit > Rec."Total Allocated Limit" then
                        Error('You are not allowed to post Reciept amount(s) that is greater than amount allocated');
                    //check if lower lower limit has been exceeded.
                    if Rec."Total Balance" < Rec.lowerlimit then
                        Message('Remaining balance is%1,Please reoder,your limit of Ksh. %2,has been passed', Rec."Total Balance", Rec.lowerlimit);
                    //Check if vehicle limit has been exceeded.
                    lowercheck := Rec."Total Amt Spend per Vehicle" + Rec.check;
                    if lowercheck > Rec."Allocated vehicle Limit" then begin
                        if Confirm('The amount spend for this vehicle is more than allocated amount,Do you still want to Post?', true) = false then
                            exit;
                    end;
                    //enter data to Detailed ledger entry table
                    FuelCard.Reset;
                    FuelCard.SetRange(FuelCard.No, Rec.No);
                    if FuelCard.Find('-') then begin
                        FuelCardLines.Reset;
                        FuelCardLines.SetRange(FuelCardLines."No.", Rec.No);
                        if FuelCardLines.Find('-') then
                            repeat
                                DetailedFD.Init;
                                DetailedFD.Line := DetailedFD.Line + 1;
                                DetailedFD.No := FuelCardLines."No.";
                                DetailedFD."Reciept No" := FuelCardLines."Reciept No";
                                DetailedFD.Amount := FuelCardLines.Amount;
                                DetailedFD."Date of Filling" := FuelCardLines."Date of Filling";
                                DetailedFD."Date of posting" := Today;
                                DetailedFD.Driver := FuelCardLines.Driver;
                                DetailedFD."Driver Names" := FuelCardLines."Driver Names";
                                DetailedFD.RegNo := FuelCardLines."Vehicle RegNo";
                                DetailedFD.Make := FuelCardLines."vehicle Make";
                                DetailedFD.Posted := true;
                                if DetailedFD.Amount <> 0 then
                                    DetailedFD.Insert;
                            until FuelCardLines.Next = 0;
                        Rec.Posted := true;
                        Message('Fuel card record posted successfully');
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec.CalcFields(Rec."Total Amount Spend");
        Rec."Total Balance" := Rec."Total Allocated Limit" - Rec."Total Amount Spend";
        Rec.CalcFields(Rec."Total Amt Spend per Vehicle");
        Rec."Vehicle Balance" := Rec."Allocated vehicle Limit" - Rec."Total Amt Spend per Vehicle";
        Rec.CalcFields(Rec.check);
    end;

    trigger OnOpenPage()
    begin
        /*IF "Total Amount Spend">"Allocated vehicle Limit" THEN BEGIN
        ERROR('Total amount spend can not be more that allocated amount');
        END;*/

    end;

    var
        DetailedFD: Record "Fuel Card Entries";
        FuelCardLines: Record "Vehicle Fuel Card Lines";
        FuelCard: Record "Fuel Card";
        CheckLimit: Decimal;
        LowerLimit: Record "Limit Types";
        lowercheck: Decimal;
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}
