#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50067 pageextension50067 extends "Administrator Role Center"
{
    actions
    {
        addafter("&Sales Analysis")
        {
            action("Employee List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Employee List';
                RunObject = Page "Employee List-HR";
            }
        }
    }
}
