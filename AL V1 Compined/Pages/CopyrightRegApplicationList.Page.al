#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56010 "Copyright Reg Application List"
{
    ApplicationArea = Basic;
    Caption = 'Application for Copyright Registration';
    CardPageID = "Copyright Application Card";
    DeleteAllowed = false;
    Editable = true;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Copyright Registration Table";
    SourceTableView = where(Status = filter(Open | Pending));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Customer Category"; Rec."Customer Category")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Title"; Rec."Copyright Title")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Category Description"; Rec."Copyright Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright SubCategory Desc"; Rec."Copyright SubCategory Desc")
                {
                    ApplicationArea = Basic;
                }
                field("Payemnt Reference No"; Rec."Payemnt Reference No")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Function")
            {
                Caption = 'Function';
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print CR1")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print CR1';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange(Rec."No.", Rec."No.");
                        Report.Run(58000, true, true, Rec)
                    end;
                }
                separator(Action1102755012)
                {
                    Caption = '-';
                }
                action(Approval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := Documenttype::"Account Opening";
                        //cc//  ApprovalEntries.SetRecordfilters(Database::Table53019, DocumentType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    var
                        Text001: label 'This request is already pending approval';
                    begin
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                }
                separator(Action1102755004)
                {
                    Caption = '       -';
                }
                action("NonRefundable Deposit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process NonRefundable Deposit';
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*
                        IF Status<>Status::Approved THEN
                        ERROR('This application has not been approved');
                        
                        
                        IF CONFIRM('Are you sure you want to create account application?',FALSE)=TRUE THEN BEGIN
                        
                        IF "ID No."<>'' THEN BEGIN
                        Cust.RESET;
                        Cust.SETRANGE(Cust."ID No.","ID No.");
                        Cust.SETRANGE(Cust."Customer Type",Cust."Customer Type"::Member);
                        IF Cust.FIND('-') THEN BEGIN
                        IF Cust."No." <> "No." THEN
                           ERROR('Member has already been created');
                        END;
                        END;
                        
                        //Create BOSA account
                        Cust."No.":='';
                        Cust."Old Member No":="Old Member No";
                        Cust.Name:=UPPERCASE(Name);
                        Cust.Address:=Address;
                        Cust."Post Code":="Post Code";
                        Cust.City:=City;
                        Cust.County:=City;
                        Cust."Country/Region Code":="Country/Region Code";
                        Cust."Force No.":="Force No.";
                        Cust."Phone No.":="Phone No.";
                        Cust."Global Dimension 1 Code":="Global Dimension 1 Code" ;
                        Cust."Global Dimension 2 Code":="Global Dimension 2 Code";
                        Cust."Customer Posting Group":="Customer Posting Group";
                        Cust."Registration Date":=TODAY;//"Registration Date"; Registration date must be the day the application is converted to a member and not day of capture*****cyrus
                        Cust.Status:=Cust.Status::Active;
                        Cust."Employer Code":="Employer Code";
                        Cust."Date of Birth":="Date of Birth";
                        Cust."Station/Department":="Station/Department";
                        Cust."E-Mail":="E-Mail (Personal)";
                        Cust.Location:=Location;
                        //**
                        Cust."Office Branch":="Office Branch";
                        Cust.Department:=Department;
                        Cust.Occupation:=Occupation;
                        Cust.Designation:=Designation;
                        Cust."Bank Code":="Bank Code";
                        Cust."Bank Branch Code":="Bank Name";
                        Cust."Bank Account No.":="Bank Account No";
                        //**
                        Cust."Sub-Location":="Sub-Location";
                        Cust.District:=District;
                        Cust."Payroll/Staff No":="Payroll/Staff No";
                        Cust."ID No.":="ID No.";
                        Cust."Passport No.":="Passport No.";
                        Cust."Salesperson Code":="Salesperson Code";
                        Cust."Mobile Phone No":="Mobile Phone No";
                        Cust."Marital Status":="Marital Status";
                        Cust."Customer Type":=Cust."Customer Type"::Member;
                        Cust.Gender:=Gender;
                        
                        //CALCFIELDS(Signature,Picture);
                        
                        Cust."Monthly Contribution":="Monthly Contribution";
                        Cust."Contact Person":="Contact Person";
                        Cust."Contact Person Phone":="Contact Person Phone";
                        Cust."ContactPerson Relation":="ContactPerson Relation";
                        Cust."Recruited By":="Recruited By";
                        Cust."Salesperson Code":="Salesperson Code";
                        Cust."ContactPerson Occupation":="ContactPerson Occupation";
                        Cust."Village/Residence":="Village/Residence";
                        Cust.INSERT(TRUE);
                        //Cust.VALIDATE(Cust."ID No.");
                        
                        //CLEAR(Picture);
                        //CLEAR(Signature);
                        //MODIFY;
                        
                        
                        ImageData."ID NO":="ID No.";
                        ImageData.Picture:=Picture;
                        ImageData.Signature:=Signature;
                        ImageData.INSERT(TRUE);
                        
                        BOSAACC:=Cust."No.";
                        
                        {
                        AcctNo:='001208'+BOSAACC;
                        //Create FOSA account
                        Accounts.INIT;
                        Accounts."No.":=AcctNo;
                        
                        Accounts."Date of Birth":="Date of Birth";
                        Accounts.Name:=Name;
                        Accounts."Creditor Type":=Accounts."Creditor Type"::Account;
                        Accounts."Staff No":="Payroll/Staff No";
                        Accounts."ID No.":="ID No.";
                        Accounts."Mobile Phone No":="Mobile Phone No";
                        Accounts."Registration Date":="Registration Date";
                        Accounts."Post Code":="Post Code";
                        Accounts.County:=City;
                        Accounts."BOSA Account No":=Cust."No.";
                        Accounts.Picture:=Picture;
                        Accounts.Signature:=Signature;
                        Accounts."Passport No.":="Passport No.";
                        Accounts."Company Code":="Employer Code";
                        Accounts.Status:=Accounts.Status::New;
                        Accounts."Account Type":='SAVINGS';
                        Accounts."Date of Birth":="Date of Birth";
                        Accounts."Global Dimension 1 Code":='FOSA';
                        Accounts."Global Dimension 2 Code":="Global Dimension 2 Code";
                        Accounts.Address:=Address;
                        Accounts."Address 2":="Address 2";
                        Accounts."Phone No.":="Phone No.";
                        Accounts."Registration Date":=TODAY;
                        Accounts.Status:=Accounts.Status::Active;
                        Accounts.Section:=Section;
                        Accounts."Home Address":="Home Address";
                        Accounts.District:=District;
                        Accounts.Location:=Location;
                        Accounts."Sub-Location":="Sub-Location";
                        Accounts."Registration Date":=TODAY;
                        Accounts."Monthly Contribution" := "Monthly Contribution";
                        Accounts."E-Mail":="E-Mail (Personal)";
                        //Accounts."Home Page":="Home Page";
                        //Accounts."Savings Account No.":="Savings Account No.";
                        //Accounts."Signing Instructions":="Signing Instructions";
                        //Accounts."Fixed Deposit Type":="Fixed Deposit Type";
                        //Accounts."FD Maturity Date":="FD Maturity Date";
                        //Accounts."Electrol Zone Code":="Electrol Zone Code";
                        //Accounts."Departments Code":="Departments Code";
                        //Accounts."Sections Code":="Sections Code";
                        Accounts.INSERT;
                        
                        
                        Accounts.RESET;
                        IF Accounts.GET(AcctNo) THEN BEGIN
                        Accounts.VALIDATE(Accounts.Name);
                        Accounts.VALIDATE(Accounts."Account Type");
                        Accounts.VALIDATE(Accounts."Global Dimension 1 Code");
                        Accounts.VALIDATE(Accounts."Global Dimension 2 Code");
                        Accounts.MODIFY;
                        
                        //Update BOSA with FOSA Account
                        IF Cust.GET(BOSAACC) THEN BEGIN
                        Cust."FOSA Account":=AcctNo;
                        Cust.MODIFY;
                        END;
                        END;
                        }
                        
                        NextOfKinApp.RESET;
                        NextOfKinApp.SETRANGE(NextOfKinApp."Account No","No.");
                        IF NextOfKinApp.FIND('-') THEN BEGIN
                         REPEAT
                          NextOfKin.INIT;
                          NextOfKin."Account No":=BOSAACC;
                          NextOfKin.Name:=NextOfKinApp.Name;
                          NextOfKin.Relationship:=NextOfKinApp.Relationship;
                          NextOfKin.Beneficiary:=NextOfKinApp.Beneficiary;
                          NextOfKin."Date of Birth":=NextOfKinApp."Date of Birth";
                          NextOfKin.Address:=NextOfKinApp.Address;
                          NextOfKin.Telephone:=NextOfKinApp.Telephone;
                          NextOfKin.Fax:=NextOfKinApp.Fax;
                          NextOfKin.Email:=NextOfKinApp.Email;
                          NextOfKin."ID No.":=NextOfKinApp."ID No.";
                          NextOfKin."%Allocation":=NextOfKinApp."%Allocation";
                          NextOfKin.INSERT;
                         UNTIL NextOfKinApp.NEXT = 0;
                        END;
                        
                        AccountSignApp.RESET;
                        AccountSignApp.SETRANGE(AccountSignApp."Account No","No.");
                        IF AccountSignApp.FIND('-') THEN BEGIN
                         REPEAT
                          AccountSign.INIT;
                          AccountSign."Account No":=AcctNo;
                          AccountSign.Names:=AccountSignApp.Names;
                          AccountSign."Date Of Birth":=AccountSignApp."Date Of Birth";
                          AccountSign."Staff/Payroll":=AccountSignApp."Staff/Payroll";
                          AccountSign."ID No.":=AccountSignApp."ID No.";
                          AccountSign.Signatory:=AccountSignApp.Signatory;
                          AccountSign."Must Sign":=AccountSignApp."Must Sign";
                          AccountSign."Must be Present":=AccountSignApp."Must be Present";
                          AccountSign.Picture:=AccountSignApp.Picture;
                          AccountSign.Signature:=AccountSignApp.Signature;
                          AccountSign."Expiry Date":=AccountSignApp."Expiry Date";
                          //AccountSign."Mobile No.":=AccountSignApp."Mobile No.";
                          AccountSign.INSERT;
                         UNTIL AccountSignApp.NEXT = 0;
                        END;
                        
                        Cust.RESET;
                        IF Cust.GET(BOSAACC) THEN BEGIN
                        Cust.VALIDATE(Cust.Name);
                        //Cust.VALIDATE(Accounts."Account Type");
                        Cust.VALIDATE(Cust."Global Dimension 1 Code");
                        Cust.VALIDATE(Cust."Global Dimension 2 Code");
                        Cust.MODIFY;
                        END;
                        
                        {
                        GenSetUp.GET();
                         Notification.CreateMessage('Dynamics NAV',GenSetUp."Sender Address","E-Mail (Personal)",'Member Acceptance Notification',
                                        'Member application '+ "No." + ' has been approved'
                                       + ' (Dynamics NAV ERP)',FALSE);
                         Notification.Send;
                        }
                        
                        //"Converted By":=USERID;
                        MESSAGE('Account created successfully.');
                        //END;
                        Status:=Status::Approved;
                        "Approved By":=USERID;
                        MODIFY;
                        END ELSE
                        ERROR('Not approved');
                        */

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange(Rec."Captured by", UserId);
    end;

    var
        Cust: Record Customer;
        Accounts: Record Vendor;
        AcctNo: Code[20];
        Acc: Record Vendor;
        UsersID: Record User;
        BOSAACC: Code[20];
        PictureExists: Boolean;
        UserMgt: Codeunit "User Setup Management";
        //NotificationMAIL: Codeunit "SMTP Mail";
        NotificationE: Codeunit Mail;
        MailBody: Text[250];
        ccEmail: Text[1000];
        toEmail: Text[1000];
        GenSetUp: Record "Imprest Lines1";
        ClearingAcctNo: Code[20];
        AdvrAcctNo: Code[20];
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Imprest,ImprestSurrender,Interbank;
        DivAcctNo: Code[20];
        SignatureExists: Boolean;
        text002: label 'Kinldy specify the next of kin';
}
