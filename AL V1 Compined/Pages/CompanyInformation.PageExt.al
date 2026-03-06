#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50001 pageextension50001 extends "Company Information"
{
    layout
    {
        modify("VAT Registration No.")
        {
            Caption = 'KRA PIN.';
        }
        addafter(Name)
        {
            field("Name 2"; Rec."Name 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(GLN)
        {
            field(Mission; Rec.Mission)
            {
                ApplicationArea = Basic;
                MultiLine = true;
            }
            field(Vision; Rec.Vision)
            {
                ApplicationArea = Basic;
                MultiLine = true;
            }
            field("Core Values"; Rec."Core Values")
            {
                ApplicationArea = Basic;
                MultiLine = true;
            }
        }
        addafter(Picture)
        {
            field("N.S.SF. No."; Rec."N.S.SF. No.")
            {
                ApplicationArea = Basic;
            }
            field("N.H.I.F No."; Rec."N.H.I.F No.")
            {
                ApplicationArea = Basic;
            }
            field(RubberStamp; Rec.RubberStamp)
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Payments)
        {
            group("Outgoing Emails")
            {
                Caption = 'Outgoing Emails';
                field("Procurement Support E-mail"; Rec."Procurement Support E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Administrator Email"; Rec."Administrator Email")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
