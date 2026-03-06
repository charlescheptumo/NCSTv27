#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70153 "IFS Staff Min Experience"
{
    Caption = 'IFS Staff Min Experience';

    fields
    {
        field(1; "IFS Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Project Role Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Experience Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',General Experience,Specialized Experience,Training Experience,No. of Handled Projects,Other Experience';
            OptionMembers = ,"General Experience","Specialized Experience","Training Experience","No. of Handled Projects","Other Experience";
        }
        field(5; "Minimum Years of Experience"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Minimum Experience Req"; Text[100])
        {
            Caption = 'Minimum Experience Requirements';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "IFS Code", "Project Role Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
