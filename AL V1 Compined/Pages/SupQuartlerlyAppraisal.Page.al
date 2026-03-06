#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56207 "Sup Quartlerly Appraisal"
{
    Caption = 'Supervisor Quartlerly Appraisal';
    PageType = Card;
    SourceTable = "Quarterly Appraisal";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Date created"; Rec."Date created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Quarter; Rec.Quarter)
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Quartely score"; Rec."Overall Quartely score")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Assignment"; ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Rec."Additional Assignment");
                        Rec."Additional Assignment".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec."Additional Assignment");
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec."Additional Assignment".CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field(Remarks; ObjText2)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Rec.Remarks);
                        Rec.Remarks.CreateInstream(ObjInstr2);
                        Obj2.Read(ObjInstr2);

                        if ObjText2 <> Format(Obj2) then begin
                            Clear(Rec.Remarks);
                            Clear(Obj2);
                            Obj2.AddText(ObjText2);
                            Rec.Remarks.CreateOutstream(ObjOutStr2);
                            Obj2.Write(ObjOutStr2);
                            //MODIFY;
                        end;
                    end;
                }
                field("Supervisor Code"; Rec."Supervisor Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Designation"; Rec."Supervisor Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22; "Quarterly Appraisal Lines")
            {
                SubPageLink = "Appraisal No" = field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control21; Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send to the Supervisor")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::"Sent to supervisior";
                    Rec.Modify;
                end;
            }
        }
    }

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        Obj2: BigText;
        ObjInstr2: InStream;
        ObjOutStr2: OutStream;
        ObjText2: Text;
}
