#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70211 "Bid Personnel Compliance"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Staff Role Code"; Code[20])
        {
            Caption = 'Staff Role Code';
            DataClassification = ToBeClassified;
            TableRelation = "IFS Key Staff"."Staff Role Code";

            trigger OnValidate()
            begin
                IfsKeyStaff.Reset;
                IfsKeyStaff.SetRange("Staff Role Code", "Staff Role Code");
                if IfsKeyStaff.FindSet then begin
                    CalcFields("Actual No. of Proposed Staff");
                    Description := IfsKeyStaff."Title/Designation Description";
                    "Staff Category" := IfsKeyStaff."Staff Category";
                    "Minimum No. of Required Staff" := IfsKeyStaff."Min No. of Recomm Staff";
                    if "Minimum No. of Required Staff" <= "Actual No. of Proposed Staff" then
                        "Compliance Check" := 'COMPLIANT'
                    else
                        "Compliance Check" := 'NON-COMPLIANT';
                end;
            end;
        }
        field(4; Description; Text[70])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Staff Category"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ',Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = ,"Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(6; "Minimum No. of Required Staff"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Requirement Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
        field(8; "Actual No. of Proposed Staff"; Integer)
        {
            CalcFormula = count("Bid Key Staff" where("Proposed Project Role ID" = field("Staff Role Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Compliance Check"; Text[60])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Staff Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        IfsKeyStaff: Record "IFS Key Staff";
}
