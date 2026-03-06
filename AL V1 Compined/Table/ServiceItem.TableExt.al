#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 90003 tableextension90003 extends "Service Item"
{
    fields
    {
        field(58000; Type; Option)
        {
            Description = 'Person/Company';
            OptionCaption = 'Person,Company';
            OptionMembers = Person,Company;
        }
        field(58001; "Customer Category"; Code[10])
        {
            Caption = 'Applicant Category';
            Description = 'Customer/Author/Publisher/Licensee';
            TableRelation = "Applicant category setup";
        }
        field(58002; "Customer Type"; Option)
        {
            Caption = 'Applicant Type';
            Description = 'Customer/Applicant';
            OptionCaption = 'Customer,Copyright Applicant';
            OptionMembers = Customer,"Copyright Applicant";
        }
        field(58003; "Company Reg No"; Code[20])
        {
        }
        field(58004; "ID. No."; Code[20])
        {
        }
        field(58005; "P.I.N"; Code[11])
        {

            trigger OnValidate()
            begin
                /*
                IF "P.I.N"<>'' THEN BEGIN
                StrPIN:=COPYSTR("P.I.N",1,11);
                
                IF STRLEN("P.I.N")<>11 THEN BEGIN
                ERROR('Invalid PIN number. Please enter the correct PIN number.');
                END;
                END;
                
                mystr:="P.I.N";
                  i := 1;
                  WHILE (mystr[i] IN ['0'..'9']) AND (i<= STRLEN(mystr)) DO
                    i := i+1;
                
                   j := 1;
                  WHILE (mystr[j] IN ['0'..'9']) AND (j<= STRLEN(mystr)) DO
                    j := j+1;
                
                
                      IF (i<>1) AND (i<>11) THEN
                  ERROR('P.I.N Must Start & End with character');
                      {IF j<>11 THEN
                  ERROR('P.I.N Must Start & End with character');}
                  */

            end;
        }
        field(58006; Title; Code[20])
        {
            TableRelation = Salutation.Code;
        }
        field(58008; "Captured by"; Code[30])
        {
        }
        field(58009; Created; Boolean)
        {
        }
        field(58010; "Registration Date"; Date)
        {
        }
        field(58011; "Created By"; Code[30])
        {
        }
        field(58012; "Copyright Title"; Text[100])
        {
        }
        field(58013; "Copyright Work Category"; Code[20])
        {
            TableRelation = "Copyright Works Categories";

            trigger OnValidate()
            begin
                if CopyrightCategory.Get(Rec."Copyright Work Category") then
                    Rec."Copyright Category Description" := Format(CopyrightCategory.Description);
            end;
        }
        field(58014; "Copyright Work SubCategory"; Code[20])
        {
            TableRelation = "Copyright Works Sub-Categories".Code where("Category Code" = field("Copyright Work Category"));

            trigger OnValidate()
            begin

                if CopyrightSubCategory.Get(Rec."Copyright Work Category", Rec."Copyright Work SubCategory") then
                    Rec."Copyright SubCategory Desc" := CopyrightSubCategory.Description;
            end;
        }
        field(58015; "Copyright Category Description"; Text[50])
        {
            Editable = false;
        }
        field(58016; "Copyright SubCategory Desc"; Text[50])
        {
            Editable = false;
        }
        field(58017; "Date of Fixation/Reduction"; Date)
        {
        }
        field(58018; Language; Code[10])
        {
            TableRelation = Language;
        }
        field(58019; "Copyright Work Abstract"; Blob)
        {
        }
        field(58020; "Agent First Name"; Text[50])
        {
            Caption = 'Agent First Name';

            trigger OnValidate()
            begin
                //IF (Surname = UPPERCASE(xRec."First Name")) OR (Surname = '') THEN
                //  Surname := "First Name";
                //"First Name":=UPPERCASE("First Name");
            end;
        }
        field(58021; "Agent Surname"; Code[50])
        {
            Caption = 'Agent Surname';

            trigger OnValidate()
            begin
                //Surname:=UPPERCASE(Surname);
            end;
        }
        field(58022; "Agent Middle Name"; Text[50])
        {
            Caption = 'Agent Middle Name';

            trigger OnValidate()
            begin
                //"Middle Name":=UPPERCASE("Middle Name");
            end;
        }
        field(58023; "Agent Address"; Text[50])
        {
            Caption = 'Agent Address';
        }
        field(58024; "Agent Address 2"; Text[50])
        {
            Caption = 'Agent Address 2';
        }
        field(58025; "Agent City"; Text[30])
        {
            Caption = 'Agent City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(58026; "Agent Contact"; Text[50])
        {
            Caption = 'Agent Contact';
        }
        field(58027; "Agent Phone No."; Text[30])
        {
            Caption = 'Agent Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(58028; "Agent ID. No."; Code[20])
        {
        }
        field(58029; "Agent P.I.N"; Code[11])
        {

            trigger OnValidate()
            begin
                /*
                IF "P.I.N"<>'' THEN BEGIN
                StrPIN:=COPYSTR("P.I.N",1,11);
                
                IF STRLEN("P.I.N")<>11 THEN BEGIN
                ERROR('Invalid PIN number. Please enter the correct PIN number.');
                END;
                END;
                
                mystr:="P.I.N";
                  i := 1;
                  WHILE (mystr[i] IN ['0'..'9']) AND (i<= STRLEN(mystr)) DO
                    i := i+1;
                
                   j := 1;
                  WHILE (mystr[j] IN ['0'..'9']) AND (j<= STRLEN(mystr)) DO
                    j := j+1;
                
                
                      IF (i<>1) AND (i<>11) THEN
                  ERROR('P.I.N Must Start & End with character');
                      {IF j<>11 THEN
                  ERROR('P.I.N Must Start & End with character');}
                  */

            end;
        }
        field(58030; "Author First Name"; Text[50])
        {
            Caption = 'Author First Name';

            trigger OnValidate()
            begin
                //IF (Surname = UPPERCASE(xRec."First Name")) OR (Surname = '') THEN
                //  Surname := "First Name";
                //"First Name":=UPPERCASE("First Name");
            end;
        }
        field(58031; "Author Agent Surname"; Code[50])
        {
            Caption = 'Author Agent Surname';

            trigger OnValidate()
            begin
                //Surname:=UPPERCASE(Surname);
            end;
        }
        field(58032; "Author Middle Name"; Text[50])
        {
            Caption = 'Author Middle Name';

            trigger OnValidate()
            begin
                //"Middle Name":=UPPERCASE("Middle Name");
            end;
        }
        field(58033; "Author Address"; Text[50])
        {
            Caption = 'Author Address';
        }
        field(58034; "Author Address 2"; Text[50])
        {
            Caption = 'Author Address';
        }
        field(58035; "Author City"; Text[30])
        {
            Caption = 'Author City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(58036; "Author Contact"; Text[50])
        {
            Caption = 'Author Contact';
        }
        field(58037; "Author Phone No."; Text[30])
        {
            Caption = 'Author Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(58038; "Author ID. No."; Code[20])
        {
        }
        field(58039; "Author P.I.N"; Code[11])
        {
        }
        field(58040; "Prod/Pub Name"; Text[50])
        {
            Caption = 'Prod/Pub Name';
        }
        field(58041; "Prod/Pub ID No/Company Reg No"; Code[20])
        {
            Caption = 'Prod/Pub ID No/Company Reg No';
        }
        field(58042; "Prod/Pub P.I.N"; Code[11])
        {
        }
        field(58043; "Assignment/License Date"; Date)
        {
            Caption = 'Assignment/License Date';
        }
        field(58044; "1st Country of Production"; Code[10])
        {
            Caption = '1st Country of Production';
            TableRelation = "Country/Region";
        }
        field(58045; ISBN; Code[20])
        {
            Caption = 'ISBN';
        }
        field(58046; "Production Category"; Option)
        {
            Caption = 'Production Category';
            OptionCaption = 'Self-Produced,Label/Record Company';
            OptionMembers = "Self-Produced","Label/Record Company";
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(58047; "Prod/Pub Phone No."; Text[30])
        {
            Caption = 'Prod/Pub Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(58048; "Prod/Pub Email"; Text[80])
        {
        }
        field(58049; "Applicant Account"; Code[20])
        {
            TableRelation = Customer where("Customer Category" = filter(1 | 2 | 3));

            trigger OnValidate()
            begin

                /*IF Customer.GET("Billing Account")THEN BEGIN
                  Name:=Customer.Name;
                  Address:=Customer.Address;
                  "Address 2":=Customer."Address 2";
                  City:=Customer.City;
                  Contact:=Customer.Contact;
                  "Phone No.":=Customer."Phone No.";
                  "Telex No.":=Customer."Telex No.";
                  "Customer Posting Group":=Customer."Customer Posting Group";
                  "Country/Region Code":=Customer."Country/Region Code";
                  //"Gen. Bus. Posting Group":=Customer."Gen. Bus. Posting Group";
                  County:=Customer.County;
                  "Post Code":=Customer."Post Code";
                  "E-Mail":=Customer."E-Mail";
                  "VAT Bus. Posting Group":=Customer."VAT Bus. Posting Group";
                  Type:=Customer.Type;
                  "Customer Category":=Customer."Customer Category";
                  "Customer Type":=Customer."Customer Type";
                  "Company Reg No":=Customer."Company Reg No";
                  "ID. No.":=Customer."ID. No.";
                  "P.I.N":=Customer."P.I.N";
                  Title:=Customer.Title;
                  "Registration Date":=TODAY;
                  "Captured by":=USERID;
                  "Created By":=USERID;
                  END;*/

            end;
        }
        field(58050; "Receipt No"; Code[20])
        {
            TableRelation = "Receipts Header1"."No." where(Posted = const(TRUE));

            trigger OnValidate()
            begin
                if Rcpt.Get(Rec."Receipt No") then begin
                    Rcpt.CalcFields(Amount);
                    Rec."Receipt Amount" := Rcpt.Amount;
                end;
            end;
        }
        field(58051; "Receipt Amount"; Decimal)
        {
            Editable = false;
        }
        field(58052; "Payemnt Reference No"; Code[30])
        {
        }
        field(58053; "Copyright works"; Code[30])
        {
        }
        field(58054; "Copyright?"; Boolean)
        {
        }
        field(58055; "Copyright Registration No"; Code[30])
        {
        }
    }

    //Unsupported feature: Property Modification (Fields) on "DropDown(FieldGroup 1)".


    var
        CopyrightCategory: Record 56020;
        CopyrightSubCategory: Record 56021;
        Customer: Record Customer;
        Rcpt: Record 56007;
        PostCode: Record "Post Code";
}
