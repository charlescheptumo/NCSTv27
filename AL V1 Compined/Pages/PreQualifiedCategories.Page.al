#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70130 "Pre Qualified Categories"
{
    Caption = 'Pre Qualified Received';
    PageType = List;
    SourceTable = "Prequalified Suppliers1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Fiscal Year"; Rec."Fiscal Year")
                {
                    ApplicationArea = Basic;
                }
                field("Pre Qualified"; Rec."Pre Qualified")
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
            action("Start Evaluation")
            {
                ApplicationArea = Basic;
                Image = SetupPayment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = seetit2;

                trigger OnAction()
                var
                    rec2: Record "Quotations Evaluation";
                    rec3: Record "Procurement Request";
                    rec5: Record "Procurement Request";
                    rec7: Record "Quotations Evaluation";
                    rec8: Record "Quotations Evaluation";
                    reqlines: Record "Procurement Request Lines";
                    rec9: Record "Quotations Evaluation";
                    rec10: Record "Quotations Evaluation";
                    I: Integer;
                    J: Integer;
                    rec51: Record "Quotations Evaluation";
                begin
                    rec3.Reset;
                    if rec3.Get(bdno2) then begin
                        if rec3."In Technical?" = true then begin
                            // ERROR('Technical Evaluation has already happened for this Quotation...');
                        end;
                    end;
                    rec2.Reset;
                    Rec.SetRange("Ref No.", Rec."Ref No.");
                    Rec.SetFilter(Selected, '%1', true);
                    if Rec.FindSet then begin
                        repeat
                            rec2.Init;
                            rec2.TransferFields(Rec);
                            rec2."Ref No." := bdno2;
                            rec2.Insert;

                            //added to be pushed to bidders
                            ProcurementLines.Reset;
                            ProcurementLines.SetRange(ProcurementLines."Requisition No", Rec."Ref No.");
                            //ProcurementLines.SETRANGE(ProcurementLines."Requisition No",No);
                            if ProcurementLines.Find('-') then begin
                                repeat
                                    //ProcurementLines.CALCFIELDS(Specifications); 28.11.2019 Hunaina
                                    TenderBids.Reset;
                                    TenderBids.SetRange(contactNo, Rec."Contact No");
                                    TenderBids.SetRange("Requisition No", Rec."Ref No.");
                                    TenderBids.SetFilter(Amount, '<>%1', 0);
                                    if TenderBids.FindSet then begin

                                        TenderBids."Bidder Name" := Rec.Name;
                                        TenderBids."Bidder Email" := Rec."E-mail";
                                        TenderBids.Type := ProcurementLines.Type;
                                        TenderBids.No := ProcurementLines.No;
                                        TenderBids.Description := ProcurementLines.Specifications;
                                        // TenderBids.Description:=ProcurementLines.Description;//commented for Nacosti
                                        //IF NOT TenderBids.GET(TenderBids."Requisition No",TenderBids."Bidder Name",TenderBids."Bidder Email") THEN
                                        TenderBids.Modify;
                                    end else begin
                                        //MESSAGE('Req No %1,Bidder Name %2,Bidder Email %3,No%4',"Ref No.",Name,"E-mail",ProcurementLines.No);
                                        TenderBids.Init;
                                        TenderBids."Requisition No" := Rec."Ref No.";
                                        TenderBids."Bidder Name" := Rec.Name;
                                        TenderBids."Bidder Email" := Rec."E-mail";
                                        TenderBids."Line No" := ProcurementLines."Line No";
                                        TenderBids.Type := ProcurementLines.Type;
                                        TenderBids.No := ProcurementLines.No;
                                        TenderBids.Description := ProcurementLines.Specifications;
                                        //TenderBids.Description:=ProcurementLines.Description;//commented for Nacosti
                                        if not TenderBids.Get(TenderBids."Requisition No", TenderBids."Bidder Name", TenderBids."Bidder Email", TenderBids."Line No") then
                                            TenderBids.Insert;
                                    end;
                                until ProcurementLines.Next = 0;
                            end;
                        until Rec.Next = 0;
                    end;



                    Message('Evaluation can begin in a separate Menu...');


                    rec3.Reset;
                    rec3.Get(bdno2);
                    rec3."In Technical?" := true;
                    rec3.Modify;



                    if rec3."Does Not Require TOR" = true then begin
                        //==========================================================================================================================
                        rec5.Reset;
                        rec5.Get(Rec."Ref No.");

                        if rec5."In Financial?" = true then begin
                            Error('The Quotation is already in Financial stage. Please Find it in the next stage.');
                        end;
                        //ERROR('%1',"Ref No.");
                        rec51.Reset;
                        rec51.SetFilter(rec51."Ref No.", Rec."Ref No.");
                        rec51.SetFilter("Passes Technical?", '%1', true);
                        if Rec.FindSet then begin
                            Message('Finanncial Evaluation can begin in a separate Menu..');
                            rec5.Reset;
                            rec5.Get(Rec."Ref No.");
                            rec5."In Financial?" := true;
                            rec5.Modify;
                            //====================================================
                            rec7.Reset;
                            rec7.SetFilter(rec7."Ref No.", Rec."Ref No.");
                            rec7.SetFilter(rec7."Passes Technical?", '%1', true);
                            rec7.SetFilter(rec7.created, '%1', false);
                            if rec7.FindSet then begin
                                I := 10;
                                repeat
                                    dialogbd.Open('Creating Entries for ##1');
                                    reqlines.Reset;
                                    reqlines.SetFilter(reqlines."Requisition No", Rec."Ref No.");
                                    reqlines.SetFilter(reqlines.Description, '<>%1', '');
                                    if reqlines.FindSet then
                                        repeat
                                            rec9.Init;
                                            rec9.Copy(rec7);
                                            rec9.entryno := I;
                                            rec9."Item Description" := reqlines.Description;
                                            rec9.created := true;
                                            rec9.Insert;
                                            dialogbd.Update(1, rec9.Name);
                                            Sleep(1000);
                                            //MESSAGE('%1..%2..%3',rec9.Name,rec9."Item Description",i);
                                            I += 10;
                                        until reqlines.Next = 0;
                                    dialogbd.Close;
                                until rec7.Next = 0;
                            end;
                            //====================================================
                            CurrPage.Close;
                        end;
                        if not Rec.FindSet then begin
                            Error('No Supplier has passed Technical Specification...!!!');
                        end;


                        //==========================================================================================================================
                    end;
                    CurrPage.Close;
                end;
            }
            action(Bidders)
            {
                ApplicationArea = Basic;
                RunObject = Page Bidders;
                Visible = false;
            }
            action(Create)
            {
                ApplicationArea = Basic;
                Caption = 'Create';
                Image = CustomerContact;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Rec."Pre Qualified" = true then
                        Rec.CreateVend(Rec);
                end;
            }
            action("Load Prequalified Suppliers")
            {
                ApplicationArea = Basic;
                Image = Lock;
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.LoadPreQualifiedVend(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if bdno2 <> Rec."Ref No." then begin
            Rec.Selected := false;
            Rec."Ref No." := '';
        end;
    end;

    trigger OnOpenPage()
    begin

        //Message('%1',bdno2);
        seetitbl := true;
        recit.Reset;
        if recit.Get(bdno2) then begin
            if recit.Status <> recit.Status::Open then begin
                seetitbl := false;
            end;
            if recit."Quotation Evaluation" = true then begin
                seetit2 := true;
            end;
        end;
    end;

    var
        bdno2: Code[50];
        seetitbl: Boolean;
        recit: Record "Procurement Request";
        seetit2: Boolean;
        dialogbd: Dialog;
        ProcurementLines: Record "Procurement Request Lines";
        TenderBids: Record "Tender Bids";


    procedure GetRefnopg(bdno: Code[50])
    begin
        bdno2 := bdno;
    end;
}
