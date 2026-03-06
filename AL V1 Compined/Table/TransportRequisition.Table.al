#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59003 "Transport Requisition"
{

    fields
    {
        field(1; "Transport Requisition No"; Code[20])
        {
        }
        field(2; Commencement; Text[30])
        {
        }
        field(3; Destination; Text[30])
        {
        }
        field(4; "Vehicle Allocated"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";
        }
        field(5; "Driver Allocated"; Code[20])
        {
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                drivers.Reset;
                drivers.SetRange(drivers.Driver, "Driver Allocated");
                if drivers.Find('-') then
                    // "Driver Name":=HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";
                    "Driver Name" := drivers."Driver Name";
                "Vehicle Allocated by" := UserId;
            end;
        }
        field(6; "Requested By"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(7; "Date of Request"; Date)
        {

            trigger OnValidate()
            begin
                if "Date of Request" < Today then
                    Error('Date requested can not be less than today');
            end;
        }
        field(8; "Vehicle Allocated by"; Code[30])
        {
        }
        field(9; "Opening Odometer Reading"; Decimal)
        {
            //DecimalPlaces = 0 : 0;
        }
        field(10; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;
        }
        field(13; "Date of Trip"; Date)
        {

            trigger OnValidate()
            begin


                if "Date of Trip" < Today then
                    Error('Date requested can not be less than today');

                if "Date of Trip" < "Date of Request" then
                    Error('Date of Trip can not be less than Date of Requested');
            end;
        }
        field(14; "Purpose of Trip"; Text[250])
        {
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(61; Comments; Text[250])
        {
        }
        field(62; Department; Code[20])
        {
        }
        field(63; "Driver Name"; Text[100])
        {
        }
        field(64; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin

                /*TESTFIELD(Status,Status::Open);
                IF NOT UserMgt.CheckRespCenter(1,Department) THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter); */

            end;
        }
        field(65; "Loaded to WorkTicket"; Boolean)
        {
        }
        field(66; "Time out"; Time)
        {
        }
        field(67; "Time In"; Time)
        {
        }
        field(68; "Journey Route"; Text[250])
        {
        }
        field(69; "Time Requested"; Time)
        {
        }
        field(70; "Closing Odometer Reading"; Decimal)
        {
            //DecimalPlaces = 0 : 0;
        }
        field(71; "Work Ticket No"; Code[20])
        {
            TableRelation = "Dialy Work Ticket Header"."Daily Work Ticket" where(Status = const(Approved));
        }
        field(72; "No of Days Requested"; Integer)
        {
        }
        field(73; "Authorized  By"; Text[30])
        {
        }
        field(74; Position; Text[30])
        {
        }
        field(75; "User Id"; Code[100])
        {
        }
        field(76; "Added On"; DateTime)
        {
        }
        field(77; HOD; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Enabled = false;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
    }

    keys
    {
        key(Key1; "Transport Requisition No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Transport Requisition No" = '' then begin
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Transport Req No");
           // NoSeriesMgt.InitSeries(FltMgtSetup."Transport Req No", xRec."No. Series", 0D, "Transport Requisition No", "No. Series");
            "Transport Requisition No" := NoSeriesMgt.GetNextNo(FltMgtSetup."Transport Req No", WorkDate(), true);
        end;
        "User Id" := UserId;
        "Added On" := CurrentDatetime;

        //added on 28/06/2019 to add the HOD
        HrEmployee.Reset;
        HrEmployee.SetRange("User ID", "User Id");
        if HrEmployee.FindSet then begin
            HOD := HrEmployee.HOD;
            "Directorate Code" := HrEmployee."Directorate Code";
            "Department Code" := HrEmployee."Department Code";
            Division := HrEmployee.Division;
            "Employee No" := HrEmployee."No.";
        end;
        //
    end;

    trigger OnModify()
    begin
        /*IF (Status=Status::Approved) OR (Status=Status::Approved) THEN
           ERROR(Text0001);*/

    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Text0001: label 'You cannot modify an Approved or Closed Record';
        HrEmployee: Record Employee;
        UserMgt: Codeunit "User Management";
        Text001: label 'Your identification is set up to process from %1 %2 only.';
        RespCenter: Record "Responsibility Center";
        drivers: Record "Vehicle Drivers";
}
