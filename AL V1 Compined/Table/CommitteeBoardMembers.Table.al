#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55001 "Committee Board Members"
{

    fields
    {
        field(1; Committee; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Code"; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                if Board.Get(Code) then begin
                    //SurName:=Board.Surname;
                    //Names:=Board."Other Names";
                end;
            end;
        }
        field(4; Names; Text[250])
        {
        }
        field(5; Designation; Text[100])
        {
        }
        field(6; Remarks; Text[200])
        {
        }
        field(7; Role; Option)
        {
            OptionCaption = ' ,Chairperson,Secretary,Member';
            OptionMembers = " ",Chairperson,Secretary,Member;
        }
        field(9; "Director No"; Code[20])
        {
            TableRelation = "Board Of Directors".Code where(Status = filter(Active));

            trigger OnValidate()
            begin
                Directors.Get("Director No");
                Names := Board.Surname;
            end;
        }
        field(10; Email; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", Names, Committee)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Board: Record "Board Of Directors";
        Directors: Record Vendor;
}
