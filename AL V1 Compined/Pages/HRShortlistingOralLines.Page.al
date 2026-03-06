#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69271 "HR Shortlisting Oral Lines"
{
    Caption = 'Shorlisted Candidates';
    Editable = true;
    PageType = ListPart;
    SourceTable = "HR Shortlisted Applicants";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Qualified for Oral Interview"; Rec."Qualified for Oral Interview")
                {
                    ApplicationArea = Basic;
                }
                field("Job Application No"; Rec."Job Application No")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                }
                field("Stage Score"; Rec."Stage Score")
                {
                    ApplicationArea = Basic;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                }
                field(Employ; Rec.Employ)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employed';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Manual Change"; Rec."Manual Change")
                {
                    ApplicationArea = Basic;
                    Caption = 'Manual Change';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Send Interview Invitation")
            {
                ApplicationArea = Basic;
                Caption = '&Send Interview Invitation';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Qualified for Written Intervie");


                    HRJobApplications.SetFilter(HRJobApplications."Application No", Rec."Job Application No");
                    Report.Run(53940, false, false, HRJobApplications);
                end;
            }
            action("&Print1")
            {
                ApplicationArea = Basic;
                Caption = '&Print1';
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;

                trigger OnAction()
                begin
                    HRJobApplications.Reset;
                    HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Job Application No");
                    if HRJobApplications.Find('-') then
                        Report.Run(55523, true, true, HRJobApplications);
                end;
            }
        }
    }

    var
        MyCount: Integer;
        HRJobApplications: Record "HR Job Applications";


    procedure GetApplicantNo() AppicantNo: Code[20]
    begin
        //AppicantNo:=Applicant;
    end;
}
