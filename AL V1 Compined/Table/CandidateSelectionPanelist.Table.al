#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69708 "Candidate Selection Panelist"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Candidate Shortlisting,Interview Invitation';
            OptionMembers = "Candidate Shortlisting","Interview Invitation";
        }
        field(2;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Panel ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Appointed Selection";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher"."Document No.";
        }
        field(5;"Member No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointed Member"."Member No." where ("Document No."=field("Appointed Selection"));
        }
        field(6;Role;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(7;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Telephone No";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Designation;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Staff No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;Notified;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Notified On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Member No.","Panel ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

