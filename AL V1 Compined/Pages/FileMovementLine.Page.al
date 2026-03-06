#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59091 "File Movement Line"
{
    PageType = ListPart;
    SourceTable = "File Movement Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                }
                field("File Description"; Rec."File Description")
                {
                    ApplicationArea = Basic;
                }
                field("File Number"; Rec."File Number")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Purpose/Description"; Rec."Purpose/Description")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
}
