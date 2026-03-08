#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59124 "Advertisement Channels"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Mode;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Print,Online';
            OptionMembers = ,Print,Online;
        }
        field(3;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(33;text;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(46;jj;Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code",Mode,Description)
        {
        }
    }

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
}

