#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57007 eprocurementQueries
{

    trigger OnRun()
    begin
    end;

    var
        DynasoftPortalUsers: Record "Dynasoft Portal User";

    procedure fnDynasoftPortalUsers(email: Text; password: Text) status: Text
    begin
        DynasoftPortalUsers.Reset;
        DynasoftPortalUsers.SetRange("Authentication Email", email);
        DynasoftPortalUsers.SetRange("Password Value", password);
        if DynasoftPortalUsers.FindFirst then begin
            status := 'Success*Login successfully';
        end else begin
            status := 'Danger*Could not login, kindly contact system administrator';
        end
    end;
}
