#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70008 "Evaluation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Evaluation Report.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(Mandatory; "Bidder Mandatory Requirements")
        {
            DataItemTableView = where(Technical = filter(false), Finacial = filter(false));
            RequestFilterHeading = 'Mandatory Requirements';
            column(ReportForNavId_2; 2)
            {
            }
            column(Specification_Mandatory; Mandatory.Specification)
            {
            }
            column(Complied_Mandatory; Compliedtxt)
            {
            }
            column(EvaluaterUserId_Mandatory; Mandatory."Evaluater User Id")
            {
            }
            column(CompanyName_Mandatory; Mandatory."Company Name")
            {
            }
            column(Ref_no; Mandatory."Tender No")
            {
            }
            column(logo; corec.Picture)
            {
            }
            column(passedmandatory; passedmandatory)
            {
            }
            column(i; i)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Compliedtxt := 'No';
                passedmandatory := 'Yes';
                if Mandatory.Complied = true then begin
                    Compliedtxt := 'Yes';
                end;
                //=====================================Successful Bidders in Mandatory
                bidderrec.Reset;
                bidderrec.SetFilter(bidderrec."Ref No.", Mandatory."Tender No");
                bidderrec.SetFilter(bidderrec.Name, '%1', Mandatory."Company Name");
                if bidderrec.FindSet then begin
                    if Mandatory.Complied = false then begin
                        passedmandatory := 'No';
                    end;
                    if bidderrec."Failed Mandatory" = true then begin
                        passedmandatory := 'No';
                        i := 1000;
                    end;
                    if bidderrec."Failed Mandatory" = false then begin
                        if previousvend <> Mandatory."Company Name" then begin
                            i := 0;
                            //message('%1..%2',previousvend,Mandatory."Company Name");
                        end;
                        previousvend := Mandatory."Company Name";
                        passedmandatory := 'Yes';
                        i += 1;
                        if Mandatory.Complied = false then begin
                            passedmandatory := 'No';
                            i += 1000;
                        end;


                    end;
                    if i = 0 then begin
                        CurrReport.Skip;
                    end;

                end;
                //====================================================================
                //message('%1',i);
            end;

            trigger OnPreDataItem()
            begin
                corec.CalcFields(corec.Picture);
                Compliedtxt := 'No';
                //======================================================
                bidderrec.Reset;
                bidderrec.SetFilter(bidderrec."Ref No.", Mandatory."Tender No");
                if bidderrec.FindSet then
                    repeat
                        bidderrec."Failed Mandatory" := false;
                        bidderrec.Modify;
                    until bidderrec.Next = 0;

                bidderrec.Reset;
                bidderrec.SetFilter(bidderrec."Ref No.", Mandatory."Tender No");
                if bidderrec.FindSet then
                    repeat
                        mandrec.Reset;
                        mandrec.SetFilter(mandrec."Tender No", Mandatory."Tender No");
                        mandrec.SetFilter(mandrec."Company Name", bidderrec.Name);
                        mandrec.SetFilter(mandrec.Technical, '%1', false);
                        mandrec.SetFilter(mandrec.Complied, '%1', false);
                        if mandrec.FindSet then begin
                            bidderrec."Failed Mandatory" := true;
                            bidderrec.Modify;
                        end;
                    until bidderrec.Next = 0;

                //======================================================
                //i:=1;
                Mandatory.SetFilter(Mandatory."Company Name", '<>%1', '');
            end;
        }
        dataitem(Financial; "Bidder Mandatory Requirements")
        {
            DataItemTableView = where(Technical = const(true));
            RequestFilterHeading = 'Technical Requirements';
            column(ReportForNavId_3; 3)
            {
            }
            column(Specification_Financial; Financial.Specification)
            {
            }
            column(Technicalscore_Financial; Financial."Technical score")
            {
            }
            column(SystemScore_Financial; Financial."System Score")
            {
            }
            column(EvaluaterUserId_Financial; Financial."Evaluater User Id")
            {
            }
            column(CompanyName_Financial; Financial."Company Name")
            {
            }
            column(TechnicalMaximumScore_Financial; Financial."Technical Maximum Score")
            {
            }
            column(Financialavg; Financialavg)
            {
            }
            column(J; j)
            {
            }
            column(Financialthreshold; Financialthreshold)
            {
            }
            column(k; k)
            {
            }
            column(Financialquote; Financialquote)
            {
            }
            column(financialscore; financialscore)
            {
            }
            column(leastfinancial; leastfinancial)
            {
            }
            column(biddingwinner; biddingwinner)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //k+=1;
                finacialrec.Reset;
                bidderrec.Reset;
                bidderrec.SetFilter(bidderrec."Ref No.", Financial."Tender No");
                bidderrec.SetFilter(bidderrec.Name, '%1', Financial."Company Name");
                if bidderrec.FindSet then begin
                    if bidderrec."Failed Mandatory" = true then begin
                        CurrReport.Skip;
                    end;
                    if bidderrec."Failed Mandatory" = false then begin
                        j := 0;
                        Financialtot := 0;
                        Financialavg := 0;
                        finacialrec.Reset;
                        finacialrec.SetFilter(finacialrec."Tender No", Financial."Tender No");
                        finacialrec.SetFilter(finacialrec."Company Name", Financial."Company Name");
                        finacialrec.SetFilter(finacialrec.Technical, '%1', true);
                        if finacialrec.FindSet then
                            repeat
                                Financialtot := Financialtot + finacialrec."System Score";
                                j += 1;         //message('%1',finacialrec."System Score");
                            until finacialrec.Next = 0;
                        Financialavg := Financialtot / j;

                        //IF (((Financialquote<=bidderrec."Quoted Amount") and (bidderrec."Quoted Amount">0)) and (Financialquote>0)) then begin
                        //   leastfinancial:=Financialquote;
                        //end;
                        if bidderrec."Quoted Amount" > 0 then begin
                            Financialquote := bidderrec."Quoted Amount";
                            if leastfinancial > Financialquote then begin
                                leastfinancial := Financialquote;
                            end;
                            if leastfinancial < Financialquote then begin
                                if leastfinancial = 0 then begin
                                    leastfinancial := Financialquote;
                                end;
                            end;
                            //MESSAGE('least %1..quote:%2',leastfinancial,Financialquote);
                            biddingwinner := '';
                            if bidderrec."Recommended Winner" = true then begin
                                biddingwinner := bidderrec.Name;
                            end;
                        end;

                    end;

                end;
                //message('%1',Financialavg);
                if previousvend2 <> Financial."Company Name" then begin
                    k := 1
                end;
                if previousvend2 = Financial."Company Name" then begin
                    k := k + 1
                end;

                previousvend2 := Financial."Company Name";
                // k:=k+1;

                //message('%1..%2',k,Financial."Company Name");
                //message('%1',Financialthreshold);
                //MESSAGE('%1',leastfinancial);
                if Financialquote = 0 then begin
                    Financialquote := 1;
                end;
                financialscore := ROUND(leastfinancial / Financialquote * (100 - Financialthreshold), 0.02);
            end;

            trigger OnPreDataItem()
            begin
                Financial.SetRange(Financial."Tender No", Mandatory."Tender No");
                //===========================================================================
                procrec.Reset;
                procrec.SetFilter(procrec.No, Mandatory."Tender No");
                if procrec.FindSet then begin
                    Financialthreshold := procrec."Technical Score";
                end;
                //===========================================================================
                //message('%1',Financialthreshold);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        corec: Record "Company Information";
        avoidrep: array[100000] of Text;
        i: Integer;
        j: Integer;
        Compliedtxt: Text;
        procrec: Record "Procurement Request";
        bidderrec: Record Bidders;
        passedmandatory: Text;
        previousvend: Text;
        finacialrec: Record "Bidder Mandatory Requirements";
        Financialtot: Decimal;
        Financialavg: Decimal;
        Financialthreshold: Decimal;
        previousvend2: Text;
        k: Integer;
        Financialquote: Decimal;
        financialscore: Decimal;
        leastfinancial: Decimal;
        leastfinancial2: Decimal;
        biddingwinner: Text;
        mandrec: Record "Bidder Mandatory Requirements";
}
