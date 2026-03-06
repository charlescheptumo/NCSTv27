#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56025 "Applicant onboarding card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Applicant onboarding Table";
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
                    Editable = false;
                }
                field("Applicant Category"; Rec."Applicant Category")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Name"; Rec."Applicant Name")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Caption = 'Salutation';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Address 2(County)';
                    ShowMandatory = true;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Telex No."; Rec."Telex No.")
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
                    ShowMandatory = true;
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Company Registration No"; Rec."Company Registration No")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ShowMandatory = true;
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
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer Posting Group';
                    Visible = false;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Account Type';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    OptionCaption = 'Open,Pending Approval,Approved';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Outlook)
            {
            }
            systempart(Control17; Notes)
            {
            }
            systempart(Control18; Links)
            {
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
                separator(Action23)
                {
                    Caption = '       -';
                }
                action("Create Customer Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Customer Account';
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;

                    trigger OnAction()
                    begin
                        //IF Status<>Status::Approved THEN
                        //ERROR(Text008);

                        if Confirm(Text009, false) = true then begin
                            //IF Created=TRUE THEN
                            //ERROR(Text005);
                            //Use PIN as a mandatory field
                            //TESTFIELD("P.I.N");
                            //IF "P.I.N"<>'' THEN BEGIN
                            //Cust.RESET;
                            //Cust.SETRANGE(Cust."P.I.N","P.I.N");
                            /*IF Cust.FIND('-') THEN BEGIN
                            IF Cust."No." <> "No." THEN
                            ERROR(Text006);
                            END;*/
                            //END;

                            Cust."No." := Rec."No.";
                            Cust.Name := Rec."Applicant Name";
                            Cust.Address := Rec.Address;
                            Cust."Address 2" := Rec."Address 2";
                            Cust."Post Code" := Rec."Post Code";
                            Cust.City := Rec.City;
                            Cust.County := Rec.City;
                            Cust."Country/Region Code" := Rec."Country/Region Code";
                            Cust."Phone No." := Rec."Phone No";
                            Cust."Customer Posting Group" := Rec."Customer Posting Group";
                            Cust."Gen. Bus. Posting Group" := Rec."Gen. Bus. Posting Group";
                            Cust."VAT Bus. Posting Group" := Rec."VAT Bus. Posting Group";
                            Cust."E-Mail" := Rec."E-Mail";
                            Cust.Type := Rec.Type;
                            //Cust."Customer Category":=Cust."Customer Category"::"3";
                            Cust."Customer Type" := Cust."customer type"::Trade;
                            Cust."Company Reg No" := Rec."Company Registration No";
                            Cust."ID. No." := Rec."ID/Passport No";
                            Cust."P.I.N" := Rec."P.I.N";
                            Cust.Title := Rec.Title;
                            Cust.Insert(true);
                            BOSAACC := Cust."No.";
                            SendNotMail;
                            Cust.Reset;
                            if Cust.Get(BOSAACC) then begin
                                Cust.Validate(Cust.Name);
                                Cust.Validate(Cust."Global Dimension 1 Code");
                                Cust.Validate(Cust."Global Dimension 2 Code");
                                Cust.Modify;
                            end;
                            /*
                            //Send Email
                            SMTPMailSet.GET;
                            MESSAGE('%1',"E-Mail");

                            NotificationMAIL.CreateMessage('Dynamics NAV',SMTPMailSet."Email Sender Address","E-Mail",'Applicant Acceptance Notification',
                                            'Copyright Applicant/Billing Account '+ "No." + ' has been created on KECOBO Database'
                                           + ' (Dynamics NAV ERP)',FALSE);
                            NotificationMAIL.Send;
                            */
                            Message(Text007);
                            Rec.Status := Rec.Status::Approved;

                            Rec."Created By" := UserId;
                            Rec.Created := true;
                            Rec."Registration Date" := Today;
                            Rec.Modify;

                        end;


                        //END;



                        //TESTFIELD("ID. No.");
                        /*
                        IF Created=TRUE THEN
                        ERROR(Text005);
                        
                        IF Status<>Status::Approved THEN
                        ERROR(Text008);
                        
                        IF CONFIRM(Text009,FALSE)=TRUE THEN BEGIN
                        
                        GenSetUp.GET;
                        Scheme.GET;
                        
                        
                        IF "ID. No." <>'' THEN BEGIN
                        Cust.RESET;
                        Cust.SETRANGE(Cust."ID. No.","ID. No.");
                        Cust.SETRANGE(Cust."Vendor Type",Cust."Vendor Type"::"1");
                        IF Cust.FIND('-') THEN BEGIN
                        IF Cust."No." <> "No." THEN
                        ERROR(Text006);
                        END;
                        END;
                        */
                        /*
                        CustMember.RESET;
                        CustMember.SETRANGE(CustMember."No.","Sponsor Code");
                        IF CustMember.FINDFIRST THEN
                        //IF CustMember."member No Prefix"<>'' THEN
                        //Cust."No.":=Scheme."Scheme Prefix"+CustMember."member No Prefix"+INCSTR(CustMember."Member No")
                        //ELSE
                        Cust."No.":='';
                        //!!!!!!!!!!!!!!!Create Member Account!!!!!!!!!!!!!
                        CustMember."Member No":=INCSTR(CustMember."Member No");
                        CustMember.MODIFY;
                        //Cust."Benevolent Fund No.":='';
                        Cust.Name:=UPPERCASE("First Name")+' '+UPPERCASE("Middle Name")+' '+UPPERCASE(Surname);
                        Cust."First Name":=UPPERCASE("First Name");
                        Cust."Last Name":=UPPERCASE("Middle Name");
                        Cust."Middle Name":=UPPERCASE(Surname);
                        Cust.Address:=Address;
                        Cust."Post Code":="Post Code";
                        Cust.City:=City;
                        Cust.County:=City;
                        Cust."Country/Region Code":="Country/Region Code";
                        Cust."Phone No.":="Phone No.";
                        Cust."Global Dimension 1 Code":="Global Dimension 1 Code" ;
                        Cust."Global Dimension 2 Code":="Global Dimension 2 Code";
                        Cust."Vendor Posting Group":="Vendor Posting Group";
                        Cust."Registration Date":=TODAY;//Registration date must be the Day the Application.
                        Cust."Membership Status":=Cust."Membership Status"::"0";
                        Cust."Sponsor Code":="Sponsor Code";
                        Cust."Sponsor Name":="Sponsor Name";
                        Cust."Date of Birth":="Date of Birth";
                        Cust."E-Mail":="E-Mail";
                        Cust."Exempt From Tax Splits":="Exempt From tax Splits";
                        Cust."Shortcut Dimension 3 Code":="P.I.N";
                        Cust."Pensionable Service Start Date":="Employment Date";
                        Cust."Scheme Join Date":="Scheme Join Date";
                        
                        //**
                        
                        Cust."Preferred Bank Account":="Preferred Bank Account";
                        Cust."Bank Branch Code":="Bank Branch Code";
                        
                        //**
                        Cust."ID. No.":="ID. No.";
                        Cust."Marital Status":="Marital Status";
                        Cust."Vendor Type":=Cust."Vendor Type"::"1";
                        Cust.Sex:=Sex;
                        
                        CALCFIELDS(Picture);
                        
                        Cust.Picture:=Picture;
                        Cust.INSERT(TRUE);
                        */

                        //BOSAACC:=Cust."No.";







                        //SendNotMail;




                        /*
                        
                        //!!!!!Insert Next of Kin!!!!!!!!!!
                        NextOfKinApp.RESET;
                        NextOfKinApp.SETRANGE(NextOfKinApp."Vendor No","No.");
                        IF NextOfKinApp.FIND('-') THEN BEGIN
                         REPEAT
                          NextOfKin.INIT;
                          NextOfKin."Vendor No":=BOSAACC;
                          NextOfKin.Name:=NextOfKinApp.Name;
                          NextOfKin.Relationship:=NextOfKinApp.Relationship;
                          NextOfKin.Beneficiary:=NextOfKinApp.Beneficiary;
                          NextOfKin."Date Of Birth":=NextOfKinApp."Date Of Birth";
                          NextOfKin.Address:=NextOfKinApp.Address;
                          NextOfKin."Pin No":=NextOfKinApp."Pin No";
                          NextOfKin.Email:=NextOfKinApp.Email;
                          NextOfKin."ID No":=NextOfKinApp."ID No";
                          NextOfKin.Allocation:=NextOfKinApp.Allocation;
                          NextOfKin.INSERT;
                         UNTIL NextOfKinApp.NEXT = 0;
                        END;
                        */





                        Cust.Reset;
                        if Cust.Get(BOSAACC) then begin
                            Cust.Validate(Cust.Name);
                            Cust.Validate(Cust."Global Dimension 1 Code");
                            Cust.Validate(Cust."Global Dimension 2 Code");
                            Cust.Modify;
                        end;


                        //End Updating Advice Buffer
                        /*
                        GenSetUp.GET();
                        SMTPMailSet.GET;
                        Notification.CreateMessage('Dynamics NAV',SMTPMailSet."Email Sender Address","E-Mail",'Member Acceptance Notification',
                                        'Member application '+ "No." + ' has been approved'
                                       + ' (Dynamics NAV ERP)',FALSE);
                        Notification.Send;
                        //Send SMS
                        */
                        //
                        /*
                        Sms:='Your Account No. '+ "No." +' has been opened successfully. CIC PENSION LTD ';
                        SendSms1.SendSms('MEMBAPP',"Phone No.",Sms);
                        
                        MESSAGE(Text007);
                        Status:=Status::Approved;
                        
                        "Created By":=USERID;
                        Created:=TRUE;
                        MODIFY;
                        
                        END ELSE
                        ERROR(Text008);
                        */

                    end;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
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
