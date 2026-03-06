#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56054 "ICT Officers Category Mapping"
{
    Caption = 'ICT Officers Category Mapping';
    DataCaptionFields = UserName, "Help Desk Category", "Region Name";
    DrillDownPageID = "ICT Helpdesk Office Mapping";
    LookupPageID = "ICT Helpdesk Office Mapping";

    fields
    {
        field(1; UserName; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", UserName);
                if UserSetup.FindSet then begin
                    "Employee No" := UserSetup."Employee No.";
                end
            end;
        }
        field(2; "Help Desk Category"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category";
        }
        field(3; "Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));

            trigger OnValidate()
            begin
                if ObjRC.Get("Region Code") then
                    "Region Name" := ObjRC.Name;
            end;
        }
        field(4; "Region Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "User Feedbback Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Assined Issue Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Assigned; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Employee No"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";
        }
    }

    keys
    {
        key(Key1; UserName)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; UserName, "Help Desk Category", "Region Name")
        {
        }
    }

    var
        ObjRC: Record "Responsibility Center";
        UserSetup: Record "User Setup";
}
