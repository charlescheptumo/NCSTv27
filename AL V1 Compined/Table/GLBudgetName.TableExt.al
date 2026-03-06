#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 99001 tableextension99001 extends "G/L Budget Name"
{
    fields
    {
        field(50000; "Budget Dimension 5 Code"; Code[10])
        {

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 5 Code" <> xRec."Budget Dimension 5 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 5 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY0;
                  UpdateBudgetDim("Budget Dimension 5 Code",4);
                END;
                */

            end;
        }
        field(50001; "Budget Dimension 6 Code"; Code[20])
        {
            Caption = 'Budget Dimension 4 Code';
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                /*
                IF "Budget Dimension 6 Code" <> xRec."Budget Dimension 6 Code" THEN BEGIN
                  IF Dim.CheckIfDimUsed("Budget Dimension 6 Code",12,Name,'',0) THEN
                    ERROR(Text000,Dim.GetCheckDimErr);
                  MODIFY;
                  UpdateBudgetDim("Budget Dimension 6 Code",5);
                END;
                */

            end;
        }
        field(50002; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Approved,Revised,Sublimentary';
            OptionMembers = Approved,Revised,Sublimentary;
        }
        field(50005; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Budget Plan Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50008; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
    }
}
