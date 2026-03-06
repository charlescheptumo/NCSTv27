#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57034 "Safari Team"
{
    PageType = ListPart;
    SourceTable = "Project Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        if Rec.Type = Rec.Type::Machine then
                            Show := true;
                    end;
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Town';
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Time Period"; Rec."Time Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Days';
                    Enabled = true;

                    trigger OnValidate()
                    begin
                        //TESTFIELD("Task No.");
                        Rec.TestField(Rec."No.");
                    end;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    Enabled = false;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field(Entitlement; Rec.Entitlement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Daily Subsistence Allowance';
                }
                field("Transport Costs"; Rec."Transport Costs")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Total Entitlement"; Rec."Total Entitlement")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Tasks to Carry Out"; Rec."Tasks to Carry Out")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if Rec.Type = Rec.Type::Machine then
            Show := true;

        editTransport := false;
        EditDays := true;


        if ImprestMemo.Get(Rec."Imprest Memo No.") then begin




            ApprovalEntry.Reset;
            ApprovalEntry.SetRange("Table ID", 57008);
            //ApprovalEntry.SETRANGE("Document Type","Document Type"::im","Document Type"::"Imprest memo");
            ApprovalEntry.SetRange("Document No.", ImprestMemo."No.");
            ApprovalEntry.SetRange("Sequence No.", 1);
            ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
            ApprovalEntry.SetFilter("Approver ID", '<>%1', ApprovalEntry."Sender ID");

            if ApprovalEntry.FindFirst then begin
                editTransport := true;
                EditDays := false;
                Rec.Modify;

                //MESSAGE(ImprestMemo."No.");

            end;

        end;
    end;

    var
        [InDataSet]
        Show: Boolean;
        editTransport: Boolean;
        ApprovalEntry: Record "Approval Entry";
        ImprestMemo: Record "Imprest Memo";
        EditDays: Boolean;
}
