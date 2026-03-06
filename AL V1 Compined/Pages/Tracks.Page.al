#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56082 Tracks
{
    ApplicationArea = Basic;
    CardPageID = "Tracks Card";
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Tracks;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Copyright No"; Rec."Copyright No")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Title"; Rec."Copyright Title")
                {
                    ApplicationArea = Basic;
                }
                field("Track Title"; Rec."Track Title")
                {
                    ApplicationArea = Basic;
                }
                field("Track Work Category"; Rec."Track Work Category")
                {
                    ApplicationArea = Basic;
                }
                field("Track Work SubCategory"; Rec."Track Work SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Track Category Description"; Rec."Track Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Track SubCategory Desc"; Rec."Track SubCategory Desc")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Fixation/Reduction"; Rec."Date of Fixation/Reduction")
                {
                    ApplicationArea = Basic;
                }
                field("Track Language"; Rec."Track Language")
                {
                    ApplicationArea = Basic;
                }
                field("<Track Work Abstract>"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Track Work Abstract';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Rec."Track Work Abstract");
       rec. "Track Work Abstract".CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
}
