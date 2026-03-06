#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70111 "Disposal Header"
{
    PageType = Card;
    SourceTable = "Disposal Header";
    ApplicationArea = All;

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
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                }
                field("Disposal Plan"; Rec."Disposal Plan")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Reason For Disposal"; Rec."Reason For Disposal")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                }
                field("Select Customer"; Rec."Select Customer")
                {
                    ApplicationArea = Basic;
                    Visible = biddersvisible;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = biddersvisible;
                }
            }
            part(Control11; "Disposal Sub Page")
            {
                Editable = Editable;
                SubPageLink = "Document No." = field(No);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup13)
            {
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Enabled = biddersvisible;
                    Image = Vendor;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Disposal Bidders";
                    RunPageLink = "Disposal No." = field(No);

                    trigger OnAction()
                    begin
                        /*
                        DisposalBidders.RESET;
                        DisposalBidders.SETRANGE("Disposal No.",No);
                        IF DisposalBidders.FINDFIRST THEN
                        
                        DisposalLines.RESET;
                        DisposalLines.SETRANGE("Document No.",No);
                        IF DisposalLines.FINDSET THEN
                          BEGIN
                            REPEAT
                              DisposalBidsPerLine1.INIT;
                              DisposalBidsPerLine1."Document No.":=DisposalLines."Document No.";
                              DisposalBidsPerLine1."Disposal No":=DisposalLines."Document No.";
                              DisposalBidsPerLine1.Type:=DisposalBidsPerLine1.Type::"Fixed Asset";
                              DisposalBidsPerLine1.No:=DisposalLines."Fixed Asset No.";
                              DisposalBidsPerLine1.Description:=DisposalLines."FA Name";
                              DisposalBidsPerLine1.Quantity:=1;
                              DisposalBidsPerLine1.Customer:=DisposalBidders.Name;
                              DisposalBidsPerLine1.INSERT;
                              UNTIL DisposalLines.NEXT=0;
                        
                            END;
                            */

                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        ////cc//if ApprovalsMgmt.CheckDisposalRequestApprovalPossible(Rec) THEN
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                        //  //cc//ApprovalsMgmt.OnSendDisposalRequestDocForApproval(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::"Pending Approval");
                        ////cc//if ApprovalsMgmt.CheckDisposalRequestApprovalPossible(Rec) THEN
                        ////ApprovalsMgmt.OnCancelDisposalRequestApprovalRequest(Rec);
                    end;
                }
                action("Create Sales Order")
                {
                    ApplicationArea = Basic;
                    Image = SalesInvoice;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Select Customer");
                        Rec.TestField(Rec."Sales Order Created", false);
                        DisposalBidders.Reset;
                        DisposalBidders.SetRange("Disposal No.", Rec.No);
                        if DisposalBidders.Find('-') then begin
                            repeat
                                DisposalBidders.TestField(Name);
                                DisposalBidders.TestField("Email Address");
                                DisposalBidders.TestField(Amount);
                                DisposalBidders.TestField("Phone No.");
                                DisposalBidders.TestField("Contact Person");
                                DisposalBidders.TestField("Physical Addess");
                            until DisposalBidders.Next = 0;
                        end;
                        DisposalBidders.Reset;
                        DisposalBidders.SetRange("Disposal No.", Rec.No);
                        DisposalBidders.SetRange(Award, true);
                        if not DisposalBidders.FindFirst then begin
                            Error('You must award the disposal to atleast one bidder');
                        end;

                        SalesSetup.Get;
                        SalesSetup.TestField("Posted Shipment Nos.");
                        SalesSetup.TestField("Posted Invoice Nos.");
                        Rec.Reset;
                        if Rec.Get(Rec.No) then begin
                            SalesHeader.Reset;
                            SalesHeader.Init;
                            SalesHeader."Document Type" := SalesHeader."document type"::Order;
                            SalesHeader.Validate("Document Type");
                            SalesHeader."No." := NoMgt.GetNextNo(SalesSetup."Order Nos.", Today, true);
                            SalesHeader."Document Type" := SalesHeader."document type"::Order;
                            SalesHeader."Sell-to Customer No." := Rec."Select Customer";
                            SalesHeader.Validate("Sell-to Customer No.");
                            SalesHeader."Assigned User ID" := UserId;
                            //SalesHeader.//"Customer Category":=SalesHeader."Customer Category"::Organization;
                            SalesHeader."Posting No. Series" := SalesSetup."Posted Invoice Nos.";

                            SalesHeader."Shipping No. Series" := SalesSetup."Posted Shipment Nos.";
                            if UserSetup.Get(UserId) then begin
                                SalesHeader."Shortcut Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                                SalesHeader."Shortcut Dimension 2 Code" := UserSetup."Shortcut Dimension 2 Code";

                            end;
                            SalesHeader.Insert;
                        end;

                        DisposalLines.Reset;
                        DisposalLines.SetRange("Document No.", Rec.No);
                        if DisposalLines.FindSet then begin
                            repeat
                                "LineNo." := "LineNo." + 1;
                                /*FnCreateSalesline(SalesHeader."Document Type",
                                                  "LineNo.",DisposalLines."Fixed Asset/Item No."
                                                  ,1,1,SalesHeader."No.");*/
                                //ERROR('%1',SalesHeader."Document Type");
                                FnCreateSaleslineNew(DisposalLines, "LineNo.", SalesHeader."No.");
                            until DisposalLines.Next = 0;
                        end;
                        Rec."Sales Order Created" := true;
                        Rec.Modify;
                        Message('Sales Order No. %1 has been created', SalesHeader."No.");
                        CurrPage.Close;

                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        biddersvisible := false;
        if Rec.Status = Rec.Status::Approved then
            biddersvisible := true;
        Approvededit();
    end;

    trigger OnAfterGetRecord()
    begin
        biddersvisible := false;
        if Rec.Status = Rec.Status::Approved then
            biddersvisible := true;
        Approvededit();
    end;

    trigger OnOpenPage()
    begin
        biddersvisible := false;
        if Rec.Status = Rec.Status::Approved then
            biddersvisible := true;
        Approvededit();
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DisposalLines: Record "Disposal Lines";
        DisposalBidsPerLine1: Record "Disposal Bids Per Line 1";
        DisposalBidders: Record "Disposal Bidders";
        biddersvisible: Boolean;
        isEditable: Boolean;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        NoMgt: Codeunit "No. Series";
        SalesSetup: Record "Sales & Receivables Setup";
        "LineNo.": Integer;
        UserSetup: Record "User Setup";

    local procedure Approvededit()
    begin
        Editable := false;
        if Rec.Status = Rec.Status::Open then
            Editable := true;
    end;


    procedure FnCreateSalesline(Type: Option; "Lineno.": Integer; No1: Code[20]; Quantityl: Integer; "Unit price": Decimal; "DocumentNo.": Code[20])
    var
        SalesLine: Record "Sales Line";
        FADeBook: Record "FA Depreciation Book";
        UserSetup: Record "User Setup";
    begin
        begin
            SalesLine.Init;
            SalesLine."Document Type" := SalesLine."document type"::Order;
            SalesLine."Document No." := "DocumentNo.";
            SalesLine."Line No." := "Lineno." + 1;

            SalesLine.Type := SalesLine.Type::"Fixed Asset";
            SalesLine."No." := No1;
            FADeBook.Reset;
            FADeBook.SetRange("FA No.", SalesLine."No.");
            if FADeBook.FindSet then
                FADeBook.CalcFields("Book Value");
            SalesLine.Validate(SalesLine."No.");
            SalesLine.Quantity := Quantityl;
            SalesLine.Validate(SalesLine.Quantity);
            SalesLine."Unit Price" := FADeBook."Book Value";
            SalesLine.Validate(SalesLine."Unit Price");
            if UserSetup.Get(UserId) then begin
                SalesLine."Shortcut Dimension 1 Code" := UserSetup."Shortcut Dimension 2 Code";
                SalesLine."Shortcut Dimension 2 Code" := UserSetup."Shortcut Dimension 3 Code";
                SalesLine.Validate(SalesLine."Shortcut Dimension 1 Code");
                SalesLine.Validate(SalesLine."Shortcut Dimension 2 Code");
            end;
            SalesLine.Insert;
        end;
    end;


    procedure FnCreateSaleslineNew(DisposalLine: Record "Disposal Lines"; "Lineno.": Integer; "DocumentNo.": Code[20])
    var
        SalesLine: Record "Sales Line";
        FADeBook: Record "FA Depreciation Book";
        UserSetup: Record "User Setup";
    begin
        begin
            SalesLine.Init;
            SalesLine."Document Type" := SalesLine."document type"::Order;
            SalesLine."Document No." := "DocumentNo.";
            SalesLine."Line No." := "Lineno." + 1;
            if DisposalLine.Type = DisposalLine.Type::"Fixed Asset" then
                SalesLine.Type := SalesLine.Type::"Fixed Asset"
            else
                SalesLine.Type := SalesLine.Type::Item;
            SalesLine."No." := DisposalLine."Fixed Asset/Item No.";
            if SalesLine.Type = SalesLine.Type::"Fixed Asset" then begin
                FADeBook.Reset;
                FADeBook.SetRange("FA No.", SalesLine."No.");
                if FADeBook.FindSet then
                    FADeBook.CalcFields("Book Value");
            end;
            SalesLine.Validate(SalesLine."No.");
            SalesLine.Quantity := DisposalLine.Quantity;
            SalesLine.Validate(SalesLine.Quantity);
            SalesLine."Unit Price" := DisposalLine."Estimated current value";
            SalesLine.Validate(SalesLine."Unit Price");
            if UserSetup.Get(UserId) then begin
                SalesLine."Shortcut Dimension 1 Code" := UserSetup."Shortcut Dimension 2 Code";
                SalesLine."Shortcut Dimension 2 Code" := UserSetup."Shortcut Dimension 3 Code";
                SalesLine.Validate(SalesLine."Shortcut Dimension 1 Code");
                SalesLine.Validate(SalesLine."Shortcut Dimension 2 Code");
            end;
            SalesLine.Insert;
        end;
    end;
}
