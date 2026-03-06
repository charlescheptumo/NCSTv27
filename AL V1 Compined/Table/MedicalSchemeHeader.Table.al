#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69035 "Medical Scheme Header"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Selection Date"; Date)
        {
        }
        field(3; "Cover Type"; Option)
        {
            OptionMembers = " ","In House",Outsourced;
        }
        field(4; "Service Provider"; Code[10])
        {
            TableRelation = if ("Cover Type" = const(Outsourced)) Vendor;
        }
        field(5; "Name of Broker"; Text[30])
        {
        }
        field(6; "Policy No"; Code[20])
        {
        }
        field(7; "Policy Start Date"; Date)
        {

            trigger OnValidate()
            begin
                "Policy Expiry Date" := CalcDate('1Y', "Policy Start Date") - 1;
            end;
        }
        field(8; "Policy Expiry Date"; Date)
        {
        }
        field(9; "Employee No"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if EmpRec.Get("Employee No") then begin
                    "Employee Name" := EmpRec."First Name" + ' ' + EmpRec."Middle Name" + ' ' + EmpRec."Last Name";
                    if SalaryScales.Get(EmpRec."Salary Scale") then
                        "Entitlement -Inpatient" := SalaryScales."In Patient Limit";
                    "Entitlement -OutPatient" := SalaryScales."Out Patient Limit";
                end;


                MedLines.Init;
                MedLines."Medical Scheme No" := "No.";
                MedLines."Line No." := MedLines."Line No." + 10000;
                MedLines."Employee Code" := "Employee No";
                MedLines.Relationship := 'EMPLOYEE';

                if EmpRec.Get("Employee No") then
                    MedLines."Date Of Birth" := EmpRec."Date Of Birth";
                MedLines.SurName := EmpRec."Last Name";
                MedLines."Other Names" := EmpRec."First Name";
                MedLines."Service Provider" := "Service Provider";
                if not MedLines.Get(MedLines."Medical Scheme No", MedLines."Line No.") then
                    MedLines.Insert;


                Dependants.Reset;
                Dependants.SetRange(Dependants."Employee Code", "Employee No");
                if Dependants.Find('-') then
                    repeat
                        MedLines.Init;
                        MedLines."Medical Scheme No" := "No.";
                        MedLines."Line No." := MedLines."Line No." + 10000;
                        MedLines."Employee Code" := "Employee No";
                        MedLines.Relationship := Dependants.Relationship;
                        MedLines.SurName := Dependants.SurName;
                        MedLines."Other Names" := Dependants."Other Names";

                        if EmpRec.Get("Employee No") then
                            // MedLines."Date Of Birth":=EmpRec."Date Of Birth";

                            MedLines."Date Of Birth" := Dependants."Date Of Birth";
                        MedLines."Service Provider" := "Service Provider";

                        if not MedLines.Get(MedLines."Medical Scheme No", MedLines."Line No.") then
                            MedLines.Insert;
                    until Dependants.Next = 0;
            end;
        }
        field(10; "Employee Name"; Text[50])
        {
        }
        field(11; "Entitlement -Inpatient"; Decimal)
        {
        }
        field(12; "Entitlement -OutPatient"; Decimal)
        {
        }
        field(13; "Fiscal Year"; Code[10])
        {
            TableRelation = "G/L Budget Name";
        }
        field(14; "No. Of Lives"; Integer)
        {
            CalcFormula = count("Medical Scheme Lines" where("Medical Scheme No" = field("No.")));
            FieldClass = FlowField;
        }
        field(15; "No. Series"; Code[10])
        {
        }
        field(16; "Cover Selected"; Code[20])
        {
            TableRelation = "Medical Cover Types" where(Type = field("Cover Type"));

            trigger OnValidate()
            begin
                Validate("Employee No");
            end;
        }
        field(17; "In-Patient Claims"; Decimal)
        {
            CalcFormula = sum("Claim Line"."Approved Amount" where("Employee No" = field("Employee No"),
                                                                    "Claim Type" = const("In-Patient")));
            FieldClass = FlowField;
        }
        field(18; "Out-Patient Claims"; Decimal)
        {
            CalcFormula = sum("Claim Line"."Approved Amount" where("Employee No" = field("Employee No"),
                                                                    "Claim Type" = const("Out-Patient")));
            FieldClass = FlowField;
        }
        field(19; "User ID"; Code[20])
        {
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
    }

    trigger OnInsert()
    begin


        if "No." = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField(HumanResSetup."Cover Selection Nos");
         //    NoSeriesMgt.InitSeries(HumanResSetup."Cover Selection Nos", xRec."No. Series", 0D, "No.", "No. Series");
            "No." := NoSeriesMgt.GetNextNo(HumanResSetup."Cover Selection Nos", Today, true);
        end;

        "User ID" := UserId;

        if UserRec.Get(UserId) then begin
            // "Employee No":=UserRec."Open Service Contract";
            Validate("Employee No");

        end;

        "Selection Date" := Today;
        AcctPeriod.Reset;
        AcctPeriod.SetRange(AcctPeriod."Starting Date", 0D, Today);
        AcctPeriod.SetRange(AcctPeriod."New Fiscal Year", true);
        if AcctPeriod.Find('+') then begin
            "Policy Start Date" := AcctPeriod."Starting Date";
            "Policy Expiry Date" := CalcDate('1Y', AcctPeriod."Starting Date") - 1;
        end;
        /*
        MedScheme.RESET;
        MedScheme.SETRANGE(MedScheme."Employee No","Employee No");
        MedScheme.SETRANGE(MedScheme."Policy Start Date","Policy Start Date");
        IF MedScheme.FIND('+') THEN
        ERROR('You have already selected your cover for the current year');
        */

    end;

    var
        MedLines: Record "Medical Scheme Lines";
        Dependants: Record "Employee Beneficiaries";
        EmpRec: Record Employee;
        UserRec: Record "User Setup";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        SalaryScales: Record "Salary Scales";
        MedScheme: Record "Medical Scheme Header";
        AcctPeriod: Record "Accounting Period";
}
