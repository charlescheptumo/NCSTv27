#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70085 "RFI Prequalification Category"
{
    DrillDownPageID = "RFI Prequalification Category";
    LookupPageID = "RFI Prequalification Category";

    fields
    {
        field(1; "Document No"; Code[20])
        {
            Description = 'Linked to Invitation For Prequalification Table';
            NotBlank = true;
            TableRelation = "Request For Information";
        }
        field(2; "Prequalification Category ID"; Code[80])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Prequalification Category Table';
            TableRelation = "Procurement Category".Code;

            trigger OnValidate()
            begin
                ProcCategories.Reset;
                ProcCategories.SetRange(Code, "Prequalification Category ID");
                if ProcCategories.FindSet then begin
                    Description := ProcCategories.Description;
                    "Procurement Type" := ProcCategories."Procurement Type";
                end;
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Period Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Indicate the Prequalification Start Date (To define period of prequalification of the vendor)';
        }
        field(6; "Period End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Indicate the Prequalification End Date (To define period of prequalification of the vendor)';
        }
        field(7; "Submission Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'To determine earliest Date when potential bidders can submit their prequalification proposals';
        }
        field(8; "Submission Start Time"; Time)
        {
            DataClassification = ToBeClassified;
            Description = 'To determine earliest Time when potential bidders can submit their prequalification proposals';
        }
        field(9; "Submission End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Submission End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Applicable Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'This shall be populated automatically based on selected prequalification categories (This guides the vendor on the drop off locations)';
        }
        field(12; "Restricted RC"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Responsibility Center Table (Operating Unit Type field). However, it shall be populated based on the selected Prequalification Category';
        }
        field(13; "Restricted RC Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center"."Operating Unit Type";
        }
        field(14; "Restricted RC Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(15; "No. of Submissions"; Integer)
        {
            CalcFormula = count("IFP Response Line" where("Procurement Category" = field("Prequalification Category ID"),
                                                           "RFI Document No." = field("Document No")));
            Description = 'Calcfield that counts the total number of submissions made against a specific IFP';
            FieldClass = FlowField;
        }
        field(16; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
        field(17; "Special Group Reservation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Prequalification Category ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcCategories: Record "Procurement Category";
}
