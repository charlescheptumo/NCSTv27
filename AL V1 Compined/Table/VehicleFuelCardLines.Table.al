#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59001 "Vehicle Fuel Card Lines"
{

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                /*FHead.RESET;
                FHead.SETRANGE(FHead.No,"No.");
                IF FHead.FIND('-') THEN
                  BEGIN
                     VALIDATE("No.",FHead.No);
                  END;*/

            end;
        }
        field(2; "Reciept No"; Code[20])
        {
        }
        field(3; Amount; Decimal)
        {
        }
        field(4; "Date of Filling"; Date)
        {
        }
        field(5; Driver; Text[30])
        {
            TableRelation = "Vehicle Drivers";

            trigger OnValidate()
            begin
                FleetDriver.Reset;
                FleetDriver.SetRange(FleetDriver.Driver, Driver);
                if FleetDriver.Find('-') then
                    "Driver Names" := FleetDriver."Driver Name";
            end;
        }
        field(6; "Driver Names"; Text[30])
        {
        }
        field(7; "Vehicle RegNo"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                VMake.Reset;
                VMake.SetRange(VMake."Registration No.", "Vehicle RegNo");
                if VMake.Find('-') then
                    "vehicle Make" := VMake.Make;
            end;
        }
        field(8; "vehicle Make"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Reciept No", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FHead: Record "Fuel Card";
        FleetDriver: Record "Vehicle Drivers";
        VMake: Record "Fleet Vehicles.";
}
