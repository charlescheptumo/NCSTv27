#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 90005 "Previous Committee Members"
{
    CardPageID = "Committee Member Card";
    PageType = List;
    SourceTable = "Board Of Directors";
    SourceTableView = where(Category = filter("Committee Member" | Staff),
                            Status = filter(Inactive));

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
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Term Expiry Date"; Rec."Term Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000010; Notes)
            {
            }
            systempart(Control1000000011; MyNotes)
            {
            }
            systempart(Control1000000012; Links)
            {
            }
        }
    }

    actions
    {
    }
}
