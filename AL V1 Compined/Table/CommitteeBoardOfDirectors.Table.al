#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69104 "Committee Board Of Directors"
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
            TableRelation = "Board Of Directors".Code;

            trigger OnValidate()
            begin
                if Board.Get(Code) then begin
                    SurName := Board.Surname;
                    OtherNames := Board."Other Names";
                end;
            end;
        }
        field(3; SurName; Text[150])
        {
        }
        field(4; OtherNames; Text[150])
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
            OptionCaption = ' ,Chairmain,Secretary,Member';
            OptionMembers = " ",Chairmain,Secretary,Member;
        }
        field(8; "Employee No"; Code[20])
        {
            TableRelation = Employee;
        }
        field(9; "Director No"; Code[20])
        {
            TableRelation = Vendor."No." where("Vendor Type" = filter(Director));
        }
    }

    keys
    {
        key(Key1; Committee, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Board: Record "Board Of Directors";
}
