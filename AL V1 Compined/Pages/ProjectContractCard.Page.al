#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65078 "Project Contract Card"
{
    PageType = Card;
    SourceTable = "Project Contract Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project Contract No"; Rec."Project Contract No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grant Application ID"; Rec."Grant Application ID")
                {
                    ApplicationArea = Basic;
                }
                field("External Contract No"; Rec."External Contract No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contract Customer No"; Rec."Primary Contract Customer No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grant Administrator"; Rec."Grant Administrator")
                {
                    ApplicationArea = Basic;
                }
                field("Award Type"; Rec."Award Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Funding Sponsor ID"; Rec."Primary Funding Sponsor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Sponsor Name"; Rec."Primary Sponsor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control30; "Contract Funding Lines")
            {
                SubPageLink = "Project Contract No." = field("Project Contract No");
            }
            systempart(Control32; Links)
            {
                Visible = false;
            }
            systempart(Control31; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action39)
            {
            }
            action("Print Project Contract")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    Rec.SetRange(Rec."Project Contract No", Rec."Project Contract No");
                    Report.Run(65019, true, true, Rec)
                end;
            }
            action("Notify Contract Award")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Message('Nofity Team');
                end;
            }
            action("Si&gn Contract")
            {
                ApplicationArea = Service;
                Caption = 'Si&gn Contract';
                Image = Signature;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Confirm the contract.';

                trigger OnAction()
                var
                    SignServContractDoc: Codeunit SignServContractDoc;
                begin
                    Rec."Contract Status" := Rec."contract status"::Signed;
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                    Message('Contract Signed Successfully');
                end;
            }
            action("Cancel Contract")
            {
                ApplicationArea = Service;
                Caption = 'Cancel Contract';
                Image = Signature;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Cancel  the contract.';

                trigger OnAction()
                var
                    SignServContractDoc: Codeunit SignServContractDoc;
                begin
                    Rec."Contract Status" := Rec."contract status"::Signed;
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                    Message('Contract Signed Successfully');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;

                trigger OnAction()
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField(Rec."Approval Status", Rec."approval status"::Open);//status must be open.
                                                                                      //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                      //cc//if ApprovalsMgmt.CheckProjectContractApprovalsWorkflowEnabled(Rec) then
                                                                                      //cc//ApprovalsMgmt.OnSendProjectContractForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    //ApprovalsMgmt.OnCancelProjectContractApprovalRequest(Rec);
                end;
            }
            separator(Action35)
            {
            }
        }
    }

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}
