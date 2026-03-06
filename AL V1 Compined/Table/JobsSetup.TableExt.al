#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50030 tableextension50030 extends "Jobs Setup"
{
    fields
    {
        field(50000; "Current Year Budget Start Date"; Date)
        {

            trigger OnValidate()
            begin
                //Ushindi
                Rec."Current Year Budget End Date" := CalcDate('12M-1D', Rec."Current Year Budget Start Date");
                //Ushindi
            end;
        }
        field(50001; "Current Year Budget End Date"; Date)
        {
        }
        field(50002; "Default Jobs Dimension"; Code[20])
        {
            TableRelation = Dimension;
        }
        field(65001; "Budget Plan Nos"; Code[20])
        {
            Caption = 'Budget Plan Nos';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(65002; "Billable Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
