#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56076 "ICT Helpdesk Request"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(<> " "));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Part 1: User Information.")
            {
                Editable = true;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Name';
                    Editable = false;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
                    Editable = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EXT; Rec.EXT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Extension No';
                    Editable = false;
                    Visible = false;
                }
                field("ICT Issue Category"; Rec."ICT Issue Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Part 2:1 Hardware Issues")
            {
                Visible = false;
                field("Computer not Starting up"; Rec."Computer not Starting up")
                {
                    ApplicationArea = Basic;
                }
                field("Keyboard, Mouse Failure"; Rec."Keyboard, Mouse Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Printer Failure"; Rec."Printer Failure")
                {
                    ApplicationArea = Basic;
                }
                field("UPS Failure"; Rec."UPS Failure")
                {
                    ApplicationArea = Basic;
                }
                field("LCD /Monitor Failure"; Rec."LCD /Monitor Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Storage Device Failure"; Rec."Storage Device Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Hardware Installation"; Rec."Hardware Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Others, specify HW"; Rec."Others, specify HW")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Part 2:2 Software Issues")
            {
                Visible = false;
                field("Computer Running /Loading Slow"; Rec."Computer Running /Loading Slow")
                {
                    ApplicationArea = Basic;
                }
                field("Network Access Problems"; Rec."Network Access Problems")
                {
                    ApplicationArea = Basic;
                }
                field("Antivirus Inefficiency"; Rec."Antivirus Inefficiency")
                {
                    ApplicationArea = Basic;
                }
                field(Applications; Rec.Applications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Applications Software (MS Word, MS Excel, MS Access, MS PowerPoint etc)';
                }
                field("Software Installation"; Rec."Software Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Others, specify SW"; Rec."Others, specify SW")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Please describe the issue here:")
            {
                field("HelpDesk Category"; Rec."HelpDesk Category")
                {
                    ApplicationArea = Basic;
                }
                field("Shared Inventory"; Rec."Shared Inventory")
                {
                    ApplicationArea = Basic;
                }
                field("ICT Inventory"; Rec."ICT Inventory")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Involved';
                    Visible = true;
                }
                field("ICT Inventory Name"; Rec."ICT Inventory Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Expected Resolution"; Rec."Expected Resolution")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."HelpDesk Category");
                    Rec.TestField(Rec."Description of the issue");
                    if Confirm('Are you sure you want to send ICT helpdesk issue?') = true then begin
                        Rec."Request Date" := Today;
                        Rec."Request Time" := Time;
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Modify;

                        Employee.Reset;
                        Employee.SetRange("No.", Rec."Assigned To EmpNo");
                        if Employee.Find('-') then begin
                            Employee.TestField("Company E-Mail");
                            Email2 := Employee."Company E-Mail";


                            CInfo.Get;


                            SetUp.Get();

                            Rec.Email := SetUp."ICT Email";
                            Body := '<br>Kindly login to the ERP System and attend to the ICT Issue ' + Rec."Description of the issue" + ' from ' + Rec."Requesting Officer Name" + '.' + '</br>';
                            Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                            Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                            //SMTP.CreateMessage(COMPANYNAME, 'draveljuma@dynasoft.co.ke', 'draveljuma@dynasoft.co.ke', 'ICT Heldesk Notification', Body, true);
                            Message(Rec.Email);
                            //SMTP.AddCC(Rec.Email);
                            //SMTP.Send();
                            BODY := Body;
                            EMAILMESSAGE.Create(SetUp."ICT Email", 'ICT Heldesk Notification', BODY);
                            EMAILSNED.send(EMAILMESSAGE, Enum::"Email Scenario"::Default);
                            Message('ICT Issue notification sent successfully.');
                        end;

                        Employee.Reset;
                        Employee.SetRange(Employee."User ID", Rec."Requesting Officer");
                        if Employee.Find('-') then begin
                            //MESSAGE("Assigned To");
                            Rec.Email := Employee."E-Mail";
                            Rec."Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;
                        Email2 := CInfo."Administrator Email";
                        Body := '<br>Your issue has been received by ICT department Issue No. ' + Rec."Job No." + ' Issue description  ' + Rec."Description of the issue" + ' from ' + Rec."Requesting Officer Name" + '.' + '</br>';
                        Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                        Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                        //   SMTP.CreateMessage(COMPANYNAME, 'draveljuma@dynasoft.co.ke', 'draveljuma@dynasoft.co.ke', 'ICT Heldesk Notification', Body, true);
                        Message(Rec.Email);
                        //    SMTP.Send();
                        BODY := Body;
                        EMAILMESSAGE.Create(SetUp."ICT Email", 'ICT Heldesk Notification', BODY);
                        EMAILSNED.send(EMAILMESSAGE, Enum::"Email Scenario"::Default);
                        Message('ICT Issue notification sent successfully.');
                    end;

                    CurrPage.Close;
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Validate(Rec."Job No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::Open;
    end;

    var
        Employee: Record Employee;

        // SMTP: Codeunit "SMTP Mail";
        Email2: Text[250];
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];
        CInfo: Record "Company Information";
        Category: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
        SetUp: Record "ICT Helpdesk Global Parameters";
}
