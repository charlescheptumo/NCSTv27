#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50084 "Purchase Service Items"
{
    PageType = List;
    SourceTable = "Document Approval Delegation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field("Service Code"; "Service Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Service Name"; "Service Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("G/L Account"; "G/L Account")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("G/L Account Name"; "G/L Account Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("No. Series"; Rec."No. Series")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Capex; Capex)
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Notes)
            {
            }
            systempart(Control11; Links)
            {
            }
        }
    }

    actions
    {
    }
}
