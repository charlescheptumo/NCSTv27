#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69654 "Employee_Applicant Referees"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee,Job Applicant';
            OptionMembers = Employee,"Job Applicant";
        }
        field(2; "No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Rererence Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Previous Employer,Current Employer,Other Referee';
            OptionMembers = ,"Previous Employer","Current Employer","Other Referee";
        }
        field(5; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Designation/Title"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Institution; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(9; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(10; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", City, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", City, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(11; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", City, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", City, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(12; "Country/Region Code"; Code[30])
        {
            Caption = 'County';
            TableRelation = "Country/Region";
        }
        field(13; "Phone No."; Text[15])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(14; "E-Mail"; Text[70])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit Mail;
            begin
                // MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(15; "Years Known"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Relationship; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PostCode: Record "Post Code";
}

