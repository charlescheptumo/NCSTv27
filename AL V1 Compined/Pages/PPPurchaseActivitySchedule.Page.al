#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75013 "PP Purchase Activity Schedule"
{
    PageType = List;
    SourceTable = "PP Purchase Activity Schedule";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PP Entry"; Rec."PP Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Days"; Rec."Planned Days")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Days"; Rec."Actual Days")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Dates"; Rec."Planned Dates")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Dates"; Rec."Actual Dates")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        PurchaseActivityPlanNo: Code[20];
        [InDataSet]
        PurchaseActivityPlanNoVisible: Boolean;
        [InDataSet]
        PurchaseActivityPlanLineNoVisible: Boolean;


    procedure SetPurchaseActivityNo(No: Code[20])
    begin
        PurchaseActivityPlanNo := No;
    end;


    procedure SetPurchaseActivityNoVisible(NewJobNoVisible: Boolean)
    begin
        PurchaseActivityPlanNoVisible := NewJobNoVisible;
    end;


    procedure SetPurchaseActivityLineNoVisible(NewJobTaskNoVisible: Boolean)
    begin
        PurchaseActivityPlanLineNoVisible := NewJobTaskNoVisible;
    end;
}
