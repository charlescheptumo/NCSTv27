#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70191 "RFI Response"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFP Response,EOI Response';
            OptionMembers = "IFP Response","EOI Response";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document No." <> '' then begin
                    ProcurementSetup.Get;
                    if "Document Type" = "document type"::"IFP Response" then begin
                        ProcurementSetup.TestField("IFP Response Nos");
                        NoMgt.TestManual(ProcurementSetup."IFP Response Nos");
                        "No. Series" := ''
                    end else begin
                        ProcurementSetup.TestField("EOI Response Nos");
                        NoMgt.TestManual(ProcurementSetup."EOI Response Nos");
                        "No. Series" := ''
                    end;
                end;
            end;
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange("No.", "Vendor No.");
                if Vend.FindSet then begin
                    "Vendor Name" := Vend.Name;
                    "Vendor Address" := Vend.Address;
                    "Vendor Address 2" := Vend."Address 2";
                    "Post Code" := Vend."Post Code";
                    City := Vend.City;
                    "Country/Region Code" := Vend."Country/Region Code";
                    County := Vend.County;
                    "Phone No." := Vend."Phone No.";
                    "E-Mail" := Vend."E-Mail";

                end;
            end;
        }
        field(5; "Vendor Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "RFI Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code;
        }
        field(7; "Vendor Representative Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Vendor Repr Designation"; Text[80])
        {
            Caption = 'Vendor Representative Designation';
            DataClassification = ToBeClassified;
        }
        field(9; "Vendor Address"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Vendor Address 2"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(11; City; Text[300])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(12; "Phone No."; Text[300])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            var
                //CC//       Char: dotnet Char;
                i: Integer;
            begin
                //CC//      for i := 1 to StrLen("Phone No.") do
                //CC//           if Char.IsLetter("Phone No."[i]) then
                //CC//                Error(PhoneNoCannotContainLettersErr);
            end;
        }
        field(13; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(14; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(15; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(16; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(17; "Special Group Vendor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Special Group Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Special Vendor Category".Code;
        }
        field(19; "Final Evaluation Score"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(20; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Submitted,Evaluation,Closed,Cancelled,Opened';
            OptionMembers = Draft,Submitted,Evaluation,Closed,Cancelled,Opened;
        }
        field(21; "Date Submitted"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            ProcurementSetup.Get;
            if "Document Type" = "document type"::"IFP Response" then begin
                ProcurementSetup.TestField("IFP Response Nos");
                //NoMgt.InitSeries(ProcurementSetup."IFP Response Nos", xRec."No. Series", 0D, "Document No.", "No. Series");
                "Document No." := NoMgt.GetNextNo(ProcurementSetup."IFP Response Nos", WorkDate(), true);
            end else begin
                ProcurementSetup.TestField("EOI Response Nos");
                //NoMgt.InitSeries(ProcurementSetup."EOI Response Nos", xRec."No. Series", 0D, "Document No.", "No. Series");
                "Document No." := NoMgt.GetNextNo(ProcurementSetup."EOI Response Nos", WorkDate(), true);
            end;
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
        PostCode: Record "Post Code";
        PhoneNoCannotContainLettersErr: label 'You cannot enter letters in this field.';
        Vend: Record Vendor;
}
