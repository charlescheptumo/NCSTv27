#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75085 "Vendor Special Group Entry"
{
    PageType = List;
    SourceTable = "Vendor Special Group Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Certifcate No"; Rec."Certifcate No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Category"; Rec."Vendor Category")
                {
                    ApplicationArea = Basic;
                }
                field("Certifying Agency"; Rec."Certifying Agency")
                {
                    ApplicationArea = Basic;
                }
                field("Products/Service Category"; Rec."Products/Service Category")
                {
                    ApplicationArea = Basic;
                }
                field("Certificate Expiry Date"; Rec."Certificate Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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
