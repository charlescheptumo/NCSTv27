#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57085 "Project Surrender Team"
{
    PageType = ListPart;
    SourceTable = "Project Members";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Rec.Type = Rec.Type::Machine then
                            Show := true;
                    end;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Time Period"; Rec."Actual Time Period")
                {
                    ApplicationArea = Basic;
                }
                field("Time Period"; Rec."Time Period")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Daily Rate"; Rec.Entitlement)
                {
                    ApplicationArea = Basic;
                }
                field("Actual Spent"; Rec."Actual Spent")
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
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = Basic;
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = Basic;
                }
                field("Last Maintenance Cost"; Rec."Last Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Editable = show;
                }
                field("Expected Maintenance Cost"; Rec."Expected Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Editable = Show;
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
    end;

    var
        [InDataSet]
        Show: Boolean;
}
