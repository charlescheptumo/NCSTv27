#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69134 "Overtime Claims Approved"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Overtime Header";
    SourceTableView = where(Status = const(Approved));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("EMp No."; Rec."EMp No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Convert to pay"; Rec."Convert to pay")
                {
                    ApplicationArea = Basic;
                }
                field("Convert to Leave"; Rec."Convert to Leave")
                {
                    ApplicationArea = Basic;
                }
                field("Weekend Hours"; Rec."Weekend Hours")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("Dim Code 1"; Rec."Dim Code 1")
                {
                    ApplicationArea = Basic;
                }
                field("Dim Code 2"; Rec."Dim Code 2")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Overtime Details")
            {
                Caption = 'Overtime Details';
                part(Control1000000004; "Overtime Lines")
                {
                    SubPageLink = "EmpNo." = field("EMp No."),
                                  "Application Code" = field("Application Code");
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("-Convert To leave")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    if Rec."Convert to Leave" = true then
                        Rec."Convert Overtime"();
                end;
            }
            action("-Convert to Pay")
            {
                ApplicationArea = Basic;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                    Text001: label 'This transaction is already pending approval';
                begin



                    /*
                    IF "Paying Type"="Paying Type"::" " THEN
                    ERROR('Kindly spceify the paying type')
                    
                    ELSE IF ("Paying Vendor Account"<>'') AND ("Paying Bank Account"<>'') THEN
                    ERROR('You cannot have both paying bank and paying vendor, choose one')
                    
                    ELSE IF ("Paying Type"="Paying Type"::Vendor) AND ("Paying Vendor Account"='') THEN
                    ERROR('Kindly spceify the paying vendor account')
                    
                    ELSE IF ("Paying Type"="Paying Type"::Bank) AND ("Paying Bank Account"='') THEN
                    ERROR('Kindly spceify the paying bank account');
                    
                    
                    IF NOT LinesExists THEN
                       ERROR('There are no Lines created for this Document');
                    //Ensure No Items That should be committed that are not
                    IF LinesCommitmentStatus THEN
                      ERROR('There are some lines that have not been committed');
                    
                    PayLine.RESET;
                    PayLine.SETRANGE(PayLine.No,"No.");
                    PayLine.SETRANGE(PayLine.Type,'MEMBER');
                    IF PayLine.FIND('-') THEN BEGIN
                    IF PayLine."Transaction Type"=PayLine."Transaction Type"::" " THEN
                    ERROR('Transaction Type cannot be blank in payment lines');
                    END;
                    
                    TESTFIELD(Payee);
                    //Release the PV for Approval
                    
                    
                    BankAcc.RESET;
                    BankAcc.SETRANGE(BankAcc."No.","Paying Bank Account");
                    BankAcc.SETRANGE(BankAcc."Bank Type",BankAcc."Bank Type"::Cash);
                    IF BankAcc.FIND('-') THEN BEGIN
                    BankAcc.CALCFIELDS(BankAcc.Balance);
                    
                    IF  BankAcc.Balance<0 THEN
                    ERROR('Kindly ensure that the petty cash float is enough') ;
                    END;
                    */
                    //ApprovalMgt.SendOvertimeApprovalReq(Rec) ;

                end;
            }
            action("Cancel Approval REquest")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    //IF ApprovalMgt.CancelOvertimeAppRequest(Rec,TRUE,TRUE) THEN;
                end;
            }
            action("Fill Overtime Details`")
            {
                ApplicationArea = Basic;
                //RunObject = Page UnknownPage52018537;
            }
        }
    }

    var
        HRSETUP: Record "Human Resources Setup";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Imprest,ImprestSurrender,Interbank,Overtime;
}
