#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59004 "Vehicle Drivers"
{

    fields
    {
        field(1; Driver; Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", Driver);
                if Emp.Find('-') then
                    "Driver Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(2; "Driver Name"; Text[100])
        {
        }
        field(3; "Driver License Number"; Code[20])
        {
        }
        field(4; "Last License Renewal"; Date)
        {
        }
        field(5; "Renewal Interval"; Option)
        {
            OptionMembers = " ",Days,Weeks,Months,Quarterly,Years;
        }
        field(6; "Renewal Interval Value"; Integer)
        {

            trigger OnValidate()
            begin
                StrValue := 'D';

                if "Renewal Interval" = "renewal interval"::Days then begin
                    StrValue := 'D';
                end
                else if "Renewal Interval" = "renewal interval"::Weeks then begin
                    StrValue := 'W';
                end
                else if "Renewal Interval" = "renewal interval"::Months then begin
                    StrValue := 'M';
                end
                else if "Renewal Interval" = "renewal interval"::Quarterly then begin
                    StrValue := 'Q';
                end
                else if "Renewal Interval" = "renewal interval"::Years then begin
                    StrValue := 'Y';
                end;

                "Next License Renewal" := CalcDate(Format("Renewal Interval Value") + StrValue, "Last License Renewal");
            end;
        }
        field(7; "Next License Renewal"; Date)
        {
        }
        field(8; "Year Of Experience"; Decimal)
        {
        }
        field(9; Grade; Code[20])
        {
        }
        field(10; Active; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; Driver, "Driver Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
        StrValue: Text[1];
}
