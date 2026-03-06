#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72111 "Road Inventory"
{
    // DrillDownPageID = UnknownPage72148;
    //LookupPageID = UnknownPage72148;

    fields
    {
        field(1; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Link Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Road Class ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            //CC//    TableRelation = Table72004.Field1;

            trigger OnValidate()
            begin
                //CC//        "Desired Road Reserve Width(M)" := RoadClass."Desired Road Reserve Width (M)";
            end;
        }
        field(4; "Road Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,National Trunk Road,National Secondary Road,County Road, Urban Road,KWS Road, Special Purpose Road, Unclassified Road';
            OptionMembers = " ","National Trunk Road","National Secondary Road","County Road"," Urban Road","KWS Road"," Special Purpose Road"," Unclassified Road";
        }
        field(5; "Carriageway Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Single,Dual';
            OptionMembers = " ",Single,Dual;
        }
        field(6; "Primary County ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = County.Code;
        }
        field(7; "Primary Region ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(8; "Start Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;

            trigger OnValidate()
            begin
                if "Start Chainage(KM)" < 0 then
                    Error('Value cannot be negative');
            end;
        }
        field(9; "End Chainage(KM)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;

            trigger OnValidate()
            begin
                if "End Chainage(KM)" < 0 then
                    Error('Value cannot be negative');

                if "End Chainage(KM)" < "Start Chainage(KM)" then
                    Error('End chainage should be greater than start chainage');

                if "End Chainage(KM)" > 0 then
                    "Gazetted Road Length (KMs)" := "End Chainage(KM)" - "Start Chainage(KM)";
            end;
        }
        field(10; "Gazetted Road Length (KMs)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 20 : 20;
        }
        field(11; "No. of Road Sections"; Integer)
        {
            CalcFormula = count("Road Section" where("Road Code" = field("Road Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Total Section Length (KMs)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(13; "General Road Surface Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Poor,Very Poor,Fair';
            OptionMembers = " ",Excellent,Good,Poor,"Very Poor",Fair;
        }
        field(14; "Start Point Longitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(15; "Start Point Latitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(16; "End Point Longitude"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
        }
        field(17; "End Point Latitude"; Decimal)
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
        field(21; "Original Road Agency"; Code[20])
        {
            DataClassification = ToBeClassified;
            //CC//    TableRelation = Table72088.Field1 where(Field12 = filter(Yes));
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
            // CalcFormula = count("Purchase Header" where("Document Type" = filter("Blanket Order"),
            //                                              "Contract Status" = filter(Signed),
            //                                              "Planned Commencement Date" = field("Road Code")));
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(26; "No. of Planned Road Projects"; Integer)
        {
            //CC//  FieldClass = FlowField;
        }
        field(27; "No. of Ongoing Road Projects"; Integer)
        {
            // CalcFormula = count(Job where(Field70027 = field("Road Code"),
            //                                Status = filter(Open)));
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(28; "No. of Completed Road Projects"; Integer)
        {
            // CalcFormula = count(Job where(Field70027 = field("Road Code"),
            //                                Status = filter(Completed)));
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(29; "Budget (Total Cost)"; Decimal)
        {
            // CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Line Type" = filter(Budget),
            //                                                                 Field72000 = field("Road Code")));
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(30; "Actual (Total Cost)"; Decimal)
        {
            // CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Entry Type" = filter(Usage),
            //                                                                Field72000 = field("Road Code")));
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(31; "No. of Res. Land Acq. W_orders"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Res. Land Acq. W_orders';
        }
        field(32; "No. of Roadside Devpt Apps"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Pending Roadside Devpt Apps';
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
        field(38; "Old Data"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            //CC//     TableRelation = Table72006.Field1;
        }
        field(40; "KeRRA Road Code"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Web GIS URL"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "No. of Feasibility Studies"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "No. of Environmental Studies"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "No. of Topographic Surveys"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "No. of Traffic Census reports"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "No. of Road Safety Audits"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "No. of Works Purchase Req"; Integer)
        {
            Caption = 'No. of Works Purchase Requisitions';
            DataClassification = ToBeClassified;
            Description = 'No. of Works Purchase Req';
        }
        field(48; "No. of Tender Invitations"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Total Contract Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Planned Construction Proj"; Integer)
        {
            //CC//    CalcFormula = count(Job where(Status = const(Planning),
            //CC//                                   Field70064 = const(2),
            //CC//                                   Field70027 = field("Road Code")));
            Caption = 'Planned Construction Projects';
            Description = 'Planned Construction Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(51; "Ongoing Construction Proj"; Integer)
        {
            //CC//                                Field70027 = field("Road Code")));
            Caption = 'Ongoing Construction Projects';
            Description = 'Ongoing Construction Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52; "Completed Construction Proj"; Integer)
        {
            //CC//                                    Field70027 = field("Road Code")));
            Caption = 'Completed Construction Projects';
            Description = 'Completed Construction Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(53; "Construction Budget"; Decimal)
        {
            //CC//                                                                    Field72000 = field("Road Code")));
            Caption = 'Construction Budget (Total Cost)';
            Description = 'Construction Budget (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(54; "Construction Actual"; Decimal)
        {
            //CC//                                                                  Field72000 = field("Road Code")));
            Caption = 'Construction Actual (Total Cost)';
            Description = 'Construction Actual (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(55; "Planned Maintenance Proj"; Integer)
        {
            //CC//                                 Field70027 = field("Road Code")));
            Caption = 'Planned Maintenance Projects';
            Description = 'Planned Maintenance Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(56; "Ongoing Maintenance Proj"; Integer)
        {
            //CC//                                  Field70027 = field("Road Code")));
            Caption = 'Ongoing Maintenance Projects';
            Description = 'Ongoing Maintenance Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57; "Completed Maintenance Proj"; Integer)
        {
            //CC//                                 Field70027 = field("Road Code")));
            Caption = 'Completed Maintenance Projects';
            Description = 'Completed Maintenance Projects';
            Editable = false;
            FieldClass = FlowField;
        }
        field(58; "Maintenance Budget"; Decimal)
        {
            //  CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Line Type" = const(Budget),
            //                                                                 Field72005 = const(2),
            //                                                                Field72000 = field("Road Code")));
            Caption = 'Maintenance Budget (Total Cost)';
            Description = 'Maintenance Budget (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59; "Maintenance Actual"; Decimal)
        {
            // CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Entry Type" = const(Usage),
            //                                                                Test = const('3'),
            //                                                                Field72000 = field("Road Code")));
            Caption = 'Maintenance Actual (Total Cost)';
            Description = 'Maintenance Actual (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "Road Valuation"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(61; Layer; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(62; Material; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Chainage Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(64; "KeRRA Road Reference Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65; "No. of App Roadside Devpt Apps"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Approved Roadside Devpt Apps';
        }
        field(66; "No. of Rej Roadside Devpt Apps"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Rejected Roadside Devpt Apps';
        }
        field(67; "Desired Road Reserve Width(M)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(68; "Authenti Road Reserve Width(M)"; Decimal)
        {
            Caption = 'Authentic Road Reserve Width(M)';
            DataClassification = ToBeClassified;
        }
        field(69; "Actual Road Reserve Width(M)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Start Chainage Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Road Code", "Link Name", "Road Class ID", "Primary County ID", "Start Chainage(KM)", "End Chainage(KM)")
        {
        }
        fieldgroup(Brick; "Road Code", "Link Name", "Road Class ID", "Primary County ID", "Start Chainage(KM)", "End Chainage(KM)")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Road Code" = '' then begin
            //CC//     RoadManagementSetup.Get();
            //CC//   RoadManagementSetup.TestField("KeRRA Road Code Nos");
            //CC//   NoSeriesManagement.InitSeries(RoadManagementSetup."KeRRA Road Code Nos", xRec."No. Series", Today, "Road Code", "No. Series");
        end;
    end;

    var
    //CC//   RoadClass: Record 72004;
    //CC//    RoadManagementSetup: Record 72102;
    //CC//    NoSeriesManagement: Codeunit "No. Series";
}
