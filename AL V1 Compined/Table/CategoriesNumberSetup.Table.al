#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56052 "Categories Number Setup"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "copyright Category Code"; Code[20])
        {
            TableRelation = "Copyright Works Categories".Code;

            trigger OnValidate()
            begin
                Rec.Reset;
                Rec.SetRange(Rec."copyright Category Code", "copyright Category Code");
                if Rec.FindSet then begin
                    Error('This category has already been assigned a number series');
                end else begin
                    copyrightWorks.Reset;
                    if copyrightWorks.Get("copyright Category Code") then
                        "Copyright Category Description" := copyrightWorks.Description;
                end;
            end;
        }
        field(3; "Copyright Category Description"; Text[200])
        {
        }
        field(4; "no series"; Code[50])
        {
            TableRelation = "No. Series".Code;
        }
    }

    keys
    {
        key(Key1; "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        copyrightWorks: Record "Copyright Works Categories";
}
