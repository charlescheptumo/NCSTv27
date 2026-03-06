#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70008 "Procurement Plan 1"
{
    DrillDownPageID = "Procurement Plan Listing";
    LookupPageID = "Procurement Plan Listing";

    fields
    {
        field(1; "Plan Year"; Code[10])
        {
        }
        field(2; "Plan Item No"; Code[10])
        {
            NotBlank = true;
        }
        field(3; "Procurement Type"; Option)
        {
            OptionMembers = " ",Service,Goods,Works;

            trigger OnValidate()
            begin
                if "Procurement Type" = "procurement type"::Service then
                    Type := Type::"G/L Account";

                if "Procurement Type" = "procurement type"::Goods then
                    Type := Type::Item;

                if "Procurement Type" = "procurement type"::Works then
                    Type := Type::"G/L Account";
            end;
        }
        field(4; "Unit of Measure"; Code[10])
        {
            TableRelation = "Unit of Measure";
        }
        field(5; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                "Estimated Cost" := Quantity * "Unit Cost";
            end;
        }
        field(6; "Procurement Method"; Code[10])
        {
            TableRelation = "Procurement Method";
        }
        field(7; "Source of Funds"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(8; "Estimated Cost"; Decimal)
        {
        }
        field(9; "Advertisement Date"; Date)
        {
        }
        field(10; "Bid/Quotation Opening Date"; Date)
        {
        }
        field(11; "Proposal Evaluation date"; Date)
        {
        }
        field(12; "Financial Opening date"; Date)
        {
        }
        field(13; "Negotiation date"; Date)
        {
        }
        field(14; "Notification of award date"; Date)
        {
        }
        field(15; "Contract Date"; Date)
        {
        }
        field(16; "Contract End Date (Planned)"; Date)
        {
        }
        field(17; "Department Code"; Code[10])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(18; "TOR/Technical specs due Date"; Date)
        {
        }
        field(19; "Item Description"; Text[250])
        {
        }
        field(20; Quantity; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Unit Cost");
            end;
        }
        field(21; Category; Code[10])
        {
        }
        field(22; "Process Type"; Option)
        {
            OptionMembers = " ",Direct,RFQ,RFP,Tender;
        }
        field(23; "Approved Budget"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry1".Amount where("Budget Name" = field("Plan Year"),
                                                                      "Procurement Item" = field("Plan Item No")));
            FieldClass = FlowField;
        }
        field(24; "Plan Status"; Option)
        {
            OptionMembers = " ",Open,Approved,Rejected;
        }
        field(25; Type; Option)
        {
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";
        }
        field(26; "No."; Code[10])
        {
            TableRelation = if (Type = const(" ")) "Standard Text"
            else if (Type = const("G/L Account")) "G/L Account"
            else if (Type = const(Item)) Item
            //CC//   else if (Type = const(RESOURSE)) Resource
            else if (Type = const("Fixed Asset")) "Fixed Asset"
            else if (Type = const("Charge (Item)")) "Item Charge";

            trigger OnValidate()
            begin
                if GLAcc.Get("No.") then begin
                    "Item Description" := GLAcc.Name;
                end;


                if ItemRec.Get("No.") then begin
                    "Item Description" := ItemRec.Description;
                    "Unit of Measure" := ItemRec."Base Unit of Measure";
                    "Unit Cost" := ItemRec."Last Direct Cost";

                end;
            end;
        }
        field(27; Actual; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Procurement Plan Item" = field("Plan Item No"),
                                                        "Procurement Plan" = field("Plan Year")));
            FieldClass = FlowField;
        }
        field(28; Commitment; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where("Procurement Plan" = field("Plan Year"),
                                                                  "Vote Item" = field("Plan Item No")));
            FieldClass = FlowField;
        }
        field(29; Test; Code[10])
        {
        }
        field(30; "Requisition Items"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Procurement Plan" = field("Plan Year"),
                                                            "Procurement Plan Item" = field("Plan Item No"),
                                                            "Requisition Status" = const(Approved)));
            FieldClass = FlowField;
        }
        field(31; "Funding Source Code"; Code[10])
        {
            TableRelation = "Funding Source";
        }
        field(32; "Output Code"; Code[10])
        {
        }
        field(33; "Objective Code"; Code[10])
        {
        }
        field(34; "Outcome Code"; Code[10])
        {
        }
        field(35; "Target Groups"; Code[10])
        {
            TableRelation = "Vendor Target Groups".Code;
        }
        field(36; "Margin of preference for Local"; Decimal)
        {
        }
        field(37; "Quarter 1 Amount"; Decimal)
        {
        }
        field(38; "Quarter 2 Amount"; Decimal)
        {
        }
        field(39; "Quarter 3 Amount"; Decimal)
        {
        }
        field(40; "Quarter 4 Amount"; Decimal)
        {
        }
        field(41; "Quarter 1 Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Quarter 2 Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Quarter 3 Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Quarter 4 Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(45; Youth; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(46; Women; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(47; PWD; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Citizen Contractors"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(5701; "Job ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(5702; "Job Task No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job ID"),
                                                             "Directorate Code" = field("Directorate Code"));
        }
        field(5703; "Workplan Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job ID"),
                                                             "Directorate Code" = field("Directorate Code"));

            trigger OnValidate()
            begin
                Validate("Job Task No.", "Workplan Task No.");
            end;
        }
        field(70000; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70001; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70026; "Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code where(Indentation = const(0));

            trigger OnValidate()
            begin
                /*ItemCategory.RESET;
                ItemCategory.SETRANGE("Item No","Item Category Description");
                IF ItemCategory.FIND('-') THEN
                  "Item Category Description":=ItemCategory.Description;*/

            end;
        }
        field(70027; "General Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            Enabled = false;
            TableRelation = "General Item Categories".Code;
        }
    }

    keys
    {
        key(Key1; "Plan Year", "Department Code", "Plan Item No")
        {
            Clustered = true;
            SumIndexFields = "Estimated Cost";
        }
        key(Key2; "Source of Funds")
        {
            SumIndexFields = "Estimated Cost";
        }
        key(Key3; "Plan Item No")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Plan Year", "Plan Item No", "Item Description", "Estimated Cost", "Approved Budget")
        {
        }
    }

    var
        GLAcc: Record "G/L Account";
        ItemRec: Record Item;


    procedure CheckAttachment(var ProcurementPlan: Record "Procurement Plan 1") LinkExists: Boolean
    var
        RecLink: Record "Record Link";
        SearchString: Text[50];
        ProcPlanRef: RecordRef;
        RecLinkRef: RecordRef;
    begin
        ProcPlanRef.GetTable(ProcurementPlan);
        SearchString := Format(ProcPlanRef.RecordId);

        RecLink.SetFilter(RecLink."Record ID", SearchString);
        if RecLink.Find('-') then begin
            LinkExists := true;
            repeat
            //MESSAGE('%1 %2',RecLink."Link ID",RecLink.Description);
            until RecLink.Next = 0;
        end
        else
            LinkExists := false;
    end;


    procedure FindManagersEmail(var ProcurePlan: Record "Procurement Plan 1") Memailaddress: Text[50]
    var
        Jobs: Record "Company Jobs";
        Emp: Record Employee;
    begin
        Jobs.Reset;
        Jobs.SetRange(Jobs.Management, true);
        Jobs.SetRange(Jobs."Dimension 1", ProcurePlan."Department Code");
        if Jobs.Find('-') then begin
            //MESSAGE('%1',Jobs."Job ID");
            Emp.Reset;
            Emp.SetRange(Emp.Position, Jobs."Job ID");
            if Emp.Find('-') then
                Memailaddress := Emp."Company E-Mail";
            if Memailaddress = '' then
                Error('set company address for employee %1', Emp."No.");
        end
        else
            Error('Manager for Department %1 has not been defined in the system', ProcurePlan."Department Code");
    end;
}
