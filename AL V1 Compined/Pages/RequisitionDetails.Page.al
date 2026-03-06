#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70021 "Requisition Details"
{
    DeleteAllowed = true;
    PageType = List;
    SourceTable = "Requisition Lines1";
    SourceTableView = where("Requisition Status" = const(Approved),
                            "Request Generated" = const(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Line"; Rec."Budget Line")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Status"; Rec."Requisition Status")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Actions")
            {
                Caption = 'Actions';
                action("Generate RFQ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate RFQ';
                    Image = ReturnOrder;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin

                        RequestLines.Reset;
                        RequestLines.SetRange(RequestLines.Select, true);
                        RequestLines.SetRange(RequestLines."Request Generated", false);
                        if RequestLines.Find('-') then begin

                            if RequisitionHeader.Get(RequestLines."Requisition No") then begin

                                ProcurementRequest.Init;
                                ProcurementRequest."Process Type" := RequestLines."process type"::RFQ;
                                if not PPSetup.Get then
                                    Error(Text000);
                                case ProcurementRequest."Process Type" of
                                    ProcurementRequest."process type"::RFQ:
                                        begin
                                            PPSetup.TestField("Request for Quotation Nos.");
                                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Quotation Nos.", Today, true);
                                        end;
                                    ProcurementRequest."process type"::RFP:
                                        begin
                                            PPSetup.TestField("Request for Proposals Nos.");
                                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Proposals Nos.", Today, true);
                                        end;
                                    ProcurementRequest."process type"::Tender:
                                        begin
                                            PPSetup.TestField("Tenders Nos");
                                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Tenders Nos", Today, true);
                                        end;
                                end;
                                ProcurementRequest.Title := RequestLines.Description;
                                ProcurementRequest."Requisition No" := RequestLines."Requisition No";
                                ProcurementRequest."Creation Date" := Today;
                                ProcurementRequest."User ID" := UserId;
                                ProcurementRequest.Insert(true);
                            end;
                            repeat
                                LineNo := LineNo + 10000;
                                ProcurementRequestLine.Init;
                                ProcurementRequestLine.TransferFields(RequestLines);
                                ProcurementRequestLine."Requisition No" := ProcurementRequest.No;
                                ProcurementRequestLine."Line No" := LineNo;
                                if not ProcurementRequestLine.Get(ProcurementRequest.No, LineNo) then
                                    ProcurementRequestLine.Insert;
                                RequestLines."Request Generated" := true;
                                RequestLines.Modify;
                            until RequestLines.Next = 0;
                        end;
                    end;
                }
                action("Generate RFP")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate RFP';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        RequestLines.Reset;
                        RequestLines.SetRange(RequestLines.Select, true);
                        RequestLines.SetRange(RequestLines."Request Generated", false);
                        if RequestLines.Find('-') then begin

                            if RequisitionHeader.Get(RequestLines."Requisition No") then begin

                                ProcurementRequest.Init;
                                ProcurementRequest."Process Type" := RequestLines."process type"::RFP;
                                if not PPSetup.Get then
                                    Error(Text000);
                                case ProcurementRequest."Process Type" of
                                    ProcurementRequest."process type"::RFQ:
                                        begin
                                            PPSetup.TestField("Request for Quotation Nos.");
                                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Quotation Nos.", Today, true);
                                        end;
                                    ProcurementRequest."process type"::RFP:
                                        begin
                                            PPSetup.TestField("Request for Proposals Nos.");
                                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Proposals Nos.", Today, true);
                                        end;
                                    ProcurementRequest."process type"::Tender:
                                        begin
                                            PPSetup.TestField("Tenders Nos");
                                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Tenders Nos", Today, true);
                                        end;
                                end;
                                ProcurementRequest.Title := RequestLines.Description;
                                ProcurementRequest."Requisition No" := RequestLines."Requisition No";
                                ProcurementRequest."Creation Date" := Today;
                                ProcurementRequest."User ID" := UserId;
                                ProcurementRequest.Insert(true);
                            end;
                            repeat
                                LineNo := LineNo + 10000;
                                ProcurementRequestLine.Init;
                                ProcurementRequestLine.TransferFields(RequestLines);
                                ProcurementRequestLine."Requisition No" := ProcurementRequest.No;
                                ProcurementRequestLine."Line No" := LineNo;
                                if not ProcurementRequestLine.Get(ProcurementRequest.No, LineNo) then
                                    ProcurementRequestLine.Insert;
                                RequestLines."Request Generated" := true;
                                RequestLines.Modify;
                            until RequestLines.Next = 0;
                        end;
                    end;
                }
                action("Generate Tender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate Tender';
                    Image = Purchase;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        RequestLines.Reset;
                        RequestLines.SetRange(RequestLines.Select, true);
                        RequestLines.SetRange(RequestLines."Request Generated", false);
                        if RequestLines.Find('-') then begin

                            if RequisitionHeader.Get(RequestLines."Requisition No") then begin

                                ProcurementRequest.Init;
                                ProcurementRequest."Process Type" := RequestLines."process type"::Tender;
                                if not PPSetup.Get then
                                    Error(Text000);
                                case ProcurementRequest."Process Type" of
                                    ProcurementRequest."process type"::RFQ:
                                        begin
                                            PPSetup.TestField("Request for Quotation Nos.");
                                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Quotation Nos.", Today, true);
                                        end;
                                    ProcurementRequest."process type"::RFP:
                                        begin
                                            PPSetup.TestField("Request for Proposals Nos.");
                                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Request for Proposals Nos.", Today, true);
                                        end;
                                    ProcurementRequest."process type"::Tender:
                                        begin
                                            PPSetup.TestField("Tenders Nos");
                                            ProcurementRequest.No := NoSeriesMgt.GetNextNo(PPSetup."Tenders Nos", Today, true);
                                        end;
                                end;
                                ProcurementRequest.Title := RequestLines.Description;
                                ProcurementRequest."Requisition No" := RequestLines."Requisition No";
                                ProcurementRequest."Creation Date" := Today;
                                ProcurementRequest."User ID" := UserId;
                                ProcurementRequest.Insert(true);
                            end;
                            repeat
                                LineNo := LineNo + 10000;
                                ProcurementRequestLine.Init;
                                ProcurementRequestLine.TransferFields(RequestLines);
                                ProcurementRequestLine."Requisition No" := ProcurementRequest.No;
                                ProcurementRequestLine."Line No" := LineNo;
                                if not ProcurementRequestLine.Get(ProcurementRequest.No, LineNo) then
                                    ProcurementRequestLine.Insert;
                                RequestLines."Request Generated" := true;
                                RequestLines.Modify;
                            until RequestLines.Next = 0;
                        end;
                    end;
                }
                action("Show Req Card")
                {
                    ApplicationArea = Basic;
                    Caption = 'Show Req Card';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Requisition Header";
                    RunPageLink = "No." = field("Requisition No");
                }
            }
        }
    }

    var
        RequestRec: Record "Procurement Request";
        RequestLine: Record "Procurement Request Lines";
        RequestLines: Record "Requisition Lines1";
        RequisitionHeader: Record "Requisition Header1";
        ProcurementRequest: Record "Procurement Request";
        ProcurementRequestLine: Record "Procurement Request Lines";
        LineNo: Integer;
        NoSeriesMgt: Codeunit "No. Series";
        PPSetup: Record "Purchases & Payables Setup";
        Text000: label 'Purchases Setup doesn''''nt exist';
}
