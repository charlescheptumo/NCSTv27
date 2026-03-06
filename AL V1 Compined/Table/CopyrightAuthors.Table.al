#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56023 "Copyright Authors"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Copyright Reg No"; Code[20])
        {
            TableRelation = "Copyright Registration Table"."No.";
        }
        field(3; "First Name"; Text[50])
        {
            Caption = ' First Name';

            trigger OnValidate()
            begin
                //IF (Surname = UPPERCASE(xRec."First Name")) OR (Surname = '') THEN
                //  Surname := "First Name";
                //"First Name":=UPPERCASE("First Name");
            end;
        }
        field(4; Surname; Code[50])
        {
            Caption = 'Surname';

            trigger OnValidate()
            begin
                //Surname:=UPPERCASE(Surname);
            end;
        }
        field(5; "Middle Name"; Text[50])
        {
            Caption = ' Middle Name';

            trigger OnValidate()
            begin
                //"Middle Name":=UPPERCASE("Middle Name");
            end;
        }
        field(6; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(7; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(9; Contact; Text[50])
        {
            Caption = 'Contact';
        }
        field(10; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(11; "ID. No."; Code[20])
        {
        }
        field(12; "P.I.N"; Code[11])
        {
        }
        field(13; "Pseudo Name"; Text[50])
        {
        }
        field(15; "Email Address"; Text[50])
        {
        }
        field(16; Type; Option)
        {
            OptionMembers = Applicant,Author,Agent,Publisher,Producer;
        }
        field(17; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(18; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(19; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(20; County; Text[30])
        {
            Caption = 'County';
        }
    }

    keys
    {
        key(Key1; "Copyright Reg No")
        {
            Clustered = true;
        }
        key(Key2; "Line No")
        {
        }
    }

    fieldgroups
    {
    }

    var
        objTrack: Record Tracks;
        PostCode: Record "Post Code";
}
