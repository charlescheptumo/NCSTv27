#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59093 "File Management Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "File Locations Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                }
                field("Custodian Name"; Rec."Custodian Name")
                {
                    ApplicationArea = Basic;
                }
                field("File Receiving Nos"; Rec."File Receiving Nos")
                {
                    ApplicationArea = Basic;
                }
                field("File Disposal No. Series"; Rec."File Disposal No. Series")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
            }
            systempart(Control10; Notes)
            {
            }
            systempart(Control11; MyNotes)
            {
            }
            systempart(Control12; Links)
            {
            }
        }
    }

    actions
    {
    }
}
