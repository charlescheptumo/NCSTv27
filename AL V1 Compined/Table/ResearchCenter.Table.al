#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65000 "Research Center"
{
    Caption = 'Research Center';
    DrillDownPageID = "Research Center List";
    LookupPageID = "Research Center List";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(4; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(5; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(6; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(7; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(8; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(9; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(10; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(11; Contact; Text[50])
        {
            Caption = 'Contact';
        }
        field(12; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
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
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(14; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(15; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(103; "Home Page"; Text[90])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(5900; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(5901; "Contract Gain/Loss Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Contract Gain/Loss Entry".Amount where("Responsibility Center" = field(Code),
                                                                       "Change Date" = field("Date Filter")));
            Caption = 'Contract Gain/Loss Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50000; "Research Center?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Center Director"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Center Director");
                if Employee.Find('-') then begin
                    "Center Director Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(50002; Overview; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Center Director Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "No. of Research Programs"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50007; "No. of Awarded GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Application Status" = const(Won),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50008; "No. of Lost Grant GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Application Status" = const(Lost),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50009; "No. of Ongoing RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Center" = field(Code),
                                           "Project Start Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50010; "No. of Completed RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Center" = field(Code),
                                           "Project End Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50011; "Total Amount Awarded(LCY)"; Decimal)
        {
            CalcFormula = sum("Grant Funding Application"."Awarded Grant Amount (LCY)" where("Research Center" = field(Code),
                                                                                              "Application Status" = const(Won),
                                                                                              "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50012; "No. of Assets"; Integer)
        {
            CalcFormula = count("Fixed Asset" where("Research Center" = field(Code)));
            Description = 'For Statistics';
            FieldClass = FlowField;
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
        fieldgroup(Brick; "Code", Name, "Location Code")
        {
        }
    }

    trigger OnDelete()
    begin
        DimMgt.DeleteDefaultDim(Database::"Responsibility Center", Code);
    end;

    var
        PostCode: Record "Post Code";
        DimMgt: Codeunit DimensionManagement;
        DocTxt: label 'Purchase Order';
        Employee: Record Employee;
        Text014: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Responsibility Center", Code, FieldNumber, ShortcutDimCode);
        Modify;
    end;


    procedure SetWorkDescription(NewWorkDescription: Text)
    var
    //CC// TempBlob: Record TempBlob temporary;
    begin
        Clear(Overview);
        if NewWorkDescription = '' then
            exit;
        //CC//      TempBlob.Blob := Overview;
        //CC//      TempBlob.WriteAsText(NewWorkDescription, Textencoding::Windows);
        //CC//     Overview := TempBlob.Blob;
        Modify;
    end;


    procedure GetWorkDescription(): Text
    var
        //CC//     TempBlob: Record TempBlob temporary;
        CR: Text[1];
    begin
        CalcFields(Overview);
        if not Overview.Hasvalue then
            exit('');
        CR[1] := 10;
        //CC//    TempBlob.Blob := Overview;
        //CC//     exit(TempBlob.ReadAsText(CR, Textencoding::Windows));
    end;


    procedure DisplayMap()
    var
        MapPoint: Record "Online Map Setup";
        MapMgt: Codeunit "Online Map Management";
    begin
        if MapPoint.FindFirst then
            MapMgt.MakeSelection(Database::"Research Center", GetPosition)
        else
            Message(Text014);
    end;
}
