#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69658 "Application Hobby"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
        }
        field(2;"Candidate No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Hobby Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Hobby Type";

            trigger OnValidate()
            begin
                if HobbyType.Get("Hobby Type") then begin
                  "Hobby Category":=HobbyType."Hobby Categgory";
                   Description:=HobbyType.Description;
                   end
            end;
        }
        field(4;"Hobby Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Travel/Sports/Adventure,Games,Arts & Creatives,Food & Cooking,Collecting,Others';
            OptionMembers = "Travel/Sports/Adventure",Games,"Arts & Creatives","Food & Cooking",Collecting,Others;
        }
        field(5;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Candidate No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HobbyType: Record "Hobby Type";
}

