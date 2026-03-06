#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69118 "Employee Card-HR"
{
    Caption = 'Employee Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        /*IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                          */

                    end;
                }
                field(Picture; Rec.Image)
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Middle Name/Initials';
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field(HR; Rec.HR)
                {
                    ApplicationArea = Basic;
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Organization Units")
            {
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field(Extension; Rec.Extension)
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Pager; Rec.Pager)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.2"; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address Code"; Rec."Alt. Address Code")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address Start Date"; Rec."Alt. Address Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address End Date"; Rec."Alt. Address End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension Scheme Join Date';
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Medical Scheme Join Date';
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = Basic;
                }
                field("Send Alert to"; Rec."Send Alert to")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Inactive Date"; Rec."Inactive Date")
                {
                    ApplicationArea = Basic;
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Emplymt. Contract Code"; Rec."Emplymt. Contract Code")
                {
                    ApplicationArea = Basic;
                }
                field("Statistics Group Code"; Rec."Statistics Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                }
                field("Union Code"; Rec."Union Code")
                {
                    ApplicationArea = Basic;
                }
                field("Union Membership No."; Rec."Union Membership No.")
                {
                    ApplicationArea = Basic;
                }
                field("Claim Limit"; Rec."Claim Limit")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Separation Details")
            {
                field("Reason for termination Code"; REC."Reason for termination Code")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for termination"; Rec."Reason for termination")
                {
                    ApplicationArea = Basic;
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                }
                field("Exit Interview Conducted"; Rec."Exit Interview Conducted")
                {
                    ApplicationArea = Basic;
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = Basic;
                    Editable = ExitDateEditable;
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = Basic;
                    Editable = ExitByEditable;
                }
                field("Allow Re-Employment In Future"; Rec."Allow Re-Employment In Future")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Payroll Details")
            {
                Caption = 'Payroll Details';
                field("Pays tax?"; Rec."Pays tax?")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Wages"; Rec."Pay Wages")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("Employee's Bank"; Rec."Employee's Bank")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch Name"; Rec."Bank Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'N.S.S.F No.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                field("Leave Days B/F"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days B/F';
                    Importance = Promoted;
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Acrued Leave Days"; Rec."Acrued Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Cash per Leave Day"; Rec."Cash per Leave Day")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Status"; Rec."Leave Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Type Filter"; Rec."Leave Type Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Period Filter"; Rec."Leave Period Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("On Leave"; Rec."On Leave")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control35; "HR Employees Factbox")
            {
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5200),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                }
                action("&Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("&Relatives")
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    Image = Relatives;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("&Next Of Kin")
                {
                    ApplicationArea = Basic;
                    Caption = '&Next Of Kin';
                    Image = Relatives;
                    RunObject = Page "Next Of Kin";
                    RunPageLink = "Employee Code" = field("No.");
                }
                action("&Dependants")
                {
                    ApplicationArea = Basic;
                    Caption = '&Dependants';
                    Image = Relatives;
                    RunObject = Page Dependants;
                    RunPageLink = "Employee Code" = field("No.");
                }
                action("Mi&sc. Article Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mi&sc. Article Information';
                    Image = Filed;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("&Confidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = '&Confidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("&Medical Info")
                {
                    ApplicationArea = Basic;
                    Caption = '&Medical Info';
                    Image = Lock;
                    RunObject = Page "Medical Info";
                    RunPageLink = "Employee No" = field("No.");
                    Visible = false;
                }
                action("R&esponsibilities")
                {
                    ApplicationArea = Basic;
                    Caption = 'R&esponsibilities';
                    Image = Position;
                    RunObject = Page Responsibilities;
                    RunPageLink = "Employee No." = field("No.");
                }
                action("Q&ualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("Employment H&istory")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment H&istory';
                    Image = History;
                    RunObject = Page "Employment History";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("I&tems Assigned")
                {
                    ApplicationArea = Basic;
                    Caption = 'I&tems Assigned';
                    Image = CheckList;
                    RunObject = Page "Appointment Checklist";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("C&onfidential Info")
                {
                    ApplicationArea = Basic;
                    Caption = 'C&onfidential Info';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("A&bsences")
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    Image = Absence;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
                }
                separator(Action23)
                {
                }
                action("Absences by Ca&tegories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Absences by Ca&tegories';
                    Image = AbsenceCategory;
                    RunObject = Page "Empl. Absences by Categories";
                    RunPageLink = "No." = field("No."),
                                  "Employee No. Filter" = field("No.");
                }
                action("Misc. Articles &Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page "Misc. Articles Overview";
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                }
                separator(Action61)
                {
                }
                action("Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
                action("Create Customer Imprest A/C")
                {
                    ApplicationArea = Basic;
                    Enabled = ShowCust;
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        Cust: Record Customer;
                    begin
                        if Rec.CreateCustomer then
                            Message(Text000, 'Imprest A/C')
                        else
                            Message(Text001, 'Imprest A/C');
                    end;
                }
                action("Create Resource A/C")
                {
                    ApplicationArea = Basic;
                    Enabled = ShowResource;
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Rec.CreateResource then
                            Message(Text000, 'Resource')
                        else
                            Message(Text001, 'Resource');
                    end;
                }
                action(Attachments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Employee Documents";
                    RunPageLink = "Doc No." = field("No.");
                    Visible = false;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowCust := Rec.CreateCustomer;
        ShowResource := Rec.CreateResource;
    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
        ExitDateEditable := true;
        ExitByEditable := true;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        ShowCust := Rec.CreateCustomer;
        ShowResource := Rec.CreateResource;
    end;

    var
        [InDataSet]
        MapPointVisible: Boolean;
        [InDataSet]
        ShowCust: Boolean;
        [InDataSet]
        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';
        [InDataSet]
        ExitDateEditable: Boolean;
        [InDataSet]
        ExitByEditable: Boolean;


    procedure Updatecontrols()
    begin

        if Rec."Exit Interview Conducted" = Rec."exit interview conducted"::Yes then begin
            ExitByEditable := true;
            ExitDateEditable := true;
        end else begin
            ExitByEditable := false;
            ExitDateEditable := false;
        end;
    end;
}
