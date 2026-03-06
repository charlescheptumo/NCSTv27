#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70031 "Procurement Request Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Procurement Request Lines";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                }
                field(Specifications; Rec.Specifications)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Line"; Rec."Budget Line")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Ordered; Rec.Ordered)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; Rec."Job Task No.")
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
            action("Generate Purchase Order")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Purchase Order';
                Image = CreateBinContent;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ProcReq.Reset;
                    ProcReq.SetRange(No, Rec."Requisition No");
                    if ProcReq.Find('-') then begin

                        ProcReq.TestField("Requisition No");

                        if ProcReq."Generate Multiple LPO" then begin

                            if Confirm('Are you sure you want to generate Purchase Order for the selected Vendor No ' + Rec."Vendor No" + '?', true) then begin

                                if PurchReq.Get(ProcReq."Requisition No") then
                                    if UserId = PurchReq."Assigned User ID" then begin

                                        ProcReqLines.Reset;
                                        ProcReqLines.SetRange("Requisition No", ProcReq.No);
                                        ProcReqLines.SetRange(Ordered, false);
                                        ProcReqLines.SetRange(Select, true);
                                        if ProcReqLines.Find('-') then begin
                                            repeat
                                                Rec.TestField(Rec."Vendor No");
                                                Rec.TestField(Rec."Supplier Category");


                                                /*
                                                IF PurchReq.GET("Requisition No")  THEN
                                                IF PurchReq.Status = PurchReq.Status::Released THEN BEGIN
                                                CALCFIELDS("Procurement Amount");
                                                PurchReq.CALCFIELDS(Amount);

                                                IF "Procurement Amount" > PurchReq.Amount THEN
                                                ERROR('The Procurement Amount %1 cannot be more than the Purchase Request Approved Amount %2',"Procurement Amount",PurchReq.Amount);
                                                END ELSE ERROR(Text000);
                                                */

                                                PurchReq.CreatePurchaseOrderProcMethodLines(ProcReqLines);

                                            until ProcReqLines.Next = 0;
                                        end;
                                    end else
                                        Error('User %1 has not been assigned permission to generate Purchase Order for this requisition', UserId);
                            end else
                                exit;



                        end else
                            Error('This function is only used when Generate LPO is Checked!');
                    end;

                end;
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }

    var
        ProcReq: Record "Procurement Request";
        PurchReq: Record "Purchase Header";
        ProcReqLines: Record "Purchase Line";
        filecu: Codeunit "File Management";
        filename: Text;
        PURCHSETUP: Record "Purchases & Payables Setup";
        Lineno: Integer;
}
