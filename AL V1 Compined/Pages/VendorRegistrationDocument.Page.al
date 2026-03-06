#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75015 "Vendor Registration Document"
{
    PageType = List;
    SourceTable = "Vendor Registration Document";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Global Requirement"; Rec."Global Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Requirement"; Rec."Special Group Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor (Works Requirement)"; Rec."Contractor (Works Requirement)")
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
