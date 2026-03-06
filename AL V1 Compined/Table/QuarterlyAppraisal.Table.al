#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56201 "Quarterly Appraisal"
{

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;
        }
        field(2; "Date created"; Date)
        {
            Editable = false;
        }
        field(3; "Time Created"; Time)
        {
            Editable = false;
        }
        field(4; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(5; "Employee No"; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(6; "Employee Name"; Text[250])
        {
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(9; Quarter; Option)
        {
            OptionCaption = ' ,Quarter 1,Quarter 2,Quarter 3,Quarter 4';
            OptionMembers = " ","Quarter 1","Quarter 2","Quarter 3","Quarter 4";
        }
        field(10; "Financial Year"; Code[20])
        {
            TableRelation = "Appraisal  Period";
        }
        field(11; "Overall Quartely score"; Decimal)
        {
            Editable = false;
        }
        field(12; "Additional Assignment"; Blob)
        {
        }
        field(13; Remarks; Blob)
        {
        }
        field(14; "Supervisor Code"; Code[10])
        {
        }
        field(15; "Supervisor Name"; Text[250])
        {
        }
        field(16; "Supervisor Designation"; Text[250])
        {
        }
        field(17; Status; Option)
        {
            OptionCaption = 'Open,Sent to supervisior,Completed,Rejected';
            OptionMembers = Open,"Sent to supervisior",Completed,Rejected;
        }
        field(18; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            HumanResSetup.Get();
            HumanResSetup.TestField("Quarterly Appraisal Nos.");
          //  NoSeriesMgt.InitSeries(HumanResSetup."Quarterly Appraisal Nos.", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(HumanResSetup."Quarterly Appraisal Nos.", WorkDate(), true);
        end;

        "Time Created" := Time;
        "Date created" := Today;
        "Created By" := UserId;

        Usersetup.Get("Created By");
        "Employee No" := Usersetup."Employee No.";
        "Employee Name" := Usersetup."Employee Name";
        ApproverUSerID := Usersetup."Approver ID";

        EmployeeRec.Get("Employee No");
        "Global Dimension 1 Code" := EmployeeRec."Global Dimension 1 Code";

        EmployeeRec1.Reset;
        EmployeeRec1.SetRange("User ID", ApproverUSerID);
        if EmployeeRec1.Find('-') then begin
            "Supervisor Code" := EmployeeRec1."No.";
            "Supervisor Designation" := EmployeeRec1."Job Title";
            "Supervisor Name" := EmployeeRec1.FullName;
        end;
    end;

    var
        Employee: Record Employee;
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Usersetup: Record "User Setup";
        EmployeeRec: Record Employee;
        ApproverUSerID: Code[100];
        EmployeeRec1: Record Employee;
}
