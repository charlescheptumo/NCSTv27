#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80021 "Center Card"
{
    Caption = 'Center Card';
    PageType = Card;
    SourceTable = "Responsibility Center";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center code.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the address associated with the responsibility center.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the city where the responsibility center is located.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name of the person you regularly contact. ';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location of the responsibility center.';
                }
                field("Operating Unit Type"; Rec."Operating Unit Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Direct Reports To"; Rec."Direct Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Indirect Reports To"; Rec."Indirect Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Hierarchical  Level ID"; Rec."Hierarchical  Level ID")
                {
                    ApplicationArea = Basic;
                }
                field(Vision; Rec.Vision)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Mission; Rec.Mission)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Motto; Rec.Motto)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Headed By (Title)"; Rec."Headed By (Title)")
                {
                    ApplicationArea = Basic;
                }
                field("Current Head"; Rec."Current Head")
                {
                    ApplicationArea = Basic;
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s phone number.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the fax number of the responsibility center.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Location;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the email address of the responsibility center.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s web site.';
                }
            }
        }
        area(factboxes)
        {
            part(Control35; "Research Center Factbox")
            {
                SubPageLink = Code = field(Code);
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';
                Image = Dimensions;
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5714),
                                  "No." = field(Code);
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
            }
            action("Core Values")
            {
                ApplicationArea = Basic;
                Image = ValueLedger;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Core Values";
            }
            separator(Action31)
            {
            }
            action("Core Mandate")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Core Mandates";
            }
            separator(Action27)
            {
            }
            action("Responsibility Centers")
            {
                ApplicationArea = Advanced;
                Caption = 'Responsibility Centers';
                Image = Position;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Responsibility Center List";
                ToolTip = 'Set up responsibility centers to administer business operations that cover multiple locations, such as a sales offices or a purchasing departments.';
            }
            separator(Action23)
            {
            }
            action("Annual Reporting Codes")
            {
                ApplicationArea = Basic;
                Image = AccountingPeriods;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Annual Reporting Codes";
            }
            group(ActionGroup55)
            {
                action("Copy Company Address")
                {
                    ApplicationArea = Basic;
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Rec.Code = '' then
                            Error(Text0001, Rec.Code);
                        CompInfo.Get();
                        Rec.Address := CompInfo.Address;
                        Rec."Address 2" := CompInfo."Address 2";
                        Rec."Post Code" := CompInfo."Post Code";
                        Rec.City := CompInfo.City;
                        Rec."Phone No." := CompInfo."Phone No.";
                        Rec."E-Mail" := CompInfo."E-Mail";
                        Rec."Fax No." := CompInfo."Fax No.";
                        Rec."Home Page" := CompInfo."Home Page";
                        Rec.Mission := CompInfo.Mission;
                        Rec.Vision := CompInfo.Vision;
                        Rec.Motto := CompInfo.Motto;
                        Rec."Country/Region Code" := CompInfo."Country/Region Code";
                        Rec.Modify;

                        Message(Text0002);
                    end;
                }
                action("Staff Profile")
                {
                    ApplicationArea = Basic;
                    Image = Employee;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Employee List-P";
                    RunPageLink = "Research Center" = field(Code);
                }
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                    Image = Grid;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Grant Funding Application List";
                    RunPageLink = "Research Center" = field(Code);
                }
                action("Project profile")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job List";
                    RunPageLink = "Research Center" = field(Code);
                }
                action("Sub Centers")
                {
                    ApplicationArea = Basic;
                    Image = Skills;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Research Sub-Center List";
                    RunPageLink = "Research Centre" = field(Code);
                }
                action("Research Programs")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Research Center Programs List";
                    RunPageLink = "Center Code" = field(Code);
                }
                action("Research Infrastructure")
                {
                    ApplicationArea = Basic;
                    Image = FixedAssets;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Research Infrastructure List";
                    RunPageLink = "Center Code" = field(Code);
                }
                action("Fixed Assets")
                {
                    ApplicationArea = Basic;
                    Image = FixedAssets;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Fixed Asset List";
                    RunPageLink = "Research Center" = field(Code);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Research Center Statistics";
                    RunPageLink = Code = field(Code);
                }
            }
        }
        area(reporting)
        {
            group(ActionGroup44)
            {
                action("Research Centers")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    RunObject = Report "Research Center List";
                }
                action("Research Centers Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65010, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action41)
                {
                }
                action("Center Grant Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65011, true, true, ResearchCenter);
                        end;
                    end;
                }
                action("Center Projects Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65012, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action38)
                {
                }
                action("Fixed Assets List")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Rec.Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65013, true, true, ResearchCenter);
                        end;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Operating Unit Type" := Rec."operating unit type"::Region;
    end;

    var
        CompInfo: Record "Company Information";
        WorkDescription: Text;
        ResearchCenter: Record "Responsibility Center";
        Text0001: label 'Research Code %1 should not be blank';
        Text0002: label 'Details updated successfully';
        ShowMapLbl: label 'Show on Map';
}
