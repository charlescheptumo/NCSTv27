#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69224 "Training Evaluation Header"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; Name; Text[200])
        {
        }
        field(3; "Department Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal.Code, "Department Code");
                if DimVal.Find('-') then
                    "Department Name" := DimVal.Name;
            end;
        }
        field(4; "Training Code"; Code[30])
        {
            TableRelation = "Training Requests".Code;

            trigger OnValidate()
            begin
                //Course.RESET;
                if Course.Get("Training Code") then begin
                    "Training Description" := Course.Description;
                    "Start Date" := Course."Actual Start Date";
                    "End Date" := Course."Actual End Date";
                end;
            end;
        }
        field(5; "Training Description"; Text[50])
        {
        }
        field(6; "No. Series"; Code[20])
        {
        }
        field(7; "Start Date"; Date)
        {
        }
        field(8; "End Date"; Date)
        {
        }
        field(9; Comments; Text[250])
        {
        }
        field(10; "Department Name"; Text[30])
        {
        }
        field(11; "What did you Learn"; Text[250])
        {
        }
        field(12; "What did you not undestand"; Text[250])
        {
        }
        field(13; "Emp No."; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if HRRec.Get("Emp No.") then begin
                    Name := HRRec."First Name" + ' ' + HRRec."Last Name";
                    "Department Code" := HRRec."Global Dimension 1 Code";
                    Validate("Department Code");
                end;
            end;
        }
        field(14; Submitted; Boolean)
        {
        }
        field(17; "Supervisor's Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18; Challenges; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Course content"; Option)
        {
            Caption = 'Did the course content meet your needs';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(20; "Training Gaps"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Presentation match"; Option)
        {
            Caption = 'Did the presentation match the descriptionin course content';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(22; Objectives; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Training Objectives Achieved?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Training Gaps Adressed?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Any Challenge Encountered?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Topics delivered as stated"; Option)
        {
            Caption = 'Were topics delivered as stated in the course time-table';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(27; "Material Relevance"; Option)
        {
            Caption = 'Were Textbooks/Materials/Handouts relevant to the course';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(28; "Adequate training aids"; Option)
        {
            Caption = 'Were there adequate training aids & equipment';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(29; "Comments About the Facilitator"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Knowledge and adherence"; Option)
        {
            Caption = 'Knowledge and adherence to the subject matter';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Poor,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Poor,Fair,Good,"Very Good",Excellent;
        }
        field(31; "Preparation for each class"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Poor,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Poor,Fair,Good,"Very Good",Excellent;
        }
        field(32; "Communicated material"; Option)
        {
            Caption = 'Communicated material effectively';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Poor,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Poor,Fair,Good,"Very Good",Excellent;
        }
        field(33; "Responded well"; Option)
        {
            Caption = 'Responded well to participants questions';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Poor,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Poor,Fair,Good,"Very Good",Excellent;
        }
        field(34; "Positive rapport"; Option)
        {
            Caption = 'Established positive rapport with participants';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Poor,Fair,Good,Very Good,Excellent';
            OptionMembers = " ",Poor,Fair,Good,"Very Good",Excellent;
        }
        field(35; "Give suggestions"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if No = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Training Evaluation Nos");
           //NoSeriesMgt.InitSeries(HRSetup."Training Evaluation Nos", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(HRSetup."Training Evaluation Nos", Today, true);
            //"GL Account":=HRSetup."Account No (Training)";
        end;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Course: Record "Training Requests";
        DimVal: Record "Dimension Value";
        HRRec: Record Employee;
}
