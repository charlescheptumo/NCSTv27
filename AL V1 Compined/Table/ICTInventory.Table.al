#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56060 "ICT Inventory"
{
    DrillDownPageID = "ICT Inventory List";
    LookupPageID = "ICT Inventory List";

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Sub-Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Hardware,Software';
            OptionMembers = Hardware,Software;
        }
        field(4; "Sub Type No."; Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Sub-Type" = "sub-type"::Software then begin
                    FixedAssets.Reset;
                    FixedAssets.SetRange("No.", "Sub Type No.");
                    if FixedAssets.FindSet then
                        "Sub Type Description" := FixedAssets.Description;
                    Description := FixedAssets.Description;
                    "Location Code" := FixedAssets."Location Code";
                    "Serial No." := FixedAssets."Serial No.";
                    "Warranty Date" := FixedAssets."Warranty Date";
                    "Maintenance Vendor No." := FixedAssets."Maintenance Vendor No.";
                    "Under Maintenance" := FixedAssets."Under Maintenance";
                    "FA Class Code" := FixedAssets."FA Class Code";
                    "FA Subclass Code" := FixedAssets."FA Subclass Code";
                    Insured := FixedAssets.Insured;
                    "Current Assigned Division/Unit" := FixedAssets."Research Center";
                    "Current Assigned Employee" := FixedAssets."Responsible Employee";
                    //"Acquisition Cost":=FixedAssets.

                end;
                if "Sub-Type" = "sub-type"::Hardware then begin
                    Items.Reset;
                    Items.SetRange("No.", "Sub Type No.");
                    if Items.FindSet then
                        "Sub Type Description" := Items.Description;
                    Description := Items.Description;
                end;
                if "Sub-Type" = "sub-type"::Software then begin
                    Resources.Reset;
                    Resources.SetRange("No.", "Sub Type No.");
                    if Resources.FindSet then
                        "Sub Type Description" := Resources.Name;
                    Description := Resources.Name;
                end;
            end;
        }
        field(5; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(6; "ICT Asset Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Asset Category".Code;

            trigger OnValidate()
            begin
                ICTAssetCategory.Reset;
                ICTAssetCategory.SetRange(Code, "ICT Asset Category");
                if ICTAssetCategory.FindSet then
                    "FA Class Code" := ICTAssetCategory."FA Class Code";
                "FA Subclass Code" := ICTAssetCategory."FA SubClass";
            end;
        }
        field(7; "Serial No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Warranty Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Maintenance Vendor No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(10; "Under Maintenance"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Sub Type Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "FA Class Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "FA Class".Code;
        }
        field(13; "FA Subclass Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "FA Subclass".Code where("FA Class Code" = field("FA Class Code"));
        }
        field(14; Insured; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Current Assigned Employee"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                /*IF Resources.GE) THEN;
                "Employee Name":=Resources.Name;*/

            end;
        }
        field(16; "Current Assigned Division/Unit"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Department));
        }
        field(17; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Acquisition Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "No Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "No. of Issues Raised"; Integer)
        {
            CalcFormula = count("ICT Helpdesk" where("ICT Inventory" = field(Code),
                                                      Status = filter(<> Open)));
            FieldClass = FlowField;
        }
        field(21; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Has Expiry Date" = false then
                    Error('Ensure Track Expiry Date field has been Ticked');
            end;
        }
        field(22; "Has Expiry Date"; Boolean)
        {
            Caption = 'Track Expiry Date';
            DataClassification = ToBeClassified;
        }
        field(23; "RAM (GB)"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Computer Specifications".Code where("Specs type" = const(" "));
        }
        field(24; Processor; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Computer Specifications".Code where("Specs type" = const(RAM));
        }
        field(25; "Hard Disk (GB)"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Computer Specifications".Code where("Specs type" = const(Processor));
        }
        field(26; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Leased,Issued';
            OptionMembers = " ",Open,Leased,Issued;
        }
        field(27; Category; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Hardware,Software';
            OptionMembers = Hardware,Software;
        }
        field(28; Model; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Computer Specifications".Code where("Specs type" = const(Model));
        }
        field(29; Manufacturer; Code[10])
        {
            Caption = 'System Manufacturer';
            DataClassification = ToBeClassified;
            TableRelation = "Computer Specifications".Code where("Specs type" = const(Manufacturer));
        }
        field(30; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Leasing/Issuing"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Leasing,Issuing';
            OptionMembers = Leasing,Issuing;
        }
        field(32; "Shared Inventory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Hard Disk Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,HDD,SSD';
            OptionMembers = " ",HDD,SSD;
        }
        field(34; "Operating System"; Text[35])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Computer Specifications".Code where("Specs type" = const("Operating System"));
        }
        field(35; "Tag No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ICT.Get;
            ICT.TestField(ICT."ICT Inventory Nos");
         //   NoSeriesMgt.InitSeries(ICT."ICT Inventory Nos", xRec."No Series", 0D, Code, "No Series");
            Code := NoSeriesMgt.GetNextNo(ICT."ICT Inventory Nos", Today, true);
        end;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        ICT: Record "ICT Helpdesk Global Parameters";
        Resources: Record Resource;
        FixedAssets: Record "Fixed Asset";
        Items: Record Item;
        ICTAssetCategory: Record "ICT Asset Category";
}
