#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50085 "Service Item Lists"
{
    ApplicationArea = Basic;
    CardPageID = "Service Item Cards";
    PageType = List;
    SourceTable = "Service Items";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Service Code"; Rec."Service Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Service Name"; Rec."Service Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Capex; Rec.Capex)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}
