#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59075 "Record Creation"
{

    fields
    {
        field(1; "File No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "File Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "File Types SetUp".Code;
        }
        field(3; "Registry Code"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Creation date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "File Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(9; "File Classification"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '      ,General File, Top Secret File, Confidential File';
            OptionMembers = "      ","General File"," Top Secret File"," Confidential File";
        }
        field(10; "File Location"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(15; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(16; Custody; Code[30])
        {
            Caption = 'Employee No';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active),
                                                  "Global Dimension 1 Code" = field("Global Dimension 1 Code"));

            trigger OnValidate()
            begin
                Employees.Reset;
                Employees.SetRange("No.", Custody);
                if Employees.FindSet then
                    "Employee Name" := Employees."First Name" + ' ' + Employees."Last Name";
                "Assigned Employee" := Employees."User ID";
            end;
        }
        field(17; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Submitted,Assigned';
            OptionMembers = Open,Submitted,Assigned;
        }
        field(19; "Assigned Employee"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", "Assigned Employee");
                if UserSetup.FindSet then begin
                    Custody := UserSetup."Employee No.";
                    "Employee Name" := UserSetup."Employee Name";
                end;
            end;
        }
        field(20; Disposed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Disposed By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Disposed Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Disposed Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Last Folio No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "File No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "File No" = '' then begin
            GenLedgerSetup.Get;
            GenLedgerSetup.TestField(GenLedgerSetup."File Creation Nos");
          //  NoSeriesMgt.InitSeries(GenLedgerSetup."File Creation Nos", xRec."No. Series", 0D, "File No", "No. Series");
            "File No" := NoSeriesMgt.GetNextNo(GenLedgerSetup."File Creation Nos", Today, true);
        end;

    end;

    var
        GenLedgerSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Vendor: Record Vendor;
        Employees: Record Employee;
        UserSetup: Record "User Setup";
}
