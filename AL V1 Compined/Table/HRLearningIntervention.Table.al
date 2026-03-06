#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69156 "HR Learning Intervention"
{
    //LookupPageID = UnknownPage52091;

    fields
    {
        field(1; "Employee No."; Code[20])
        {

            trigger OnValidate()
            begin
                OK := Employee.Get("Employee No.");
                if OK then begin
                    "Employee First Name" := Employee."Known As";
                    "Employee Last Name" := Employee."Last Name";
                end;
            end;
        }
        field(2; EduTC; Decimal)
        {

            trigger OnValidate()
            begin
                TotalTC := EduTC + TrainTC;
                //CALCSUMS(EduAC);
                EduVar := EduTC - EduAC;
                //CALCSUMS(TrainAC);
                TrainVar := TrainTC - TrainAC;
                TotalVar := TotalTC - TotalAC;
            end;
        }
        field(3; EduAC; Decimal)
        {
            FieldClass = Normal;
        }
        field(4; EduVar; Decimal)
        {
        }
        field(5; TrainTC; Decimal)
        {

            trigger OnValidate()
            begin
                //CALCSUMS(EduAC);
                //CALCSUMS(TrainAC);
                TotalTC := EduTC + TrainTC;
                EduVar := EduTC - EduAC;
                TrainVar := TrainTC - TrainAC;
                TotalVar := TotalTC - TotalAC;
            end;
        }
        field(6; TrainAC; Decimal)
        {
            FieldClass = Normal;
        }
        field(7; TrainVar; Decimal)
        {
        }
        field(8; TotalTC; Decimal)
        {

            trigger OnValidate()
            begin
                TotalTC := EduTC + TrainTC;
            end;
        }
        field(9; TotalAC; Decimal)
        {
        }
        field(10; TotalVar; Decimal)
        {
        }
        field(11; Budget; Decimal)
        {

            trigger OnValidate()
            begin
                Remaining := Budget - Used;
                //CALCSUMS(EduAC);
                EduVar := EduTC - EduAC;
                //CALCSUMS(TrainAC);
                TrainVar := TrainTC - TrainAC;
                TotalVar := TotalTC - TotalAC;
            end;
        }
        field(12; Used; Decimal)
        {
            FieldClass = Normal;

            trigger OnValidate()
            begin
                Remaining := Budget - Used;
                TrainVar := TrainTC - TrainAC;
                TotalVar := TotalTC - TotalAC;
            end;
        }
        field(13; Remaining; Decimal)
        {

            trigger OnValidate()
            begin
                Remaining := Budget - Used;
                TrainVar := TrainTC - TrainAC;
                TotalVar := TotalTC - TotalAC;
            end;
        }
        field(14; "Calendar Year"; Integer)
        {
            FieldClass = Normal;
        }
        field(15; "Employee First Name"; Text[30])
        {
            FieldClass = Normal;
        }
        field(16; "Employee Last Name"; Text[30])
        {
        }
        field(17; "A Development Plan Costs Used"; Decimal)
        {
        }
        field(18; "Development Plan Costs Total"; Decimal)
        {
        }
        field(19; "E Development Plan Costs Used"; Decimal)
        {
            FieldClass = Normal;
        }
        field(20; "Used In Education Assistance"; Decimal)
        {
            //CC//   CalcFormula = sum(Table69150.Field73 where(Field74 = field("Calendar Year")));
            FieldClass = FlowField;
        }
        field(21; Comment; Boolean)
        {
            Editable = false;
        }
        field(22; "Other Training Costs"; Decimal)
        {
            //CC//     CalcFormula = sum("HR Company or Other Training".Results where(Field25 = field("Calendar Year")));
            FieldClass = FlowField;
        }
        field(23; "Line No"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Calendar Year", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        OK := Employee.Get("Employee No.");
        if OK then begin
            "Employee First Name" := Employee."Known As";
            "Employee Last Name" := Employee."Last Name";
        end;
        "Calendar Year" := Date2dmy(WorkDate, 3);
    end;

    var
        OK: Boolean;
        Employee: Record Employee;
        eVal: Boolean;
        tVal: Boolean;
}
