#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72027 "Road Section"
{
    // DrillDownPageID = UnknownPage72037;
    //LookupPageID = UnknownPage72037;

    fields
    {
        field(1; "Road Section No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Road Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";
        }
        field(3; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Class ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            //CC//  TableRelation = Table72004.Field1;

            trigger OnValidate()
            begin
                // RoadClass.Reset;
                // RoadClass.SetRange(RoadClass."Road Class ID", "Road Class ID");
                // if RoadClass.FindSet then
                //     "Desired Road Reserve Width(M)" := RoadClass."Desired Road Reserve Width (M)";
            end;
        }
        field(5; "Road Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Primary National,Secondary National,County Road';
            OptionMembers = " ","Primary National","Secondary National","County Road";
        }
        field(6; "Carriageway Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Single,Dual';
            OptionMembers = " ",Single,Dual;
        }
        field(7; "Primary Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(8; "Primary County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County.Code;
        }
        field(9; "Primary Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(10; "Start Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Start Chainage(KM)" < 0 then begin
                    Error('Value cannot be negative');
                end;
            end;
        }
        field(11; "End Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 9999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "End Chainage(KM)" < 0 then begin
                    Error('Value cannot be negative');
                end;

                if "End Chainage(KM)" < "Start Chainage(KM)" then
                    Error('End Chainage cannot be less than start chainage');

                if "End Chainage(KM)" > 0 then begin
                    "Total Road Length (KMs)" := "End Chainage(KM)" - "Start Chainage(KM)";
                end;
            end;
        }
        field(12; "Total Road Length (KMs)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Start Point Longitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(14; "Start Point Latitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(15; "End Point Longitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(16; "End Point Latitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(18; "Paved Road Length (Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(19; "Paved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(20; "Unpaved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(22; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Last Road Condition Survey ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Last Road Cond. Survey Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Last Road Condition Survey Date';
        }
        field(25; "No. of Awarded Contracts"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Blanket Order"),
                                                         "Contract Status" = filter(Signed)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "No. of Planned Road Projects"; Integer)
        {
            // CalcFormula = count(Job where(Field70027 = field("Road Code"),
            //                                Status = filter(Planning)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "No. of Ongoing Road Projects"; Integer)
        {
            // CalcFormula = count(Job where(Field70027 = field("Road Code"),
            //                                Status = filter(Open)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "No. of Completed Road Projects"; Integer)
        {
            // CalcFormula = count(Job where(Field70027 = field("Road Code"),
            //                                Status = filter(Completed)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Budget (Total Cost)"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Line Type" = filter(Budget)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Actual (Total Cost)"; Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Entry Type" = filter(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "No. of Res. Land Acq. W_orders"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Res. Land Acq. W_orders';
        }
        field(32; "No. of Roadside Devpt Apps"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Roadside Devpt Apps';
        }
        field(33; "No. of Enchmt Stop W_orders"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Enchmt Stop W_orders';
        }
        field(34; "No. of Axle Load Inspections"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "No. of Axle Load Exempt Prmts"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Axle Load Exempt Prmts';
        }
        field(36; "No. of Filed Road Misuse Inc."; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Filed Road Misuse Inc.';
        }
        field(37; "Total No. of Fatalities"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Section Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            //CC//     TableRelation = Table72006.Field1;
        }
        field(40; "UnPaved Road Length (Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(41; "Chainage Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Desired Road Reserve Width(M)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Authenti Road Reserve Width(M)"; Decimal)
        {
            Caption = 'Authentic Road Reserve Width(M)';
            DataClassification = ToBeClassified;
        }
        field(44; "Actual  Road Reserve Width(M)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Paved Road Length %", "Road Section No.", "Road Code")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        fieldgroup(DropDown; "Road Section No.", "Road Code", "Section Name")
        {
        }
        fieldgroup(Brick; "Road Section No.", "Road Code", "Section Name")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Road Section No." = '' then begin
            //CC//     RMSSetup.Get();
            //CC//   RMSSetup.TestField("Section Nos");
            //CC//       NoSeriesMgt.InitSeries(RMSSetup."Section Nos", xRec."No. Series", Today, "Road Section No.", "No. Series");
        end;

        RoadInventory.Reset;
        RoadInventory.SetRange("Road Code", "Road Code");
        if RoadInventory.FindSet then begin
            "Carriageway Type" := RoadInventory."Carriageway Type";
            "Road Class ID" := RoadInventory."Road Class ID";
            "Road Category" := RoadInventory."Road Category";
            "Primary County ID" := RoadInventory."Primary County ID";
            "Primary Region ID" := RoadInventory."Primary Region ID";
        end;
    end;

    var
        //CC//    RMSSetup: Record UnknownRecord52017;
        NoSeriesMgt: Codeunit "No. Series";
        RoadInventory: Record "Road Inventory";
    //CC//    RoadClass: Record UnknownRecord72004;
}

