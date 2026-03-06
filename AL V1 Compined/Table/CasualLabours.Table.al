#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57020 "Casual Labours"
{

    fields
    {
        field(1; "Imprest Memo No."; Code[20])
        {
            TableRelation = "Imprest Memo";
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Skilled,Unskilled';
            OptionMembers = Skilled,Unskilled;
        }
        field(3; "No. Required"; Integer)
        {

            trigger OnValidate()
            begin
                /*VALIDATE("Work Type");*/

            end;
        }
        field(4; "Work Type"; Option)
        {
            OptionMembers = Skilled,Unskilled;

            trigger OnValidate()
            begin
                //Ushindi
                /*
                CALCFIELDS(Project);
                //Ushindi
                IF "Work Type"<>'' THEN
                  BEGIN
                    IF ResourceRec.GET("Resource No.") THEN;
                    IF ResourceRec."Resource Group No."<>'' THEN
                      BEGIN
                        IF ResourceCost.GET(ResourceCost.Type::Resource,"Resource No.","Work Type") THEN
                          BEGIN
                            Amount:=ResourceCost."Direct Unit Cost"*"No. of Days"*"No. Required";
                            Rate:=ResourceCost."Direct Unit Cost";
                          END
                        ELSE
                        IF ResourceCost.GET(ResourceCost.Type::"Group(Resource)",ResourceRec."Resource Group No.","Work Type") THEN
                          BEGIN
                           Rate:=ResourceCost."Direct Unit Cost";
                           Amount:=ResourceCost."Direct Unit Cost"*"No. of Days"*"No. Required";
                          END
                      END ELSE
                      BEGIN
                       IF ResourceCost.GET(ResourceCost.Type::Resource,"Resource No.","Work Type") THEN
                         BEGIN
                          Rate:=ResourceCost."Direct Unit Cost";
                          Amount:=ResourceCost."Direct Unit Cost"*"No. of Days"*"No. Required";
                         END
                       ELSE BEGIN
                        IF ResourceCost.GET(ResourceCost.Type::All,'',"Work Type") THEN
                          BEGIN
                           Rate:=ResourceCost."Direct Unit Cost";
                           Amount:=ResourceCost."Direct Unit Cost"*"No. of Days"*"No. Required";
                          END
                        ELSE
                          ERROR(Text000);
                       END;
                      END;
                  END ELSE
                  ERROR(Text001);
                  */

            end;
        }
        field(5; "No. of Days"; Decimal)
        {

            trigger OnValidate()
            begin
                //VALIDATE("Work Type");
                Amount := Rate * "No. of Days";
            end;
        }
        field(6; Rate; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            begin
                Amount := Rate * "No. of Days";
            end;
        }
        field(7; Amount; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                Amount := Rate * "No. of Days";
            end;
        }
        field(8; Activity; Text[250])
        {
        }
        field(9; "Resource No."; Code[20])
        {
        }
        field(10; Posted; Boolean)
        {
        }
        field(11; Linked; Boolean)
        {
        }
        field(24; Project; Code[20])
        {
            CalcFormula = lookup("Imprest Memo".Project where("No." = field("Imprest Memo No.")));
            FieldClass = FlowField;
        }
        field(25; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Project));

            trigger OnValidate()
            begin
                /*
                CALCFIELDS(Project);
                
                IF TaskRec.GET(Project,"Task No.") THEN;
                "Job Task Description":=TaskRec.Description;
                */

            end;
        }
        field(26; "Actual No. of Days"; Decimal)
        {

            trigger OnValidate()
            begin
                //VALIDATE("Work Type");
            end;
        }
        field(27; Surrendered; Boolean)
        {
        }
        field(57000; "Job Task Description"; Text[50])
        {
            Caption = 'Job Task Description';
            Editable = false;
        }
        field(57001; "Actual Rate"; Decimal)
        {
        }
        field(57002; "Actual Amount"; Decimal)
        {
        }
        field(57003; Name; Text[60])
        {
        }
    }

    keys
    {
        key(Key1; "Imprest Memo No.", Type, "Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        WTRec: Record "Work Type";
        ResourceRec: Record Resource;
        ResourceCost: Record "Resource Cost";
        Text000: label 'Kindly setup resource costs';
        Text001: label 'Kindly insert the work type';
        TaskRec: Record "Job Task";
}
