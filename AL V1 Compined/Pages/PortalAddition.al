page 57893 "Add Portal Users"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = portalusers;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(ActivatedAsVendor; Rec.ActivatedAsVendor)
                {
                    ToolTip = 'Specifies the value of the ActivatedAsVendor field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(IDNoorRegNo; Rec.IDNoorRegNo)
                {
                    ToolTip = 'Specifies the value of the IDNoorRegNo field.', Comment = '%';
                }
                field("Last Login"; Rec."Last Login")
                {
                    ToolTip = 'Specifies the value of the Last Login field.', Comment = '%';
                }
                field(Password; Rec.Password)
                {
                    ToolTip = 'Specifies the value of the Password field.', Comment = '%';
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
                field(VendorNo; Rec.VendorNo)
                {
                    ToolTip = 'Specifies the value of the VendorNo field.', Comment = '%';
                }
                field(changedPassword; Rec.changedPassword)
                {
                    ToolTip = 'Specifies the value of the changedPassword field.', Comment = '%';
                }
                field("customer No"; Rec."customer No")
                {
                    ToolTip = 'Specifies the value of the customer No field.', Comment = '%';
                }
                field(isAdmin; Rec.isAdmin)
                {
                    ToolTip = 'Specifies the value of the isAdmin field.', Comment = '%';
                }
                field(status; Rec.status)
                {
                    ToolTip = 'Specifies the value of the status field.', Comment = '%';
                }
                field(usertype; Rec.usertype)
                {
                    ToolTip = 'Specifies the value of the usertype field.', Comment = '%';
                }
                field(validated; Rec.validated)
                {
                    ToolTip = 'Specifies the value of the validated field.', Comment = '%';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

}