#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57012 "Other Costs"
{

    fields
    {
        field(1; "Imprest Memo No."; Code[20])
        {
            TableRelation = "Imprest Memo";
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; Description; Text[150])
        {
            CalcFormula = lookup("Receipts and Payment Types1".Description where(Code = field("Type of Expense")));
            FieldClass = FlowField;
        }
        field(4; "Quantity Required"; Decimal)
        {

            trigger OnValidate()
            begin

                case Type of
                    Type::Item:
                        begin
                            if ItemRec.Get("No.") then;
                            "Unit Cost" := ItemRec."Unit Cost";
                            "Line Amount" := "Quantity Required" * "Unit Cost";
                        end;
                    else
                        "Line Amount" := "Quantity Required" * "Unit Cost" * "No. of Days";
                end;
            end;
        }
        field(5; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                "Line Amount" := "Quantity Required" * "Unit Cost" * "No. of Days";
                ///"Line Amount":="Quantity Required"*"Unit Cost";
            end;
        }
        field(6; "Required For"; Text[250])
        {
        }
        field(7; "Line Amount"; Decimal)
        {
            Editable = false;
        }
        field(8; "Work Type"; Code[20])
        {
            TableRelation = "Work Type";
        }
        field(9; "No."; Code[20])
        {
            CalcFormula = lookup("Receipts and Payment Types1"."G/L Account" where(Code = field("Type of Expense"),
                                                                                    "Appear on Imprest?" = filter(true)));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                case Type of
                    Type::"G/L Account":
                        begin
                            if GLAccount.Get("No.") then;
                            Description := GLAccount.Name;
                        end;
                    Type::"Fixed Asset":
                        begin
                            if FA.Get("No.") then;
                            Description := FA.Description;
                        end;
                    Type::Item:
                        begin
                            if ItemRec.Get("No.") then;
                            Description := ItemRec.Description;
                        end;
                    Type::"Charge (Item)":
                        begin
                            if ItemCharge.Get("No.") then;
                            Description := ItemCharge.Description;
                        end;
                end;
                //Ushindi
                CalcFields(Project);
                //Ushindi
            end;
        }
        field(10; Posted; Boolean)
        {
        }
        field(11; Linked; Boolean)
        {
        }
        field(12; Type; Option)
        {
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";
        }
        field(13; "Employee No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            var
                Employee2: Record Employee;
            begin

                if Employee2.Get("Employee No.") then begin
                    "Employee Name" := Employee2."First Name" + ' ' + Employee2."Middle Name" + ' ' + Employee2."Last Name";
                end;
            end;
        }
        field(14; "Employee Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(24; Project; Code[20])
        {
            CalcFormula = lookup("Imprest Memo".Project where("No." = field("Imprest Memo No.")));
            FieldClass = FlowField;
        }
        field(25; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Project));

            trigger OnValidate()
            begin
                CalcFields(Project);
                if TaskRec.Get(Project, "Task No.") then;
                "Job Task Description" := TaskRec.Description;
            end;
        }
        field(26; "Actual Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                "Actual Line Amount" := "Quantity Used" * "Actual Unit Cost";
            end;
        }
        field(27; "Actual Line Amount"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin

                "Actual Line Amount" := "Quantity Used" * "Actual Unit Cost";
            end;
        }
        field(28; Surrendered; Boolean)
        {
        }
        field(29; "No. of Days"; Decimal)
        {
        }
        field(50020; "Vote Item"; Code[20])
        {
            Editable = false;
            TableRelation = "G/L Account"."No.";
        }
        field(50021; "Vote Amount"; Decimal)
        {
            CalcFormula = lookup("G/L Budget Entry".Amount where("G/L Account No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022; "Actual to Date"; Decimal)
        {
            Editable = false;
        }
        field(50023; Commitments; Decimal)
        {
            Editable = false;
        }
        field(50024; "Vote Item Desc."; Text[200])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(57000; "Job Task Description"; Text[50])
        {
            Caption = 'Job Task Description';
            Editable = false;
        }
        field(57001; "Quantity Used"; Decimal)
        {

            trigger OnValidate()
            begin
                case Type of
                    Type::Item:
                        begin
                            if ItemRec.Get("No.") then;
                            "Unit Cost" := ItemRec."Unit Cost";
                            "Line Amount" := "Quantity Required" * "Unit Cost";
                            "Actual Line Amount" := "Quantity Used" * "Actual Unit Cost";
                        end;
                    else
                        "Actual Line Amount" := "Quantity Used" * "Actual Unit Cost";
                end;
            end;
        }
        field(57002; "Actual Unit Costs"; Decimal)
        {

            trigger OnValidate()
            begin
                "Actual Line Amount" := "Quantity Used" * "Actual Line Amount";
            end;
        }
        field(57003; "Type of Expense"; Code[50])
        {
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));
        }
        field(57007; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
    }

    keys
    {
        key(Key1; "Imprest Memo No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        FA: Record "Fixed Asset";
        ItemRec: Record Item;
        ItemCharge: Record "Item Charge";
        TaskRec: Record "Job Task";
        Employee: Record Resource;
}
