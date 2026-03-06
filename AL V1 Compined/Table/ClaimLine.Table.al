#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69038 "Claim Line"
{
    DrillDownPageID = "Approved Salary Vouchers";
    LookupPageID = "Approved Salary Vouchers";

    fields
    {
        field(1; "Claim No"; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Patient No"; Integer)
        {
            TableRelation = "Medical Scheme Lines"."Line No." where("Employee Code" = field("Employee No"));

            trigger OnValidate()
            begin
                MedSchemeLines.Reset;
                MedSchemeLines.SetRange(MedSchemeLines."Employee Code", "Employee No");
                MedSchemeLines.SetRange(MedSchemeLines."Line No.", "Patient No");
                if MedSchemeLines.Find('+') then
                    "Patient Name" := MedSchemeLines."Other Names" + ' ' + MedSchemeLines.SurName;
            end;
        }
        field(4; "Patient Name"; Text[50])
        {
        }
        field(5; "Hospital/Specialist"; Text[50])
        {
        }
        field(6; "Invoice Number"; Code[20])
        {
        }
        field(7; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                "Approved Amount" := Amount;
                MedicalSheme.Reset;
                MedicalSheme.SetRange(MedicalSheme."Employee No", "Employee No");
                if MedicalSheme.Find('+') then begin
                    MedicalSheme.CalcFields(MedicalSheme."In-Patient Claims", MedicalSheme."Out-Patient Claims");
                    if Amount + MedicalSheme."In-Patient Claims" > MedicalSheme."Entitlement -Inpatient" then
                        Message('By Accepting this claim you will be exceed the in-patient limit');

                    if Amount + MedicalSheme."Out-Patient Claims" > MedicalSheme."Entitlement -OutPatient" then
                        Message('By Accepting this claim you will be exceed the out-patient limit');


                end;
            end;
        }
        field(8; "Approved Amount"; Decimal)
        {
        }
        field(9; "Employee No"; Code[20])
        {
            TableRelation = Employee;
        }
        field(10; "Medical Scheme"; Code[20])
        {
        }
        field(11; Status; Option)
        {
            OptionMembers = " ",Approved,Rejected,"Part Payment";
        }
        field(12; "Amount Spend (In-Patient)"; Decimal)
        {
            CalcFormula = sum("Claim Line"."Approved Amount" where("Employee No" = field("Employee No"),
                                                                    "Patient No" = field("Patient No"),
                                                                    "Claim Type" = const("In-Patient")));
            FieldClass = FlowField;
        }
        field(13; "Amout Spend (Out-Patient)"; Decimal)
        {
            CalcFormula = sum("Claim Line"."Approved Amount" where("Employee No" = field("Employee No"),
                                                                    "Patient No" = field("Patient No"),
                                                                    "Claim Type" = const("Out-Patient")));
            FieldClass = FlowField;
        }
        field(14; "Claim Type"; Option)
        {
            OptionMembers = " ","In-Patient","Out-Patient";
        }
        field(15; "Balance (In-Patient)"; Decimal)
        {
        }
        field(16; "Balance (Out-Patient)"; Decimal)
        {
        }
        field(17; "Visit Date"; Date)
        {
        }
        field(18; "Employee Name"; Text[50])
        {
        }
        field(19; Relationship; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Claim No", "Line No")
        {
            Clustered = true;
        }
        key(Key2; "Claim Type", "Employee No", "Patient No")
        {
            SumIndexFields = "Approved Amount", Amount;
        }
    }

    fieldgroups
    {
    }

    var
        MedSchemeLines: Record "Medical Scheme Lines";
        MedicalSheme: Record "Medical Scheme Header";
}
