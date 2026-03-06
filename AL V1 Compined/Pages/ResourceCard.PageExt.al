#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50021 pageextension50021 extends "Resource Card"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""No."(Control 2)".

        addafter("Resource Group No.")
        {
            field("Job Group"; Rec."Job Group")
            {
                ApplicationArea = Basic;
            }
        }
    }


    //Unsupported feature: Code Insertion on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //begin
    /*
    "Resource Type":="Resource Type"::Normal;
    */
    //end;
}
