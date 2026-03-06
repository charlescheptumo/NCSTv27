#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50010 tableextension50010 extends "Company Information"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Name 2"(Field 3)".

        field(50000; "Tel Phone"; Code[30])
        {
        }
        field(50001; Hotline; Code[30])
        {
        }
        field(50002; "Country/Region Name"; Text[50])
        {
        }
        field(59000; "N.S.SF. No."; Code[20])
        {
        }
        field(59001; "N.H.I.F No."; Code[20])
        {
        }
        field(59003; RubberStamp; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(59008; "Pin No"; Text[30])
        {
        }
        field(59011; "Core Values"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70000; "Procurement Support E-mail"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70001; "Administrator Email"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(80000; Vision; Text[255])
        {
            DataClassification = ToBeClassified;
            Description = 'SPM';
        }
        field(80001; Mission; Text[255])
        {
            DataClassification = ToBeClassified;
            Description = 'SPM';
        }
        field(80002; Motto; Text[255])
        {
            DataClassification = ToBeClassified;
            Description = 'SPM';
        }
        field(80003; "Headed By"; Text[255])
        {
            DataClassification = ToBeClassified;
            Description = 'SPM';
            TableRelation = "Company Jobs";
        }
        field(80004; "Current Head"; Text[255])
        {
            DataClassification = ToBeClassified;
            Description = 'SPM';
            TableRelation = Employee;
        }
    }
}
