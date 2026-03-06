#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50018 tableextension50018 extends Resource
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "City(Field 8)".


        //Unsupported feature: Property Modification (Data type) on ""Social Security No."(Field 9)".


        //Unsupported feature: Property Modification (Data type) on ""Job Title"(Field 10)".


        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          ResSetup.GET;
          NoSeriesMgt.TestManual(ResSetup."Resource Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF ("Resource Type"="Resource Type"::Normal) THEN BEGIN
        #1..5
        END;

        IF ("Resource Type"="Resource Type"::Researcher) THEN BEGIN
        IF "No." <> xRec."No." THEN BEGIN
           GrantSetup.GET;
          NoSeriesMgt.TestManual(GrantSetup."Researcher Nos");
          "No. Series" := '';
        END;
        END;

        IF ("Resource Type"="Resource Type"::Administrator) THEN BEGIN
        IF "No." <> xRec."No." THEN BEGIN
           GrantSetup.GET;
          NoSeriesMgt.TestManual(GrantSetup."Grant Admin Nos");
          "No. Series" := '';
        END;
        END;
        */
        //end;
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                ///ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023; "Researcher?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(65002; "No. of Awarded GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Principal Investigator" = field("No."),
                                                                   "Application Status" = const(Won),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65003; "No. of Lost Grant GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Principal Investigator" = field("No."),
                                                                   "Application Status" = const(Lost),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65004; "No. of Ongoing RProjects"; Integer)
        {
            CalcFormula = count(Job where("Person Responsible" = field("No."),
                                           Status = filter(Open | Planning | Quote),
                                           "Document Type" = const(Project),
                                           "Starting Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65005; "No. of Completed RProjects"; Integer)
        {
            CalcFormula = count(Job where("Person Responsible" = field("No."),
                                           Status = filter(Completed),
                                           "Document Type" = const(Project),
                                           "Ending Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65006; "No. of Research Outputs"; Integer)
        {
            CalcFormula = count("Research Output Register" where("Principle Investigator" = field("No."),
                                                                  "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65007; "Total Amount Awarded(LCY)"; Decimal)
        {
            CalcFormula = sum("Grant Funding Application"."Awarded Grant Amount (LCY)" where("Principal Investigator" = field("No.")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(65008; Admin; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(65009; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(65010; "Employee Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65011; "Resource Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Normal,Researcher,Administrator';
            OptionMembers = Normal,Researcher,Administrator;
        }
        field(65012; "External Consultant"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(65013; "Researcher's Major"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65014; "Researcher Biography"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(65015; "Job Group"; Code[20])
        {
            CalcFormula = lookup(Employee."Salary Scale" where("Resource No." = field("No.")));
            FieldClass = FlowField;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "No." = '' THEN BEGIN
      ResSetup.GET;
      ResSetup.TESTFIELD("Resource Nos.");
      NoSeriesMgt.InitSeries(ResSetup."Resource Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    IF GETFILTER("Resource Group No.") <> '' THEN
      IF GETRANGEMIN("Resource Group No.") = GETRANGEMAX("Resource Group No.") THEN
        VALIDATE("Resource Group No.",GETRANGEMIN("Resource Group No."));

    DimMgt.UpdateDefaultDim(
      DATABASE::Resource,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    IF ("Resource Type"="Resource Type"::Normal) THEN BEGIN
    #1..5
    END;

    IF ("Resource Type"="Resource Type"::Researcher) THEN BEGIN
    IF "No." = '' THEN BEGIN
      GrantSetup.GET;
      GrantSetup.TESTFIELD("Researcher Nos");
      NoSeriesMgt.InitSeries(GrantSetup."Researcher Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END;

    IF ("Resource Type"="Resource Type"::Administrator) THEN BEGIN
    IF "No." = '' THEN BEGIN
      GrantSetup.GET;
      GrantSetup.TESTFIELD("Grant Admin Nos");
      NoSeriesMgt.InitSeries(GrantSetup."Grant Admin Nos",xRec."No. Series",0D,"No.","No. Series");
    END;
    END;
    #6..13
    */
    //end;

    var
        GrantSetup: Record "Grants Setup";
}
