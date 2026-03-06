#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50035 tableextension50035 extends "Job Task"
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Job No."(Field 1)".

        field(68; "Remaining AMount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023; "LPO Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "PRN Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Transaction Codes"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; Commitments; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where(Job = field("Job No."),
                                                                  "Job Task No" = field("Job Task No."),
                                                                  Type = const(Committed)));
            FieldClass = FlowField;
        }
    }


    //Unsupported feature: Code Modification on "CalcEACTotalCost(PROCEDURE 6)".

    //procedure CalcEACTotalCost();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Job No." <> Job."No." THEN
      IF NOT Job.GET("Job No.") THEN
        EXIT(0);

    IF Job."Apply Usage Link" THEN
      EXIT("Usage (Total Cost)" + "Remaining (Total Cost)");

    EXIT(0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
      EXIT(-"Usage (Total Cost)" + "Schedule (Total Cost)");
      //EXIT("Usage (Total Cost)" + "Remaining (Total Cost)");

    EXIT(0);
    */
    //end;
}
