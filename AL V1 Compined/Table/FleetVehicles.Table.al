#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59017 "Fleet Vehicles."
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "Fixed Asset"."No." where("Fixed Asset Type" = const(Vehicle));

            trigger OnValidate()
            begin
                /*
                IF "No." <> xRec."No." THEN BEGIN
                  FASetup.GET;
                  NoSeriesMgt.TestManual(FASetup."Fixed Asset Nos.");
                  "No. Series" := '';
                END;
                */
                CopyFields();

            end;
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';

            trigger OnValidate()
            begin
                /*
                IF ("Search Description" = UPPERCASE(xRec.Description)) OR ("Search Description" = '') THEN
                  "Search Description" := Description;
                IF Description <> xRec.Description THEN BEGIN
                  FADeprBook.SETCURRENTKEY("FA No.");
                  FADeprBook.SETRANGE("FA No.","No.");
                  FADeprBook.MODIFYALL(Description,Description);
                END;
                MODIFY(TRUE);
                */

            end;
        }
        field(3; "Search Description"; Code[30])
        {
            Caption = 'Search Description';
        }
        field(4; "Description 2"; Text[30])
        {
            Caption = 'Description 2';
        }
        field(5; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
        }
        field(6; "FA Subclass Code"; Code[10])
        {
            Caption = 'FA Subclass Code';
            TableRelation = "FA Subclass";
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                /*
                ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                */

            end;
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                /*
                ValidateShortcutDimCode(2,"Global Dimension 2 Code");
                */

            end;
        }
        field(9; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(10; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            TableRelation = "FA Location";
        }
        field(11; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                "Vendor No." := FA."Vendor No.";
            end;
        }
        field(12; "Main Asset/Component"; Option)
        {
            Caption = 'Main Asset/Component';
            Editable = false;
            OptionCaption = ' ,Main Asset,Component';
            OptionMembers = " ","Main Asset",Component;
        }
        field(13; "Component of Main Asset"; Code[20])
        {
            Caption = 'Component of Main Asset';
            Editable = false;
            TableRelation = "Fixed Asset";
        }
        field(14; "Budgeted Asset"; Boolean)
        {
            Caption = 'Budgeted Asset';

            trigger OnValidate()
            begin
                /*
                FAMoveEntries.ChangeBudget(Rec);
                */

            end;
        }
        field(15; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
        }
        field(16; "Responsible Employee"; Code[20])
        {
            Caption = 'Responsible Employee';
            TableRelation = Employee;
        }
        field(17; "Serial No."; Text[30])
        {
            Caption = 'Serial No.';

            trigger OnValidate()
            begin
                "Registration No." := "Serial No.";
                Modify;
            end;
        }
        field(18; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(19; Insured; Boolean)
        {
            CalcFormula = exist("Ins. Coverage Ledger Entry" where("FA No." = field("No."),
                                                                    "Disposed FA" = const(false)));
            Caption = 'Insured';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; Comment; Boolean)
        {
            CalcFormula = exist("Comment Line" where("Table Name" = const("Fixed Asset"),
                                                      "No." = field("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(22; Picture; MEDIA)
        {
            Caption = 'Picture';
            //   SubType = Bitmap;
        }
        field(23; "Maintenance Vendor No."; Code[20])
        {
            Caption = 'Maintenance Vendor No.';
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                "Maintenance Vendor No." := FA."Maintenance Vendor No.";
            end;
        }
        field(24; "Under Maintenance"; Boolean)
        {
            Caption = 'Under Maintenance';
        }
        field(25; "Next Service Date"; Date)
        {
            Caption = 'Next Service Date';
        }
        field(26; Inactive; Boolean)
        {
            Caption = 'Inactive';
        }
        field(27; "FA Posting Date Filter"; Date)
        {
            Caption = 'FA Posting Date Filter';
            FieldClass = FlowFilter;
        }
        field(28; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(29; "FA Posting Group"; Code[10])
        {
            Caption = 'FA Posting Group';
            TableRelation = "FA Posting Group";
        }
        field(57042; "Research Center"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Research Center?" = const(true),
                                                           "Operating Unit Type" = const(Department));
        }
        field(59000; "Last Service Date"; Date)
        {
        }
        field(59001; "Service Interval"; Option)
        {
            OptionMembers = ,Hour,Day,Week,Month,Quarter,Year;
        }
        field(59002; "Service Interval Value"; Integer)
        {
        }
        field(59003; "Last Service No."; Code[10])
        {
        }
        field(59004; Type; Option)
        {
            OptionMembers = " ",Vehicle,Machinery;
        }
        field(59005; Make; Code[10])
        {
            TableRelation = "Vehicle Make".Code;
        }
        field(59006; Model; Code[10])
        {
            TableRelation = "Vehicle Model".Code;
        }
        field(59007; "Year Of Manufacture"; Integer)
        {
        }
        field(59008; "Country Of Origin"; Code[30])
        {
            TableRelation = "Country/Region";
        }
        field(59009; "Start Reading"; Decimal)
        {
        }
        field(59010; Ownership; Option)
        {
            OptionMembers = " ","First Owner","Second Owner","Third Owner","Fourth Owner","Fifth Owner";
        }
        field(59011; "Chassis Serial No."; Code[50])
        {
        }
        field(59012; "Engine Serial No."; Code[50])
        {
        }
        field(59013; "Horse Power"; Integer)
        {
        }
        field(59014; "Ignition Key Code"; Code[10])
        {
        }
        field(59015; "Door Key Code"; Code[10])
        {
        }
        field(59016; "Body Color"; Code[10])
        {
        }
        field(59017; "Interior Color"; Code[10])
        {
        }
        field(59018; Cylinders; Integer)
        {
        }
        field(59019; "Wheel Size Rear"; Decimal)
        {
        }
        field(59020; "Wheel Size Front"; Decimal)
        {
        }
        field(59021; "Tire Size Rear"; Code[20])
        {
        }
        field(59022; "Tire Size Front"; Code[20])
        {
        }
        field(59023; "Fuel Type"; Option)
        {
            OptionMembers = " ",Petrol,Diesel,Hybrid;
        }
        field(59024; "Fuel Rating"; Decimal)
        {
        }
        field(59025; "Current Reading"; Decimal)
        {
        }
        field(59026; "Registration No."; Code[10])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                //"Registration No.":=FA."Serial No.";
            end;
        }
        field(59027; "Readings Based On"; Option)
        {
            OptionMembers = " ",Hours,Mileage;
        }
        field(59028; "Total Consumption"; Decimal)
        {
            CalcFormula = sum("FA Ledger Entry".Amount where("FA Posting Group" = filter('FUEL'),
                                                              "FA No." = field("No.")));
            FieldClass = FlowField;
        }
        field(59029; "Tare Weight"; Decimal)
        {
        }
        field(59030; Available; Boolean)
        {
        }
        field(59031; "Gross Weight"; Decimal)
        {
        }
        field(59032; "Reason for Unavailability"; Option)
        {
            OptionMembers = " ",Maintenance,Out;
        }
        field(59033; Selected; Boolean)
        {
        }
        field(59034; "Selected By"; Code[20])
        {
        }
        field(59035; "Fuel Card No"; Code[20])
        {
        }
        field(59036; "Fuel Card Pin"; Code[20])
        {
        }
        field(59037; "Vehicle Limit"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Vehicle Limit" <> xRec."Vehicle Limit" then begin
                    statusChange.Reset;
                    statusChange.SetRange(statusChange."User ID", UserId);
                    statusChange.SetRange(statusChange."Function", statusChange."function"::LimitChange);
                    if not statusChange.Find('-') then
                        Error('You dont have Permission to change Vehicle Limit');
                end;
            end;
        }
        field(59038; "Licensing Company"; Text[30])
        {
        }
        field(59039; "Date of Last Insurance"; Date)
        {
        }
        field(59040; "Expiry Date"; Date)
        {
        }
        field(59041; "Licensing Details"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "No.", "Registration No.")
        {
            Clustered = true;
            SumIndexFields = "Start Reading", "Current Reading";
        }
    }

    fieldgroups
    {
    }

    var
        FA: Record "Fixed Asset";
        statusChange: Record "Status Change Permisions";


    procedure CopyFields()
    begin

        FA.Reset;
        if FA.Get("No.") then begin
            //"Maintenance Code":=FA.Description;
            Description := FA.Description;
            "FA Subclass Code" := FA."FA Subclass Code";
            "Location Code" := FA."FA Location Code";
            "Vendor No." := FA."Vendor No.";
            "Main Asset/Component" := FA."Main Asset/Component";
            "Component of Main Asset" := FA."Component of Main Asset";
            "Budgeted Asset" := FA."Budgeted Asset";
            "Responsible Employee" := FA."Responsible Employee";
            "Serial No." := FA."Serial No.";
            "Last Date Modified" := FA."Last Date Modified";
            Blocked := FA.Blocked;
            Picture := FA.Image;
            "Maintenance Vendor No." := FA."Maintenance Vendor No.";
            "Under Maintenance" := FA."Under Maintenance";
            "Next Service Date" := FA."Next Service Date";
            Inactive := FA.Inactive;
            "No. Series" := FA."No. Series";
            "FA Posting Group" := FA."FA Posting Group";
            Insured := FA.Insured;
            Comment := FA.Comment;
        end;

        /*
       FA.RESET;
       FA.GET("No.");
       TRANSFERFIELDS(FA);
       "Registration No.":=FA."Serial No.";
       */

    end;
}
