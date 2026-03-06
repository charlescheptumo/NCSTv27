#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56064 "ICT Issuance Entries"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Issuance Voucher"."No.";
        }
        field(2; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Inventory".Code;

            trigger OnValidate()
            begin
                // ICTInventory.RESET;
                // ICTInventory.SETRANGE(Code,Code);
                // IF ICTInventory.FINDSET THEN BEGIN
                //  Description:=ICTInventory.Description;
                //  "Serial No.":=ICTInventory."Serial No.";
                //  "FA No":=ICTInventory."Sub Type No.";
                //  END;
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Serial No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Duration of Use start date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Duration of Use end date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Duration of Use"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "FA No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";
        }
        field(9; "Reason For Movement"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Issuance,Movement';
            OptionMembers = Issuance,Movement;
        }
        field(11; "Issued To User ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                // UserSetup.RESET;
                // UserSetup.SETRANGE("User ID","Issued To User ID");
                // IF UserSetup.FINDSET THEN
                //  "Issued To No.":=UserSetup."Employee No.";
                //  "Issued Date":=TODAY;
                //  Employee.RESET;
                //  Employee.SETRANGE("No.",UserSetup."Employee No.");
                //  IF Employee.FINDSET THEN BEGIN
                //    Name:=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                //    "Shortcut Dimension 1 Code":=Employee."Global Dimension 1 Code";
                //    Department:=Employee."Department Code";
                //    Directorate:=Employee."Directorate Code";
                //    "Division/Unit":=Employee.Division;
                //
                //    END;
            end;
        }
        field(12; "Issued To No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(13; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Issued Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Branches Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Board));
        }
        field(16; Directorate; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(17; Department; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Department));
        }
        field(18; "Division/Unit"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Division/Section"));
        }
        field(19; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(20; "Issued By"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(21; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(22; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(23; "Previously Assigned To"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Previously Assigned Dpt"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Leasing/Issuing"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Leasing,Issuing';
            OptionMembers = Leasing,Issuing;
        }
    }

    keys
    {
        key(Key1; "Entry No", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTInventory: Record "ICT Inventory";
}
