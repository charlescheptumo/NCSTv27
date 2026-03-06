#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50028 tableextension50028 extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Receivable Payment Posting"; Option)
        {
            OptionMembers = Direct,Batch;
        }
        field(50001; "Receivable Batch Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                /*
                //check the type of account selected by the user
                GLAcc.RESET;
                GLAcc.GET("Receivable Batch Account");
                
                IF GLAcc."Direct Posting"=FALSE THEN
                  BEGIN
                    ERROR('Selected account must be Direct Posting');
                  END;
                
                IF GLAcc."Account Type"<>GLAcc."Account Type"::Posting THEN
                  BEGIN
                    ERROR('Only Account(s) of type Posting can be selected');
                  END;
                 */

            end;
        }
        field(50002; "ICT Helpdesk Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50003; "Disposal No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
