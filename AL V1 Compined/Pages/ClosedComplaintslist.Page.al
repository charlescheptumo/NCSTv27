#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56092 "Closed Complaints list"
{
    ApplicationArea = Basic;
    CardPageID = "Closed Complaints Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Cases Management";
    SourceTableView = where(Status = filter(Closed),
                            Enquiry = filter(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Enquiry Number"; Rec."Enquiry Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Complaints Nos';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                }
                field("Receiving Officer"; Rec."Receiving Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Resource Assigned"; Rec."Resource Assigned")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Case Solved"; Rec."Case Solved")
                {
                    ApplicationArea = Basic;
                }
                field("Closed By"; Rec."Closed By")
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
