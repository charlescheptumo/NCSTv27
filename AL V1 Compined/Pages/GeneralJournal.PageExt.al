#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50012 pageextension50012 extends "General Journal"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Modification (Visible) on ""Account Type"(Control 8)".


        //Unsupported feature: Property Modification (Visible) on "Amount(Control 18)".


        //Unsupported feature: Property Modification (Visible) on ""Amount (LCY)"(Control 113)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account Type"(Control 53)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account No."(Control 55)".


        //Unsupported feature: Property Deletion (Visible) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (Visible) on ""Currency Code"(Control 67)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Posting Type"(Control 14)".


        //Unsupported feature: Property Deletion (Visible) on ""Bal. Gen. Posting Type"(Control 57)".


        //Unsupported feature: Property Deletion (Visible) on ""Shortcut Dimension 1 Code"(Control 136)".


        //Unsupported feature: Property Deletion (Visible) on ""Shortcut Dimension 2 Code"(Control 135)".


        //Unsupported feature: Property Deletion (Visible) on "ShortcutDimCode3(Control 134)".


        //Unsupported feature: Property Deletion (Visible) on "ShortcutDimCode4(Control 133)".

        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(AccountName)
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
