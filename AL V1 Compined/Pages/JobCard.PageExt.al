#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50022 pageextension50022 extends "Job Card"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""No."(Control 2)".

        modify("Bill-to Customer No.")
        {
            Caption = 'Grantor';
        }
        modify("Bill-to Contact No.")
        {
            Caption = 'Grantor Contacts';
        }
        modify("Person Responsible")
        {
            Caption = 'Investigator';
        }
        modify("Project Manager")
        {
            Caption = 'Principal Investigator';
        }
        addafter("Project Manager")
        {
            field("Opportunity Reference"; Rec."Opportunity Reference")
            {
                ApplicationArea = Basic;
            }
            field("Fund Opportunity Name"; Rec."Fund Opportunity Name")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Grant Amount"; Rec."Grant Amount")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field(exchequer; Rec.exchequer)
            {
                ApplicationArea = Basic;
            }
            group("Research Details")
            {
                Visible = false;
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Research Project Area"; Rec."Research Project Area")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Grant Type"; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Researcher Code"; Rec."Researcher Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    var
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetNoFieldVisible;
    IsCountyVisible := FormatAddress.UseCounty("Bill-to Country/Region Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    //Ushindi
    CALCFIELDS("Project Budget","Actual Project Costs","PO Commitments","PRN Commitments","Store Requisition Commitments","Imprest Application Commitment");
    TotalBudgetCommitments:="PO Commitments"+"PRN Commitments"+"Store Requisition Commitments"+"Imprest Application Commitment";
    AvailableFunds:="Project Budget"-"Actual Project Costs"-TotalBudgetCommitments;
    //Ushindi

    SetNoFieldVisible;
    IsCountyVisible := FormatAddress.UseCounty("Bill-to Country/Region Code");
    */
    //end;
}
