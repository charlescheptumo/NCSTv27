#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56051 Tracks
{
    DrillDownPageID = Tracks;
    LookupPageID = Tracks;

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Copyright No"; Code[20])
        {
            TableRelation = "Copyright Registration Table"."No.";

            trigger OnValidate()
            begin
                objCopyright.Reset;
                objCopyright.SetRange(objCopyright."No.", "Copyright No");
                if objCopyright.FindSet then begin
                    // MESSAGE(objCopyright."Copyright Title");
                    "Copyright Title" := objCopyright."Copyright Title";
                end;
            end;
        }
        field(3; "Copyright Title"; Text[100])
        {
            Editable = false;
        }
        field(4; "Track Title"; Text[100])
        {
        }
        field(5; "Track Work Category"; Code[20])
        {
            TableRelation = "Copyright Works Categories";

            trigger OnValidate()
            var
                CopyrightCategory: Record "Copyright Works Categories";
            begin
                if CopyrightCategory.Get("Track Work Category") then
                    "Track Category Description" := Format(CopyrightCategory.Description);
            end;
        }
        field(6; "Track Work SubCategory"; Code[20])
        {
            TableRelation = "Copyright Works Sub-Categories".Code where("Category Code" = field("Track Work Category"));

            trigger OnValidate()
            var
                CopyrightSubCategory: Record "Copyright Works Sub-Categories";
            begin

                if CopyrightSubCategory.Get("Track Work SubCategory", "Track Work Category") then
                    "Track SubCategory Desc" := CopyrightSubCategory.Description;
            end;
        }
        field(7; "Track Category Description"; Text[50])
        {
            Editable = false;
        }
        field(8; "Track SubCategory Desc"; Text[50])
        {
            Editable = false;
        }
        field(9; "Date of Fixation/Reduction"; Date)
        {
        }
        field(10; "Track Language"; Code[10])
        {
            TableRelation = Language;
        }
        field(11; "Track Work Abstract"; Blob)
        {
        }
        field(12; "Prod/Pub Name"; Text[50])
        {
            Caption = 'Prod/Pub Name';
        }
        field(13; "Prod/Pub ID No/Company Reg No"; Code[30])
        {
            Caption = 'Producer ID No/Company Reg No';
        }
        field(14; "Prod/Pub P.I.N"; Code[11])
        {
        }
        field(15; "Assignment/License Date"; Date)
        {
            Caption = 'Assignment/License Date';
        }
        field(16; "1st Country of Production"; Code[10])
        {
            Caption = '1st Country of Production';
            TableRelation = "Country/Region";
        }
        field(17; "Production Category"; Option)
        {
            Caption = 'Production Category';
            OptionCaption = 'Self-Produced,Label/Record Company';
            OptionMembers = "Self-Produced","Label/Record Company";
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(18; "Prod/Pub Phone No."; Text[30])
        {
            Caption = 'Prod/Pub Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(19; "Prod/Pub Email"; Text[80])
        {
        }
        field(20; "Producer Address"; Text[30])
        {
        }
        field(21; "Producer Post Code"; Code[10])
        {
        }
        field(22; "Producer City"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Line No", "Copyright No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        objCopyright: Record "Copyright Registration Table";
}
