#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59002 "Department Vehicle Allocation"
{

    fields
    {
        field(1; "Vehicle No"; Code[20])
        {
        }
        field(2; Department; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal.Code, Department);
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                if DimVal.Find('-') then
                    "Department Name" := DimVal.Name;
            end;
        }
        field(3; "Department Name"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Vehicle No", Department)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimVal: Record "Dimension Value";
}
