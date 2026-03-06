#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69272 "Medical Claim Header List"
{
    ApplicationArea = Basic;
    CardPageID = "Medical Claim Header";
    PageType = List;
    SourceTable = "Medical Claim Header1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Claim No"; Rec."Claim No")
                {
                    ApplicationArea = Basic;
                }
                field("Claim Date"; Rec."Claim Date")
                {
                    ApplicationArea = Basic;
                }
                field("Service Provider"; Rec."Service Provider")
                {
                    ApplicationArea = Basic;
                }
                field("Service Provider Name"; Rec."Service Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Claimant; Rec.Claimant)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Settled; Rec.Settled)
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
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
