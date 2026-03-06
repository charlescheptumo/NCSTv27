#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80004 "Annual Reporting Codes"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Annual Reporting Codes";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Reporting Start Date"; Rec."Reporting Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reporting End Date"; Rec."Reporting End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Current Year"; Rec."Current Year")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Procurement Plan"; Rec."Annual Procurement Plan")
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
            action("Create Quarterly Periods")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    StartDate := Rec."Reporting Start Date";
                    EndDate := Rec."Reporting End Date";
                    Q1 := CalcDate('+1Q-1D', Rec."Reporting Start Date");
                    I := 0;
                    while I < 4 do begin
                        if I = 0 then begin
                            QStartDate := StartDate;
                            QEndDate := CalcDate('CM', Q1);
                        end else begin
                            QStartDate := QSDate;
                            QEndDate := QCM;
                        end;

                        I := I + 1;
                        QCode := 'Q' + Format(I) + '-' + Rec.Code;
                        Des := Rec.Code + ' ' + 'QUARTER' + ' ' + Format(I);

                        //For Insersting
                        Qperiods.Init;
                        Qperiods.Code := QCode;
                        Qperiods."Year Code" := Rec.Code;
                        Qperiods.Description := Rec.Description;
                        Qperiods."Reporting Start Date" := QStartDate;
                        Qperiods."Reporting End Date" := QEndDate;
                        Qperiods.Insert(true);

                        //For Pushing to next Quarter
                        QSDate := CalcDate('+1Q', QStartDate);
                        QEDate := CalcDate('+1Q-1D', QEndDate);
                        QCM := CalcDate('CM', QEDate);
                    end;

                    Message('%1 Quarter Periods Created Successfuly ', Rec.Code);
                end;
            }
            action("Quarterly Reporting Periods")
            {
                ApplicationArea = Basic;
                Image = Period;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Quarterly Reporting Periods";
                RunPageLink = "Year Code" = field(Code);
            }
        }
    }

    var
        StartDate: Date;
        EndDate: Date;
        I: Integer;
        QCode: Code[20];
        Des: Code[50];
        QStartDate: Date;
        QEndDate: Date;
        QSDate: Date;
        QEDate: Date;
        Q1: Date;
        QCMEndDate: Date;
        QCM: Date;
        Qperiods: Record "Quarterly Reporting Periods";
}
