#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57017 "Imprest Surrender"
{
    DrillDownPageID = "All Imprest Memos";
    LookupPageID = "All Imprest Memos";

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            NotBlank = false;

            trigger OnValidate()
            begin

                if "No." <> xRec."No." then
                    NoSeriesMgt.TestManual(CashMgt."Imprest Memo Nos");
            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; Project; Code[20])
        {
            TableRelation = Job where(Status = filter(<> Completed),
                                       "Project Budget" = filter(<> 0));

            trigger OnValidate()
            begin
                if JobRec.Get(Project) then begin
                    JobRec.CalcFields("Project Budget", "Actual Project Costs",
                    "PO Commitments", "PRN Commitments", "Store Requisition Commitments", "Imprest Application Commitment");
                    "Project Description" := JobRec.Description;
                    "Project Budget" := JobRec."Project Budget";
                    "Actual Project Costs" := JobRec."Actual Project Costs";
                    "PO Commitments" := JobRec."PO Commitments";
                    "PRN Commitments" := JobRec."PRN Commitments";
                    "Store Requisition Commitments" := JobRec."Store Requisition Commitments";
                    "Imprest Application Commitment" := JobRec."Imprest Application Commitment";
                    "Total Budget Commitments" := "PO Commitments" + "PRN Commitments" + "Store Requisition Commitments" + "Imprest Application Commitment";
                    "Available Funds" := "Project Budget" - "Actual Project Costs" - "Total Budget Commitments";
                    "Global Dimension 2 Code" := Project;
                    Validate("Global Dimension 2 Code");
                end;
            end;
        }
        field(4; "Project Description"; Text[250])
        {
        }
        field(5; Objective; Blob)
        {
            SubType = UserDefined;
        }
        field(6; "Terms of Reference"; Blob)
        {
            SubType = Memo;
        }
        field(7; Requestor; Code[20])
        {
            Editable = false;
            TableRelation = Resource where(Type = const(Person));

            trigger OnValidate()
            begin
                if ResourceRec.Get(Requestor) then;
                "Requestor Name" := ResourceRec.Name;
            end;
        }
        field(8; "Requestor Name"; Text[50])
        {
            Editable = false;
        }
        field(9; "Total Subsistence Allowance"; Decimal)
        {
            CalcFormula = sum("Project Members".Entitlement where("Imprest Memo No." = field("No."),
                                                                   "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Total Casuals Cost"; Decimal)
        {
            CalcFormula = sum(Casuals.Amount where("Imprest Memo No." = field("No."),
                                                    "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Total Other Costs"; Decimal)
        {
            CalcFormula = sum("Other Costs"."Line Amount" where("Imprest Memo No." = field("No."),
                                                                 "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(13; Posted; Boolean)
        {
            Editable = false;
        }
        field(14; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(15; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(16; "Datetime Posted"; DateTime)
        {
        }
        field(17; "Posted By"; Code[50])
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(18; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(19; Currency; Code[20])
        {
            Editable = true;
            TableRelation = Currency.Code;
        }
        field(20; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(21; "Work Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Currency.Code;
        }
        field(22; "Project Task"; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting));

            trigger OnValidate()
            begin
                if TaskRec.Get(Project, "Project Task") then;
                "Project Task Description" := TaskRec.Description;
            end;
        }
        field(23; "Project Task Description"; Text[250])
        {
        }
        field(24; "Project Maintenance Costs"; Decimal)
        {
            CalcFormula = sum("Project Members"."Expected Maintenance Cost" where("Imprest Memo No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Project Lead Costs"; Decimal)
        {
            CalcFormula = sum("Project Members".Entitlement where("Imprest Memo No." = field("No."),
                                                                   Type = const(Machine)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Project Budget"; Decimal)
        {
            Caption = 'Total Project Budget';
            Editable = false;
            FieldClass = Normal;
        }
        field(27; "Total Fuel Costs"; Decimal)
        {
            CalcFormula = sum("Project Members"."Expected Maintenance Cost" where("Imprest Memo No." = field("No."),
                                                                                   "Expense Type" = const(Fuel),
                                                                                   "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Total Maintenance Costs"; Decimal)
        {
            CalcFormula = sum("Project Members"."Expected Maintenance Cost" where("Imprest Memo No." = field("No."),
                                                                                   "Expense Type" = const(Maintenance),
                                                                                   "Work Type" = field("Work Type Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Actual Project Costs"; Decimal)
        {
            Editable = false;
        }
        field(94; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(100; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(101; "Shortcut Dimension 5 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
        }
        field(50014; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; "Project Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; "Division Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 4 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50018; "Destination Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 5 Code")));
            FieldClass = FlowField;
        }
        field(57001; "PO Commitments"; Decimal)
        {
            Caption = 'Purchase Order Commitments';
            Editable = false;
            FieldClass = Normal;
        }
        field(57002; "PRN Commitments"; Decimal)
        {
            Caption = 'Purchase Requisition(PRN) Commitments';
            Editable = false;
            FieldClass = Normal;
        }
        field(57003; "Store Requisition Commitments"; Decimal)
        {
            Caption = 'Store Requisition(S11) Commitments';
            Editable = false;
            FieldClass = Normal;
        }
        field(57004; "Imprest Application Commitment"; Decimal)
        {
            Caption = 'Imprest Applications Commitments';
            Editable = false;
            FieldClass = Normal;
        }
        field(57005; "Total Budget Commitments"; Decimal)
        {
            Editable = false;
        }
        field(57006; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(57007; "User ID"; Code[50])
        {
            Caption = 'User ID';
            NotBlank = true;
            TableRelation = "User Setup"."User ID";

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //UserMgt.LookupUserID("User ID");
            end;

            trigger OnValidate()
            var
                UserMgt: Codeunit "User Management";
            begin
                //UserMgt.ValidateUserID("User ID");
            end;
        }
        field(57008; "Document Type"; Option)
        {
            OptionMembers = "Imprest Memo";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Project, "Project Description", Date, Requestor, "Requestor Name")
        {
        }
    }

    trigger OnInsert()
    begin

        CashMgt.Get();
        CashMgt.TestField("Imprest Memo Nos");
        if "No." = '' then
          //  NoSeriesMgt.InitSeries(CashMgt."Imprest Memo Nos", xRec."No. Series", 0D, "No.", "No. Series");
            "No." := NoSeriesMgt.GetNextNo(CashMgt."Imprest Memo Nos", WorkDate(),true);
        /*
           //Assign Customer Account
          IF UserSetup.GET(USERID) THEN BEGIN
             UserSetup.TESTFIELD(Picture);

           IF Customer.GET(UserSetup.Picture) THEN BEGIN
              "Account No.":=Customer."No.";
              "Account Name":=Customer.Name;
              Payee:=Customer.Name;
              END
              ELSE
              ERROR(Text001,UserSetup.Picture);
             END;
      */
        //Ushindi
        //Confirm if any open Memo exists and force reuse
        ImprestMemo.Reset;
        ImprestMemo.SetRange(ImprestMemo.Status, ImprestMemo.Status::Open);
        ImprestMemo.SetRange(ImprestMemo."User ID", UserId);
        ImprestMemo.SetFilter("No.", '<>%1', "No.");
        if ImprestMemo.Find('-') then Error(Text003, ImprestMemo."No.");
        //
        //Insert User ID and Resource No/Mapping
        UserSetup.Reset;
        if not UserSetup.Get(UserId) then
            Error('%1 is not defined under the User Setup, Please check!', UserId);
        if UserSetup.Get(UserId) then begin
            UserSetup.TestField(UserSetup."Resource No");
            UserSetup.TestField(UserSetup."Employee No.");
            UserSetup.TestField(UserSetup."Imprest Account");
            UserSetup.TestField(UserSetup."Employee Name");
            "User ID" := UserId;
            Requestor := UserSetup."Resource No";
            "Requestor Name" := UserSetup."Employee Name";
        end;
        //Insert Today Date as default
        Date := Today;
        //Ushindi

    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        CashMgt: Record "Cash Management Setup";
        Text000: label 'Cash management setup does''nt exist';
        Text001: label 'Create an Imprest A/C for Employee No. %1 under the Employee Card \Please contact system Administrator';
        Text002: label 'Cheque No. already exists';
        JobRec: Record Job;
        ResourceRec: Record Resource;
        TaskRec: Record "Job Task";
        UserSetup: Record "User Setup";
        ImprestMemo: Record "Imprest Memo";
        Text003: label 'Another Project Imprest Memo No %1 you created is still Open, Please check or reuse it!';
        DIM: Record "Dimension Value";

    local procedure InsertTOR()
    var
        Instr: InStream;
        TOR: BigText;
        Outstr: OutStream;
        TermsText: Text;
    begin
        TOR.AddText(TermsText);
        Rec."Terms of Reference".CreateOutstream(Outstr);
        TOR.Write(Outstr);
        Insert;
    end;
}
