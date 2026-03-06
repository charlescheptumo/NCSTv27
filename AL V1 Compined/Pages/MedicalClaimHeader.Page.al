#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69273 "Medical Claim Header"
{
    // // NameDataTypeSubtypeLength ImportClaimsXMLportXMLport51511005

    Editable = true;
    PageType = Card;
    SourceTable = "Medical Claim Header1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Claim No"; Rec."Claim No")
                {
                    ApplicationArea = Basic;
                }
                field("Claim Date"; Rec."Claim Date")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Service Provider"; Rec."Service Provider")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Service Provider Name"; Rec."Service Provider Name")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Settled; Rec.Settled)
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(Claimant; Rec.Claimant)
                {
                    ApplicationArea = Basic;
                }
                field("Fiscal Year"; Rec."Fiscal Year")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Approvals"; Rec."No. of Approvals")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000010; "Claim Lines")
            {
                SubPageLink = "Claim No" = field("Claim No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Import)
            {
                Caption = 'Import';
                action("Import Claim Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Claim Lines';

                    trigger OnAction()
                    begin
                        //ImportClaims.RUN;
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.SendMedClaimApprovalRequest(Rec) THEN;
                        Message('Approval Request has been sent Successfully');
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelMedClaimApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
            }
            group(Approvals)
            {
                Caption = 'Approvals';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Claimant := Rec.Claimant::"Service Provider";
    end;

    var
        HRSetup: Record "Human Resources Setup";
        Link: Text[250];
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}
