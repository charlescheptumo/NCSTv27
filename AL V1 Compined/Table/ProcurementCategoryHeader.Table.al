#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70003 "Procurement Category Header"
{

    fields
    {
        field(1; "Fiscal Year"; Code[10])
        {
            TableRelation = "G/L Budget Name";
        }
        field(2; Category; Code[10])
        {
            TableRelation = "Supplier Category";

            trigger OnValidate()
            begin
                if CategoryRec.Get(Category) then begin
                    "Category Name" := CategoryRec.Description;
                end;
            end;
        }
        field(3; "Category Name"; Text[250])
        {
        }
        field(4; "No of Prequalified Suppliers"; Integer)
        {
            CalcFormula = count("Prequalified Suppliers1" where("Fiscal Year" = field("Fiscal Year"),
                                                                 Category = field(Category)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Fiscal Year", Category)
        {
            Clustered = true;
        }
        key(Key2; Category)
        {
        }
    }

    fieldgroups
    {
    }

    var
        CategoryRec: Record "Supplier Category";
}
