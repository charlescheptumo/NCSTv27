#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50025 pageextension50025 extends "User Setup"
{
    layout
    {
        addafter("User ID")
        {
            field(CIDO; Rec.CIDO)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Time Sheet Admin.")
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = Basic;
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = Basic;
            }
            field(Receiptionist; Rec.Receiptionist)
            {
                ApplicationArea = Basic;
            }
            field("Accounts User"; Rec."Accounts User")
            {
                ApplicationArea = Basic;
            }
            field(Leave; Rec.Leave)
            {
                ApplicationArea = Basic;
            }
            field("Resource No"; Rec."Resource No")
            {
                ApplicationArea = Basic;
            }
            field("Imprest Account"; Rec."Imprest Account")
            {
                ApplicationArea = Basic;
            }
            field("Payroll View"; Rec."Payroll View")
            {
                ApplicationArea = Basic;
            }
            field("Post Memo"; Rec."Post Memo")
            {
                ApplicationArea = Basic;
            }
            field("Post Requisition"; Rec."Post Requisition")
            {
                ApplicationArea = Basic;
            }
            field("Procurement officer"; Rec."Procurement officer")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Manager"; Rec."Procurement Manager")
            {
                ApplicationArea = Basic;
            }
            field("post surrender"; Rec."post surrender")
            {
                ApplicationArea = Basic;
            }
            field("Allowed To Auto Reverse"; Rec."Allowed To Auto Reverse")
            {
                ApplicationArea = Basic;
            }
            field("Create New Job"; Rec."Create New Job")
            {
                ApplicationArea = Basic;
            }
            field("Approval Administrator"; Rec."Approval Administrator")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Email)
        {
            field("Portal User"; Rec."Portal User")
            {
                ApplicationArea = Basic;
            }
            field("Reopen Document"; Rec."Reopen Document")
            {
                ApplicationArea = Basic;
            }
            field("ICT Officer"; Rec."ICT Officer")
            {
                ApplicationArea = Basic;
            }
        }
    }


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    HideExternalUsers;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //HideExternalUsers;
    */
    //end;
}
