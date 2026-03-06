#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69225 "Training Evaluation Lines"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Evaluation Area"; Text[250])
        {
        }
        field(4; Rating; Option)
        {
            OptionCaption = ' ,Poor,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Poor,Fair,Good,"Very Good",Excellent;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Evaluation Area")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
