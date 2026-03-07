#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69607 "Staff Establishment Plan"
{

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Effective Date";Date)
        {
        }
        field(4;"External Document No.";Code[30])
        {
        }
        field(5;"Total Staff Establishment";Integer)
        {
            Editable = false;
        }
        field(6;"No. of Recruitment Plans";Integer)
        {
            CalcFormula = count("Recruitment Plan");
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;"Created By";Code[30])
        {
            Editable = false;
        }
        field(8;"Created On";Date)
        {
            Editable = false;
        }
        field(9;"Created Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By":=UserId;
        "Created On":=Today;
        "Created Time":=Time;
    end;

    var
        QualificationSetUp: Record Qualification;
}

