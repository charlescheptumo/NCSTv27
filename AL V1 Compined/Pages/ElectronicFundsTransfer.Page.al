#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57079 "Electronic Funds Transfer"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "EFT Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("EFT Batch")
            {
                Caption = 'EFT Batch';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank  No"; Rec."Bank  No")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = Basic;
                }
                field("Total Count"; Rec."Total Count")
                {
                    ApplicationArea = Basic;
                    Caption = 'Record Count';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Transferred; Rec.Transferred)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Transferred"; Rec."Date Transferred")
                {
                    ApplicationArea = Basic;
                }
                field("Time Transferred"; Rec."Time Transferred")
                {
                    ApplicationArea = Basic;
                }
                field("Transferred By"; Rec."Transferred By")
                {
                    ApplicationArea = Basic;
                }
                field(RTGS; Rec.RTGS)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1102760018; "EFT Details")
            {
                SubPageLink = "Header No" = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Get)
            {
                Caption = 'Get';
                separator(Action1102760024)
                {
                }
                action("Get Salary EFT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get Salary EFT';

                    trigger OnAction()
                    begin
                        if Rec.Transferred = true then
                            Error('EFT Batch already transfered. Please use another one.');

                        EFTHeader.Reset;
                        EFTHeader.SetRange(EFTHeader.No, Rec.No);
                        if EFTHeader.Find('-') then
                            Report.Run(39006076, true, true, EFTHeader)
                    end;
                }
                separator(Action1102760027)
                {
                }
                action("Re-genarate EFT Format")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-genarate EFT Format';
                    Visible = false;

                    trigger OnAction()
                    begin
                        EFTDetails.Reset;
                        EFTDetails.SetRange(EFTDetails."Header No", Rec.No);
                        if EFTDetails.Find('-') then begin
                            repeat
                                //EFTDetails.TESTFIELD(EFTDetails."Destination Account No");
                                EFTDetails.TestField(EFTDetails.Amount);
                                //EFTDetails.TESTFIELD(EFTDetails."Destination Account Name");
                                //EFTDetails.TESTFIELD(EFTDetails."Bank No");

                                //IF STRLEN(EFTDetails."Destination Account No") > 13 THEN
                                //ERROR('Destnation account %1 more than 13 characters.',EFTDetails."Destination Account No");

                                TextGen := Format(EFTDetails.Amount);


                                /*
                                IF EFTDetails.Amount <> ROUND(EFTDetails.Amount,1) THEN BEGIN
                                IF EFTDetails.Amount <> ROUND(EFTDetails.Amount,0.1) THEN BEGIN
                                EFTDetails.ExportFormat:=PADSTR('',13-STRLEN(EFTDetails."Destination Account No"),' ')+EFTDetails."Destination Account No"+
                                                         PADSTR('',6,' ')+
                                                         PADSTR('',6-STRLEN(EFTDetails."Bank No"),' ')+EFTDetails."Bank No"+' '+
                                                         EFTDetails."Destination Account Name"+PADSTR('',30-STRLEN(EFTDetails."Destination Account Name"),' ')+
                                                         PADSTR('',9-STRLEN(DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')),' ')+
                                                                DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')+
                                                         PADSTR('',8-STRLEN(EFTDetails."Staff No"),' ')+EFTDetails."Staff No";
                                END ELSE BEGIN
                                EFTDetails.ExportFormat:=PADSTR('',13-STRLEN(EFTDetails."Destination Account No"),' ')+EFTDetails."Destination Account No"+
                                                         PADSTR('',6,' ')+
                                                         PADSTR('',6-STRLEN(EFTDetails."Bank No"),' ')+EFTDetails."Bank No"+' '+
                                                         EFTDetails."Destination Account Name"+PADSTR('',30-STRLEN(EFTDetails."Destination Account Name"),' ')+
                                                         PADSTR('',8-STRLEN(DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')),' ')+
                                                                DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')+'0'+
                                                         PADSTR('',8-STRLEN(EFTDetails."Staff No"),' ')+EFTDetails."Staff No";
                                END;
                                END ELSE BEGIN
                                EFTDetails.ExportFormat:=PADSTR('',13-STRLEN(EFTDetails."Destination Account No"),' ')+EFTDetails."Destination Account No"+
                                                         PADSTR('',6,' ')+
                                                         PADSTR('',6-STRLEN(EFTDetails."Bank No"),' ')+EFTDetails."Bank No"+' '+
                                                         EFTDetails."Destination Account Name"+PADSTR('',30-STRLEN(EFTDetails."Destination Account Name"),' ')+
                                                         PADSTR('',7-STRLEN(DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')),' ')+
                                                                DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')+'00'+
                                                         PADSTR('',8-STRLEN(EFTDetails."Staff No"),' ')+EFTDetails."Staff No";
                                END;
                                */
                                if EFTDetails.Amount <> ROUND(EFTDetails.Amount, 1) then begin
                                    if EFTDetails.Amount <> ROUND(EFTDetails.Amount, 0.1) then begin
                                        EFTDetails.ExportFormat := PadStr('', 15 - StrLen(EFTDetails."Destination Account No"), ' ') + EFTDetails."Destination Account No" +
                                                                 PadStr('', 4, ' ') +
                                                                 PadStr('', 6 - StrLen(EFTDetails."Bank No"), ' ') + EFTDetails."Bank No" + ' ' +
                                                                 EFTDetails."Destination Account Name" + PadStr('', 30 - StrLen(EFTDetails."Destination Account Name"), ' ') +
                                                                 PadStr('', 9 - StrLen(DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',')), ' ') +
                                                                        DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',') +
                                                                 PadStr('', 8 - StrLen(EFTDetails."Staff No"), ' ') + EFTDetails."Staff No";
                                    end else begin
                                        EFTDetails.ExportFormat := PadStr('', 15 - StrLen(EFTDetails."Destination Account No"), ' ') + EFTDetails."Destination Account No" +
                                                                 PadStr('', 4, ' ') +
                                                                 PadStr('', 6 - StrLen(EFTDetails."Bank No"), ' ') + EFTDetails."Bank No" + ' ' +
                                                                 EFTDetails."Destination Account Name" + PadStr('', 30 - StrLen(EFTDetails."Destination Account Name"), ' ') +
                                                                 PadStr('', 8 - StrLen(DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',')), ' ') +
                                                                        DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',') + '0' +
                                                                 PadStr('', 8 - StrLen(EFTDetails."Staff No"), ' ') + EFTDetails."Staff No";
                                    end;
                                end else begin
                                    EFTDetails.ExportFormat := PadStr('', 15 - StrLen(EFTDetails."Destination Account No"), ' ') + EFTDetails."Destination Account No" +
                                                             PadStr('', 4, ' ') +
                                                             PadStr('', 6 - StrLen(EFTDetails."Bank No"), ' ') + EFTDetails."Bank No" + ' ' +
                                                             EFTDetails."Destination Account Name" + PadStr('', 30 - StrLen(EFTDetails."Destination Account Name"), ' ') +
                                                             PadStr('', 7 - StrLen(DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',')), ' ') +
                                                                    DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',') + '00' +
                                                             PadStr('', 8 - StrLen(EFTDetails."Staff No"), ' ') + EFTDetails."Staff No";
                                end;


                                //EXIT;
                                //ERROR('haha');


                                EFTDetails.Transferred := true;
                                EFTDetails.Modify;
                            until EFTDetails.Next = 0;
                        end;

                    end;
                }
                separator(Action1102760032)
                {
                }
                action("Dividends EFT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dividends EFT';

                    trigger OnAction()
                    begin
                        //IF Transferred = TRUE THEN
                        //ERROR('EFT Batch already transfered. Please use another one.');

                        EFTHeader.Reset;
                        EFTHeader.SetRange(EFTHeader.No, Rec.No);
                        if EFTHeader.Find('-') then
                            Report.Run(39004479, true, true, EFTHeader)
                    end;
                }
                separator(Action1102760035)
                {
                }
                action("Salary Dividends EFT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Salary Dividends EFT';

                    trigger OnAction()
                    begin
                        if Rec.Transferred = true then
                            Error('EFT Batch already transfered. Please use another one.');

                        EFTHeader.Reset;
                        EFTHeader.SetRange(EFTHeader.No, Rec.No);
                        if EFTHeader.Find('-') then
                            Report.Run(39004484, true, true, EFTHeader)
                    end;
                }
                separator(Action1102760034)
                {
                }
                action("Generate Dividends EFT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate Dividends EFT';

                    trigger OnAction()
                    begin

                        EFTDetails.Reset;
                        EFTDetails.SetRange(EFTDetails."Header No", Rec.No);
                        if EFTDetails.Find('-') then begin
                            repeat
                                EFTDetails.TestField(EFTDetails."Destination Account No");
                                EFTDetails.TestField(EFTDetails.Amount);
                                EFTDetails.TestField(EFTDetails."Destination Account Name");
                                EFTDetails.TestField(EFTDetails."Bank No");

                                if StrLen(EFTDetails."Destination Account Name") > 28 then
                                    Error('Destnation account name of staff no %1 more than 28 characters.', EFTDetails."Staff No");

                                if StrLen(EFTDetails."Destination Account No") > 14 then
                                    Error('Destnation account of staff no %1 more than 14 characters.', EFTDetails."Staff No");

                                //For STIMA, replace staff No with stima
                                ReffNo := 'STIMA';

                                if EFTDetails.Amount <> ROUND(EFTDetails.Amount, 1) then begin
                                    if EFTDetails.Amount <> ROUND(EFTDetails.Amount, 0.1) then begin
                                        EFTDetails.ExportFormat := PadStr('', 14 - StrLen(EFTDetails."Destination Account No"), ' ') + EFTDetails."Destination Account No" +
                                                                 PadStr('', 5, ' ') +
                                                                 PadStr('', 6 - StrLen(EFTDetails."Bank No"), ' ') + EFTDetails."Bank No" + ' ' +
                                                                 EFTDetails."Destination Account Name" + PadStr('', 30 - StrLen(EFTDetails."Destination Account Name"), ' ') +
                                                                 PadStr('', 9 - StrLen(DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',')), ' ') +
                                                                        DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',') +
                                                                 PadStr('', 8 - StrLen(CopyStr(ReffNo, 1, 8)), ' ') + ReffNo;
                                    end else begin
                                        EFTDetails.ExportFormat := PadStr('', 14 - StrLen(EFTDetails."Destination Account No"), ' ') + EFTDetails."Destination Account No" +
                                                                 PadStr('', 5, ' ') +
                                                                 PadStr('', 6 - StrLen(EFTDetails."Bank No"), ' ') + EFTDetails."Bank No" + ' ' +
                                                                 EFTDetails."Destination Account Name" + PadStr('', 30 - StrLen(EFTDetails."Destination Account Name"), ' ') +
                                                                 PadStr('', 8 - StrLen(DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',')), ' ') +
                                                                        DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',') + '0' +
                                                                 PadStr('', 8 - StrLen(CopyStr(ReffNo, 1, 8)), ' ') + ReffNo;
                                    end;
                                end else begin
                                    TextGen := Format(EFTDetails."Staff No");

                                    EFTDetails.ExportFormat := PadStr('', 14 - StrLen(EFTDetails."Destination Account No"), ' ') + EFTDetails."Destination Account No" +
                                                             PadStr('', 5, ' ') +
                                                             PadStr('', 6 - StrLen(EFTDetails."Bank No"), ' ') + EFTDetails."Bank No" + ' ' +
                                                             EFTDetails."Destination Account Name" + PadStr('', 30 - StrLen(EFTDetails."Destination Account Name"), ' ') +
                                                             PadStr('', 7 - StrLen(DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',')), ' ') +
                                                                    DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',') + '00' +
                                                             PadStr('', 8 - StrLen(CopyStr(ReffNo, 1, 8)), ' ') + ReffNo;
                                end;



                                EFTDetails.Modify;
                            until EFTDetails.Next = 0;
                        end;




                        EFTDetails.Reset;
                        EFTDetails.SetRange(EFTDetails."Header No", Rec.No);
                        if EFTDetails.Find('-') then
