#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70033 "Files Path Management"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; Path; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; No, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        rfprec.Reset;
        rfprec.SetFilter(rfprec.No, No);
        rfprec.SetFilter(rfprec.Status, '<>%1', rfprec.Status::Open);
        if rfprec.FindSet then begin
            Error('You can Only Delete Open Entries!!');
        end;
    end;

    trigger OnInsert()
    begin
        rfprec.Reset;
        rfprec.SetFilter(rfprec.No, No);
        rfprec.SetFilter(rfprec.Status, '<>%1', rfprec.Status::Open);
        if rfprec.FindSet then begin
            Error('You can Only Add to Open Entries!!');
        end;
    end;

    trigger OnModify()
    begin
        rfprec.Reset;
        rfprec.SetFilter(rfprec.No, No);
        rfprec.SetFilter(rfprec.Status, '<>%1', rfprec.Status::Open);
        if rfprec.FindSet then begin
            Error('You can Only Modify Open Entries!!');
        end;
    end;

    var
        rfprec: Record "Procurement Request";
}
