#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69093 "Directors Payroll Period"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Directorsl PeriodX";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("New Fiscal Year"; Rec."New Fiscal Year")
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Date Locked"; Rec."Date Locked")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Date"; Rec."Pay Date")
                {
                    ApplicationArea = Basic;
                }
                field("Close Pay"; Rec."Close Pay")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Create Directors Period")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CreateYear;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Create Director PeriodX";
            }
            action("Close Directors Period")
            {
                ApplicationArea = Basic;
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //IF Rec.Status<>Status::Released THEN
                    // ERROR('Payroll period must be APPROVED before closing. Please check!!');
                    if Rec.Closed = true then
                        Error('Payroll period has already been closed.Please Check!!');

                    if not Confirm('You are about to close the current Pay period are you sure you want to do this?' + //
                    ' Make sure all reports are correct before closing the current pay period, Go ahead?', false) then
                        exit;

                    ClosingFunction.GetCurrentPeriod(Rec);
                    ClosingFunction.Run;
                end;
            }
        }
    }

    var
        ClosingFunction: Report "Close Directors Pay period";
}
