#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50045 pageextension50045 extends "Approval Entries"
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""Last Modified By User ID"(Control 27)".


        //Unsupported feature: Property Deletion (Visible) on ""Document Type"(Control 6)".

    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "Record(Action 38)".


        //Unsupported feature: Property Insertion (Visible) on ""&Delegate"(Action 35)".


        //Unsupported feature: Property Deletion (Enabled) on ""&Delegate"(Action 35)".

    }

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MarkAllWhereUserisApproverOrSender;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //MarkAllWhereUserisApproverOrSender;
    */
    //end;

    procedure SetfiltersCustom(TableId: Integer; DocumentNo: Code[20])
    begin
        if TableId <> 0 then begin
            Rec.FilterGroup(1);
            Rec.SetCurrentkey(Rec."Table ID", Rec."Document Type", Rec."Document No.");
            Rec.SetRange(Rec."Table ID", TableId);
            if DocumentNo <> '' then
                Rec.SetRange(Rec."Document No.", DocumentNo);
            Rec.FilterGroup(0);
        end;
    end;

    //Unsupported feature: Property Modification (OptionString) on "Setfilters(PROCEDURE 1).DocumentType(Parameter 1002)".

}
