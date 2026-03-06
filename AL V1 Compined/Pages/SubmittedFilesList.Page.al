#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59117 "Submitted Files List"
{
    ApplicationArea = Basic;
    Caption = 'File Creation';
    CardPageID = "Record Creation";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Record Creation";
    SourceTableView = where(Status = const(Submitted));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Registry Code"; Rec."Registry Code")
                {
                    ApplicationArea = Basic;
                }
                field("File Classification"; Rec."File Classification")
                {
                    ApplicationArea = Basic;
                }
                field("File Location"; Rec."File Location")
                {
                    ApplicationArea = Basic;
                }
                field("Creation date"; Rec."Creation date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
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
