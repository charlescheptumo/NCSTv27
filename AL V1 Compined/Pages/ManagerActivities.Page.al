#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69087 "Manager Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(Employees)
            {
                Caption = 'Employees';
            }
            cuegroup("Service Contracts")
            {
                Caption = 'Service Contracts';

                actions
                {
                    action("New Service Contract")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Service Contract';
                        RunObject = Page "Service Contract";
                        RunPageMode = Create;
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter(Rec."Date Filter", '>=%1', WorkDate);
    end;
}
