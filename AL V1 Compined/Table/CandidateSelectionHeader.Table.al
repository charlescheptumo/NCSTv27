#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69706 "Candidate Selection Header"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Candidate Shortlisting,Interview Invitation,Consolidated Interview Report';
            OptionMembers = "Candidate Shortlisting","Interview Invitation","Consolidated Interview Report";
        }
        field(2; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Source Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Final Shortlisting,Previous Interview';
            OptionMembers = " ","Final Shortlisting","Previous Interview";
        }
        field(4; "Source Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Source Type" = filter("Final Shortlisting")) "Candidate Selection Header"."Document No." where("Document Type" = filter("Candidate Shortlisting"),
                                                                                                                               "Vacancy ID" = field("Vacancy ID"))
            else
            if ("Source Type" = filter("Previous Interview")) "Candidate Selection Header"."Document No." where("Document Type" = filter("Interview Invitation"),
                                                                                                                                                                                                                                       "Vacancy ID" = field("Vacancy ID"),
                                                                                                                                                                                                                                       Posted = filter(true));
        }
        field(5; "Interview Invitation No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PreScreen Header"."Document No.";
        }
        field(6; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Candidate Shortlist No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Ability Test Report ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Phone Interview ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Vacancy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"), Published = const(true));

            trigger OnValidate()
            begin
                RequisitionHeader.Reset;
                RequisitionHeader.SetRange("Document No.", "Vacancy ID");
                if RequisitionHeader.FindFirst then begin
                    Description := Format(RequisitionHeader."Document Type") + ' ' + RequisitionHeader."Job Title/Designation";
                    "No. of openings" := RequisitionHeader."No of Openings";
                    RequisitionHeader.CalcFields("No. of Applications");
                    "No. of Submitted Applications" := RequisitionHeader."No. of Applications";
                    Region := RequisitionHeader.Region;
                    "Employment Type" := RequisitionHeader."Employment Type";
                    "Position ID" := RequisitionHeader."Position ID";
                    "Job Title" := RequisitionHeader."Job Title/Designation";
                    "Planned end Date" := RequisitionHeader."Planned Recruitment End Date";
                    "Planned Start Date" := RequisitionHeader."Planned Recruitment Start Date";
                    Directorate := RequisitionHeader.Directorate;
                    Department := RequisitionHeader.Department;
                    "Default Terms of Service Code" := RequisitionHeader."Default Terms of Service Code";
                    "Application Closing Date" := RequisitionHeader."Application Closing Date";
                    "Application Closing Time" := RequisitionHeader."Application Closing Time";
                    "Seniority Level" := RequisitionHeader."Seniority Level";
                    Region := RequisitionHeader.Region;
                end
            end;
        }
        field(11; "Appointed Selection Comm ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher";

            trigger OnValidate()
            var
                LastLineNo: Integer;
            begin
                CommiteeAppointedMember.Reset;
                CommiteeAppointedMember.SetRange("Document No.", "Appointed Selection Comm ID");
                if CommiteeAppointedMember.FindSet then begin
                    repeat
                        CandidateSelectionCommittee.Init;
                        CandidateSelectionCommittee.SetRange("Document No.", "Document No.");
                        if CandidateSelectionCommittee.FindLast() then begin
                            LastLineNo := CandidateSelectionCommittee."Line No." + 1;
                        end else begin
                            LastLineNo := 0;
                        end;
                        CandidateSelectionCommittee."Document No." := "Document No.";
                        CandidateSelectionCommittee."Line No." := LastLineNo;
                        CandidateSelectionCommittee."Appointed Committee ID" := CommiteeAppointedMember."Document No.";
                        CandidateSelectionCommittee."Member No." := CommiteeAppointedMember."Member No.";
                        CandidateSelectionCommittee.Name := CommiteeAppointedMember."Member Name";
                        CandidateSelectionCommittee."Phone No." := CommiteeAppointedMember."Telephone No.";
                        CandidateSelectionCommittee.Email := CommiteeAppointedMember."Member Email";
                        CandidateSelectionCommittee."Staff No." := CommiteeAppointedMember."Staff No.";
                        CandidateSelectionCommittee.Designation := CommiteeAppointedMember.Designation;
                        CandidateSelectionCommittee.Insert(true);
                    until CommiteeAppointedMember.Next = 0;
                end;
            end;
        }
        field(12; "Selection Committee Chair"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointed Member"."Member No." where(Role = filter(Chairperson));
        }
        field(13; "Lead HR Officer"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Officers";
        }
        field(14; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Primary Contact Person"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Primary Contact Phone"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Primary Contact Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Additional Comments"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Interview Mode"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Physical(Face to Face),Phone Interview,Online';
            OptionMembers = " ","Physical(Face to Face)","Phone Interview",Online;
        }
        field(20; "Position ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";

            trigger OnValidate()
            begin
                CompanyPositions.Reset;
                CompanyPositions.SetRange("Position ID", "Position ID");
                if CompanyPositions.FindFirst then begin
                    "Job Title" := CompanyPositions."Job Title";
                    Directorate := CompanyPositions.Directorate;
                    Department := CompanyPositions.Department;
                    "Seniority Level" := CompanyPositions."Seniority Level";
                    "Default Terms of Service Code" := CompanyPositions."Default Terms of Service";

                end
            end;
        }
        field(21; "Job Title"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "No. of openings"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24; Department; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25; Region; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Seniority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior Level",Executive;
        }
        field(27; "Default Terms of Service Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
        field(29; "Application Closing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Application Closing Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Minimum Academic Qualification"; Code[30])
        {
            DataClassification = ToBeClassified;
            // muga
            // TableRelation = Qualification where("Qualification Category" = filter(Academic),
            //                                      Blocked = filter(false));

            // 
            // trigger OnValidate()
            // begin
            //     if Qualification.Get("Minimum Academic Qualification") then
            //         "Min Academic Hierarchy Pointer" := Qualification."Academic Hierachy Code";
            // end;
        }
        field(32; "Min Academic Hierarchy Pointer"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Minimum Work Experience"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Minimum Mngmnt Experience"; Integer)
        {
            Caption = 'Minimum Management Experience';
            DataClassification = ToBeClassified;
        }
        field(35; "Shortlisting Venue"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Planned end Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "No. of Submitted Applications"; Integer)
        {
            CalcFormula = count("Job Applications" where("Vacancy Id" = field("Vacancy ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "No. of Apptitude Invitees"; Integer)
        {
            CalcFormula = count("PreScreening Line" where("Vacancy ID" = field("Vacancy ID"),
                                                           "Document Type" = filter("Ability Test Invitation")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "No. of Final Shortlisted Candi"; Integer)
        {
            CalcFormula = count("Candidate Shortlist Matrix" where("Vacancy ID" = field("Vacancy ID"),
                                                                    "Document Type" = filter("Candidate Shortlisting")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Missed Academic Total"; Integer)
        {
            CalcFormula = count("Shortlist Failed Academic" where("Vacancy ID" = field("Vacancy ID"),
                                                                   "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "Missed Management Total"; Integer)
        {
            CalcFormula = count("Shortlist Failed Management" where("Vacancy ID" = field("Vacancy ID"),
                                                                     "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "Missed General Total"; Integer)
        {
            CalcFormula = count("Shortlist Failed General" where("Vacancy ID" = field("Vacancy ID"),
                                                                  "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(44; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(45; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(47; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Interview Scoresheet Template"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Screening Template".Code where("Template Type" = filter("Interview Scoresheet"));
        }
        field(50; "Approval Status"; Enum "App Status")
        {
            Editable = false;
        }
        field(51; "Missed Specialization Total"; Integer)
        {
            CalcFormula = count("Shortlist Failed Specializatio" where("Vacancy ID" = field("Vacancy ID"),
                                                                  "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(52; "Missed Attained Score Total"; Integer)
        {
            // CalcFormula = count("Shortlist Failed Specializatio" where("Vacancy ID" = field("Vacancy ID"),
            //                                                       "Document No." = field("Document No.")));
            Editable = false;
            // FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
        key(key2; "Appointed Selection Comm ID")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HRSetup.Get;
        //muga
        // if "Document Type" = "document type"::"Candidate Shortlisting" then begin
        //     HRSetup.TestField("Shortlisting Voucher Nos.");
        //     if "Document No." = '' then
        //         NoSeriesMgt.InitSeries(HRSetup."Shortlisting Voucher Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        // end;
        // if "Document Type" = "document type"::"Consolidated Interview Report" then begin
        //     HRSetup.TestField("Interview Report Nos.");
        //     if "Document No." = '' then
        //         NoSeriesMgt.InitSeries(HRSetup."Interview Report Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");

        // end;
        // if "Document Type" = "document type"::"Interview Invitation" then begin
        //     HRSetup.TestField("Interview Invitation Nos.");
        //     if "Document No." = '' then
        //         NoSeriesMgt.InitSeries(HRSetup."Interview Invitation Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");

        // end;
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        "Document Date" := Today;
    end;

    var
        Qualification: Record Qualification;
        CompanyPositions: Record "Company Positions";
        RequisitionHeader: Record "Recruitment Requisition Header";
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "Human Resources Setup";
        CommiteeAppointedMember: Record "Commitee Appointed Member";
        CandidateSelectionCommittee: Record "Candidate Selection Committee";
}

