#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56024 "Applicant onboarding list"
{
    ApplicationArea = Basic;
    CardPageID = "Applicant onboarding card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Applicant onboarding Table";
    SourceTableView = where(Created = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Category"; Rec."Applicant Category")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Name"; Rec."Applicant Name")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("ID/Passport No"; Rec."ID/Passport No")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("Company Registration No"; Rec."Company Registration No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
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
                separator(Action22)
                {
                    Caption = '-';
                }
                action("Create Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Account';
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
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange(Rec."No.", Rec."No.");
                        Report.Run(58001, true, true, Rec)
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange(Rec."Created By", UserId);
    end;

    var
        Cust: Record Customer;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Accounts: Record Vendor;
        AcctNo: Code[20];
        Sms: Text;
        Acc: Record Vendor;
        UsersID: Record User;
        BOSAACC: Code[20];
        MembAppl: Record "Applicant onboarding Table";
        InsBbfVisible: Boolean;
        i: Integer;
        PrincipalMemberVisible: Boolean;
        PrincipalVisible: Boolean;
        ClassBCategory: Boolean;
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
        NameEditable: Boolean;
        AddressEditable: Boolean;
        GlobalDim1Editable: Boolean;
        GlobalDim2Editable: Boolean;
        CustPostingGroupEdit: Boolean;
        PhoneEditable: Boolean;
        MaritalstatusEditable: Boolean;
        IDNoEditable: Boolean;
        RegistrationDateEdit: Boolean;
        OfficeBranchEditable: Boolean;
        DeptEditable: Boolean;
        SectionEditable: Boolean;
        OccupationEditable: Boolean;
        DesignationEdiatble: Boolean;
        EmployerCodeEditable: Boolean;
        DOBEditable: Boolean;
        EmailEdiatble: Boolean;
        StaffNoEditable: Boolean;
        GenderEditable: Boolean;
        MonthlyContributionEdit: Boolean;
        PostCodeEditable: Boolean;
        CityEditable: Boolean;
        WitnessEditable: Boolean;
        StatusEditable: Boolean;
        BankCodeEditable: Boolean;
        BranchCodeEditable: Boolean;
        BankAccountNoEditable: Boolean;
        VillageResidence: Boolean;
        SignatureExists: Boolean;
        ForceNo: Boolean;
        ContPhone: Boolean;
        ContRelation: Boolean;
        ContOcuppation: Boolean;
        Recruitedby: Boolean;
        PassEditable: Boolean;
        EmployerEditable: Boolean;
        CountryEditable: Boolean;
        SalesEditable: Boolean;
        AccountCategory: Boolean;
        CustMember: Record Customer;
        "BenvNo.": Code[10];
        BankAEditable: Boolean;
        MemEditable: Boolean;
        BenvEditable: Boolean;
        BankNEditable: Boolean;
        InserFEditable: Boolean;
        FosAEditable: Boolean;
        InsertBenV: Boolean;
        IdentityEditable: Boolean;
        RecriutedEditable: Boolean;
        ActivicodeEditable: Boolean;
        FosaAccountEditable: Boolean;
        CustPostEditable: Boolean;
        InsertBenvVisisble: Boolean;
        iEntryNo: Integer;
        Vendor: Record Vendor;
        UserSetup: Record "User Setup";
        //SMTPMailSet: Record "SMTP Mail Setup";
        SposnorCode: Record Customer;
        Scheme: Record "Company Information";
        text001: label 'Status must be open';
        text002: label 'Kindly specify the next of kin';
        text003: label 'You must specify Signatories for this type of membership';
        Text004: label 'You MUST specify the next of kin Benevolent';
        Text005: label 'This Application has been created';
        Text006: label 'This Apllicant PIN No. Already Exists on the Customer Database';
        Text007: label 'This Account Has Been created Successfully';
        Text008: label 'This Document is  Not approved.Contact System Administrator';
        Text009: label 'Are you sure you want to CreateCustomer/Billing Account?';
        Text0010: label 'All Members are created  must have a FOSA Account.Please Check General Setup.';
        Text0011: label 'Does this member have a Benevolent Fund Application?';
        Text0012: label 'Traansaction Type Must a value in Application -%1, It cannot be empty';
        Text0013: label 'Member contributions must have values';
        Text0014: label 'There are still some pending Applications. Please utilise them first';
        Text0015: label 'This information is not needed for this Membership application category- %1';
        Text0016: label 'This category is eligible for BBF enrollment';
        Text0017: label 'Insurance Contributions Must have a value in application No. -%1.It cannot be null.';
        Text0018: label 'Deposit Contributions Must have a value.It cannot be null';
        Text0019: label 'Either Benevolent Fund or Entrance fee must have a value in application No. -%1';
        Text0020: label 'Deposit Contributions Must have a value in application No. -%1.It cannot be null.';


    procedure UpdateControls()
    begin
        /*
        IF Status=Status::Approved THEN BEGIN
        
             NameEditable:=FALSE;
             AddressEditable:=FALSE;
             GlobalDim1Editable:=FALSE;
             GlobalDim2Editable:=FALSE;
             CustPostingGroupEdit:=FALSE;
             PhoneEditable:=FALSE;
             MaritalstatusEditable:=FALSE;
             IDNoEditable:=FALSE;
             PhoneEditable:=FALSE;
             RegistrationDateEdit:=FALSE;
             OfficeBranchEditable:=FALSE;
             DeptEditable:=FALSE;
             SectionEditable:=FALSE;
             OccupationEditable:=FALSE;
             DesignationEdiatble:=FALSE;
             EmployerCodeEditable:=FALSE;
             DOBEditable:=FALSE;
             EmailEdiatble:=FALSE;
             StaffNoEditable:=FALSE;
             GenderEditable:=FALSE;
             MonthlyContributionEdit:=FALSE;
             PostCodeEditable:=FALSE;
             CityEditable:=FALSE;
             WitnessEditable:=FALSE;
             BankCodeEditable:=FALSE;
             BranchCodeEditable:=FALSE;
             BankAccountNoEditable:=FALSE;
             VillageResidence:=FALSE;
             ForceNo:=FALSE;
             ContPhone:=FALSE;
             ContRelation:=FALSE;
             ContOcuppation:=FALSE;
             Recruitedby:=FALSE;
             PassEditable:=FALSE;
             EmployerEditable:=FALSE;
             CountryEditable:=FALSE;
             SalesEditable:=FALSE;
             AccountCategory:=FALSE;
             BankAEditable:=FALSE;
             MemEditable:=FALSE;
             BenvEditable:=FALSE;
             BankNEditable:=FALSE;
             InsertBenV:=FALSE;
             IdentityEditable:=FALSE;
             RecriutedEditable:=FALSE;
             ActivicodeEditable:=FALSE;
             FosaAccountEditable:=FALSE;
             CustPostEditable:=FALSE;
             PrincipalMemberVisible:=FALSE;
             PrincipalVisible:=FALSE;
             ClassBCategory:=FALSE;
        
        
             END;
        
             IF Status=Status::Open THEN BEGIN
             NameEditable:=TRUE;
             //PrincipalMemberVisible:=TRUE;
             //PrincipalVisible:=TRUE;
             //ClassBCategory:=TRUE;
             AddressEditable:=TRUE;
             GlobalDim1Editable:=FALSE;
             GlobalDim2Editable:=TRUE;
             CustPostingGroupEdit:=FALSE;
             PhoneEditable:=TRUE;
             MaritalstatusEditable:=TRUE;
             IDNoEditable:=TRUE;
             PhoneEditable:=TRUE;
             RegistrationDateEdit:=TRUE;
             OfficeBranchEditable:=TRUE;
             DeptEditable:=TRUE;
             SectionEditable:=TRUE;
             OccupationEditable:=TRUE;
             DesignationEdiatble:=TRUE;
             EmployerCodeEditable:=TRUE;
             DOBEditable:=TRUE;
             EmailEdiatble:=TRUE;
             StaffNoEditable:=TRUE;
             GenderEditable:=TRUE;
             MonthlyContributionEdit:=TRUE;
             PostCodeEditable:=TRUE;
             CityEditable:=FALSE;
             WitnessEditable:=TRUE;
             BankCodeEditable:=TRUE;
             BranchCodeEditable:=TRUE;
             BankAccountNoEditable:=TRUE;
             VillageResidence:=TRUE;
             ForceNo:=TRUE;
             ContPhone:=TRUE;
             ContRelation:=TRUE;
             ContOcuppation:=TRUE;
             Recruitedby:=TRUE;
             PassEditable:=TRUE;
             EmployerEditable:=TRUE;
             CountryEditable:=TRUE;
             SalesEditable:=TRUE;
             AccountCategory:=TRUE;
             BankAEditable:=TRUE;
             MemEditable:=TRUE;
             BenvEditable:=TRUE;
             BankNEditable:=TRUE;
             InsertBenV:=TRUE;
             IdentityEditable:=TRUE;
             RecriutedEditable:=TRUE;
             ActivicodeEditable:=TRUE;
             FosaAccountEditable:=TRUE;
             CustPostEditable:=TRUE;
             END
        */

    end;


    procedure SendSMS()
    begin
        /*
        SMSMessages.RESET;
        IF SMSMessages.FIND('+') THEN BEGIN
        iEntryNo:=SMSMessages."Entry No";
        iEntryNo:=iEntryNo+1;
        END ELSE BEGIN
        iEntryNo:=1;
        END;
        
        SMSMessages.INIT;
        SMSMessages."Entry No":=iEntryNo;
        SMSMessages."Account No":="No.";
        SMSMessages."Date Entered":=TODAY;
        SMSMessages."Time Entered":=TIME;
        SMSMessages.Source:='Member Application';
        SMSMessages."Entered By":=USERID;
        SMSMessages."System Created Entry":=TRUE;
        SMSMessages."Document No":="No.";
        SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
        SMSMessages."SMS Message":='Your Account No. '+ "No." +' of type ' + "FOSA Account Type" + ' has been opened successfully. MWALIMU SACCCO';
        IF Vendor."Phone No."<> '' THEN BEGIN
        SMSMessages."Telephone No":=Vendor."Phone No.";
        END ELSE BEGIN
        SMSMessages."Telephone No":=Vendor."MPESA Mobile No";
        END;
        SMSMessages.INSERT;
        */

    end;


    procedure CheckMemberCat()
    begin

        //IF "Member Category"="Member Category"::"Class A" THEN
        //ERROR(Text0015,"Member Category");
    end;


    procedure SendNotMail()
    begin
        /*
        SMTPMailSet.GET;
        
        UserSetup.RESET;
        UserSetup.SETRANGE(UserSetup."Imprest Account",TRUE);
        IF UserSetup.FIND('-') THEN BEGIN
        REPEAT
        Notification.CreateMessage('Dynamics NAV',SMTPMailSet."Email Sender Address",UserSetup."E-Mail",'Account Creation Notification',
                        'Member Policy '+ BOSAACC + ' has been approved & Created'
                       + ' (Dynamics NAV ERP)',FALSE);
        Notification.Send;
        UNTIL UserSetup.NEXT=0
        END;
        */

    end;
}
