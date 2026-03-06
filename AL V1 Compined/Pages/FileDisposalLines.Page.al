#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59124 "File Disposal Lines"
{
    PageType = ListPart;
    SourceTable = "File Disposal Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                }
                field("File Type Description"; Rec."File Type Description")
                {
                    ApplicationArea = Basic;
                }
                field("File System No"; Rec."File System No")
                {
                    ApplicationArea = Basic;
                    Caption = 'File  No';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
