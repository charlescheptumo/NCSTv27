#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50000 Password
{
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            field("Enter Password"; EnterPassword)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin

      //cc//  if custCodeunit.ValidateOTP(UserId, EnterPassword)
      //cc//  then
            Message('Login Successful!'); //  ELSE
                                          // ERROR('Invalid ID Number!') ;


        //    Error('You Enter must OTP!Refresh the System!');

    end;

    var
        EnterPassword: Text;
        custCodeunit: Codeunit "Customer Mgt.";
}
