#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56209 "Annual Appraisal"
{
    PageType = Card;
    SourceTable = "Annual Appraisal";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Date created"; Rec."Date created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Depot Name"; Rec."Depot Name")
                {
                    ApplicationArea = Basic;
                }
                field(Mission; Rec.Mission)
                {
                    ApplicationArea = Basic;
                }
                field(Vision; Rec.Vision)
                {
                    ApplicationArea = Basic;
                }
                field("Core Values"; Rec."Core Values")
                {
                    ApplicationArea = Basic;
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Terms of service"; Rec."Terms of service")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                }
                field("Acting Appointment"; Rec."Acting Appointment")
                {
                    ApplicationArea = Basic;
                }
                field("Length of service"; Rec."Length of service")
                {
                    ApplicationArea = Basic;
                }
                field("Duration in present position"; Rec."Duration in present position")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Assignment"; ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Rec."Additional Assignment");
                        Rec."Additional Assignment".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec."Additional Assignment");
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec."Additional Assignment".CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field(Remarks; ObjText2)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Rec.Remarks);
                        Rec.Remarks.CreateInstream(ObjInstr2);
                        Obj2.Read(ObjInstr2);

                        if ObjText2 <> Format(Obj2) then begin
                            Clear(Rec.Remarks);
                            Clear(Obj2);
                            Obj2.AddText(ObjText2);
                            Rec.Remarks.CreateOutstream(ObjOutStr2);
                            Obj2.Write(ObjOutStr2);
                            //MODIFY;
                        end;
                    end;
                }
                field(ApproverID; Rec.ApproverID)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Code"; Rec."Supervisor Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Designation"; Rec."Supervisor Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Second ApproverID"; Rec."Second ApproverID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Second Supervisor Code"; Rec."Second Supervisor Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Second Supervisor Name"; Rec."Second Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Second Supervisor Designation"; Rec."Second Supervisor Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total score self rating"; Rec."Total score self rating")
                {
                    ApplicationArea = Basic;
                }
                field("Total score Supervisor"; Rec."Total score Supervisor")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Mean Appraisal score"; Rec."Mean Appraisal score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Actual of Eighty"; Rec."Actual of Eighty")
                {
                    ApplicationArea = Basic;
                }
                field("Competency/skill Total"; Rec."Competency/skill Total")
                {
                    ApplicationArea = Basic;
                }
                field("Previous score"; Rec."Previous score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("CompetenceTotal Overall rating"; Rec."CompetenceTotal Overall rating")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22; "Departmental Objectives App")
            {
                Editable = true;
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control60; "Annual Appraisal Lines")
            {
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control62; "Rating Appraisal")
            {
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control39; "Appraisal Values")
            {
                Caption = 'Appraisal Values (1 = Fails to Meet, 2 = meets minimum requirements, 3 = Meets requirements, 4 = Meets and exceeds requirements, 5 = Clearly exceeds requirements)';
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control28; "Training & Development Needs")
            {
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control47; "Appraisee coments")
            {
                Caption = 'Appraissee┬s comments on performance (based on 3a & b)';
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control41; "Superviser coments")
            {
                Caption = 'Supervisor┬s comments on performance (based on 3a & b)';
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control72; "Second Superviser comments")
            {
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control29; "Helpdesk Requisition Allocatio")
            {
                SubPageLink = "Job No." = field(No);
            }
            part(Control38; "Superviser comentsMid")
            {
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control48; "Mid-Year Review")
            {
                Caption = 'Targets Varied Mid-Year ';
                SubPageLink = "Appraisal No" = field(No);
            }
            group("Appraisee comments on appraisal")
            {
                Caption = 'Appraisee comments on appraisal';
                field("Discussion help you"; Rec."Discussion help you")
                {
                    ApplicationArea = Basic;
                }
                field("Discussion take place"; Rec."Discussion take place")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control70; "Appraisee comentsO")
            {
                Caption = 'General Comments on your overall performance';
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control71; "Superviser comentsO")
            {
                Caption = 'Supervisors┬ General Comments on overall performance:';
                SubPageLink = "Appraisal No" = field(No);
            }
            part(Control37; "Superviser comentsO")
            {
                Caption = 'Comments on the consistency and reasonableness of the comments given by the supervisor and any significant statements made by the appraisee ';
                SubPageLink = "Appraisal No" = field(No);
            }
            group(Recommendations)
            {
                field("Recommended reward or sanction"; Rec."Recommended reward or sanction")
                {
                    ApplicationArea = Basic;
                }
                field("Other recommendation"; Rec."Other recommendation")
                {
                    ApplicationArea = Basic;
                }
                field(Recommendation; Rec.Recommendation)
                {
                    ApplicationArea = Basic;
                }
                field("Meeting held on"; Rec."Meeting held on")
                {
                    ApplicationArea = Basic;
                }
                field("Minutes No."; Rec."Minutes No.")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control13; "Managing Director comments")
            {
                SubPageLink = "Appraisal No" = field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control21; Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send to the Supervisor")
            {
                ApplicationArea = Basic;
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::"Sent to supervisor";
                    Rec.Modify;
                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange(Rec.No, Rec.No);
                    Report.Run(56205, true, true, Rec);
                end;
            }
        }
    }

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        Obj2: BigText;
        ObjInstr2: InStream;
        ObjOutStr2: OutStream;
        ObjText2: Text;
}
