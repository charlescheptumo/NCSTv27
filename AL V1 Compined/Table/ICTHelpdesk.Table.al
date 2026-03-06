#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56050 "ICT Helpdesk"
{
    DrillDownPageID = "Helpdesk request List";
    LookupPageID = "Helpdesk request List";

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Issue No.';

            trigger OnValidate()
            begin
                /*
                Employee.RESET;
                Employee.SETFILTER(Employee."Emp UserID","Requesting Officer");
                
                IF Employee.FIND('-') THEN
                BEGIN
                  "Requesting Officer Name":=Employee."First Name" +' ' +Employee."Last Name";
                  Department:=Employee."Department Code";
                  Email:=Employee."Company E-Mail";
                  Phone:=Employee."Work Phone Number";
                  EXT :=Employee."Ext."
                END;
                
                DimValue.RESET;
                DimValue.SETFILTER(DimValue.Code,Department);
                DimValue.SETFILTER(DimValue."Global Dimension No.",'2');
                IF DimValue.FIND('-') THEN
                BEGIN
                  "Department Name":=DimValue.Name
                END;
                */

            end;
        }
        field(2; "Assigned To"; Code[50])
        {
            TableRelation = "ICT Officers Category Mapping".UserName;

            trigger OnValidate()
            var
                user1: Record User;
            begin
                UserMngt.ValidateUserName(user1, user1, "Assigned To");
                //UserMngt.LookupUserID("Assigned To");

                if UserSetup.Get("Assigned To") then begin
                    HrLeave.Reset;
                    HrLeave.SetRange(HrLeave."Employee No", UserSetup."Employee No.");
                    HrLeave.SetRange(HrLeave.Status, HrLeave.Status::Released);
                    HrLeave.SetFilter(HrLeave."End Date", '>%1', Today);
                    if HrLeave.FindSet then begin
                        Error('%1 is on leave until %2 please select another Employee', "Assigned To", HrLeave."End Date");
                    end;
                end;
            end;
        }
        field(3; "Assigned Date"; Date)
        {
        }
        field(4; "Assigned Time"; Time)
        {
        }
        field(5; Department; Code[10])
        {
            Editable = true;
            TableRelation = "Responsibility Center"."Operating Unit Type" where("Operating Unit Type" = filter(Department));
        }
        field(6; "Department Name"; Text[50])
        {
        }
        field(7; "Physical Station"; Text[30])
        {
        }
        field(8; "Nature of Service"; Text[50])
        {
        }
        field(9; EXT; Code[10])
        {
        }
        field(10; "Requesting Officer"; Code[50])
        {
        }
        field(11; "Requesting Officer Name"; Text[50])
        {
        }
        field(12; Phone; Code[30])
        {
        }
        field(13; Email; Text[100])
        {
        }
        field(14; "Request Date"; Date)
        {
        }
        field(15; "Request Time"; Time)
        {
        }
        field(16; "Computer not Starting up"; Boolean)
        {
        }
        field(17; "Keyboard, Mouse Failure"; Boolean)
        {
        }
        field(18; "Printer Failure"; Boolean)
        {
        }
        field(19; "UPS Failure"; Boolean)
        {
        }
        field(20; "LCD /Monitor Failure"; Boolean)
        {
        }
        field(21; "Storage Device Failure"; Boolean)
        {
        }
        field(22; "Hardware Installation"; Boolean)
        {
        }
        field(23; "Others, specify HW"; Text[200])
        {
        }
        field(24; "Computer Running /Loading Slow"; Boolean)
        {
        }
        field(25; "Network Access Problems"; Boolean)
        {
        }
        field(26; "Antivirus Inefficiency"; Boolean)
        {
        }
        field(27; Applications; Boolean)
        {
        }
        field(28; "Software Installation"; Boolean)
        {
        }
        field(29; "Others, specify SW"; Text[200])
        {
        }
        field(30; Diagnosis; Text[250])
        {
        }
        field(31; "Action Taken"; Text[250])
        {
        }
        field(32; "Attended By"; Code[50])
        {
        }
        field(33; "Attended Date"; Date)
        {
        }
        field(34; "Attended Time"; Time)
        {
        }
        field(35; "Technical Staff Remarks"; Text[200])
        {
        }
        field(36; "Requesting Officer Remarks"; Text[200])
        {
        }
        field(37; "Attended by Name"; Text[50])
        {
        }
        field(38; Status; Option)
        {
            OptionCaption = ' ,Open,Pending,Assigned,Attended,Resolved,Closed,Escalated';
            OptionMembers = " ",Open,Pending,Assigned,Attended,Resolved,Closed,Escalated;
        }
        field(39; "No. Series"; Code[20])
        {
        }
        field(40; "ICT Issue Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category";
        }
        field(41; "Escalated To"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category"."Category Head";

            trigger OnValidate()
            begin
                //UserMngt.ValidateUserID("Escalated To");
            end;
        }
        field(42; "Escalated By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Escalated Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Escalated Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Requester Feedback"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(46; Reopened; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Reopened By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Feed Back Given"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(51; "Shortcut Dimension 1 Code"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Region Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Constituency Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Description of the issue"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then begin
                    "Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Global Dimension 1 Code" := Employee.Region;
                end;
            end;
        }
        field(56; "Ascalation Details"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Assigned To EmpNo"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Escalated To EmpNo"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Solved Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Ict Head Escalation"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category"."Category Head";
        }
        field(61; "IT Escalation Details"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "IT Escalation Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(63; "HelpDesk Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category";

            trigger OnValidate()
            var
                TXT001: label 'The category %1 has no officer assigned.Consult the System Administrator';
                ICTHelpdesk: Record "ICT Helpdesk Category";
            begin
                /*CategoryMapping.RESET;
                CategoryMapping.SETRANGE("Help Desk Category","HelpDesk Category");
                IF CategoryMapping.FINDFIRST THEN BEGIN
                  CategoryMapping.TESTFIELD(UserName);
                  "Assigned To":=CategoryMapping.UserName;
                  "Assigned To EmpNo":=CategoryMapping."Employee No";
                  "Assigned Date":=TODAY;
                  ICTHelpdesk.RESET;
                  ICTHelpdesk.SETRANGE(Code,"HelpDesk Category");
                  IF ICTHelpdesk.FINDFIRST THEN BEGIN
                    "Expected Resolution":=CURRENTDATETIME+ICTHelpdesk."Expected Duration"
                  END;
                   END ELSE
                  ERROR(TXT001,"HelpDesk Category");*/
                CategoryMapping.Reset;
                CategoryMapping.SetRange("Help Desk Category", "HelpDesk Category");
                if CategoryMapping.FindFirst then begin
                    CategoryMapping.TestField(UserName);
                    "Assigned To" := CategoryMapping.UserName;
                    "Assigned To EmpNo" := CategoryMapping."Employee No";
                    "Assigned Date" := Today;
                    ICTHelpdesk.Reset;
                    ICTHelpdesk.SetRange(Code, "HelpDesk Category");
                    if ICTHelpdesk.FindFirst then begin
                        "Expected Resolution" := CurrentDatetime + ICTHelpdesk."Expected Duration"
                    end;
                end else
                    Error(TXT001, "HelpDesk Category");

            end;
        }
        field(64; "Expected Resolution"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(65; "ICT Inventory"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Shared Inventory" = const(false)) "ICT Inventory".Code where(Blocked = const(false),
                                                                                             "Current Assigned Employee" = field("Employee No"))
            else if ("Shared Inventory" = const(true)) "ICT Inventory".Code where("Shared Inventory" = filter(true),
                                                                                                                                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                ICTInventory.Reset;
                ICTInventory.SetRange(Code, "ICT Inventory");
                if ICTInventory.FindSet then
                    "ICT Inventory Name" := ICTInventory.Description;
            end;
        }
        field(66; "ICT Inventory Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Closed Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Closed Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Shared Inventory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Job No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Job No." = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField(SalesSetup."ICT Helpdesk Nos.");
          //  NoSeriesMgt.InitSeries(SalesSetup."ICT Helpdesk Nos.", xRec."No. Series", 0D, "Job No.", "No. Series");
            "Job No." := NoSeriesMgt.GetNextNo(SalesSetup."ICT Helpdesk Nos.", Today, true);    
        end;

        //"Requesting Officer":=UPPERCASE(USERID);
        UserSetup.Get(UserId);

        if UserSetup."Portal User" = false then begin

            UserSetup.Reset;
            UserSetup.SetRange(UserSetup."User ID", UpperCase(UserId));
            if UserSetup.Find('-') then begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", UserSetup."Employee No.");
                if Employee.Find('-') then begin
                    "Requesting Officer" := UpperCase(UserId);
                    "Employee No" := Employee."No.";
                    "Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := Employee."Global Dimension 2 Code";
                    if ObjRespCenter.Get(Employee."Department Code") then
                        "Shortcut Dimension 1 Code" := ObjRespCenter.Name;
                    Email := Employee."Company E-Mail";
                    //MESSAGE(Email);
                    Phone := Employee."Phone No.";
                    EXT := Employee."Ext.";
                    //"Physical Station":=Employee.Station;
                    "Request Date" := Today;
                    "Request Time" := Time;
                end;
            end;
        end;



        // DimValue.RESET;
        // DimValue.SETFILTER(DimValue.Code,Department);
        // DimValue.SETFILTER(DimValue."Global Dimension No.",'1');
        // IF DimValue.FIND('-') THEN
        // BEGIN
        //  "Region Name":=DimValue.Name
        // END;
        //
        // DimValue.RESET;
        // DimValue.SETFILTER(DimValue.Code,Department);
        // DimValue.SETFILTER(DimValue."Global Dimension No.",'2');
        // IF DimValue.FIND('-') THEN
        // BEGIN
        //  "Constituency Name":=DimValue.Name
        // END;
        //
        // DimValue.RESET;
        // DimValue.SETFILTER(DimValue.Code,Department);
        // DimValue.SETFILTER(DimValue."Global Dimension No.",'3');
        // IF DimValue.FIND('-') THEN
        // BEGIN
        //  "Department Name":=DimValue.Name;
        // END;
    end;

    var
        Employee: Record Employee;
        DimValue: Record "Dimension Value";
        NoSeriesMgt: Codeunit "No. Series";
        SalesSetup: Record "Sales & Receivables Setup";
        "user id": Record User;
        UserMngt: Codeunit "User Management";
        UserSetup: Record "User Setup";
        ObjRespCenter: Record "Responsibility Center";
        HrLeave: Record "HR Leave Application";
        CategoryMapping: Record "ICT Officers Category Mapping";
        ICTInventory: Record "ICT Inventory";
}
