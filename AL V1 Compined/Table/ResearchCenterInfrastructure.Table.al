#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65004 "Research Center Infrastructure"
{
    Caption = 'Research Center Infrastructure';
    DrillDownPageID = "Research Infrastructure List";
    LookupPageID = "Research Infrastructure List";

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    GrantsSetup.Get;
                    NoSeriesMgt.TestManual(GrantsSetup."Research Iinfrastructure Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Center Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Research Center?" = const(true));
        }
        field(3; "Infrastructure Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Infrust Categories";
        }
        field(4; Description; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Ownership Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Owned,Leased,Donation,Collaboration';
            OptionMembers = Owned,Leased,Donation,Collaboration;
        }
        field(6; "Fixed Asset No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset" where("Research Center" = field("Center Code"));
        }
        field(7; "External Refference No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; No, "Center Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            GrantsSetup.Get;
            GrantsSetup.TestField("Research Iinfrastructure Nos");
           // NoSeriesMgt.InitSeries(GrantsSetup."Research Iinfrastructure Nos", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(GrantsSetup."Research Iinfrastructure Nos", WorkDate(), true);
        end;
    end;

    var
        GrantsSetup: Record "Grants Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
