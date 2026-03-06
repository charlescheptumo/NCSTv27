#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70085 "Technical Evaluation Window"
{
    PageType = List;
    SourceTable = "Bidder Mandatory Requirements";
    SourceTableView = where(Finacial = const(false),
                            Technical = const(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Specification; Rec.Specification)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Technical score"; Rec."Technical score")
                {
                    ApplicationArea = Basic;
                }
                field("Technical Maximum Score"; Rec."Technical Maximum Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("System Score"; Rec."System Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Start Technical Specification")
            {
                ApplicationArea = Basic;
                Image = SuggestVendorBills;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //====================================================Mandatory Evaluation....
                    //ERROR('%1',"Tender No");


                    MandatoryReq.Reset;
                    MandatoryReq.SetFilter(MandatoryReq."RFP No.", '%1', Rec."Tender No");
                    MandatoryReq.SetFilter(MandatoryReq."Evaluation Type", '%1', MandatoryReq."evaluation type"::Technical);
                    //MandatoryReq.SETFILTER(MandatoryReq."Line No",'%1',10);
                    if MandatoryReq.FindSet then
                        repeat
                            //message('%1',MandatoryReq.Description);
                            Biddersrec.Reset;
                            Biddersrec.SetFilter(Biddersrec."Ref No.", Rec."Tender No");
                            if Biddersrec.FindSet then
                                repeat

                                    BidderMandatory.Reset;
                                    BidderMandatory.SetFilter(BidderMandatory."Tender No", Rec."Tender No");
                                    BidderMandatory.SetFilter(BidderMandatory."Company Name", Biddersrec.Name);
                                    BidderMandatory.SetFilter(BidderMandatory.Technical, '%1', true);
                                    if BidderMandatory.FindSet then begin
                                        BidderMandatory.Delete;
                                    end;

                                    //================================================================
                                    BidderMandatory2.Reset;
                                    BidderMandatory2.SetFilter(BidderMandatory2."Tender No", Rec."Tender No");
                                    BidderMandatory2.SetFilter(BidderMandatory2."Company Name", '%1', Biddersrec.Name);
                                    if BidderMandatory2.FindSet then
                                        repeat
                                            Biddersrec."Failed Mandatory" := false;
                                            if BidderMandatory2.Complied = false then begin
                                                Biddersrec."Failed Mandatory" := true;
                                                Biddersrec.Modify;
                                            end;
                                            Biddersrec.Modify;
                                        until BidderMandatory2.Next = 0;
                                    if Biddersrec."Failed Mandatory" = false then begin

                                        evaluatorsrec.Reset;
                                        evaluatorsrec.SetFilter(evaluatorsrec.tenderno, Rec.No);
                                        if evaluatorsrec.FindSet then begin
                                            if evaluatorsrec."Evaluator 1" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec."Tender No";
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Technical score" := 0;
                                                BidderMandatory.Remarks := '';
                                                BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                BidderMandatory.Technical := true;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 1";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 2" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec."Tender No";
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Technical score" := 0;
                                                BidderMandatory.Remarks := '';
                                                BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                BidderMandatory.Technical := true;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 2";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 3" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec."Tender No";
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Technical score" := 0;
                                                BidderMandatory.Remarks := '';
                                                BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                BidderMandatory.Technical := true;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 3";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 4" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec."Tender No";
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Technical score" := 0;
                                                BidderMandatory.Remarks := '';
                                                BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                BidderMandatory.Technical := true;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 4";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 5" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec."Tender No";
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Technical score" := 0;
                                                BidderMandatory.Remarks := '';
                                                BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                BidderMandatory.Technical := true;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 5";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 6" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec."Tender No";
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Technical score" := 0;
                                                BidderMandatory.Remarks := '';
                                                BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                BidderMandatory.Technical := true;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 6";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 7" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec."Tender No";
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Technical score" := 0;
                                                BidderMandatory.Remarks := '';
                                                BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                BidderMandatory.Technical := true;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 7";
                                                BidderMandatory.Insert;
                                            end;
                                            if evaluatorsrec."Evaluator 8" <> '' then begin
                                                BidderMandatory.Reset;
                                                BidderMandatory.Init;
                                                BidderMandatory."Tender No" := Rec."Tender No";
                                                BidderMandatory."Company Name" := Biddersrec.Name;
                                                BidderMandatory.Specification := MandatoryReq.Description;
                                                BidderMandatory."Technical score" := 0;
                                                BidderMandatory.Remarks := '';
                                                BidderMandatory."Technical Maximum Score" := MandatoryReq."Maximum Score";
                                                BidderMandatory.Technical := true;
                                                BidderMandatory."Evaluater User Id" := evaluatorsrec."Evaluator 8";
                                                BidderMandatory.Insert;
                                            end;

                                        end;
                                        j += 1;
                                    end;
                                //==============================================================
                                until Biddersrec.Next = 0;
                        until MandatoryReq.Next = 0;
                    if j > 1 then begin
                        Message('Technical Evaluation can begin in a separate Window...');
                    end;
                    if j = 0 then begin
                        Message('No Bidder has qualified');
                    end;

                    //============================================================================
                end;
            }
            action("Proceed to Financial Evaluation")
            {
                ApplicationArea = Basic;
                Image = Bank;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = Seeevaladmin;

                trigger OnAction()
                begin
                    conf := Confirm('Are you sure you want to Proceed to Financial Evaluation?');
                    if Format(conf) = 'Yes' then begin
                        recrfp.Reset;
                        recrfp.Get(Rec."Tender No");
                        recrfp."Financial Started?" := true;
                        recrfp.Modify;
                        CurrPage.Close;

                        biiderec.Reset;
                        biiderec.SetFilter(biiderec."Ref No.", Rec."Tender No");
                        Page.Run(70087, biiderec);

                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        evalrec.Reset;
        //MESSAGE('%1',"Tender No");
        evalrec.SetFilter(evalrec.tenderno, Rec."Tender No");
        if evalrec.FindSet then begin
            if evalrec."Evaluator 1" = UserId then begin
                eval1see := true;
            end;
            if evalrec."Evaluator 2" = UserId then begin
                eval2see := true;
            end;
            if evalrec."Evaluator 2" = UserId then begin
                eval2see := true;
            end;
            if evalrec."Evaluator 3" = UserId then begin
                eval3see := true;
            end;
            if evalrec."Evaluator 4" = UserId then begin
                eval4see := true;
            end;
            if evalrec."Evaluator 5" = UserId then begin
                eval5see := true;
            end;
            if evalrec."Evaluator 6" = UserId then begin
                eval6see := true;
            end;
            if evalrec."Evaluator 7" = UserId then begin
                eval7see := true;
            end;
            if evalrec."Evaluator 8" = UserId then begin
                eval8see := true;
            end;

        end;

        Seeevaladmin := false;
        RFPREC.Reset;
        RFPREC.Get(Rec."Tender No");
        if RFPREC."Evaluation Admin" = UserId then begin
            Seeevaladmin := true;
        end;


        Rec.SetFilter(Rec."Evaluater User Id", UserId);
    end;

    var
        evalrec: Record "Procurement Evaluators";
        eval1see: Boolean;
        eval2see: Boolean;
        eval3see: Boolean;
        eval4see: Boolean;
        eval5see: Boolean;
        eval6see: Boolean;
        eval7see: Boolean;
        eval8see: Boolean;
        seeit: array[8] of Boolean;
        i: Integer;
        MandatoryReq: Record "RFQ Evaluation Lists";
        BidderMandatory: Record "Bidder Mandatory Requirements";
        BidderMandatory2: Record "Bidder Mandatory Requirements";
        Biddersrec: Record Bidders;
        ans: Boolean;
        RFPREC: Record "Procurement Request";
        evaluatorsrec: Record "Procurement Evaluators";
        j: Integer;
        Seeevaladmin: Boolean;
        recrfp: Record "Procurement Request";
        conf: Boolean;
        biiderec: Record Bidders;
}
