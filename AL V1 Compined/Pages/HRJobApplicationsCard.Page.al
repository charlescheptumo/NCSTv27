#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69251 "HR Job Applications Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Other Details';
    SourceTable = "HR Job Applications";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    Caption = '1st Language (R/W/S)';
                    Importance = Promoted;
                }
                field("First Language Read"; Rec."First Language Read")
                {
                    ApplicationArea = Basic;
                    Caption = '1st Language Read';
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    ApplicationArea = Basic;
                    Caption = '1st Language Write';
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    ApplicationArea = Basic;
                    Caption = '1st Language Speak';
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    Caption = '2nd Language (R/W/S)';
                    Importance = Promoted;
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                    ApplicationArea = Basic;
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    ApplicationArea = Basic;
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Type"; Rec."Applicant Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                    Style = Strong;
                    StyleExpr = true;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Internal';
                    Editable = true;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                }
                field("Country Details"; Rec."Citizenship Details")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application Reff No.';
                    Importance = Promoted;
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                    Caption = 'Position Applied For';
                    Editable = true;
                    Enabled = true;
                    Importance = Promoted;
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortlist For Written"; Rec.Shortlist)
                {
                    ApplicationArea = Basic;
                }
                field(Expatriate; Rec.Expatriate)
                {
                    ApplicationArea = Basic;
                }
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = Basic;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = Basic;
                }
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin

                        if Rec."Date Of Birth" >= Today then begin
                            Error('Invalid Entry');
                        end;
                        DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
                        Rec.Age := DAge;
                    end;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Postal Address2"; Rec."Postal Address2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Postal Address 2';
                }
                field("Postal Address3"; Rec."Postal Address3")
                {
                    ApplicationArea = Basic;
                    Caption = 'Postal Address 3';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = Basic;
                }
                field("Residential Address2"; Rec."Residential Address2")
                {
                    ApplicationArea = Basic;
                }
                field("Residential Address3"; Rec."Residential Address3")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code2"; Rec."Post Code2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Code 2';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755009; "HR Job Applications Factbox")
            {
                SubPageLink = "Application No" = field("Application No");
            }
            systempart(Control1102755008; Outlook)
            {
            }
            systempart(Control3; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Other Details")
            {
                Caption = 'Other Details';
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Applicant Qualifications";
                    RunPageLink = "Application No" = field("Application No");
                }
                action("Page HR Training Needs Card")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Need';
                    Promoted = true;
                    PromotedCategory = Category5;
                    //    //RunObject = Page UnknownPage51516208;
                }
                action(Referees)
                {
                    ApplicationArea = Basic;
                    Caption = 'Referees';
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Applicant Referees";
                    RunPageLink = "Job Application No" = field("Application No");
                }
                action("Generate Offer Letter")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate Offer Letter';
                    Promoted = true;
                    // RunObject = Report 55606;
                }
                action("Upload Attachments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Upload Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No" = field("Application No");
                    Visible = false;
                }
            }
            group("&Functions")
            {
                Caption = '&Functions';
                action("&Send Interview Invitation")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Interview Invitation';
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Qualified);


                        HRJobApplications.SetFilter(HRJobApplications."Application No", Rec."Application No");
                        Report.Run(53940, false, false, HRJobApplications);
                    end;
                }
                action("&Upload to Employee Card")
                {
                    ApplicationArea = Basic;
                    Caption = '&Upload to Employee Card';
                    Image = ImportDatabase;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Rec."Employee No" = '' then begin
                            //IF NOT CONFIRM('Are you sure you want to Upload Applicants information to the Employee Card',FALSE) THEN EXIT;
                            HRJobApplications.SetFilter(HRJobApplications."Application No", Rec."Application No");
                            Report.Run(55600, true, false, HRJobApplications);
                        end else begin
                            Message('This applicants information already exists in the employee card');
                        end;
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Application No");
                        if HRJobApplications.Find('-') then
                            Report.Run(55523, true, true, HRJobApplications);
                    end;
                }
            }
        }
    }

    var
        HRJobApplications: Record "HR Job Applications";
        // SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "Hr E-Mail Parameters";
        Employee: Record Employee;
        Text19064672: label 'Shortlisting Summary';
        Dates: Codeunit "HR Dates";
        DAge: Text[100];
}
