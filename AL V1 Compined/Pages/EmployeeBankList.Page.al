#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69007 "Employee Bank List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Employee Bank AccountX";
    UsageCategory = Administration;

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
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field(Agent; Rec.Agent)
                {
                    ApplicationArea = Basic;
                }
                field("No.Of Employees"; Rec."No.Of Employees")
                {
                    ApplicationArea = Basic;
                }
                field("No.Of Employees-Guards"; Rec."No.Of Employees-Guards")
                {
                    ApplicationArea = Basic;
                }
                field("No.Of Employees-Admin"; Rec."No.Of Employees-Admin")
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
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; MyNotes)
            {
            }
            systempart(Control1000000021; Links)
            {
            }
        }
    }

    actions
    {
    }
}
