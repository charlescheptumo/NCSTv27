#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50019 tableextension50019 extends Job
{
    fields
    {
        modify("Bill-to Customer No.")
        {
            TableRelation = Customer where("Funding Class" = const(Grant));
        }

        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          JobsSetup.GET;
          NoSeriesMgt.TestManual(JobsSetup."Job Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Document Type"="Document Type"::Job THEN BEGIN
        #1..5
        END;

        IF "Document Type"="Document Type"::Project THEN BEGIN
        IF "No." <> xRec."No." THEN BEGIN
          GrantsSetup.GET;
          NoSeriesMgt.TestManual(GrantsSetup."Research Project Nos");
          "No. Series" := '';
        END;
        END;
        */
        //end;


        //Unsupported feature: Code Insertion on ""Person Responsible"(Field 20)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF Res.GET("Person Responsible") THEN BEGIN
          "Principle Investigator Name":=Res.Name;
          END;
        */
        //end;
        field(50000; "Project Budget"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Job No." = field("No."),
                                                                            "Line Type" = const(Budget)));
            Caption = 'Total Project Budget';
            Description = '//Daudi changed from schedule to budget as per the new 2017';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Actual Project Costs"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Job No." = field("No."),
                                                                           "Entry Type" = const(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Budget Commitments"; Decimal)
        {
            Caption = 'Total Budget Commitments';
        }
        field(50003; "Available Funds"; Decimal)
        {
        }
        field(50006; "Last Invoice Date"; Date)
        {
            CalcFormula = max("Job Ledger Entry"."Posting Date" where("Job No." = field("No."),
                                                                       "Entry Type" = const(Sale)));
            FieldClass = FlowField;
        }
        field(50007; "Prior Period Turnover"; Decimal)
        {
        }
        field(50008; "Prior Period Costs"; Decimal)
        {
        }
        field(50009; "Current Period Turnover"; Decimal)
        {
        }
        field(50010; "Current Period Costs"; Decimal)
        {
        }
        field(50011; "Later Period Turnover"; Decimal)
        {
        }
        field(50012; "Later Period Costs"; Decimal)
        {
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(5, Rec."Shortcut Dimension 5 Code");
            end;
        }
        field(50050; "Last Invoice Entry Date"; Date)
        {
            CalcFormula = max("Job Ledger Entry"."Posting Date" where("Job No." = field("No."),
                                                                       "Entry Type" = const(Sale)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50051; "Last Usage Entry Date"; Date)
        {
            CalcFormula = max("Job Ledger Entry"."Posting Date" where("Job No." = field("No."),
                                                                       "Entry Type" = const(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57000; "No. Of Project Imprest Memos"; Integer)
        {
            CalcFormula = count("Imprest Memo" where(Project = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57001; "PO Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = filter(Order),
                                                                   Status = filter(Released),
                                                                   "Job No." = field("No.")));
            Caption = 'Purchase Order Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57002; "PRN Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = filter("Purchase Requisition"),
                                                                   Status = filter(Released),
                                                                   "Job No." = field("No."),
                                                                   Ordered = filter(false)));
            Caption = 'Purchase Requisition(PRN) Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57003; "Store Requisition Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where("Document Type" = filter("Store Requisition"),
                                                                   Status = filter(Released),
                                                                   "Job No." = field("No."),
                                                                   "Quantity To  Issue" = filter(> 0)));
            Caption = 'Store Requisition(S11) Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57004; "Imprest Application Commitment"; Decimal)
        {
            CalcFormula = sum("Imprest Lines".Amount where(Project = field("No."),
                                                            Status = filter(Released),
                                                            "Payment Type" = filter(<> "Imprest Surrender")));
            Caption = 'Imprest Applications Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57005; "Opportunity Reference"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Oportunity".No;

            trigger OnValidate()
            begin
                if FundOp.Get(Rec."Opportunity Reference") then begin
                    Rec."Fund Opportunity Name" := FundOp.Name;
                    Rec."Grant Amount" := FundOp.Amount;
                end;
            end;
        }
        field(57006; "Grant Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(57007; "Fund Opportunity Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(57008; "Research Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Research Center?" = const(true));
        }
        field(57009; "Research Program"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Program";
        }
        field(57010; "Research Project Area"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Project Area" where("Research Program ID" = field("Research Program"));
        }
        field(57011; "Grant Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Types";
        }
        field(57012; "Researcher Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource where("Researcher?" = filter(true));
        }
        field(65000; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Start of Grants Module';
            OptionCaption = 'Job,Project,Budget';
            OptionMembers = Job,Project,Budget;
        }
        field(65001; "Grant Applications ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Funding Application" where("Application Status" = const(Won));

            trigger OnValidate()
            begin
                GFA.Reset;
                GFA.SetRange("Application No", Rec."Grant Applications ID");
                if GFA.Find('-') then begin
                    GFA.CalcFields("Principal Investigator");
                    Rec."Bill-to Customer No." := GFA."Grantor No.";
                    Rec."Bill-to Name" := GFA."Grantor Name";
                    Rec."Research Center" := GFA."Research Center";
                    Rec."Person Responsible" := GFA."Principal Investigator";
                    Rec."Currency Code" := GFA."Currency Code";
                    // "Project Manager":=
                end;
            end;
        }
        field(65002; "Grantor Admin Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65003; "Grantor Admin Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65004; "Grantor Financial Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65005; "Grantor Financial Contact Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65006; "Grantor Authorized Official ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65007; "Grantor Authorized Official"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65008; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(65009; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65010; "Creation Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(65011; "Notice of Award No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65012; "External Grant Reference No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65013; "CFDA No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65014; "Award Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65015; "Assistance Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Grant,Cooperative Agreement';
            OptionMembers = Grant,"Cooperative Agreement";
        }
        field(65016; "Budget Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65017; "Budget End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65018; "Project Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65019; "Project End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65020; "Primary Funding Sponsor ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Funding Class" = const(Grant));

            trigger OnValidate()
            var
                cust: record customer;
            begin
                Cust.Reset;
                Cust.SetRange("No.", Rec."Primary Funding Sponsor ID");
                if Cust.Find('-') then begin
                    Rec."Primary Sponsor Name" := Cust.Name;
                end;
            end;
        }
        field(65021; "Primary Sponsor Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65022; "Project Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Time and Material,Fixed-Price';
            OptionMembers = "Time and Material","Fixed-Price";
        }
        field(65024; "Total Billed Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(65025; "Grantee Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65026; "Grantee Address"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65027; "Grantee Address 2"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65028; "Grantee Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65029; "Grantee City"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65030; "Grantee Country/Region"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65031; "Grantee Project Director Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65032; "Grantee Financial Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65033; "Grantee Financial Contact Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65034; "Grantee Authorized Official ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65035; "Grantee Authorized Official"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65036; "Grantee Project Director ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65037; "Award Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Prime Recipient,Sub-Recipient';
            OptionMembers = "Prime Recipient","Sub-Recipient";
        }
        field(65038; "Project Funding Contract No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Contract Header"."Project Contract No";
        }
        field(65039; "Country Entry Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Contract Funding Lines"."Year Code" where("Project Contract No." = field("Project Funding Contract No"));
        }
        field(65040; "Grantee Admin Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65041; "Grantee Admin Contact Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65042; "Total Approved Direct Costs"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Direct Unit Cost (LCY)" where("Job No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65043; "Total Approved Indirect Costs"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Direct Unit Cost (LCY)" where("Job No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65044; "Indirect Cost (%)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(65045; "Total Approved Budget"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Job No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65046; "Total Actual Costs"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Job No." = field("No."),
                                                                           "Entry Type" = const(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65047; "Total Billable Amount"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Line Amount (LCY)" where("Job No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65048; "Total Invoiced Amount"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Line Discount Amount" where("Job No." = field("No."),
                                                                               "Entry Type" = const(Sale)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65049; "Completed (%)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(65050; "Invoiced (%)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(65051; "Project No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where("Document Type" = const(Project));
        }
        field(65052; "Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original,Revised,Suplementary';
            OptionMembers = Original,Revised,Suplementary;
        }
        field(65053; "Principle Investigator Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"));
        }
        field(70020; exchequer; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70021; Commitments; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where(Job = field("No."),
                                                                  Type = const(Committed)));
            FieldClass = FlowField;
        }
        field(70026; "Test CC"; Time)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "Research Center")
        {
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    JobsSetup.GET;

    IF "No." = '' THEN BEGIN
      JobsSetup.TESTFIELD("Job Nos.");
      NoSeriesMgt.InitSeries(JobsSetup."Job Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    IF GETFILTER("Bill-to Customer No.") <> '' THEN
      IF GETRANGEMIN("Bill-to Customer No.") = GETRANGEMAX("Bill-to Customer No.") THEN
    #10..21
    DimMgt.UpdateDefaultDim(
      DATABASE::Job,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    InitWIPFields;

    "Creation Date" := TODAY;
    "Last Date Modified" := "Creation Date";

    IF ("Project Manager" <> '') AND (Status = Status::Open) THEN
      AddToMyJobs("Project Manager");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    JobsSetup.GET;
    IF "Document Type"="Document Type"::Job THEN BEGIN
    #3..6
    END;


    JobsSetup.GET;
    IF "Document Type"="Document Type"::Budget THEN BEGIN
    IF "No." = '' THEN BEGIN
      JobsSetup.TESTFIELD("Budget Plan Nos");
      NoSeriesMgt.InitSeries(JobsSetup."Budget Plan Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END;

    IF "Document Type"="Document Type"::Project THEN BEGIN
    IF "No." = '' THEN BEGIN
      GrantsSetup.GET;
      GrantsSetup.TESTFIELD("Research Project Nos");
      NoSeriesMgt.InitSeries(GrantsSetup."Research Project Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END;
    #7..24
    //update JOB Dimensin

    #25..31
    */
    //end;

    procedure FnMetricsComputation()
    begin
        /*IF  ("Total Approved Budget"<>0) THEN BEGIN
            "Indirect Cost (%)":=ROUND("Total Approved Direct Costs"/"Total Approved Budget",0.01,'=');
            "Completed (%)":=ROUND("Total Actual Costs"/"Total Approved Budget",0.01,'=');
          END;
        IF ("Total Billable Amount"<>0) THEN BEGIN
          "Invoiced (%)":=ROUND("Total Invoiced Amount"/"Total Billable Amount",0.01,'=');
          END;
        
        MODIFY;*/

    end;

    var
        FundOp: Record "Funding Oportunity";
        GrantsSetup: Record "Grants Setup";
        GFA: Record "Grant Funding Application";
        Res: Record Resource;
}
