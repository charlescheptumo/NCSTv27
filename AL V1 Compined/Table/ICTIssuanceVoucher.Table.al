#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56061 "ICT Issuance Voucher"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Issued To User ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", "Issued To User ID");
                if UserSetup.FindSet then
                    "Issued To No." := UserSetup."Employee No.";
                "Issued Date" := Today;
                Employee.Reset;
                Employee.SetRange("No.", UserSetup."Employee No.");
                if Employee.FindSet then begin
                    Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    Department := Employee."Department Code";
                    Directorate := Employee."Directorate Code";
                    "Division/Unit" := Employee.Division;

                end;
            end;
        }
        field(3; "Issued To No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(4; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Issued Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Branches Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Board));
        }
        field(8; Directorate; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate),
                                                                "Blocked?" = const(false));
        }
        field(9; Department; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Department),
                                                                "Blocked?" = const(false),
                                                                "Direct Reports To" = field(Directorate));
        }
        field(10; "Division/Unit"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Division/Section"),
                                                                "Blocked?" = const(false),
                                                                "Direct Reports To" = field(Department));
        }
        field(11; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(12; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(13; "Issued By"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(14; "No.Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Submitted,Issued,Returned';
            OptionMembers = Open,Submitted,Issued,Returned;
        }
        field(16; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Branch';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(17; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Issuance,Movement';
            OptionMembers = Issuance,Movement;
        }
        field(18; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Leasing/Issuing"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Leasing,Issuing';
            OptionMembers = Leasing,Issuing;
        }
    }

    keys
    {
        key(Key1; "No.", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            ICT.Get;
            ICT.TestField(ICT."ICT Issuance Voucher Nos.");
            //NoSeriesMgt.InitSeries(ICT."ICT Issuance Voucher Nos.", xRec."No.Series", 0D, "No.", "No.Series");
            "No." := NoSeriesMgt.GetNextNo(ICT."ICT Issuance Voucher Nos.", Today, true);
        end;
        Description := 'INTERNAL ISSUANCE -' + "No.";
        if Type = Type::Issuance then begin

            "Issued To User ID" := UserId;
            Validate("Issued To User ID");
        end;
        "Issued By" := UserId;
    end;

    var
        ICT: Record "ICT Helpdesk Global Parameters";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
}
