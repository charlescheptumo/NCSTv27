#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69511 "Crm Nos series Card"
{
    PageType = Card;
    SourceTable = "Crm General Setup.";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Lead Nos"; Rec."Lead Nos")
                {
                    ApplicationArea = Basic;
                }
                field("General Enquiries Nos"; Rec."General Enquiries Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Cases nos"; Rec."Cases nos")
                {
                    ApplicationArea = Basic;
                }
                field("Crm logs Nos"; Rec."Crm logs Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Training Nos"; Rec."Training Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Customer App Nos"; Rec."Customer App Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
