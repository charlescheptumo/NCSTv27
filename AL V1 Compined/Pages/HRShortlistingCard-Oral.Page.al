#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69269 "HR Shortlisting Card-Oral"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Shortlist';
    SourceTable = "Employee Requisitions";
    SourceTableView = where(Status = const(Approved),
                            Closed = const(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';
                Editable = true;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Requisition DateEditable";
                    Enabled = false;
                    Importance = Promoted;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    Editable = PriorityEditable;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = Basic;
                    Editable = "Required PositionsEditable";
                    Enabled = false;
                    Importance = Promoted;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
            }
            part(Shortlisted; "HR Shortlisting Oral Lines")
            {
                SubPageLink = "Employee Requisition No" = field("Requisition No.");
            }
        }
        area(factboxes)
        {
            part(Control1102755003; "HR Jobs Factbox")
            {
                SubPageLink = "Job ID" = field("Job ID");
            }
            systempart(Control1102755001; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Applicants)
            {
                Caption = 'Applicants';
                action("&ShortList Applicants")
                {
                    ApplicationArea = Basic;
                    Caption = '&ShortList Applicants';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HRJobRequirements.Reset;
                        HRJobRequirements.SetRange(HRJobRequirements."Job Id", Rec."Job ID");
                        /*IF HRJobRequirements.COUNT=0 THEN BEGIN
                        MESSAGE('Job Requirements for the job '+ "Job ID" +' have not been setup');
                        EXIT;
                        END ELSE */
                        begin

                            //GET JOB REQUIREMENTS
                            HRJobRequirements.Reset;
                            HRJobRequirements.SetRange(HRJobRequirements."Job Id", Rec."Job ID");
                            //DELETE ALL RECORDS FROM THE SHORTLISTED APPLICANTS TABLE
                            HRShortlistedApplicants.Reset;
                            HRShortlistedApplicants.SetRange(HRShortlistedApplicants."Employee Requisition No", Rec."Requisition No.");
                            HRShortlistedApplicants.DeleteAll;


                            //GET JOB APPLICANTS
                            HRJobApplications.Reset;
                            HRJobApplications.SetRange(HRJobApplications."Employee Requisition No", Rec."Requisition No.");
                            if HRJobApplications.Find('-') then begin
                                repeat

                                    Rec.Qualified := true;
                                    if HRJobRequirements.Find('-') then begin
                                        StageScore := 0;
                                        Rec.Score := 0;
                                        repeat
                                            //GET THE APPLICANTS QUALIFICATIONS AND COMPARE THEM WITH THE JOB REQUIREMENTS
                                            AppQualifications.Reset;
                                            AppQualifications.SetRange(AppQualifications."Application No", HRJobApplications."Application No");
                                            AppQualifications.SetRange(AppQualifications."Qualification Code", HRJobRequirements."Qualification Code");
                                            if AppQualifications.Find('-') then begin
                                                Rec.Score := Rec.Score + AppQualifications."Score ID";
                                                if AppQualifications."Score ID" < HRJobRequirements."Desired Score" then
                                                    Rec.Qualified := false;
                                            end else begin
                                                Rec.Qualified := true;
                                            end;

                                        until HRJobRequirements.Next = 0;
                                    end;

                                    HRShortlistedApplicants."Employee Requisition No" := Rec."Requisition No.";
                                    HRShortlistedApplicants."Job Application No" := HRJobApplications."Application No";
                                    HRShortlistedApplicants."Stage Score" := Rec.Score;
                                    HRShortlistedApplicants."Qualified for Written Intervie" := Rec.Qualified;
                                    HRShortlistedApplicants."First Name" := HRJobApplications."First Name";
                                    HRShortlistedApplicants."Middle Name" := HRJobApplications."Middle Name";
                                    HRShortlistedApplicants."Last Name" := HRJobApplications."Last Name";
                                    HRShortlistedApplicants."ID No" := HRJobApplications."ID Number";
                                    HRShortlistedApplicants.Gender := HRJobApplications.Gender;
                                    HRShortlistedApplicants."Marital Status" := HRJobApplications."Marital Status";
                                    HRShortlistedApplicants.Insert;

                                until HRJobApplications.Next = 0;
                            end;
                            //MARK QUALIFIED APPLICANTS AS QUALIFIED
                            HRShortlistedApplicants.SetRange(HRShortlistedApplicants."Qualified for Written Intervie", true);
                            if HRShortlistedApplicants.Find('-') then
                                repeat
                                    HRJobApplications.Get(HRShortlistedApplicants."Job Application No");
                                    HRJobApplications.Qualified := true;
                                    HRJobApplications.Modify;
                                until HRShortlistedApplicants.Next = 0;
                            /*
                            RecCount:= 0;
                            MyCount:=0;
                            StageShortlist.RESET;
                            StageShortlist.SETRANGE(StageShortlist."Need Code","Need Code");
                            StageShortlist.SETRANGE(StageShortlist."Stage Code","Stage Code");

                            IF StageShortlist.FIND('-') THEN BEGIN
                            RecCount:=StageShortlist.COUNT ;
                            StageShortlist.SETCURRENTKEY(StageShortlist."Stage Score");
                            StageShortlist.ASCENDING;
                            REPEAT
                            MyCount:=MyCount + 1;
                            StageShortlist.Position:=RecCount - MyCount;
                            StageShortlist.MODIFY;
                            UNTIL StageShortlist.NEXT = 0;
                            END;
                            */
                            Message('%1', 'Shortlisting Competed Successfully.');

                        end;
                        //END ELSE
                        //MESSAGE('%1','You must select the stage you would like to shortlist.');

                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintReport;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmpReq.Reset;
                        HREmpReq.SetRange(HREmpReq."Requisition No.", Rec."Requisition No.");
                        if HREmpReq.Find('-') then
                            Report.Run(53926, true, true, HREmpReq);
                    end;
                }
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

                        /*//REPEAT
                        HRJobApplications.SETFILTER(HRJobApplications."Application No","Application No");
                        REPORT.RUN(53940,FALSE,FALSE,HRJobApplications);*/

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
                        /*HRJobApplications.RESET;
                        HRJobApplications.SETRANGE(HRJobApplications."Application No","Application No");
                        IF HRJobApplications.FIND('-') THEN
                        REPORT.RUN(55523,TRUE,TRUE,HRJobApplications);*/

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        /*
        "Required PositionsEditable" := TRUE;
        PriorityEditable := TRUE;
        ShortlistedEditable := TRUE;
        "Requisition DateEditable" := TRUE;
        "Job IDEditable" := TRUE;
        */

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    var
        HRJobRequirements: Record "HR Job Requirements";
        AppQualifications: Record "HR Applicant Qualifications";
        HRJobApplications: Record "HR Job Applications";
        Qualified: Boolean;
        StageScore: Decimal;
        HRShortlistedApplicants: Record "HR Shortlisted Applicants";
        MyCount: Integer;
        RecCount: Integer;
        HREmpReq: Record "Employee Requisitions";
        [InDataSet]
        "Job IDEditable": Boolean;
        [InDataSet]
        "Requisition DateEditable": Boolean;
        [InDataSet]
        ShortlistedEditable: Boolean;
        [InDataSet]
        PriorityEditable: Boolean;
        [InDataSet]
        "Required PositionsEditable": Boolean;
        Text19057439: label 'Short Listed Candidates';


    procedure UpdateControls()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Job IDEditable" := true;
            "Requisition DateEditable" := true;
            ShortlistedEditable := true;
            PriorityEditable := true;
            "Required PositionsEditable" := true;
        end else begin
            "Job IDEditable" := false;
            "Requisition DateEditable" := false;
            ShortlistedEditable := false;
            PriorityEditable := false;
            "Required PositionsEditable" := false;
        end;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;

        UpdateControls;
    end;
}
