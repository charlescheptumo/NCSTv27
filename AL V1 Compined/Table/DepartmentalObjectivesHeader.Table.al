#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56209 "Departmental Objectives Header"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(3; "Date Created"; Date)
        {
            Editable = false;
        }
        field(4; "Time Created"; Time)
        {
            Editable = false;
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                DimensionVal.Reset;
                DimensionVal.SetRange(Code, "Global Dimension 1 Code");
                if DimensionVal.FindSet then begin
                    "Department Name" := DimensionVal.Name;
                end;
            end;
        }
        field(6; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8; "Appraisal Period"; Code[20])
        {
            Caption = 'Appraisal Period';
            TableRelation = "Appraisal  Period";
        }
        field(9; "Department Name"; Code[100])
        {
            Editable = false;
        }
        field(10; Rating; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Rating = false then begin
            if Code = '' then begin
                HumanResSetup.Get();
                HumanResSetup.TestField("Salary Voucher Nos");
              //  NoSeriesMgt.InitSeries(HumanResSetup."Salary Voucher Nos", xRec."No. Series", 0D, Code, "No. Series");
                Code := NoSeriesMgt.GetNextNo(HumanResSetup."Salary Voucher Nos", Today, true);
            end;
        end else begin
            if Code = '' then begin
                HumanResSetup.Get();
                HumanResSetup.TestField("Rating Nos.");
            //    NoSeriesMgt.InitSeries(HumanResSetup."Rating Nos.", xRec."No. Series", 0D, Code, "No. Series");
                Code := NoSeriesMgt.GetNextNo(HumanResSetup."Rating Nos.", Today, true);
            end;
        end;

        "Time Created" := Time;
        "Date Created" := Today;
        "Created By" := UserId;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Usersetup: Record "User Setup";
        DimensionVal: Record "Dimension Value";
}
