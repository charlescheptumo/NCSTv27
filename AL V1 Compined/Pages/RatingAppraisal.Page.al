#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56227 "Rating Appraisal"
{
    Caption = 'Rating Appraisal';
    PageType = ListPart;
    SourceTable = "Departmental ObjectisAppraisal";
    SourceTableView = where(Rate = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Rating; Rec.Rating)
                {
                    ApplicationArea = Basic;
                }
                field("Rating %"; Rec."Rating %")
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
