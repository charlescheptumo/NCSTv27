#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70178 "Bid Evaluation Register"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Bid Opening Nos");
                    NoMgt.TestManual(ProcurementSetup."Bid Opening Nos");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Evaluation Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation,Due Dilligence';
            OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation","Due Dilligence";
        }
        field(3; "Evaluator Category"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Evaluation Committee,Individual Evaluator';
            OptionMembers = "Evaluation Committee","Individual Evaluator";
        }
        field(4; "Evaluation Lead"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";
        }
        field(5; "Evaluation Lead Name"; Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Bid No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote),
                                                           "Invitation For Supply No" = field("IFS Code"));

            trigger OnValidate()
            begin
                Bids.Reset;
                Bids.SetRange("No.", "Bid No.");
                if Bids.FindSet then begin
                    if "Evaluation Type" = "evaluation type"::"Preliminary Evaluation" then
                        Description := 'Preliminary Evaluation: ' + "Bid No."
                    else if "Evaluation Type" = "evaluation type"::"Technical Evaluation" then
                        Description := 'Technical Evaluation: ' + "Bid No."
                    else
                        Description := 'Financial Evaluation: ' + "Bid No.";
                    "Vendor No." := Bids."Buy-from Vendor No.";
                    "Bidder Name" := Bids."Buy-from Vendor Name";
                end;
                Validate("Bid Scoring Document No.");
            end;
        }
        field(7; "Vendor No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(8; "Bidder Name"; Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(10; "Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Evaluation Venue"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "IFS Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                IFS.Reset;
                IFS.SetRange(Code, "IFS Code");
                if IFS.FindSet then begin
                    Validate("Appointed Bid Evaluation Commi", IFS."Bid Evaluation Committe");
                    "Primary Region" := IFS."Requesting Region";
                    "Bid Envelop Type" := IFS."Bid Envelop Type";
                    Validate("Bid Scoring Document No.", IFS."Bid Scoring Template");
                    //VALIDATE("Bid Scoring Document No.");
                    "Bid Opening Register No." := IFS."Bid Opening Register";
                    //Description:='Preliminary Evaluation: '+"Bid No.";
                    "Bid Opening Date" := IFS."Bid Opening Date";
                    "Appointed Bid Evaluation Commi" := IFS."Bid Evaluation Committe";
                    "Evaluation Venue" := IFS."Bid Opening Venue";
                    "Tender Evaluation Deadline" := CalcDate(ProcurementSetup."Default Tender Evaluation Peri", "Bid Opening Date");
                    "Document Status" := "document status"::Active;
                    "Evaluation Date" := Today;
                    "Purchaser Code" := IFS."Purchaser Code";
                    if "Evaluation Type" = "evaluation type"::"Financial Evaluation" then
                        Description := 'Financial Evaluation: ' + "IFS Code";
                    "Finance Opening Register No." := IFS."Finance Opening Register";
                    "Finance Opening Date" := IFS."Finance Bid Opening Date";
                end;
            end;
        }
        field(13; "Bid Scoring Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = '30';
            Editable = false;
            TableRelation = "Bid Scoring Template".Code;

            trigger OnValidate()
            begin
                Bidevaluationscore.Reset;
                if Bidevaluationscore.FindLast then
                    LineNo := Bidevaluationscore."Line No";

                Bidevaluationscore.Reset;
                Bidevaluationscore.SetRange("Bid Scoring Document No.", "Bid Scoring Document No.");
                Bidevaluationscore.SetRange(Code, Code);
                if Bidevaluationscore.FindSet then begin
                    Bidevaluationscore.DeleteAll;

                end;

                BidEvaluationCriteria.Reset;
                BidEvaluationCriteria.SetRange("Template ID", "Bid Scoring Document No.");
                BidEvaluationCriteria.SetRange("Document No", Code);
                if BidEvaluationCriteria.FindSet then begin
                    BidEvaluationCriteria.DeleteAll;
                end;

                BidEvalScore.Reset;
                BidEvalScore.SetRange("Template ID", "Bid Scoring Document No.");
                BidEvalScore.SetRange("Document No", Code);
                if BidEvalScore.FindSet then begin
                    BidEvalScore.DeleteAll;
                end;

                BidSCoreGuide.Reset;
                BidSCoreGuide.SetRange("Template ID", "Bid Scoring Document No.");
                BidSCoreGuide.SetRange("Evaluation Type", "Evaluation Type");
                if BidSCoreGuide.FindSet then begin
                    repeat
                        Bidevaluationscore.Init;
                        Bidevaluationscore.Code := Code;
                        Bidevaluationscore."Line No" := LineNo + 1;
                        ;
                        Bidevaluationscore."Bid No." := "Bid No.";
                        Bidevaluationscore."Vendor No." := "Vendor No.";
                        Bidevaluationscore."Criteria Group" := BidSCoreGuide."Criteria Group ID";
                        Bidevaluationscore."Requirement ID" := BidSCoreGuide."Requirement ID";
                        Bidevaluationscore."Evaluation Requirement" := BidSCoreGuide."Evaluation Requirement";
                        Bidevaluationscore."Rating Type" := BidSCoreGuide."Rating Type";
                        Bidevaluationscore."Target Qty" := BidSCoreGuide."Target Qty";
                        Bidevaluationscore."Target Value/KPI" := BidSCoreGuide."Target Value";
                        Bidevaluationscore."Unit of Measure" := BidSCoreGuide."Unit of Measure";
                        //Bidevaluationscore."Response Value":=Bid
                        //Bidevaluationscore."Bid Response Actual Qty":=BidSCoreGuide.
                        //Bidevaluationscore."Score %":=
                        Bidevaluationscore."Assigned Weight %" := BidSCoreGuide."Assigned Weight %";
                        //Bidevaluationscore."Weighted Line Score":=BidSCoreGuide.
                        Bidevaluationscore."Equipment Type" := BidSCoreGuide."Equipment Type";
                        Bidevaluationscore."Desired Perfomance Direction" := BidSCoreGuide."Desired Perfomance Direction";
                        Bidevaluationscore."Bid Scoring Document No." := "Bid Scoring Document No.";
                        Bidevaluationscore.Insert(true);
                        LineNo += 1;
                    until BidSCoreGuide.Next = 0;
                end;

                //add bid evaluation criteria
                EvaluationCriteria.Reset;
                EvaluationCriteria.SetRange("Template ID", "Bid Scoring Document No.");
                EvaluationCriteria.SetRange("Evaluation Type", "Evaluation Type");
                if EvaluationCriteria.FindSet then begin
                    repeat
                        BidEvaluationCriteria.Init;
                        BidEvaluationCriteria."Template ID" := EvaluationCriteria."Template ID";
                        BidEvaluationCriteria."Criteria Group ID" := EvaluationCriteria."Criteria Group ID";
                        BidEvaluationCriteria."Document No" := Code;
                        BidEvaluationCriteria."Evaluation Type" := EvaluationCriteria."Evaluation Type";
                        BidEvaluationCriteria.Description := EvaluationCriteria.Description;
                        BidEvaluationCriteria."Total Weight %" := EvaluationCriteria."Total Weight %";
                        BidEvaluationCriteria.Insert(true);
                    until EvaluationCriteria.Next = 0;
                end;

                //add Bid Evaluation Score Guide
                BidScore.Reset;
                BidScore.SetRange("Template ID", "Bid Scoring Document No.");
                BidScore.SetRange("Evaluation Type", "Evaluation Type");
                if BidScore.FindSet then begin
                    repeat
                        BidEvalScore.Init;
                        BidEvalScore."Template ID" := BidScore."Template ID";
                        BidEvalScore."Criteria Group ID" := BidScore."Criteria Group ID";
                        BidEvalScore."Requirement ID" := BidScore."Requirement ID";
                        BidEvalScore."Entry No" := BidScore."Entry No";
                        BidEvalScore."Response Value" := BidScore."Response Value";
                        BidEvalScore."Document No" := Code;
                        BidEvalScore."Target Qty" := BidScore."Target Qty";
                        BidEvalScore."Rating Type" := BidScore."Rating Type";
                        BidEvalScore."Evaluation Type" := BidScore."Evaluation Type";
                        BidEvalScore."Desired Perfomance Direction" := BidScore."Desired Perfomance Direction";
                        BidEvalScore."Min Bid Value" := BidScore."Min Bid Value";
                        BidEvalScore."Max Bid Value" := BidScore."Max Bid Value";
                        BidEvalScore."Min Date Value" := BidScore."Min Date Value";
                        BidEvalScore."Max Date Value" := BidScore."Max Date Value";
                        BidEvalScore."Score %" := BidScore."Score %";
                        BidEvalScore.Insert(true);
                    until BidScore.Next = 0;
                end;
            end;
        }
        field(14; "Bid Scoring Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Bid Score Template,Bid Score Voucher';
            OptionMembers = "Bid Score Template","Bid Score Voucher";
        }
        field(15; "Bid Opening Register No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Bid Opening Register".Code;
        }
        field(16; "Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Tender Evaluation Deadline"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Appointed Bid Evaluation Commi"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Appointed Bid Evaluation Committee';
            TableRelation = "IFS Tender Committee"."Document No.";

            trigger OnValidate()
            begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Appointed Bid Opening Com", "Appointed Bid Evaluation Commi");
                BidCommitte.SetRange("Document No.", Code);
                if BidCommitte.FindSet then begin
                    BidCommitte.DeleteAll;
                end;

                UserSetup.Get(UserId);
                IFSTenderCommitte.Reset;
                IFSTenderCommitte.SetRange("Document No.", "Appointed Bid Evaluation Commi");
                if IFSTenderCommitte.FindSet then begin
                    repeat

                        BidCommitte.Init;
                        BidCommitte."Document No." := Code;
                        BidCommitte."Line No" := IFSTenderCommitte."Line No";
                        BidCommitte."Appointed Bid Opening Com" := "Appointed Bid Evaluation Commi";
                        BidCommitte."Role Type" := IFSTenderCommitte.Role;

                        BidCommitte."Member No." := IFSTenderCommitte."Member No.";
                        BidCommitte."Member Name" := IFSTenderCommitte."Member Name";
                        if "Evaluator Category" = "evaluator category"::"Evaluation Committee" then begin
                            if BidCommitte."Role Type" = BidCommitte."role type"::Chairperson then begin
                                "Evaluation Lead" := BidCommitte."Member No.";
                                "Evaluation Lead Name" := BidCommitte."Member Name";
                            end;
                        end else begin
                            "Evaluation Lead" := UserSetup."Employee No.";
                            "Evaluation Lead Name" := UserSetup."Employee Name";
                        end;
                        BidCommitte.Designation := IFSTenderCommitte.Designation;
                        BidCommitte."ID/Passport No" := IFSTenderCommitte."ID/Passport No";
                        BidCommitte."Tax Registration (PIN) No." := IFSTenderCommitte."Tax Registration (PIN) No.";
                        BidCommitte.Email := IFSTenderCommitte."Member Email";
                        BidCommitte."Telephone No." := IFSTenderCommitte."Telephone No.";
                        BidCommitte."Staff  No." := IFSTenderCommitte."Staff  No.";
                        BidCommitte."IFS Code" := "IFS Code";
                        BidCommitte.Insert(true);

                    until IFSTenderCommitte.Next = 0;
                end;
            end;
        }
        field(19; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Bid Envelop Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = '1-Envelop,2-Envelop';
            OptionMembers = "1-Envelop","2-Envelop";
        }
        field(21; "Final Opening Done"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Purchaser Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
        field(23; "Preliminary Evaluation Score"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Responsive,Non-Responsive';
            OptionMembers = ,Responsive,"Non-Responsive";
        }
        field(24; "Weighted Technical Eval Score"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Weighted Technical Evaluation  Score';
        }
        field(25; "Technical Evaluation  Decision"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(26; "Weighted Financial Eval Score"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Weighted Financial Evaluation  Score';
        }
        field(27; "Award Decision"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Award,Unsuccesful';
            OptionMembers = ,Award,Unsuccesful;
        }
        field(28; "Tender Evaluation Comm Remarks"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'Tender Evaluation Committee Remarks';
        }
        field(29; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(30; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Posted Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Preliminary Evaluation No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Evaluation Register".Code where("Evaluation Type" = const("Preliminary Evaluation"),
                                                                  "Preliminary Evaluation Score" = const(Responsive));

            trigger OnValidate()
            begin
                BidEvaluationregister.Reset;
                BidEvaluationregister.SetRange(Code, "Preliminary Evaluation No");
                if BidEvaluationregister.FindSet then begin
                    Validate("IFS Code", BidEvaluationregister."IFS Code");
                    Validate("Bid No.", BidEvaluationregister."Bid No.");
                end;
            end;
        }
        field(38; "No of Passed Requirements"; Integer)
        {
            CalcFormula = count("Bid Evaluation Score Entry" where(Code = field(Code),
                                                                    "Evaluation Results" = const(Pass)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "No of Failed Requirements"; Integer)
        {
            CalcFormula = count("Bid Evaluation Score Entry" where(Code = field(Code),
                                                                    "Evaluation Results" = const(Fail)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Finance Opening Register No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Bid Opening Register".Code;
        }
        field(41; "Finance Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(42; "Tech Evaluation Ranking"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Due Dilgence Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Due Diligence Rating"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Due Diligence Assessment Rating';
        }
        field(45; "Due Diligence Report ID"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(46; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Bid Opening Nos");
         //   NoMgt.InitSeries(ProcurementSetup."Bid Opening Nos", xRec."No. Series", 0D, Code, "No. Series");
         code:= NoMgt.GetNextNo(ProcurementSetup."Bid Opening Nos", Today, true);
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Evaluation Date" := Today;
        "Created Time" := Time;
        if "Evaluator Category" = "evaluator category"::"Individual Evaluator" then begin
            Emp.Reset;
            Emp.SetRange("User ID", UserId);
            if Emp.FindSet then begin
                BidCommitte.Reset;
                BidCommitte.SetRange("Member No.", Emp."No.");
                BidCommitte.SetRange("Role Type", BidCommitte."role type"::Secretary);
                if BidCommitte.FindSet then begin
                    Error('Below Role Type %1 is not allowed to do review ', BidCommitte."role type"::Secretary);
                end;
            end;
        end;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
        IFS: Record "Standard Purchase Code";
        IFSTenderCommitte: Record "IFS Tender Committee Member";
        BidCommitte: Record "Bid Evaluation Committee";
        Bids: Record "Purchase Header";
        Bidevaluationscore: Record "Bid Evaluation Score Entry";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidEvaluationregister: Record "Bid Evaluation Register";
        BidOpening: Record "Bid Opening Register";
        UserSetup: Record "User Setup";
        Emp: Record Employee;
}
