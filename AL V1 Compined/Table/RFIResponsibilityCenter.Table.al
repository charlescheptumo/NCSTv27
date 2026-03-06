#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70190 "RFI Responsibility Center"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
        field(2; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code;
        }
        field(3; "Responsibility Center ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region));

            trigger OnValidate()
            begin
                resp.Reset;
                resp.SetRange(Code, "Responsibility Center ID");
                if resp.FindSet then begin
                    "Operating Unit Type" := resp."Operating Unit Type";
                    Description := resp.Name;

                end;
            end;
        }
        field(4; "Operating Unit Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre';
            OptionMembers = Board,"Company-Level",Directorate,Department,"Section/Team",Region,"Branch/Centre";
        }
        field(5; Description; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        resp: Record "Responsibility Center";
}
