#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59029 "Fuel Card Lines"
{
    PageType = ListPart;
    SourceTable = "Vehicle Fuel Card Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reciept No"; Rec."Reciept No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Filling"; Rec."Date of Filling")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle RegNo"; Rec."Vehicle RegNo")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Vehicles List";
                }
                field("vehicle Make"; Rec."vehicle Make")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Drivers List";
                }
                field("Driver Names"; Rec."Driver Names")
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
