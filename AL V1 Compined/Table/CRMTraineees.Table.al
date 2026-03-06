#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69501 "CRM Traineees"
{

    fields
    {
        field(1; "Training Code"; Code[20])
        {
        }
        field(2; "Member No"; Code[30])
        {
            Caption = 'Employee No';
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if ObjCust.Get("Member No") then begin
                    "Member Name" := ObjCust."First Name" + ' ' + ObjCust."Middle Name" + ' ' + ObjCust."Last Name";
                    "Member ID No" := ObjCust."ID Number"
                end;
            end;
        }
        field(3; "Member Name"; Code[50])
        {
        }
        field(4; "Member ID No"; Code[20])
        {
        }
        field(5; "Member Phone No"; Code[20])
        {
        }
        field(6; "Member House Group"; Code[20])
        {
        }
        field(7; "Member House Group Name"; Code[50])
        {
        }
        field(8; Attended; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Training Code", "Member ID No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Cust: Record Employee;
        ObjCust: Record Employee;
}
