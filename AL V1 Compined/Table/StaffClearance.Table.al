#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59018 "Staff Clearance"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(3; "Employee Name"; Text[70])
        {
        }
        field(4; Designation; Text[70])
        {
        }
        field(5; "Daily Work Ticket"; Code[20])
        {
        }
        field(6; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Last day of work"; Date)
        {
        }
        field(8; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(9; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(10; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Unit Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Created By"; Code[50])
        {
            Editable = true;
        }
        field(13; "Date Created"; Date)
        {
        }
        field(14; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;
        }
        field(15; "No. Series"; Code[20])
        {
        }
        field(16; "Any comments or liabilities"; Text[100])
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "HOD Name" := UserSetup."Employee Name";
                    "HOD Date" := Today;
                end;
            end;
        }
        field(17; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Finance and Accounts Unit,ICT Unit,Case Management Unit,Business Development,Salaries Section,PHR and Admin,Library Services,Cleared,HR,Not Cleared,HOD,Cancelled,Checking';
            OptionMembers = Open,"Finance and Accounts Unit","ICT Unit","Case Management Unit","Business Development","Salaries Section","PHR and Admin","Library Services",Cleared,HR,"Not Cleared",HOD,Cancelled,Checking;
        }
        field(18; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(19; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(20; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(21; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(22; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(23; County; Text[30])
        {
            Caption = 'County';
        }
        field(24; "Outstanding Imprest Ref"; Text[50])
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Outstanding Imprest Name" := UserSetup."Employee Name";
                    "Outstanding Imprest Date" := Today;
                end;
            end;
        }
        field(25; "Outstanding Imprest Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Outstanding Imprest Name" := UserSetup."Employee Name";
                    "Outstanding Imprest Date" := Today;
                end;
            end;
        }
        field(26; "Outstanding Imprest Name"; Text[100])
        {
            Editable = false;
        }
        field(27; "Outstanding Imprest Date"; Date)
        {
            Editable = false;
        }
        field(28; "Outstanding Petty Cash Ref"; Text[50])
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Outstanding Petty Cash Name" := UserSetup."Employee Name";
                    "Outstanding Petty Cash Date" := Today;
                end;
            end;
        }
        field(29; "Outstanding Petty Cash Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Outstanding Petty Cash Name" := UserSetup."Employee Name";
                    "Outstanding Petty Cash Date" := Today;
                end;
            end;
        }
        field(30; "Outstanding Petty Cash Name"; Text[100])
        {
            Editable = false;
        }
        field(31; "Outstanding Petty Cash Date"; Date)
        {
            Editable = false;
        }
        field(32; "Any other Outstanding Ref"; Text[50])
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Any other Outstanding Name" := UserSetup."Employee Name";
                    "Any other Outstanding Date" := Today;
                end;
            end;
        }
        field(33; "Any other Outstanding Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Any other Outstanding Name" := UserSetup."Employee Name";
                    "Any other Outstanding Date" := Today;
                end;
            end;
        }
        field(34; "Any other Outstanding Name"; Text[100])
        {
            Editable = false;
        }
        field(35; "Any other Outstanding Date"; Date)
        {
            Editable = false;
        }
        field(36; "Number of unreturned Items"; Text[100])
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer" := UserSetup."Employee Name";
                    "Date ICT" := Today;
                end;
            end;
        }
        field(37; "Valued Total Cost"; Text[200])
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer" := UserSetup."Employee Name";
                    "Date ICT" := Today;
                end;
            end;
        }
        field(38; "Valued Total Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer" := UserSetup."Employee Name";
                    "Date ICT" := Today;
                end;
            end;
        }
        field(39; "Name of Clearing Officer"; Text[100])
        {
            Editable = false;
        }
        field(40; "Date ICT"; Date)
        {
            Caption = 'Date ';
            Editable = false;
        }
        field(41; "NCIA/Committee File No"; Text[50])
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer Case" := UserSetup."Employee Name";
                    "Date Case Mgt" := Today;
                end;
            end;
        }
        field(42; "NCIA/Committee File No Date"; Date)
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer Case" := UserSetup."Employee Name";
                    "Date Case Mgt" := Today;
                end;
            end;
        }
        field(43; "Contect of Data at exposure"; Text[250])
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer Case" := UserSetup."Employee Name";
                    "Date Case Mgt" := Today;
                end;
            end;
        }
        field(44; Remarks; Text[100])
        {

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer Case" := UserSetup."Employee Name";
                    "Date Case Mgt" := Today;
                end;
            end;
        }
        field(45; "Name of Clearing Officer Case"; Text[100])
        {
            Caption = 'Name of Clearing Officer';
            Editable = false;
        }
        field(46; "Date Case Mgt"; Date)
        {
            Caption = 'Date';
            Editable = false;
        }
        field(47; "Number of unreturned Items Bus"; Text[100])
        {
            Caption = 'Number of unreturned Items';

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer Bus" := UserSetup."Employee Name";
                    "Date Bus" := Today;
                end;
            end;
        }
        field(48; "Valued Total Cost Bus"; Text[100])
        {
            Caption = 'Valued Total Cost';

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer Bus" := UserSetup."Employee Name";
                    "Date Bus" := Today;
                end;
            end;
        }
        field(49; "Valued Total Amount Bus"; Decimal)
        {
            Caption = 'Valued Total Amount';

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.FindSet then begin
                    "Name of Clearing Officer Bus" := UserSetup."Employee Name";
                    "Date Bus" := Today;
                end;
            end;
        }
        field(50; "Name of Clearing Officer Bus"; Text[100])
        {
            Caption = 'Name of Clearing Officer';
            Editable = false;
        }
        field(51; "Date Bus"; Date)
        {
            Caption = 'Date ';
            Editable = false;
        }
        field(52; "Salary Overpayment"; Text[100])
        {
        }
        field(53; "Salary Overpayment Amount"; Decimal)
        {
        }
        field(54; "House Allowance Overpayment"; Text[100])
        {
        }
        field(55; "House Allowance Overpayment Am"; Decimal)
        {
            Caption = 'House Allowance Overpayment Amount';
        }
        field(56; "Commuter AllowanceOverpayment"; Text[100])
        {
        }
        field(57; "Commuter AllowanceOverpaymentA"; Decimal)
        {
            Caption = 'Commuter AllowanceOverpayment Amount';
        }
        field(58; "Medical Risk Allowance Overpay"; Text[100])
        {
            Caption = 'Medical Risk Allowance Overpayment ';
        }
        field(59; "Medical Risk AllowanceOverpay"; Decimal)
        {
            Caption = 'Medical Risk AllowanceOverpayment Amount';
        }
        field(60; "Outstanding Salary Advance"; Text[100])
        {
        }
        field(61; "Outstanding Salary AdvanceA"; Decimal)
        {
            Caption = 'Outstanding Salary Advance Amount';
        }
        field(62; "Other Salary Related Overpay"; Text[100])
        {
            Caption = 'Other Salary Related Overpayment/Liabilities';
        }
        field(63; "Other Salary Related OverpayA"; Decimal)
        {
            Caption = 'Other Salary Related Overpayment/Liabilities Amount';
        }
        field(64; "Total Salary related Liability"; Text[100])
        {
        }
        field(65; "Total Salary relatedLiabilityA"; Decimal)
        {
            Caption = 'Total Salary related Liability Amount';
        }
        field(66; "Outstanding Mortgage"; Text[100])
        {
            Caption = 'Outstanding Mortgage (NCIA Scheme)';
        }
        field(67; "Outstanding Mortgage Amount"; Decimal)
        {
            Caption = 'Outstanding Mortgage Amount  (NCIA Scheme)';
        }
        field(68; "Outstanding Car Loan"; Text[100])
        {
            Caption = 'Outstanding Car Loan/in, Advance  (NCIA Scheme)';
        }
        field(69; "Outstanding Car Loan Amount"; Decimal)
        {
            Caption = 'Outstanding Car Loan/in, Advance  (NCIA Scheme) Amount';
        }
        field(70; "Cooperative Loans"; Text[50])
        {
            Caption = 'Cooperative Loans - Indicate which SACCO';
        }
        field(71; "Cooperative Loans Total Balanc"; Decimal)
        {
            Caption = 'Cooperative Loans Total Balance';
        }
        field(72; "Cooperative Shares"; Text[50])
        {
            Caption = 'Cooperative Shares - Indicate which SACCO';
        }
        field(73; "Cooperative Share Balance"; Decimal)
        {
            Caption = 'Cooperative Shares Balance';
        }
        field(74; "Personal Loan. Balance"; Text[50])
        {
            Caption = 'Personal Loan. Balance (Indicate which Bank)';
        }
        field(75; "Personal Loan. Balance Amount"; Decimal)
        {
        }
        field(76; "Hire purchase scheme. Balance"; Text[50])
        {
            Caption = 'Hire purchase scheme. Balance (Indicate which Company)';
        }
        field(77; "Hire purchase scheme. BalanceA"; Decimal)
        {
            Caption = 'Hire purchase scheme. Balance Amount';
        }
        field(78; "University loan (HELB) balance"; Text[50])
        {
        }
        field(79; "University loan (HELB) balancA"; Decimal)
        {
            Caption = 'University loan (HELB) balance Amount';
        }
        field(80; "Prepared by"; Code[50])
        {
        }
        field(81; "Prepared by Date"; Date)
        {
        }
        field(82; "Checked by"; Code[50])
        {
        }
        field(83; "Checked by Date"; Date)
        {
        }
        field(84; "Form received by"; Code[50])
        {
        }
        field(85; "Form received Date"; Date)
        {
        }
        field(86; "Number of unreturned items Lib"; Text[50])
        {
            Caption = 'Number of unreturned items';
        }
        field(87; "Valued Total cost Lib"; Text[50])
        {
            Caption = 'Valued Total cost ';
        }
        field(88; "Valued Total cost Amount Lib"; Decimal)
        {
            Caption = 'Valued Total cost Amount';
        }
        field(89; "Name of Clearing Officer Lib"; Text[50])
        {
            Caption = 'Name of Clearing Officer';
        }
        field(90; "Name of Clearing Officer DateL"; Date)
        {
            Caption = 'Name of Clearing Officer Date';
        }
        field(91; "HOD Name"; Text[50])
        {
        }
        field(92; "HOD Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "No.", EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*HRMgt.GET;
        HRMgt.TESTFIELD("Clearance Nos");
        IF "No."='' THEN
        NoSeriesMgt.InitSeries(HRMgt."Clearance Nos",xRec."No. Series",0D,"No.","No. Series");
        
        "Created By" := USERID;
        "Date Created" := TODAY;
        
        HrEmployee.RESET;
        HrEmployee.SETRANGE("User ID",USERID);
        IF  HrEmployee.FINDSET THEN
        BEGIN
          "Employee No" := HrEmployee."No.";
          "Employee Name":=HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";
          HrEmployee.CALCFIELDS(HrEmployee."Job Title");
          Designation:=HrEmployee."Job Title";
          "Shortcut Dimension 1 Code" :=  HrEmployee."Global Dimension 1 Code";
          "Shortcut Dimension 2 Code" := HrEmployee."Global Dimension 2 Code";
        END;*/

    end;

    var
        HrEmployee: Record Employee;
        DwTicket: Record "Transport Requisition";
        DimMgt: Codeunit DimensionManagement;
        NoSeriesMgt: Codeunit "No. Series";
        HRMgt: Record "Human Resources Setup";
        PostCode: Record "Post Code";
        UserSetup: Record "User Setup";

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "No." <> '' then
            Modify;
    end;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', ' ', "No."),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        if OldDimSetID <> "Dimension Set ID" then
            Modify;
    end;
}
