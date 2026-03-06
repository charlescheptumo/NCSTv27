#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69820 "Employee profile"
{
    ApplicationArea = Basic;
    SourceTable = Employee;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("Genral details")
            {
                Caption = 'Genral details';
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Leave Days"; Rec."Annual Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Days B/F"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days B/F';
                    Importance = Promoted;
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Print Leave Analysis")
            {
                ApplicationArea = Basic;
                Caption = 'Print Leave Analysis';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category8;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."User ID", UserId);
                    Report.Run(69139, true, true, Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        Rec.SetRange(Rec."User ID", UserId);
    end;
}
