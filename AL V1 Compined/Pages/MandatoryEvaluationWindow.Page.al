#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70084 "Mandatory Evaluation Window"
{
    PageType = List;
    SourceTable = "Bidder Mandatory Requirements";
    SourceTableView = where(Finacial = const(false),
                            Technical = const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = Basic;
                }
                field(Specification; Rec.Specification)
                {
                    ApplicationArea = Basic;
                }
                field(Complied; Rec.Complied)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
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
                Visible = Seeevaladmin;

                trigger OnAction()
                var
                    procrec: Record "Procurement Request";
                    evalrec: Record "Procurement Evaluators";
                    userrec: Record "User Setup";
                    //   smtpcu: Codeunit "SMTP Mail";
                    //  smtprec: Record "SMTP Mail Setup";
                    EMAILSNED: Codeunit EMAIL;
                    EMAILMESSAGE: Codeunit "Email Message";
                    BODY: Text[1024];
                    evalusers: array[8] of Text;
                    evalmails: array[8] of Text;
                    Evaltxtmails: Text;
                    Evalbody: Text;
                    Cnftxt: Boolean;
                begin
                    Cnftxt := Confirm('Are you sure you want to Proceed to Technical Evaluation?');
                    if Format(Cnftxt) = 'Yes' then begin
                        //====================================================Mandatory Evaluation....
                        //ERROR('%1',"Tender No");
                        evalrec.Reset;
                        evalrec.SetFilter(evalrec.tenderno, Rec.No);
                        if evalrec.FindSet then begin
                            evalusers[1] := evalrec."Evaluator 1";
                            evalusers[2] := evalrec."Evaluator 2";
                            evalusers[3] := evalrec."Evaluator 3";
                            evalusers[4] := evalrec."Evaluator 4";
                            evalusers[5] := evalrec."Evaluator 5";
                            evalusers[6] := evalrec."Evaluator 6";
                            evalusers[7] := evalrec."Evaluator 7";
                            evalusers[8] := evalrec."Evaluator 8";
                            userrec.Reset;
                            if userrec.Get(evalusers[1]) then begin
                                evalmails[1] := userrec."E-Mail";
                                Evaltxtmails := evalmails[1];
                            end;
                            if userrec.Get(evalusers[2]) then begin
                                evalmails[2] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[2];
                            end;
                            if userrec.Get(evalusers[3]) then begin
                                evalmails[3] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[3];
                            end;
                            if userrec.Get(evalusers[4]) then begin
                                evalmails[4] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[4];
                            end;
                            if userrec.Get(evalusers[5]) then begin
                                evalmails[5] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[5];
                            end;
                            if userrec.Get(evalusers[6]) then begin
                                evalmails[6] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[6];
                            end;
                            if userrec.Get(evalusers[7]) then begin
                                evalmails[7] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[7];
                            end;
                            if userrec.Get(evalusers[8]) then begin
                                evalmails[8] := userrec."E-Mail";
                                Evaltxtmails := Evaltxtmails + ';' + evalmails[8];
                            end;

                            //error('%1..',Evaltxtmails);
                            Evalbody := 'Dear Sir/Madam<br><br><br>Mandatory Evaluations for RFP No: ' + Rec.No + ' has ended and Technical Evaluation will start Immediately.<br><br>Kind Regards<br><br>';
                           // smtprec.Get;
                          //  smtpcu.CreateMessage('NEMA Bidding Evaluation', smtprec."User ID", Evaltxtmails, Rec.No + ' EVALUATION', Evalbody, true);
                            //smtpcu.Send  //Remove comment...
                            emailmessage.Create(Evaltxtmails, Rec.No + ' EVALUATION', Evalbody);
                            EMAILSNED.Send(emailmessage,Enum::"Email Scenario"::Default);


                        end;


                        //===========================DELETE ALL Existing Technical Specifications for this tender....
                        BidderMandatory.Reset;
                        BidderMandatory.SetFilter(BidderMandatory."Tender No", Rec."Tender No");
                        BidderMandatory.SetFilter(BidderMandatory."Company Name", Biddersrec.Name);
                        BidderMandatory.SetFilter(BidderMandatory.Technical, '%1', true);
                        if BidderMandatory.FindSet then
                            repeat
                                BidderMandatory.Delete;
                            until BidderMandatory.Next = 0;

                        //===========================================================================================
                        MandatoryReq.Reset;
                        MandatoryReq.SetFilter(MandatoryReq."RFP No.", '%1', Rec."Tender No");
                        MandatoryReq.SetFilter(MandatoryReq."Evaluation Type", '%1', MandatoryReq."evaluation type"::Technical);
                        //MandatoryReq.SETFILTER(MandatoryReq."Line No",'%1',10);
                        if MandatoryReq.FindSet then
                            repeat
                                //message('%1',MandatoryReq.Description);
                                Biddersrec.Reset;
                                Biddersrec.SetFilter(Biddersrec."Ref No.", Rec."Tender No");
                                Biddersrec.SetFilter(Biddersrec."Failed Mandatory", '%1', false);
                                if Biddersrec.FindSet then
                                    repeat
                                        //================================================================

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

                                    //==============================================================
                                    until Biddersrec.Next = 0;
                            until MandatoryReq.Next = 0;
                        if j > 1 then begin
                            Message('Technical Evaluation can begin in a separate Window...');
                            procrec.Reset;
                            procrec.Get(Rec."Tender No");
                            procrec."Technical started?" := true;

                            procrec.Modify;
                        end;
                        if j = 0 then begin
                            Message('No Bidder has qualified');
                        end;
                        CurrPage.Close;
                        //============================================================================
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


        Rec.SetFilter(Rec."Evaluater User Id", UserId);


        RFPREC.Reset;
        RFPREC.Get(Rec."Tender No");
        if RFPREC."Evaluation Admin" = UserId then begin
            Seeevaladmin := true;
        end;
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
}
