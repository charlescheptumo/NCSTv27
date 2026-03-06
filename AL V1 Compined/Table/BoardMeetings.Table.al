#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55002 "Board Meetings"
{

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin

                if No <> xRec.No then
                    NoSeriesMgt.TestManual(CashMgt."Meeting Nos.");
            end;
        }
        field(2; Title; Text[250])
        {
        }
        field(3; "Start date"; Date)
        {
        }
        field(4; "Start time"; Time)
        {
        }
        field(5; "End Date"; Date)
        {
        }
        field(6; "End time"; Time)
        {
        }
        field(7; "Venue/Location"; Text[100])
        {
        }
        field(8; "Convened by"; Code[50])
        {
            Editable = false;
            TableRelation = "User Setup";

            trigger OnValidate()
            begin
                "Convened by" := UserId;
            end;
        }
        field(9; "Contact Tel. No"; Code[50])
        {
        }
        field(10; "Contact Email"; Text[100])
        {
        }
        field(11; Description; Text[250])
        {
            TableRelation = "Board Committees";
        }
        field(12; Status; Option)
        {
            OptionCaption = 'Pending,Upcoming,In progress,Completed,Cancelled';
            OptionMembers = Pending,Upcoming,"In progress",Completed,Cancelled;
        }
        field(13; Published; Boolean)
        {
        }
        field(14; "Meeting group Code"; Code[20])
        {
            TableRelation = "Board Committees";

            trigger OnValidate()
            begin
                Committees.Get("Meeting group Code");
                "Meeting group" := Committees.Description;

                Commit;

                //add the attendees of the meeting 06/09/2019
                Members.Reset;
                Members.SetRange(Committee, "Meeting group Code");
                if Members.FindSet then begin
                    repeat
                        Atendance.Init;
                        Atendance."Meeting Code" := No;
                        Atendance."Meeting Name" := Title;
                        Atendance."Member No" := Members.Code;
                        Atendance."Member Name" := Members.Names;
                        Atendance."Commitee No" := "Meeting group Code";
                        Atendance."Meeting Date" := "Start date";
                        Atendance.Venue := "Venue/Location";
                        Atendance.Insert(true);
                    until Members.Next = 0;
                end;
            end;
        }
        field(15; "Meeting group"; Text[100])
        {
            Editable = false;
        }
        field(16; "Conference Venue"; Text[100])
        {
        }
        field(17; "Parking Arrangement"; Option)
        {
            OptionCaption = 'Transport Provided, Taxi Reimbursement, Mileage Claim, Both Transport provided and Taxi Reimbursement';
            OptionMembers = "Transport Provided"," Taxi Reimbursement"," Mileage Claim"," Both Transport provided and Taxi Reimbursement";
        }
        field(18; "Access requirement"; Text[100])
        {
        }
        field(19; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Board Meeting Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Committees1";

            trigger OnValidate()
            begin
                Committees1.Get("Board Meeting Category Code");
                "Board Meeting Category" := Committees1.Description;
            end;
        }
        field(21; "Board Meeting Category"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Meeting Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Scheduled,Rescheduled,Confirmed';
            OptionMembers = Scheduled,Rescheduled,Confirmed;
        }
        field(23; "Published By"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Date Published"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Time Published"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Cancelled By"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Date Cancelled"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28; "Time Cancelled"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Completed By"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30; "Date Completed"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; "Time Completed"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; "Meeting Type"; Option)
        {
            FieldClass = Normal;
            OptionCaption = 'Special Committee Meeting,Scheduled Committee Meeting';
            OptionMembers = "Special Committee Meeting","Scheduled Committee Meeting";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //No. series
        if No = '' then begin
            CashMgt.Get;
            CashMgt.TestField(CashMgt."Meeting Nos.");
           // NoSeriesMgt.InitSeries(CashMgt."Meeting Nos.", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(CashMgt."Meeting Nos.", Today, true);
        end;
        "Convened by" := UserId;
        EMP.Reset;
        EMP.SetRange("User ID", UserId);
        if EMP.FindSet then begin
            "Contact Email" := EMP."Company E-Mail";
            //MESSAGE('%1 %2',"Convened by",EMP."Company E-Mail");
        end;
    end;

    var
        Committees: Record "Board Committees";
        NoSeriesMgt: Codeunit "No. Series";
        CashMgt: Record "Cash Management Setup";
        EMP: Record Employee;
        Committees1: Record "Board Committees1";
        Members: Record "Committee Board Members";
        Atendance: Record "Board Meeting Attendance";
}
