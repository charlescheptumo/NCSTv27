#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59005 "Fuel & Maintenance Requisition"
{

    fields
    {
        field(1; "Requisition No"; Code[20])
        {
        }
        field(2; "Vehicle Reg No"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                WshpFA.Reset;
                WshpFA.SetRange(WshpFA."Registration No.", "Vehicle Reg No");
                if WshpFA.Find('-') then
                    "Fixed Asset No" := WshpFA."No.";
                "Odometer Reading" := WshpFA."Current Reading";
                /* WshpFA.RESET;
                 WshpFA.SETRANGE(WshpFA."No.","Vehicle Reg No");
                 IF WshpFA.FIND('-') THEN
                 "Odometer Reading":=WshpFA."Current Reading"; */

            end;
        }
        field(3; "Vendor(Dealer)"; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vendor.Get("Vendor(Dealer)") then
                    "Vendor Name" := Vendor.Name;
            end;
        }
        field(4; "Quantity of Fuel(Litres)"; Decimal)
        {
        }
        field(5; "Total Price of Fuel"; Decimal)
        {

            trigger OnValidate()
            begin
                //"Price/Litre":= "Total Price of Fuel"/"Quantity of Fuel(Litres)"
            end;
        }
        field(6; "Odometer Reading"; Decimal)
        {
            //DecimalPlaces = 0 : 0;
        }
        field(7; "Request Date"; Date)
        {
            Editable = false;
        }
        field(8; "Date Taken for Fueling"; Date)
        {
        }
        field(9; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;
        }
        field(10; "Prepared By"; Code[30])
        {
        }
        field(11; "Closed By"; Code[30])
        {
            TableRelation = "User Setup";
        }
        field(12; "Date Closed"; Date)
        {
        }
        field(13; "Vendor Invoice No"; Code[20])
        {
            TableRelation = "Purchase Header" where("Buy-from Vendor No." = field("Vendor(Dealer)"));
        }
        field(14; "Posted Invoice No"; Code[20])
        {
            TableRelation = "Purch. Inv. Header"."No." where("Pay-to Vendor No." = field("Vendor(Dealer)"));
        }
        field(15; Description; Text[250])
        {
        }
        field(16; Department; Code[20])
        {
        }
        field(17; "No. Series"; Code[10])
        {
        }
        field(18; "Vendor Name"; Text[100])
        {
        }
        field(19; "Date Taken for Maintenance"; Date)
        {
        }
        field(20; Type; Option)
        {
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel;
        }
        field(21; "Type of Maintenance"; Option)
        {
            OptionMembers = " ",Repair,"Scheduled Service",Tyre;
        }
        field(22; Driver; Code[10])
        {

            trigger OnValidate()
            begin
                if Drivers.Get(Driver) then
                    "Driver Name" := Drivers."Driver Name";
            end;
        }
        field(23; "Driver Name"; Text[100])
        {
        }
        field(24; "Fixed Asset No"; Code[20])
        {
        }
        field(25; "Litres of Oil"; Decimal)
        {
            //DecimalPlaces = 0 : 0;
        }
        field(26; "Cheque No"; Code[20])
        {

            trigger OnValidate()
            begin
                //ERROR('Testing 123');
                Qoute.Reset;
                Qoute.SetRange(Qoute."Quote No.", "Cheque No");
                if Qoute.Find('-') then
                    "Cheque No" := Qoute."Quote No.";
            end;
        }
        field(27; "Price/Litre"; Decimal)
        {
        }
        field(28; "Type of Fuel"; Option)
        {
            OptionMembers = " ",Petrol,Diesel;
        }
        field(29; Coolant; Decimal)
        {
        }
        field(30; "Battery Water"; Decimal)
        {
        }
        field(31; "Wheel Alignment"; Decimal)
        {
        }
        field(32; "Wheel Balancing"; Decimal)
        {
        }
        field(33; "Car Wash"; Decimal)
        {
        }
        field(35; "Service Code"; Code[20])
        {
            TableRelation = "Service Items";

            trigger OnValidate()
            begin
                ServiceData.Reset;
                ServiceData.SetRange("Service Code", "Service Code");
                if ServiceData.FindSet then begin
                    "Service Name" := ServiceData."Service Name";
                    "G/L Account" := ServiceData."G/L Account";
                    "G/L Account Name" := ServiceData."G/L Account Name";
                end;
            end;
        }
        field(36; "Service Name"; Text[250])
        {
            Editable = false;
        }
        field(37; "G/L Account"; Code[20])
        {
            Editable = false;
        }
        field(38; "G/L Account Name"; Text[250])
        {
            Editable = false;
        }
        field(39; "PO Created By"; Code[50])
        {
        }
        field(40; "Date PO Created"; Date)
        {
        }
        field(41; "PO Created"; Boolean)
        {
        }
        field(42; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(43; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(44; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(45; "Project Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(46; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(47; "Unit  Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 3 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;
        }
    }

    keys
    {
        key(Key1; "Requisition No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Type = Type::Fuel then begin
            if "Requisition No" = '' then begin
                FltMgtSetup.Get;
                FltMgtSetup.TestField(FltMgtSetup."Fuel Register");
               //  NoSeriesMgt.InitSeries(FltMgtSetup."Fuel Register", xRec."No. Series", 0D, "Requisition No", "No. Series");
                "Requisition No" := NoSeriesMgt.GetNextNo(FltMgtSetup."Fuel Register", Today, true);
            end;
        end else begin
            if Type = Type::Maintenance then begin
                if "Requisition No" = '' then begin
                    FltMgtSetup.Get;
                    FltMgtSetup.TestField(FltMgtSetup."Maintenance Request");
                    // NoSeriesMgt.InitSeries(FltMgtSetup."Maintenance Request", xRec."No. Series", 0D, "Requisition No", "No. Series");
                    "Requisition No" := NoSeriesMgt.GetNextNo(FltMgtSetup."Maintenance Request", Today, true);
                end;
            end;
        end;
    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Vendor: Record Vendor;
        Drivers: Record "Vehicle Drivers";
        WshpFA: Record "Fleet Vehicles.";
        Qoute: Record "Purchase Header";
        ServiceData: Record "Service Items";
        DimMgt: Codeunit DimensionManagement;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', '', "Requisition No"),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "Requisition No" <> '' then
            Modify;
    end;
}
