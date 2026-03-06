#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69143 "Employee Appraisals"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then
                    "Job ID" := Employee.Position;
            end;
        }
        field(2; "Appraisal Type"; Code[20])
        {
            TableRelation = "Appraisal Types".Code;

            trigger OnValidate()
            begin
                AppraisalFormat.Reset;
                AppraisalFormat.SetRange(AppraisalFormat."Appraisal Code", "Appraisal Type");
                if AppraisalFormat.Find('-') then
                    repeat
                        AppraisalLines.Init;
                        AppraisalLines."Appraisal No" := "Appraisal No";
                        AppraisalLines."Employee No" := "Employee No";
                        AppraisalLines."Appraisal Type" := "Appraisal Type";
                        AppraisalLines."Appraisal Period" := "Appraisal Period";
                        AppraisalLines.Description := AppraisalFormat.Value;
                        AppraisalLines."Line No" := AppraisalLines."Line No" + 1000;
                        AppraisalLines."Appraisal Heading Type" := AppraisalFormat."Appraisal Heading Type";
                        AppraisalLines."Appraisal Header" := AppraisalFormat."Appraisal Header";
                        AppraisalLines.Bold := AppraisalFormat.Bold;
                        if not AppraisalLines.Get(AppraisalLines."Appraisal No",
                        AppraisalLines."Line No") then
                            AppraisalLines.Insert;

                    until AppraisalFormat.Next = 0;
            end;
        }
        field(3; "Appraisal Period"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Appraisal Periods".Period;
        }
        field(4; "No. Supervised (Directly)"; Integer)
        {
        }
        field(5; "No. Supervised (In-Directly)"; Integer)
        {
        }
        field(6; "Job ID"; Code[20])
        {
            TableRelation = "Company Jobs"."Job ID";
        }
        field(7; "Agreement With Rating"; Option)
        {
            OptionMembers = Entirely,Mostly,"To some extent","Not at all";
        }
        field(8; "General Comments"; Text[250])
        {
        }
        field(9; Date; Date)
        {
        }
        field(10; Rating; Code[10])
        {
            TableRelation = "Appraisal Grades";

            trigger OnValidate()
            begin
                if AppraisalGrades.Get(Rating) then
                    "Rating Description" := AppraisalGrades.Description;
            end;
        }
        field(11; "Rating Description"; Text[150])
        {
        }
        field(12; "Appraiser No"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employee.Get("Appraiser No") then
                    "Appraisers Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
        }
        field(13; "Appraisers Name"; Text[50])
        {
        }
        field(14; "Appraisee ID"; Code[20])
        {
        }
        field(15; "Appraiser ID"; Code[20])
        {
        }
        field(16; "Appraisee Name"; Text[50])
        {
        }
        field(17; "Job Group"; Code[10])
        {
        }
        field(18; "Appraiser's Job Title"; Text[50])
        {
        }
        field(19; "Appraisee's Job Title"; Text[50])
        {
        }
        field(20; "Appraisal No"; Code[20])
        {
        }
        field(21; "No. series"; Code[10])
        {
        }
        field(27; Status; Option)
        {
            Editable = false;
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(28; "Deapartment Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Appraisal No")
        {
        }
        key(Key2; "Employee No", "Appraisal Type", "Appraisal Period")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Appraisal No" = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField(HumanResSetup."Appraisal Nos");
           //  NoSeriesMgt.InitSeries(HumanResSetup."Appraisal Nos", xRec."No. series", 0D, "Appraisal No", "No. series");
            "Appraisal No" := NoSeriesMgt.GetNextNo(HumanResSetup."Appraisal Nos", Today, true);
        end;

        Date := Today;

        if UserSetup.Get(UserId) then begin

            "Appraisee ID" := UserSetup."User ID";
            //"Appraiser ID":=UserSetup."Release Service Order";
            if Employee.Get(UserSetup."Global Dimension 1 Code") then begin
                "Employee No" := Employee."No.";
                "Appraisee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                "Job Group" := Employee."Salary Scale";
                "Appraisee's Job Title" := Employee."Job Title";
                "Deapartment Code" := Employee."Global Dimension 1 Code";
                AppraisalType.Reset;
                if AppraisalType.Find('-') then
                    repeat
                        if ((Employee."Salary Scale" >= AppraisalType."Minimum Job Group") and (Employee."Salary Scale" <= AppraisalType."Maximum Job Group"
                        )) then begin
                            "Appraisal Type" := AppraisalType.Code;
                            Validate("Appraisal Type");
                        end;
                    until AppraisalType.Next = 0;

                if UserSetupSup.Get(UserSetup.Pictures) then
                    if Employee.Get(UserSetupSup."Global Dimension 1 Code") then begin
                        "Appraiser No" := Employee."No.";
                        "Appraisers Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        "Appraiser's Job Title" := Employee."Job Title";
                    end;

            end;
        end;
        EmpAppraisal.Reset;
        EmpAppraisal.SetRange(EmpAppraisal."Employee No", "Employee No");
        EmpAppraisal.SetRange(EmpAppraisal."Appraisal Type", "Appraisal Type");
        EmpAppraisal.SetRange(EmpAppraisal."Appraisal Period", "Appraisal Period");
        if EmpAppraisal.Find('-') then
            Error('You have already created an appraisal for %1', "Appraisal Period");
    end;

    var
        Employee: Record Employee;
        AppraisalGrades: Record "Appraisal Grades";
        AppraisalLines: Record "Appraisal Lines";
        AppraisalFormat: Record "Appraisal Formats";
        UserSetup: Record "User Setup";
        UserSetupSup: Record "User Setup";
        AppraisalType: Record "Appraisal Types";
        CompanyJobs: Record "Company Jobs";
        HRsetup: Record "Human Resources Setup";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        EmpAppraisal: Record "Employee Appraisals";
}
