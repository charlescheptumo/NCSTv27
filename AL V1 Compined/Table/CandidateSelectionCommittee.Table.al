#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69676 "Candidate Selection Committee"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Aptitude Test Invitation,Final Candidate Shortlisting,Formal Interview Invitation';
            OptionMembers = "Aptitude Test Invitation","Final Candidate Shortlisting","Formal Interview Invitation";
        }
        field(3; "Appointed Committee ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher";
        }
        field(4; "Member No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointed Member"."Member No." where("Document No." = field("Appointed Committee ID"));

            trigger OnValidate()
            begin
                CommiteeMember.Reset;
                CommiteeMember.SetRange("Member No.", "Member No.");
                if CommiteeMember.Find('-') then begin
                    Role := CommiteeMember.Role;
                    Name := CommiteeMember."Member Name";
                    Email := CommiteeMember."Member Email";
                    "Phone No." := CommiteeMember."Telephone No.";
                    Designation := CommiteeMember.Designation;
                    "Staff No." := CommiteeMember."Staff No.";
                end
            end;
        }
        field(5; Role; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(6; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Email; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(8; "Phone No."; Text[15])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(9; Designation; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Staff No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Notified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Notified On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Member No.", "Line No.")
        {
            // Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CommiteeMember: Record "Commitee Appointed Member";
}

