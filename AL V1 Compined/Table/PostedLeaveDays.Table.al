#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69025 "Posted Leave Days"
{
    // DrillDownPageID = UnknownPage69052;
    //LookupPageID = UnknownPage69052;

    fields
    {
        field(1; "Employee No"; Code[10])
        {
            TableRelation = Employee;
        }
        field(2; Date; Date)
        {
        }
        field(3; "Adjustment Type"; Option)
        {
            FieldClass = Normal;
            OptionCaption = ' ,Positive,Negative';
            OptionMembers = " ",Positive,Negative;
        }
        field(4; "Leave Type"; Code[20])
        {
            TableRelation = "Leave Types";
        }
        field(5; "No. Of Days"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Adjustment Type" = "adjustment type"::Positive then begin
                    if "No. Of Days" < 0 then
                        "No. Of Days" := "No. Of Days" * -1;
                end else begin
                    if "No. Of Days" > 0 then
                        "No. Of Days" := "No. Of Days" * -1;

                end;
            end;
        }
        field(6; Posted; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", Date, "Adjustment Type")
        {
            Clustered = true;
            SumIndexFields = "No. Of Days";
        }
    }

    fieldgroups
    {
    }
}
