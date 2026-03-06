#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56028 "Other Participants"
{
    PageType = List;
    SourceTable = "Copyright Authors";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID. No."; Rec."ID. No.")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
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
                    Editable = false;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = Basic;
                }
                field("Pseudo Name"; Rec."Pseudo Name")
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
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
