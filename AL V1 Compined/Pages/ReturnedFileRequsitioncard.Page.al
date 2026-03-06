#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59104 "Returned File Requsition card"
{
    Caption = 'Returned File Requsition card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "File Movement Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                }
                field("Responsiblity Center"; Rec."Responsiblity Center")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Duration Requested"; Rec."Duration Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Return Date"; Rec."Expected Return Date")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Issuing File Location"; Rec."Issuing File Location")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("File Movement Status"; Rec."File Movement Status")
                {
                    ApplicationArea = Basic;
                    OptionCaption = '<Open,Issued,Returned>';
                }
                field("Current File Location"; Rec."Current File Location")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000023; "File Movement Line")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    DocumentType := Documenttype::"File Movement";
                    ApprovalEntries.SetRecordfilters(Database::"File Movement Header", DocumentType, Rec."No.");
                    ApprovalEntries.Run;
                end;
            }
        }
    }

    trigger OnInit()
    begin
        if Rec.Status = Rec.Status::Approved then
            CurrPage.Editable := false;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Approved then
            CurrPage.Editable := false;
        Rec."Issuing File Location" := 'REGISRTY';
    end;

    var
        DocumentType: Option " ",Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Withdrawal","Membership Reg","Loan Batches","Payment Voucher","Petty Cash",Loan,Interbank,Checkoff,"Savings Product Opening","Standing Order",ChangeRequest,Custodial,"File Movement";
        ApprovalEntries: Page "Approval Entries";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}
