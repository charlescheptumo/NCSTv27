#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59008 "Dialy Work Ticket Header"
{

    fields
    {
        field(1; "Daily Work Ticket"; Code[30])
        {
        }
        field(2; "Vehicle Allocated"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                //Check for existing Workticket with the vehicle not closed
                Wticket.Reset;
                Wticket.SetRange(Wticket."Vehicle Allocated", "Vehicle Allocated");
                if Wticket.Find('-') then begin
                    repeat
                        if (Wticket.Status <> Wticket.Status::Rejected) and (Wticket."Daily Work Ticket" <> "Daily Work Ticket") then
                            Error('There are Unclosed W/Tickets for Vehicle No', "Vehicle Allocated")
                    until Wticket.Next = 0;
                end;

                //Load Driver Allocated from Rotation details

                /* Vehicleallocated.RESET;
                 Vehicleallocated.SETRANGE(Vehicleallocated."Vehicle Registration No.","Vehicle Allocated");
                 IF Vehicleallocated.FIND('-') THEN BEGIN
                 REPEAT
                      IF ("Date of Request">=Vehicleallocated."From Date") AND ("Date of Request"<=Vehicleallocated."To Date") THEN BEGIN
                          "Driver Allocated":=Vehicleallocated.Driver;
                           VALIDATE("Driver Allocated");
                      END;
                 UNTIL Vehicleallocated.NEXT=0;
                 END;*/
                //Get Previous Mileage
                WshpFA.Reset;
                WshpFA.SetRange(WshpFA."Registration No.", "Vehicle Allocated");
                if WshpFA.Find('-') then begin
                    if WshpFA."Current Reading" = 0 then begin
                        // WshpFA.TESTFIELD("Start Reading");
                        "Opening Odometer" := WshpFA."Start Reading";
                    end else begin
                        "Opening Odometer" := WshpFA."Current Reading";
                    end;
                end;

            end;
        }
        field(3; "Driver Allocated"; Code[20])
        {
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                if HrEmployee.Get("Driver Allocated") then begin
                    "Driver Name" := HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name";
                end;
            end;
        }
        field(4; "Date of Request"; Date)
        {
        }
        field(5; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;
        }
        field(6; "No. Series"; Code[50])
        {
            Description = 'Stores the number series in the database';
        }
        field(7; Comments; Text[250])
        {
        }
        field(8; Department; Code[20])
        {
        }
        field(9; "Driver Name"; Text[250])
        {
        }
        field(10; "Closed by"; Code[20])
        {
        }
        field(11; "Date Closed"; Date)
        {
        }
        field(12; "Opening Odometer"; Decimal)
        {
            //DecimalPlaces = 0 : 0;
        }
        field(13; "Closing Odometer"; Decimal)
        {
            //DecimalPlaces = 0 : 0;
        }
        field(14; "Created By"; Code[30])
        {
        }
        field(15; "Date Created"; Date)
        {
        }
        field(16; "Time Created"; Time)
        {
        }
        field(17; "Total Km's Covered"; Decimal)
        {
            CalcFormula = sum("Daily Work Ticket Lines"."Total Kilometres" where("Daily Work Ticket" = field("Daily Work Ticket")));
            //DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Daily Work Ticket")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Daily Work Ticket" = '' then begin
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Daily Work Ticket");
         //   NoSeriesMgt.InitSeries(FltMgtSetup."Daily Work Ticket", xRec."No. Series", 0D, "Daily Work Ticket", "No. Series");
            "Daily Work Ticket" := NoSeriesMgt.GetNextNo(FltMgtSetup."Daily Work Ticket", Today, true);
        end;
        "Created By" := UserId;
        "Date Created" := Today;
        "Time Created" := Time;
    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit "No. Series";
        HrEmployee: Record Employee;
        Vehicleallocated: Record "Fixed Asset";
        VehicleAllocateDpt: Record "Department Vehicle Allocation";
        Usersetup: Record "User Setup";
        Wticket: Record "Dialy Work Ticket Header";
        WshpFA: Record "Fleet Vehicles.";
}
