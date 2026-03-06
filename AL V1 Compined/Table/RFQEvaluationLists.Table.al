#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70040 "RFQ Evaluation Lists"
{

    fields
    {
        field(1; "RFP No."; Code[20])
        {
        }
        field(2; "Evaluation Type"; Option)
        {
            OptionMembers = ,Mandatory,Technical,Financial;
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[250])
        {
        }
        field(5; Score; Decimal)
        {
        }
        field(6; "Maximum Score"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "RFP No.", "Evaluation Type", "Line No")
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
        rfprec.SetFilter(rfprec.No, "RFP No.");
        rfprec.SetFilter(rfprec.Status, '<>%1', rfprec.Status::Open);
        if rfprec.FindSet then begin
            Error('You can Only Delete Open Entries!!');
        end;
    end;

    trigger OnInsert()
    begin
        //ERROR('%1..%2..%3',"RFP No.","Evaluation Type","Line No");
        evallist.Reset;
        evallist.SetFilter(evallist."RFP No.", "RFP No.");
        evallist.SetFilter(evallist."Evaluation Type", '%1', "Evaluation Type");
        if evallist.FindLast then begin
            // message('...');
            //"Line No":=evallist."Line No"+1;
        end;
        if not evallist.FindLast then begin
            // "Line No":=1;
        end;



        rfprec.Reset;
        rfprec.SetFilter(rfprec.No, "RFP No.");
        rfprec.SetFilter(rfprec.Status, '<>%1', rfprec.Status::Open);
        if rfprec.FindSet then begin
            Error('You can Only Add to Open Entries!!');
        end;
    end;

    trigger OnModify()
    begin
        rfprec.Reset;
        rfprec.SetFilter(rfprec.No, "RFP No.");
        rfprec.SetFilter(rfprec.Status, '<>%1', rfprec.Status::Open);
        if rfprec.FindSet then begin
            Error('You can Only Modify Open Entries!!');
        end;
    end;

    var
        evallist: Record "RFQ Evaluation Lists";
        rfprec: Record "Procurement Request";
}
