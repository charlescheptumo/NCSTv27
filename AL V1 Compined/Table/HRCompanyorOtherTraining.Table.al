#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69123 "HR Company or Other Training"
{
    LookupPageID = "Training Needs-Submitted";

    fields
    {
        field(1; "Employee No."; Code[10])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(2; "Course Title"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Training Needs"."No.";

            trigger OnValidate()
            begin
                if TrainingNeeds.Get("Course Title") then
                    Description := TrainingNeeds.Description;
            end;
        }
        field(3; "Cost Incurred By Employee"; Decimal)
        {

            trigger OnValidate()
            begin
                if Posted then begin
                    if Results <> xRec.Results then begin
                        Message('%1', 'You cannot change the costs after posting');
                        Results := xRec.Results;
                    end
                end
            end;
        }
        field(4; "Educaion Credits"; Decimal)
        {
        }
        field(5; "Training Credits"; Decimal)
        {
        }
        field(6; "Certificate Number"; Code[20])
        {
        }
        field(7; Results; Text[15])
        {
        }
        field(8; Competency; Option)
        {
            OptionMembers = " ",Competent,"Not yet competent";

            trigger OnValidate()
            begin
                if Competency <> xRec.Competency then begin
                    if Competency = Competency::Competent then begin
                        if TrainingNeeds.Get("Course Title") then begin
                            if Qualifications.Get(TrainingNeeds.Qualification) then begin
                                EmpQualifications.Init;
                                EmpQualifications."Employee No." := "Employee No.";
                                // EmpQualifications."Qualification Type":=Qualifications.Type;
                                EmpQualifications."Qualification Code" := Qualifications.Code;
                                EmpQualifications.Validate(EmpQualifications."Qualification Code");
                                EmpQualifications."From Date" := TrainingNeeds."Start Date";
                                EmpQualifications."To Date" := TrainingNeeds."End Date";
                                EmpQualifications.Type := EmpQualifications.Type::Internal;
                                EmpQualifications."Institution/Company" := TrainingNeeds.Provider;
                                EmpQualifications.Insert;

                            end;
                        end;
                    end;
                end;

                if Competency <> xRec.Competency then begin
                    if Competency <> Competency::Competent then begin
                        if xRec.Competency = Competency::Competent then begin
                            if TrainingNeeds.Get("Course Title") then begin
                                if EmpQualifications.Get("Employee No.", TrainingNeeds.Qualification) then
                                    EmpQualifications.Delete;
                            end;

                        end;
                    end;
                end;
            end;
        }
        field(9; "Date of re-assessment"; Date)
        {
        }
        field(10; Post; Boolean)
        {
        }
        field(11; Posted; Boolean)
        {
            Editable = true;
        }
        field(12; Description; Text[250])
        {
        }
        field(13; "Need Source"; Option)
        {
            OptionCaption = 'Appraisal,Succesion,Training,Employee,Employee Skill Plan';
            OptionMembers = Appraisal,Succesion,Training,Employee,"Employee Skill Plan";
            TableRelation = "Training Needs"."Need Source" where("No." = field("Course Title"));
        }
        field(14; Approved; Boolean)
        {
        }
        field(27; fsdf; Text[30])
        {
        }
        field(28; "Training Evaluation"; Text[250])
        {
        }
        field(29; "Request No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Course Title")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if TrainingReq.Get("Request No") then
            "Employee No." := TrainingReq."Employee No";
    end;

    var
        Employee: Record Employee;
        OK: Boolean;
        TrainingNeeds: Record "Training Needs";
        Qualifications: Record Qualification;
        EmpQualifications: Record "Employee Qualification";
        TrainingReq: Record "Training Request";
}
