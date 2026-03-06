#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65095 "GFA Close Opportunity"
{
    Caption = 'Close Opportunity';
    DataCaptionExpression = Caption;
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = Card;
    SourceTable = "GFA Opportunity Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(OptionWon; Rec."Action Taken")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Opportunity Status';
                    ToolTip = 'Specifies the action that was taken when the entry was last updated. There are six options:';
                    ValuesAllowed = Won, Lost;

                    trigger OnValidate()
                    var
                        CloseOpportunityCode: Record "Funding Decision Reasons";
                    begin
                        if Rec."Action Taken" = Rec."action taken"::Lost then
                            LostActionTakenOnValidate;
                        if Rec."Action Taken" = Rec."action taken"::Won then
                            WonActionTakenOnValidate;

                        case Rec."Action Taken" of
                            Rec."action taken"::Won:
                                begin
                                    CalcdCurrentValueLCYEnable := true;
                                    if Opp.Get(Rec."Opportunity No.") then
                                        SalesQuoteEnable := Opp."Sales Document No." <> '';
                                end;
                            Rec."action taken"::Lost:
                                begin
                                    CalcdCurrentValueLCYEnable := false;
                                    SalesQuoteEnable := false;
                                end;
                        end;

                        Rec.UpdateEstimates;
                        case Rec."Action Taken" of
                            Rec."action taken"::Won:
                                begin
                                    CloseOpportunityCode.SetRange(Type, CloseOpportunityCode.Type::Won);
                                    if CloseOpportunityCode.Count = 1 then begin
                                        CloseOpportunityCode.FindFirst;
                                        Rec."Close Opportunity Code" := CloseOpportunityCode.Code;
                                    end;
                                end;
                            Rec."action taken"::Lost:
                                begin
                                    CloseOpportunityCode.SetRange(Type, CloseOpportunityCode.Type::Lost);
                                    if CloseOpportunityCode.Count = 1 then begin
                                        CloseOpportunityCode.FindFirst;
                                        Rec."Close Opportunity Code" := CloseOpportunityCode.Code;
                                    end;
                                end;
                        end;
                    end;
                }
                field("Close Opportunity Code"; Rec."Close Opportunity Code")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Close Opportunity Code';
                    ToolTip = 'Specifies the code for closing the opportunity.';
                }
                field("Date of Change"; Rec."Date of Change")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Closing Date';
                    ToolTip = 'Specifies the date this opportunity entry was last changed.';
                }
                field("Calcd. Current Value (LCY)"; Rec."Calcd. Current Value (LCY)")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Total Amount Awarded(LCY)';
                    Enabled = CalcdCurrentValueLCYEnable;
                    ToolTip = 'Specifies the calculated current value of the opportunity entry.';
                }
                field("Cancel Old To Do"; Rec."Cancel Old To Do")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Cancel Old Tasks';
                    ToolTip = 'Specifies a task is to be cancelled from the opportunity.';
                }
                field(Challenges; Rec.Challenges)
                {
                    ApplicationArea = Basic;
                }
                field("Lessons Learnt"; Rec."Lessons Learnt")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Mitigating Factors"; Rec."Mitigating Factors")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Finish)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = '&Finish';
                Image = Approve;
                InFooterBar = true;
                Promoted = true;
                ToolTip = 'Finish closing the opportunity.';
                Visible = IsOnMobile;

                trigger OnAction()
                begin
                    Rec.CheckStatus;
                    Rec.FinishWizard;
                    CurrPage.Close;
                end;
            }
            action(SalesQuote)
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Sales Quote';
                Enabled = SalesQuoteEnable;
                Image = Quote;
                InFooterBar = true;
                Promoted = true;
                ToolTip = 'Create a sales quote based on the opportunity.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    if Opp.Get(Rec."Opportunity No.") then begin
                        Opp.ShowQuote;
                        if SalesHeader.Get(SalesHeader."document type"::Quote, Opp."Sales Document No.") then begin
                            Rec."Calcd. Current Value (LCY)" := Rec.GetSalesDocValue(SalesHeader);
                            CurrPage.Update;
                        end;
                    end;
                end;
            }
        }
    }

    trigger OnInit()
    begin
        OptionLostEnable := true;
        OptionWonEnable := true;
        SalesQuoteEnable := true;
        CalcdCurrentValueLCYEnable := true;
    end;

    trigger OnOpenPage()
    begin
        UpdateEditable;
        Rec."Cancel Old To Do" := true;
        IsOnMobile := ClientTypeManagement.GetCurrentClientType = Clienttype::Phone;
    end;

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin
        if CloseAction in [Action::OK, Action::LookupOK] then begin
            Rec.CheckStatus;
            Rec.FinishWizard;
        end;
    end;

    var
        Text000: label 'untitled';
        Cont: Record Contact;
        Opp: Record Opportunity;
        ClientTypeManagement: Codeunit "Client Type Management";
        [InDataSet]
        CalcdCurrentValueLCYEnable: Boolean;
        [InDataSet]
        SalesQuoteEnable: Boolean;
        [InDataSet]
        OptionWonEnable: Boolean;
        [InDataSet]
        OptionLostEnable: Boolean;
        IsNotAValidSelectionErr: label '%1 is not a valid selection.', Comment = '%1 - Field Value';
        IsOnMobile: Boolean;
        Text001: label 'untitled';

    local procedure Caption(): Text[260]
    var
        CaptionStr: Text[260];
    begin
        if Cont.Get(Rec."Contact Company No.") then
            CaptionStr := CopyStr(Cont."No." + ' ' + Cont.Name, 1, MaxStrLen(CaptionStr));
        if Cont.Get(Rec."Contact No.") then
            CaptionStr := CopyStr(CaptionStr + ' ' + Cont."No." + ' ' + Cont.Name, 1, MaxStrLen(CaptionStr));
        if CaptionStr = '' then
            CaptionStr := Text000;

        exit(CaptionStr);
    end;

    local procedure UpdateEditable()
    begin
        if Rec.GetFilter(Rec."Action Taken") <> '' then begin
            OptionWonEnable := false;
            OptionLostEnable := false;
        end;
    end;

    local procedure WonActionTakenOnValidate()
    begin
        if not OptionWonEnable then
            Error(IsNotAValidSelectionErr, Rec."Action Taken");
    end;

    local procedure LostActionTakenOnValidate()
    begin
        if not OptionLostEnable then
            Error(IsNotAValidSelectionErr, Rec."Action Taken");
    end;
}
