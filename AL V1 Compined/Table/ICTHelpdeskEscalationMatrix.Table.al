#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56057 "ICT Helpdesk Escalation Matrix"
{
    DrillDownPageID = "Escalation Matrix";
    LookupPageID = "Escalation Matrix";

    fields
    {
        field(1; "Officer Name"; Code[100])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()
            var
                user1: Record User;
            begin

                UserManagement.DisplayUserInformation("Officer Name");
            end;

            trigger OnValidate()
            var
                user1: Record User;
            begin
                UserManagement.ValidateUserName(user1, user1, "Officer Name");
            end;
        }
        field(2; "Reports To Officer Name"; Code[100])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()
            var
                user1: Record User;
            begin
                UserManagement.DisplayUserInformation("Reports To Officer Name");
            end;

            trigger OnValidate()
            var
                user1: Record User;
            begin
                UserManagement.ValidateUserName(user1, user1, "Reports To Officer Name");
            end;
        }
        field(3; "Category Head"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Category Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category".Code;

            trigger OnValidate()
            begin
                ICTHelpdeskCategory.Reset;
                ICTHelpdeskCategory.SetRange(ICTHelpdeskCategory.Code, "Category Code");
                if ICTHelpdeskCategory.FindSet then begin
                    Description := ICTHelpdeskCategory.Description;
                    "Category Head" := ICTHelpdeskCategory."Category Head";
                end;
            end;
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Reports To Officer Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Officer Name", "Reports To Officer Name")
        {
        }
    }

    var
        UserManagement: Codeunit "User Management";
        ICTHelpdeskCategory: Record "ICT Helpdesk Category";
}
