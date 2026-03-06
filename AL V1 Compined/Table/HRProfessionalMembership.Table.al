#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69151 "HR Professional Membership"
{
    LookupPageID = "HR Disciplinary Cases SF";

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employee."No." where("No." = field("Employee No."));

            trigger OnValidate()
            begin


                if Employee.Get("Employee No.") then begin
                    "Employee First Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";

                end;


                /* Employee.GET("Employee No.");
              IF OK THEN BEGIN
               "Employee First Name":= Employee."First Name";
               "Employee Last Name":= Employee."Last Name";
              END;*/

            end;
        }
        field(2; "Date Admitted"; Date)
        {
        }
        field(3; Organisation; Code[20])
        {
        }
        field(4; "Membership Type"; Code[20])
        {
        }
        field(5; Designation; Text[30])
        {
        }
        field(6; "Annual Fee"; Decimal)
        {
        }
        field(7; "Renewal Date"; Date)
        {
        }
        field(8; "Company Pays Fees"; Boolean)
        {
        }
        field(9; "Employee First Name"; Text[30])
        {
        }
        field(10; "Employee Last Name"; Text[30])
        {
        }
        field(11; Comment; Boolean)
        {
            Editable = false;
        }
        field(12; "Language Code (Default)"; Code[10])
        {
        }
        field(13; Attachement; Option)
        {
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(14; "Membership No"; Code[20])
        {
        }
        field(15; "Member No"; Code[10])
        {
        }
        field(16; "Membership Description"; Text[100])
        {
        }
        field(17; "No. Series"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Date Admitted")
        {
            Clustered = true;
        }
        key(Key2; "Membership No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Membership No" = '' then begin
            HumanResourceSetup.Get;
            //  HumanResourceSetup.TESTFIELD(HumanResourceSetup."Membership No.");
          //  NoSeriesMgt.InitSeries(HumanResourceSetup."Membership No.", xRec."No. Series", 0D, "Membership No", "No. Series");
            "Membership No" := NoSeriesMgt.GetNextNo(HumanResourceSetup."Membership No.", Today, true);
        end;


        if Employee.Get("Employee No.") then
            "Employee First Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";



        /*   OK:= Employee.GET("Employee No.");
        IF OK THEN BEGIN
         "Employee First Name":= Employee."First Name";
         "Employee Last Name":= Employee."Last Name";
        END;*/

    end;

    var
        Employee: Record Employee;
        OK: Boolean;
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit "No. Series";
        HumanResourceSetup: Record "Human Resources Setup";
        Cust: Record Customer;
}
