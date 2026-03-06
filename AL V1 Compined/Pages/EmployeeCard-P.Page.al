#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69031 "Employee Card-P"
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
                          CurrPage.UPDATE;*/ //commented by morris during upgrade

                    end;
                }
                field("Job Title"; Rec."Job Title")
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
                    Editable = false;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
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
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(Rank; Rec.Rank)
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
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Balance; Rec.Balance)
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
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Pay Mode"; Rec."Payroll Pay Mode")
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
                field("Taxable Allowance"; Rec."Taxable Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Allowances"; Rec."Total Allowances")
                {
                    ApplicationArea = Basic;
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                }
                field("Total Gratuity Amount"; Rec."Total Gratuity Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field(Present; Rec.Present)
                {
                    ApplicationArea = Basic;
                }
                field(Halt; Rec.Halt)
                {
                    ApplicationArea = Basic;
                }
                field(Previous; Rec.Previous)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Period Filter"; Rec."Pay Period Filter")
                {
                    ApplicationArea = Basic;
                }
                field(Basic; Rec.Basic)
                {
                    ApplicationArea = Basic;
                }
                field("Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Type"; Rec."Employee Type")
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
                field("Send Payslip By E-mail?"; Rec."Send Payslip By E-mail?")
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
            }
            group(Administration)
            {
                Caption = 'Administration';
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Employement Terms"; Rec."Employement Terms")
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
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                }
                // field("Reason for termination Code"; Rec."Reason for termination Code")
                // {
                //     ApplicationArea = Basic;
                // }
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
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field("Birth Date"; Rec."Birth Date")
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
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
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
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
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
            group("Update Employee Details")
            {
                Caption = 'Update Employee Details';
                field(overtimehrs; overtimehrs)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 1.5';
                }
                field(overtimehrs2; overtimehrs2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 2.0';
                }
                field(lostdays2; lostdays2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Lost Days';
                }
                field(leavedays; leavedays)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days';
                }
                field("insurance Relief2"; "insurance Relief2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insurance Relief';
                }
            }
        }
        area(factboxes)
        {
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
                action("Q&ualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page "Employee Qualifications";
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
            }
        }
        area(creation)
        {
            action("Assign Default Earn/Ded")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Default Earn/Ded';
                Ellipsis = true;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    /*
                    PayPeriod.RESET;
                    PayPeriod.SETRANGE(PayPeriod.Closed,FALSE);
                    IF PayPeriod.FIND('-') THEN  BEGIN
                     Earnings.RESET;
                     Earnings.SETRANGE(Earnings."Applies to All",TRUE);
                     Earnings.SETRANGE(Earnings."Basic Salary Code",TRUE);
                    { IF Earnings.FIND('-') THEN BEGIN
                      REPEAT
                       AssMatrix.INIT;
                       AssMatrix."Employee No":="No.";
                       AssMatrix.Type:=AssMatrix.Type::Payment;
                       AssMatrix."Payroll Period":=PayPeriod."Starting Date";
                       AssMatrix."Department Code":="Global Dimension 1 Code";
                       AssMatrix.Code:=Earnings.Code;
                       AssMatrix.VALIDATE(Code);
                    
                       SalaryPointer.RESET;
                    
                       SalaryPointer.SETRANGE(SalaryPointer."Salary Pointer",Present);
                       IF SalaryPointer.FIND('-') THEN
                       BEGIN
                       AssMatrix.Amount:=SalaryPointer."Basic Pay";
                       AssMatrix.VALIDATE(Amount);
                       //MESSAGE('%1',SalaryPointer."Basic Pay");
                       END
                       ELSE
                       ERROR('Please select the present salary pointer for this employee');
                    
                       AssMatrix.INSERT;
                      UNTIL Earnings.NEXT=0;
                      END;}
                    
                    
                    
                     Earnings.RESET;
                     Earnings.SETRANGE(Earnings."Applies to All",TRUE);
                     Earnings.SETRANGE(Earnings."Basic Salary Code",FALSE);
                     IF Earnings.FIND('-') THEN BEGIN
                      REPEAT
                       AssMatrix.INIT;
                       AssMatrix."Employee No":="No.";
                       AssMatrix.Type:=AssMatrix.Type::Payment;
                       AssMatrix."Payroll Period":=PayPeriod."Starting Date";
                       AssMatrix."Department Code":="Global Dimension 1 Code";
                       AssMatrix.Code:=Earnings.Code;
                       AssMatrix.VALIDATE(Code);
                       IF NOT AssMatrix.GET(AssMatrix."Employee No",AssMatrix.Type,AssMatrix.Code,AssMatrix."Payroll Period") THEN
                       AssMatrix.INSERT;
                      UNTIL Earnings.NEXT=0;
                      END;
                    
                    
                    
                    
                    
                    
                    
                      // Deducton
                     Ded.RESET;
                     Ded.SETRANGE("Applies to All",TRUE);
                    
                     IF Ded.FIND('-') THEN BEGIN
                      REPEAT
                       AssMatrix.INIT;
                       AssMatrix."Employee No":="No.";
                       AssMatrix.Type:=AssMatrix.Type::Deduction;
                       AssMatrix."Payroll Period":=PayPeriod."Starting Date";
                       AssMatrix."Department Code":="Global Dimension 1 Code";
                       AssMatrix.Code:=Ded.Code;
                       AssMatrix.VALIDATE(Code);
                       IF NOT AssMatrix.GET(AssMatrix."Employee No",AssMatrix.Type,AssMatrix.Code,AssMatrix."Payroll Period") THEN
                       AssMatrix.INSERT;
                      UNTIL Ded.NEXT=0;
                      END;
                    
                    END;
                    */
                    if Confirm(Text000, false) then
                        PayrollRun.DefaultAssignment(Rec);

                end;
            }
            action("Assign Earnings")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Earnings';
                Ellipsis = true;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Payments & Deductions";
                RunPageLink = "Employee No" = field("No."),
                              Type = const(Payment),
                              Closed = const(false);

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                end;
            }
            action("Assign Deductions")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Deductions';
                Ellipsis = true;
                Image = Cost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Payments & Deductions";
                RunPageLink = "Employee No" = field("No."),
                              Type = const(Deduction),
                              Closed = const(false);

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);
                end;
            }
            action("Assign Gratuity")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Gratuity';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    EmployeeRec.SetRange("No.", Rec."No.");
                    EmployeeRec.SetRange("Pay Period Filter", CurrentMonth);

                    Report.Run(69050, true, false, EmployeeRec);
                end;
            }
            action("Generate P9")
            {
                ApplicationArea = Basic;
                Caption = 'Generate P9';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);


                    Report.Run(69019, true, false, Employee);
                end;
            }
            action("&Generate Payslip")
            {
                ApplicationArea = Basic;
                Caption = '&Generate Payslip';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);

                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    Employee.SetRange(Employee."No.", Rec."No.");
                    Employee.SetRange(Employee."Pay Period Filter", CurrentMonth);

                    //REPORT.RUN(50053,TRUE,FALSE,Employee);
                    // REPORT.RUN(69045,TRUE,FALSE,Employee);
                    Report.Run(89028, true, false, Employee);
                end;
            }
            action("&Employee Statement")
            {
                ApplicationArea = Basic;
                Caption = '&Employee Statement';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    EmployeeRec.SetRange(EmployeeRec."No.", Rec."No.");
                    Report.Run(57016, true, false, EmployeeRec);
                end;
            }
            separator(Action1000000046)
            {
            }
            action("&Run Emp Payroll")
            {
                ApplicationArea = Basic;
                Caption = '&Run Emp Payroll';
                Ellipsis = true;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateRedemptionJournal(Rec);

                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    Employee.SetRange(Employee."No.", Rec."No.");
                    Employee.SetRange(Employee."Pay Period Filter", CurrentMonth);

                    Report.Run(69004, true, false, Employee);
                end;
            }
            action("Update1.5")
            {
                ApplicationArea = Basic;
                Caption = 'Update 1.5';

                trigger OnAction()
                begin

                    //--------------if values are empty------------
                    if overtimehrs2 = 0 then begin
                        //overtimehrs2:="Overtime2.0";
                    end;

                    //end of if values are empty---------------------




                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E001');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;
                    //MESSAGE('Basic: %1',assm.Amount);
                    OT := (assm.Amount / 22) / 8 * 1.5 * overtimehrs;
                    BA := assm.Amount;


                    //---------------------------------------------------------------------Overtime DAYS 1.5 --------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E007');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E007';
                        assm.Description := 'Overtime(1.5)';
                        assm.Amount := 0;
                        assm.Insert;
                    end;

                    //MESSAGE('Existing Overtime 1.5: %1',assm.Amount);
                    assm.Amount := OT;
                    assm."Hours 1.5" := overtimehrs;
                    assm.Modify;
                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    //MESSAGE('Updated as:\Basic Pay: %1\Overtime 1.5: %2',BA,OT);
                    //}
                end;
            }
            action("Update2.0")
            {
                ApplicationArea = Basic;
                Caption = 'Update 2.0';

                trigger OnAction()
                begin

                    //--------------if values are empty------------

                    //end of if values are empty---------------------




                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E001');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;
                    //MESSAGE('Basic: %1',assm.Amount);
                    OT2 := (assm.Amount / 22) / 8 * 2 * overtimehrs2;
                    BA := assm.Amount;


                    //---------------------------------------------------------------------Overtime DAYS 2.0 --------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E009');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E009';
                        assm.Description := 'Overtime(2.0)';
                        assm.Amount := 0;
                        assm.Insert;
                    end;

                    //MESSAGE('Existing Overtime 2.0: %1',assm.Amount);
                    assm.Amount := OT2;
                    assm."Hours 2.0" := overtimehrs2;
                    assm.Modify;


                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    //MESSAGE('Updated as:\Basic Pay: %1\Overtime 2.0: %2: %5',BA,OT2);
                    //}
                end;
            }
            action(UpdateLeave)
            {
                ApplicationArea = Basic;
                Caption = 'Update Leave';

                trigger OnAction()
                begin





                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E001');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;
                    //MESSAGE('Basic: %1',assm.Amount);
                    LE := (assm.Amount / 22) * leavedays;
                    BA := assm.Amount;


                    //-----------------------------------------------------------------Leave Days-----------------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E008');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E008';
                        assm.Description := 'Leave Pay';
                        assm.Amount := 0;
                        assm.Insert;
                    end;


                    //MESSAGE('Existing Leave Pay: %1',assm.Amount);
                    assm.Amount := LE;
                    assm."Leave Days" := leavedays;
                    assm.Modify;


                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    //MESSAGE('Updated as:\Basic Pay: %1\Leave Pay: %2',BA,LE);
                    //}
                end;
            }
            action(UpdateLostDays)
            {
                ApplicationArea = Basic;
                Caption = 'Update Lost Days';

                trigger OnAction()
                begin





                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E001');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;
                    //MESSAGE('Basic: %1',assm.Amount);
                    LD := -(assm.Amount / 22) * lostdays2;
                    BA := assm.Amount;

                    //---------------------------------------------------------------------Lost Days --------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E014');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E014';
                        assm.Description := 'Lost Days';
                        assm.Amount := 0;
                        assm.Insert;
                    end;

                    //MESSAGE('Existing Overtime 2.0: %1',assm.Amount);
                    assm.Amount := LD;
                    assm.Lostdays := lostdays2;
                    assm.Modify;


                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    Message('Updated as:\Basic Pay: %1\Lost Days: %2', BA, LD);
                    //}
                end;
            }
            action(UpdateInsurance)
            {
                ApplicationArea = Basic;
                Caption = 'Update Insurance';

                trigger OnAction()
                begin





                    //MESSAGE('Basic: %1',assm.Amount);
                    "insurance Reliefcalc" := 0.15 * "insurance Relief2";

                    //---------------------------------------------------------------------Insurance Premium --------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E016');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E016';
                        assm.Description := 'Insurance Relief';
                        assm.Amount := 0;
                        assm.Insert;
                    end;

                    //MESSAGE('Existing Overtime 2.0: %1',assm.Amount);
                    assm.Amount := "insurance Reliefcalc";

                    assm.Modify;


                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    Message('Updated as:\Insurance Premium: %1\Insurance Relief: %2', "insurance Relief2", "insurance Reliefcalc");
                    //}
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin


        Rec.SetRange(Rec."No.");

        /*
         IF "Terminal Dues Paid?"=TRUE THEN
         CurrPage."Terminal Dues Paid?".Enabled(FALSE)
         ELSE
          CurrPage."Terminal Dues Paid?".ENABLED(TRUE);
        */

    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Pays tax?" := true;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        if not MapMgt.TestSetup then
            MapPointVisible := false;

        UserSetup.Get(UserId);

        if UserSetup."Payroll View" = false then
            Error('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        [InDataSet]
        MapPointVisible: Boolean;
        PayPeriod: Record "Payroll PeriodX";
        CurrentMonth: Date;
        UserSetup: Record "User Setup";
        AssMatrix2: Record "Assignment Matrix-X";
        AssMatrix3: Record "Assignment Matrix-X";
        Mail: Codeunit Mail;
        Employee: Record Employee;
        GetGroup: Codeunit Payroll1;
        GroupCode: Code[20];
        CUser: Code[20];
        Earnings: Record EarningsX;
        Ded: Record DeductionsX;
        AssMatrix: Record "Assignment Matrix-X";
        SalaryPointer: Record "Salary Pointers";
        assm: Record "Assignment Matrix-X";
        i: Integer;
        OT: Decimal;
        LE: Decimal;
        BA: Decimal;
        overtimehrs: Integer;
        leavedays: Integer;
        OT2: Decimal;
        overtimehrs2: Integer;
        payperiod2: Date;
        sals: Record "Assignment Matrix-X";
        empp: Record Employee;
        someform: Page "Employee Card-P";
        text: Text[250];
        lostdays2: Integer;
        LD: Decimal;
        "insurance Relief2": Decimal;
        "insurance Reliefcalc": Decimal;
        PayrollRun: Report "Payroll Run";
        Text000: label 'Are you sure you want to assign default earnings & deductions?';
        EmployeeRec: Record Employee;
}
