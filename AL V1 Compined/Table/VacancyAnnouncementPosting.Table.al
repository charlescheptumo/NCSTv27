#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69632 "Vacancy Announcement Posting"
{

    fields
    {
        field(1;"Announcement No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Posting Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Agency Posting,Direct Hire Announcement,Career Fair';
            OptionMembers = "Recruitment Agency Posting","Direct Hire Announcement","Career Fair";
        }
        field(4;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header";
        }
        field(5;"Job Board ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Board";

            trigger OnValidate()
            begin
                if JobBoard.Get("Job Board ID") then begin
                  Name:=JobBoard.Name;
                "Vendor No.":=JobBoard."Vendor No.";
                end
            end;
        }
        field(6;Name;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Advertisment Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"External Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Job Posting Link";Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(10;"Channel Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Online,Print Media,TV,Radio,Internal Advert,Other';
            OptionMembers = Online,"Print Media",TV,Radio,"Internal Advert",Other;
        }
        field(11;"Vendor No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(Key1;"Announcement No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobBoard: Record "Job Board";
}

