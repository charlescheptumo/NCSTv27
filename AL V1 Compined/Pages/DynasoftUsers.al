page 53692 "DBSL Portal Users"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Dynasoft Portal User";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Authentication Email"; Rec."Authentication Email")
                {
                    ToolTip = 'Specifies the value of the Authentication Email field.', Comment = '%';
                }
                field("Change Password"; Rec."Change Password")
                {
                    ToolTip = 'Specifies the value of the Change Password field.', Comment = '%';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ToolTip = 'Specifies the value of the Full Name field.', Comment = '%';
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ToolTip = 'Specifies the value of the Last Modified Date field.', Comment = '%';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.', Comment = '%';
                }
                field("Password Value"; Rec."Password Value")
                {
                    ToolTip = 'Specifies the value of the Password Value field.', Comment = '%';
                }
                field("Record ID"; Rec."Record ID")
                {
                    ToolTip = 'Specifies the value of the Record ID field.', Comment = '%';
                }
                field("Record Type"; Rec."Record Type")
                {
                    ToolTip = 'Specifies the value of the Record Type field.', Comment = '%';
                }
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field("User Name"; Rec."User Name")
                {
                    ToolTip = 'Specifies the value of the User Name field.', Comment = '%';
                }
            }
        }
        area(Factboxes)
        {

        }
    }


}