;
                    end;
                }
            }
        }
        area(processing)
        {
            action("View Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'View Schedule';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    EFTHeader.Reset;
                    EFTHeader.SetRange(EFTHeader.No, Rec.No);
                    if EFTHeader.Find('-') then
                        Report.Run(39004320, true, true, EFTHeader)
                end;
            }
            action(Transfer)
            {
                ApplicationArea = Basic;
                Caption = 'Transfer';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //TESTFIELD("Bank  No");

                    if Rec.Transferred = true then
                        Error('Funds transfers has already been done.');

                    if Confirm('Are you absolutely sure you want to post the EFT tranfers.', false) = false then
                        exit;


                    GenJournalLine.Reset;
                    GenJournalLine.SetRange(GenJournalLine."Journal Template Name", 'PURCHASES');
                    GenJournalLine.SetRange(GenJournalLine."Journal Batch Name", 'EFT');
                    if GenJournalLine.Find('-') then
                        GenJournalLine.DeleteAll;

                    EFTDetails.Reset;
                    EFTDetails.SetRange(EFTDetails."Header No", Rec.No);
                    if EFTDetails.Find('-') then begin
                        repeat
                            //EFTDetails.TESTFIELD(EFTDetails."Destination Account No");
                            EFTDetails.TestField(EFTDetails.Amount);
                            //EFTDetails.TESTFIELD(EFTDetails."Destination Account Name");
                            //EFTDetails.TESTFIELD(EFTDetails."Bank No");

                            if StrLen(EFTDetails."Destination Account Name") > 28 then
                                Error('Destnation account name of staff no %1 more than 28 characters.', EFTDetails."Staff No");

                            if StrLen(EFTDetails."Destination Account No") > 14 then
                                Error('Destnation account of staff no %1 more than 14 characters.', EFTDetails."Staff No");


                            LineNo := LineNo + 10000;

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := 'PURCHASES';
                            GenJournalLine."Journal Batch Name" := 'EFT';
                            GenJournalLine."Document No." := Rec.No;
                            GenJournalLine."External Document No." := CopyStr(EFTDetails."Destination Account No", 1, 20);
                            GenJournalLine."Line No." := LineNo;
                            if EFTDetails."Standing Order No" <> '' then begin

                                /*IF AccountType.GET(EFTDetails."Account Type") THEN BEGIN
                                AccountType.TESTFIELD(AccountType."Standing Orders Suspense");
                                GenJournalLine."Account Type":=GenJournalLine."Account Type"::"G/L Account";
                                GenJournalLine."Account No.":=AccountType."Standing Orders Suspense";
                                GenJournalLine.VALIDATE(GenJournalLine."Account No.");
                                GenJournalLine.Description:='STO EFT - ' + EFTDetails."Standing Order No";
                                END;
                                END ELSE BEGIN*/
                                GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                                GenJournalLine."Account No." := EFTDetails."Account No";
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine.Description := 'EFT to Account ' + EFTDetails."Destination Account No";
                                //END;
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Validate(GenJournalLine."Currency Code");
                                GenJournalLine.Amount := EFTDetails.Amount;
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                if GenJournalLine."Shortcut Dimension 1 Code" = '' then begin
                                    GenJournalLine."Shortcut Dimension 1 Code" := 'FOSA';
                                    GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                end;
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;

                                //Charges
                                if (EFTDetails."Account No" <> '5-02-09565-00') and
                                   (EFTDetails."Account No" <> '5-02-09276-01') then begin

                                    LineNo := LineNo + 10000;

                                    GenJournalLine.Init;
                                    GenJournalLine."Journal Template Name" := 'PURCHASES';
                                    GenJournalLine."Journal Batch Name" := 'EFT';
                                    GenJournalLine."Document No." := Rec.No;
                                    GenJournalLine."External Document No." := CopyStr(EFTDetails."Destination Account No", 1, 20);
                                    GenJournalLine."Line No." := LineNo;
                                    GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                                    GenJournalLine."Account No." := EFTDetails."Account No";
                                    GenJournalLine.Validate(GenJournalLine."Account No.");
                                    GenJournalLine."Posting Date" := Today;
                                    if Rec.RTGS = true then
                                        GenJournalLine.Description := 'RTGS Charges'
                                    else
                                        GenJournalLine.Description := 'EFT Charges';
                                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                                    GenJournalLine.Amount := EFTDetails.Charges;
                                    GenJournalLine.Validate(GenJournalLine.Amount);
                                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                                    GenJournalLine."Bal. Account No." := EFTDetails."EFT Charges Account";
                                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                    if GenJournalLine."Shortcut Dimension 1 Code" = '' then begin
                                        GenJournalLine."Shortcut Dimension 1 Code" := 'FOSA';
                                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                    end;
                                    if GenJournalLine.Amount <> 0 then
                                        GenJournalLine.Insert;

                                end;

                                //Charges
                                /*
                                //Clear EFT
                                Transactions.RESET;
                                Transactions.SETRANGE(Transactions."Cheque No",EFTDetails.No);
                                Transactions.SETRANGE(Transactions."Transaction Type",'EFT');
                                Transactions.SETRANGE(Transactions."Account No",EFTDetails."Account No");
                                IF Transactions.FIND('-') THEN BEGIN
                                Transactions."Cheque Processed":=TRUE;
                                Transactions."Date Cleared":=TODAY;
                                Transactions.MODIFY;
                                END;
                                */
                                //Clear EFT

                                //IF STRLEN(EFTDetails."Destination Account No") > 13 THEN
                                //ERROR('Destnation account %1 more than 13 characters.',EFTDetails."Destination Account No");

                                /*
                                IF EFTDetails.Amount <> ROUND(EFTDetails.Amount,1) THEN BEGIN
                                EFTDetails.ExportFormat:=PADSTR('',13-STRLEN(EFTDetails."Destination Account No"),' ')+EFTDetails."Destination Account No"+
                                                         PADSTR('',6,' ')+
                                                         PADSTR('',6-STRLEN(EFTDetails."Bank No"),' ')+EFTDetails."Bank No"+' '+
                                                         EFTDetails."Destination Account Name"+PADSTR('',30-STRLEN(EFTDetails."Destination Account Name"),' ')+
                                                         PADSTR('',9-STRLEN(DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')),' ')+
                                                                DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')+
                                                         PADSTR('',8-STRLEN(EFTDetails."Staff No"),' ')+EFTDetails."Staff No";

                                END ELSE BEGIN
                                EFTDetails.ExportFormat:=PADSTR('',13-STRLEN(EFTDetails."Destination Account No"),' ')+EFTDetails."Destination Account No"+
                                                         PADSTR('',6,' ')+
                                                         PADSTR('',6-STRLEN(EFTDetails."Bank No"),' ')+EFTDetails."Bank No"+' '+
                                                         EFTDetails."Destination Account Name"+PADSTR('',30-STRLEN(EFTDetails."Destination Account Name"),' ')+
                                                         PADSTR('',7-STRLEN(DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')),' ')+
                                                                DELCHR(DELCHR(FORMAT(EFTDetails.Amount),'=','.'),'=',',')+'00'+
                                                         PADSTR('',8-STRLEN(EFTDetails."Staff No"),' ')+EFTDetails."Staff No";
                                END;
                                */

                                EFTDetails.Transferred := true;
                                EFTDetails.Modify;


                                /*
                                //Mark the standing order register has transfered
                                STORegister.RESET;
                                STORegister.SETRANGE(STORegister."Register No.",EFTDetails."Standing Order Register No");
                                IF STORegister.FIND('-') THEN BEGIN
                                STORegister."Transfered to EFT":=TRUE;
                                STORegister.MODIFY;
                                END;
                                */
                            end;
                        until EFTDetails.Next = 0;
                    end;


                    //Bank Entry
                    Rec.CalcFields(Total);

                    LineNo := LineNo + 10000;

                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := 'PURCHASES';
                    GenJournalLine."Journal Batch Name" := 'EFT';
                    GenJournalLine."Document No." := Rec.No;
                    GenJournalLine."External Document No." := Rec."Cheque No";
                    GenJournalLine."Line No." := LineNo;
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                    GenJournalLine."Account No." := Rec."Bank  No";
                    GenJournalLine.Validate(GenJournalLine."Account No.");
                    GenJournalLine."Posting Date" := Today;
                    GenJournalLine.Description := 'Electronic Funds Transfer - ' + Rec.No;
                    GenJournalLine.Validate(GenJournalLine."Currency Code");
                    GenJournalLine.Amount := -Rec.Total;
                    GenJournalLine.Validate(GenJournalLine.Amount);
                    GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                    if GenJournalLine."Shortcut Dimension 1 Code" = '' then begin
                        GenJournalLine."Shortcut Dimension 1 Code" := 'FOSA';
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                    end;
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;
                    //Bank Entry

                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", 'PURCHASES');
                    GenJournalLine.SetRange("Journal Batch Name", 'EFT');
                    if GenJournalLine.Find('-') then begin
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine);
                    end;


                    Rec.Transferred := true;
                    Rec."Date Transferred" := Today;
                    Rec."Time Transferred" := Time;
                    Rec."Transferred By" := UserId;
                    Rec.Modify;


                    Message('EFT Posted successfully.');

                end;
            }
        }
    }

    var
        GenJournalLine: Record "Gen. Journal Line";
        GLPosting: Codeunit "Gen. Jnl.-Post Line";
        Account: Record Vendor;
        AvailableBal: Decimal;
        LineNo: Integer;
        EFTDetails: Record "EFT Details";
        Accounts: Record Vendor;
        EFTHeader: Record "EFT Header";
        TextGen: Text[250];
        ReffNo: Code[20];
}

