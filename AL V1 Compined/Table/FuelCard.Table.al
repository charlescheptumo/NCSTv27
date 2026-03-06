#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59013 "Fuel Card"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Receipt No"; Code[20])
        {
        }
        field(3; "Registration No."; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin


                Vehicles.Reset;
                Vehicles.SetRange(Vehicles."Registration No.", "Registration No.");
                if Vehicles.Find('-') then begin

                    Make := Vehicles.Make;
                    Model := Vehicles.Model;
                    "Fuel Card No." := Vehicles."Fuel Card No";
                    "Fuel Card Pin" := Vehicles."Fuel Card Pin";
                    "Allocated vehicle Limit" := Vehicles."Vehicle Limit";
                end;
                //"Total Allocated Limit":=AllocatedAmount."Document No.";
            end;
        }
        field(4; Make; Text[30])
        {
        }
        field(5; Model; Text[30])
        {
        }
        field(6; "Fuel Card No."; Code[20])
        {
        }
        field(7; "Fuel Card Pin"; Code[20])
        {
        }
        field(8; "vehicle Limit"; Decimal)
        {
        }
        field(11; "Total Allocated Limit"; Decimal)
        {
            CalcFormula = lookup("Limit Types"."Upper Limit");
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                CalcFields("Total Amount Spend");
                "Total Balance" := "Total Allocated Limit" - Rec."Total Amount Spend";
            end;
        }
        field(12; "Total Balance"; Decimal)
        {
        }
        field(13; "Allocated vehicle Limit"; Decimal)
        {

            trigger OnValidate()
            begin
                CalcFields("Total Amt Spend per Vehicle");
                "Vehicle Balance" := "Allocated vehicle Limit" - "Total Amt Spend per Vehicle";
            end;
        }
        field(14; "Vehicle Balance"; Decimal)
        {
        }
        field(16; "No. Series"; Code[20])
        {
        }
        field(17; "Total Amount Spend"; Decimal)
        {
            CalcFormula = sum("Fuel Card Entries".Amount);
            FieldClass = FlowField;
        }
        field(18; "Total Amt Spend per Vehicle"; Decimal)
        {
            CalcFormula = sum("Fuel Card Entries".Amount where(RegNo = field("Registration No.")));
            FieldClass = FlowField;
        }
        field(19; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Posting;
        }
        field(20; Posted; Boolean)
        {
        }
        field(21; check; Decimal)
        {
            CalcFormula = sum("Vehicle Fuel Card Lines".Amount where("No." = field(No)));
            FieldClass = FlowField;
        }
        field(22; lowerlimit; Decimal)
        {
            CalcFormula = lookup("Limit Types"."Lower Limit");
            FieldClass = FlowField;
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
        if No = '' then begin
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Fuel Card No");
          //  NoSeriesMgt.InitSeries(FltMgtSetup."Fuel Card No", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(FltMgtSetup."Fuel Card No", Today, true);
        end;
    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Vehicles: Record "Fleet Vehicles.";
        AllocatedAmount: Record "Limit Types";
        LimitType: Record "Limit Types";
}
