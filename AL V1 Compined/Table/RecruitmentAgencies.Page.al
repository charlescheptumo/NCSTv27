#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69642 "Recruitment Agencies"
{
    ApplicationArea = Basic;
    CardPageID = "Recruitment Agency";
    PageType = List;
    SourceTable = "Recruitment Agency";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agency No."; Rec."Agency No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Accreditation Cert No."; Rec."Accreditation Cert No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Vacancy Posting"; Rec."No. of Vacancy Posting")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control15; Outlook)
            {
            }
            systempart(Control16; Links)
            {
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

