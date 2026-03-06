#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59098 "Approved File Requsition Card"
{
    Caption = 'Approved File Requsition Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "File Movement Header";

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
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = true;

                trigger OnAction()
                begin
                    //OnSend Approval
                    // //cc//if ApprovalsMgmt.CheckFileMovementApprovalWorkflowEnabled(Rec) THEN
                    //  //cc//ApprovalsMgmt.OnSendFileMovementDocForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    // //cc//if ApprovalsMgmt.CheckFileMovementApprovalWorkflowEnabled(Rec) THEN
                    //   //ApprovalsMgmt.OnCancelFileMovementApprovalRequest(Rec);
                end;
            }
            action("Dispatch File")
            {
                ApplicationArea = Basic;
                Caption = 'Dispatch File';
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                begin
                    FileMovementLine.Reset;
                    FileMovementLine.SetRange("Document No.", Rec."No.");
                    if FileMovementLine.FindSet then begin
                        repeat
                            RegistryFileCreation.Reset;
                            RegistryFileCreation.SetRange("File No", FileMovementLine."File Number");
                            if RegistryFileCreation.FindSet then
                                RecordLinks.Reset;
                            RecordLinks.SetRange("Record ID", RegistryFileCreation.RecordId);
                            if RecordLinks.FindSet then begin
                                repeat
                                    RecordLink1.Init;
                                    RecordLink2.Reset;
                                    RecordLink2.SetFilter("Link ID", '<>%1', 0);
                                    if RecordLink2.FindLast then begin
                                        RecordLink1."Link ID" := RecordLink2."Link ID" + 1;
                                    end;
                                    RecordLink1."Record ID" := Rec.RecordId;
                                    RecordLink1.URL1 := RecordLinks.URL1;
                                    //cc//    RecordLink1.URL2 := RecordLinks.URL2;
                                    //cc//      RecordLink1.URL3 := RecordLinks.URL3;
                                    //cc//     RecordLink1.URL4 := RecordLinks.URL4;
                                    RecordLink1.Description := RecordLinks.Description;
                                    RecordLink1.Type := RecordLinks.Type;
                                    RecordLink1.Note := RecordLinks.Note;
                                    RecordLink1.Created := CreateDatetime(Today, Time);
                                    RecordLink1."User ID" := UserId;
                                    RecordLink1.Company := RecordLinks.Company;
                                    RecordLink1.Notify := RecordLinks.Notify;
                                    RecordLink1."To User ID" := RecordLinks."To User ID";
                                    RecordLink1.Insert(true);
                                //MESSAGE('Link is :%1',RecordLinks.URL1);

                                until RecordLinks.Next = 0;
                                //  END;
                            end;
                        until FileMovementLine.Next = 0;
                    end;
                    //Procurement.fncopylinks(Rec);
                    Rec."Retrieved By" := UserId;
                    FileLines.Reset;
                    FileLines.SetRange("Document No.", Rec."No.");
                    if FileLines.Find('-') then begin
                        Rec."Current File Location" := FileLines."Department Name";
                    end;
                    Rec."File Movement Status" := Rec."file movement status"::Issued;
                    Rec.Modify(true);
                    Message('Issued Successfully');
                end;
            }
            action("Receive File")
            {
                ApplicationArea = Basic;
                Caption = 'Receive File';
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    //"Returned By":=USERID
                end;
            }
            action("Transfer File")
            {
                ApplicationArea = Basic;
                Caption = 'Transfer File';
                Image = AssemblyBOM;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    //"Current File Location":='REGISRTY';
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
        FileLines: Record "File Movement Line";
        FileMovementLine: Record "File Movement Line";
        FileMovementLine1: Record "File Movement Line";
        RecordCreation: Record "Record Creation";
        Procurement: Codeunit "Procurement Processing";
        RegistryFileCreation: Record "Record Creation";
        RecordLinks: Record "Record Link";
        RecordLink1: Record "Record Link";
        RecordLink2: Record "Record Link";
}
