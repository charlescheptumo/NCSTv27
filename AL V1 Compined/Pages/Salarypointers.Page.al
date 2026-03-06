#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69023 "Salary pointers"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Salary Pointers";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay int"; Rec."Basic Pay int")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Pointer Int"; Rec."Pointer Int")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007; Outlook)
            {
            }
            systempart(Control1000000008; Notes)
            {
            }
            systempart(Control1000000009; MyNotes)
            {
            }
            systempart(Control1000000010; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Generate Pointer Int")
            {
                ApplicationArea = Basic;
                Image = CalculateHierarchy;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SalaryScales: Record "Salary Scales";
                    SalaryPointers: Record "Salary Pointers";
                    i: Integer;
                begin
                    SalaryScales.Reset;
                    if SalaryScales.Find('-') then begin
                        repeat
                            i := 0;
                            SalaryPointers.Reset;
                            SalaryPointers.SetCurrentkey("Basic Pay int");
                           //cc//   SalaryPointers.SetAscending(Rec."Basic Pay int", true);

                            SalaryPointers.SetRange(SalaryPointers."Salary Scale", SalaryScales.Scale);
                            if SalaryPointers.Find('-') then begin
                                repeat
                                    i += 1;
                                    //MESSAGE('%1 - %2 := %3',SalaryScales.Scale,i,SalaryPointers."Basic Pay");
                                    SalaryPointers."Pointer Int" := i;
                                    SalaryPointers.Modify;
                                until SalaryPointers.Next = 0;
                            end;
                        until SalaryScales.Next = 0;
                    end;
                end;
            }
        }
    }
}
