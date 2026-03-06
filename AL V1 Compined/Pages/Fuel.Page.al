#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57052 Fuel
{
    PageType = ListPart;
    SourceTable = "Project Members";
    SourceTableView = where(Type = const(Machine));

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
                        if Rec.Type = Rec.Type::Person then begin
                            Show := true;
                            Error(Text000);
                        end;
                    end;
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = Basic;
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Tasks to Carry Out"; Rec."Tasks to Carry Out")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Consumption Rate"; Rec."Consumption Rate")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field(Mileage; Rec."Time Period")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                }
                field(Total; Rec.Entitlement)
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = Basic;
                    Visible = Show;
                }
                field("Last Maintenance Cost"; Rec."Last Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Expected  Cost"; Rec."Expected Maintenance Cost")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Rec.Project);
        if Rec.Type = Rec.Type::Person then
            Show := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.CalcFields(Rec.Project);
        Rec.Type := Rec.Type::Machine;
    end;

    trigger OnOpenPage()
    begin
        Rec.CalcFields(Rec.Project);
    end;

    var
        [InDataSet]
        Show: Boolean;
        Text000: label 'You cannot enter Person under Fuel';
}
