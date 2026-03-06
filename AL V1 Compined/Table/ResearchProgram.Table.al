#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65005 "Research Program"
{
    Caption = 'Research Program';
    DrillDownPageID = "Research Program List";
    LookupPageID = "Research Program List";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(4; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(5; City; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                //PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(6; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                //PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(7; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(8; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(9; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
            DataClassification = ToBeClassified;
        }
        field(10; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            DataClassification = ToBeClassified;
        }
        field(11; Contact; Text[50])
        {
            Caption = 'Contact';
            DataClassification = ToBeClassified;
        }
        field(12; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(13; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(14; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(15; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                //MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(103; "Home Page"; Text[90])
        {
            Caption = 'Home Page';
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(104; "Program Overview"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(105; "Program Director"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Program Director");
                if Employee.Find('-') then begin
                    "Program Director Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(106; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(107; "Program Director Name"; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(50006; "No. of Project Areas"; Integer)
        {
            CalcFormula = count("Research Project Area" where(Code = field(Code)));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50007; "No. of Awarded GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Primary Research Program ID" = field(Code),
                                                                   "Application Status" = const(Won),
                                                                   "Document Date" = field("Date filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50008; "No. of Lost Grant GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Primary Research Program ID" = field(Code),
                                                                   "Application Status" = const(Lost),
                                                                   "Document Date" = field("Date filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50009; "No. of Ongoing RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Program" = field(Code),
                                           Status = filter(Planning | Quote | Open),
                                           "Starting Date" = field("Date filter"),
                                           "Document Type" = const(Project)));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50010; "No. of Completed RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Program" = field(Code),
                                           Status = filter(Completed),
                                           "Ending Date" = field("Date filter"),
                                           "Document Type" = const(Project)));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50011; "Total Amount Awarded(LCY)"; Decimal)
        {
            CalcFormula = sum("Grant Funding Application"."Awarded Grant Amount (LCY)" where("Primary Research Program ID" = field(Code),
                                                                                              "Document Date" = field("Date filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50012; "Date filter"; Date)
        {
            FieldClass = FlowFilter;
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

    var
        PostCode: Record "Post Code";
        DimMgt: Codeunit DimensionManagement;
        Employee: Record Employee;


    procedure SetWorkDescription(NewWorkDescription: Text)
    var
    //CC//   TempBlob: Record TempBlob temporary;
    begin
        Clear("Program Overview");
        if NewWorkDescription = '' then
            exit;
        //CC//   TempBlob.Blob := "Program Overview";
        //CC//   TempBlob.WriteAsText(NewWorkDescription, Textencoding::Windows);
        //CC// "Program Overview" := TempBlob.Blob;
        Modify;
    end;


    procedure GetWorkDescription(): Text
    var
        //CC//   TempBlob: Record TempBlob temporary;
        CR: Text[1];
    begin
        CalcFields("Program Overview");
        if not "Program Overview".Hasvalue then
            exit('');
        CR[1] := 10;
        //CC//    TempBlob.Blob := "Program Overview";
        //CC//   exit(TempBlob.ReadAsText(CR, Textencoding::Windows));
    end;
}
