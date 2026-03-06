#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57005 "Payment Voucher Notification"
{

    trigger OnRun()
    begin
        SendNotification();
    end;

    var
        Text000: label 'Dear %1, <br/><br/>Kindly note that your payment of a gross amount of KES %2, Retention amount of KES %3, VAT amount of KES %4, Withheld VAT of KES %5, Withholding tax of KES %6  totalling to a net of <b>KES %7</b> has been processed';

    local procedure SendNotification()
    var
        PVRec: Record Payments;
        PVLines: Record "PV Lines";
        //  SMTP: Codeunit "SMTP Mail";
        VendorRec: Record Vendor;
        CompInfo: Record "Company Information";
        MsgSent: Boolean;
    begin
        CompInfo.Get;
        CompInfo.TestField("E-Mail");
        PVRec.Reset;
        PVRec.SetRange("No.", 'PV_15-16:0055');
        PVRec.SetRange("Payment Type", PVRec."payment type"::"Payment Voucher");
        PVRec.SetRange(Status, PVRec.Status::Released);
        PVRec.SetRange("Notification Sent", false);
        PVRec.SetRange(Posted, true);
        if PVRec.Find('-') then
            repeat
                MsgSent := false;
                PVLines.Reset;
                PVLines.SetRange(No, PVRec."No.");
                PVLines.SetRange("Account Type", PVLines."account type"::Vendor);
                if PVLines.FindFirst then begin
                    PVRec.CalcFields("Total Amount", "Total Net Amount", "Total VAT Amount", "Total Witholding Tax Amount",
                                     "VAT Wthheld six %", "Total Retention Amount");
                    if VendorRec.Get(PVLines."Account No") then;
                    if VendorRec."E-Mail" <> '' then begin
                        //SMTP.AddRecipients(VendorRec."E-Mail");
                        // SMTP.CreateMessage(COMPANYNAME, CompInfo."E-Mail", VendorRec."E-Mail", PVRec."Payment Narration",
                        //   StrSubstNo(Text000, PVRec.Payee, PVRec."Total Amount", PVRec."Total Retention Amount", PVRec."Total VAT Amount",
                        //               PVRec."VAT Wthheld six %", PVRec."Total Witholding Tax Amount", PVRec."Total Net Amount"), true);
                        //     SMTP.Send;
                        MsgSent := true;
                    end;
                end;
                if MsgSent then begin
                    PVRec."Notification Sent" := true;
                    PVRec."DateTime Sent" := CreateDatetime(Today, Time);
                    PVRec.Modify;
                end;
            until PVRec.Next = 0;
    end;
}
