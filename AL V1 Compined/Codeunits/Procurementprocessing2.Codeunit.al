#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70002 "Procurement processing2"
{

    trigger OnRun()
    begin
    end;

    var
        CompInfo: Record "Company Information";
       // SMTP1: Codeunit "SMTP Mail";
        BidOpeningRegisterLines: Record "Bid Opening Register Lines2";
        BidOpeningRegisterLine2: Record "Bid Opening Register Line";

    procedure FnSendSecretCodeOnIFSBidOpening(ProcurementRequest: Record "Procurement Request")
    var
        CommitteeMemebers: Record "Commitee Members";
        RandomDigit: Text[50];
        Password: Text[50];
        HRSetup: Record "Company Information";
        PPayableSetup: Record "Procurement Setup";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SenderMessage: Text[1000];
        LoginDetails: Text[1000];
        ActivationDetails: Text[1000];
        emailhdr: Text[100];
    begin
        CommitteeMemebers.Reset;
        CommitteeMemebers.SetRange("Appointment No", ProcurementRequest."Tender Committee");
        if CommitteeMemebers.FindSet then begin
            repeat
                CompInfo.Get;
                HRSetup.Get;
                PPayableSetup.Get;

                RandomDigit := CreateGuid;
                RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                RandomDigit := CopyStr(RandomDigit, 1, 8);

                Password := RandomDigit;

                if CommitteeMemebers."Nominated Bid Opening" = CommitteeMemebers."nominated bid opening"::"Member 1" then
                    CommitteeMemebers."Opening Person 1" := Password
                else if CommitteeMemebers."Nominated Bid Opening" = CommitteeMemebers."nominated bid opening"::"Member 2" then
                    CommitteeMemebers."Opening Person 2" := Password
                else if CommitteeMemebers."Nominated Bid Opening" = CommitteeMemebers."nominated bid opening"::"Member 3" then
                    CommitteeMemebers."Opening Person 3" := Password;

                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Procurement Officer,' + '<BR></BR>' + CompInfo.Name + '<BR></BR>' + CompInfo.Address + '<BR></BR>' + CompInfo."Address 2" + '<BR></BR>' + CompInfo.City;
                SenderMessage := '<BR>Please find below system Generated Bid Opening Secret code to be used in Process:</BR>' + '<BR></BR>';
                LoginDetails := 'Password:' + Password;
                ActivationDetails := '<BR>Please fill the Secret Code on the Bid Opening to be able to proceed :' + Format(CommitteeMemebers."Nominated Bid Opening") + '</BR>';
                emailhdr := 'Bid Opening Activation (Bid Opening No:' + ProcurementRequest.No + ')';

           //CC//     SMTP1.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
                 //CC//       CompanyDetails + '<BR></BR>' + SenderMessage + LoginDetails + ActivationDetails, true);

                    //CC//    SMTP1.Send;
                CommitteeMemebers.Modify(true);
            until CommitteeMemebers.Next = 0;
        end
    end;

    procedure UnsealBid(ProcurementRequest: Record "Procurement Request")
    var
        TenderBids: Record "Tender Bids";
    begin
        ProcurementRequest.TestField("Opening Person 1");
        ProcurementRequest.TestField("Opening Person 2");
        ProcurementRequest.TestField("Opening Person 3");

        TenderBids.Reset;
        TenderBids.SetRange("Requisition No", ProcurementRequest.No);
        if TenderBids.FindSet then begin
            repeat
                BidOpeningRegisterLines.Reset;
                BidOpeningRegisterLines.SetRange("Requisition No", TenderBids."Requisition No");
                BidOpeningRegisterLines.SetRange("Tender bid line no", TenderBids."Line No");
                if not BidOpeningRegisterLines.FindSet then begin
                    BidOpeningRegisterLines.Init;
                    BidOpeningRegisterLines."Requisition No" := TenderBids."Requisition No";
                    BidOpeningRegisterLines.Type := TenderBids.Type;
                    BidOpeningRegisterLines.No := TenderBids.No;
                    BidOpeningRegisterLines.Description := TenderBids.Description;
                    BidOpeningRegisterLines."Linked vendor" := TenderBids."Linked vendor";
                    BidOpeningRegisterLines."Bidder Name" := TenderBids."Bidder Name";
                    BidOpeningRegisterLines."Tender bid line no" := TenderBids."Line No";
                    BidOpeningRegisterLines."Unit Price" := TenderBids."Unit Price";
                    BidOpeningRegisterLines.Amount := TenderBids.Amount;
                    BidOpeningRegisterLines."Amount LCY" := TenderBids."Amount LCY";
                    BidOpeningRegisterLines.Insert(true);
                end;

            // BidOpeningRegisterLine2.RESET;
            // BidOpeningRegisterLine2.SETRANGE(

            until TenderBids.Next = 0;
        end
    end;

    procedure FnSendSecretCodeOnIFSBidOpening1(ProcurementRequest: Record "Procurement Request")
    var
        CommitteeMemebers: Record "Commitee Members";
        RandomDigit: Text[50];
        Password: Text[50];
        HRSetup: Record "Company Information";
        PPayableSetup: Record "Procurement Setup";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SenderMessage: Text[1000];
        LoginDetails: Text[1000];
        ActivationDetails: Text[1000];
        emailhdr: Text[100];
    begin
        CommitteeMemebers.Reset;
        CommitteeMemebers.SetRange("Appointment No", ProcurementRequest."Tender Committee");
        if CommitteeMemebers.FindSet then begin
            repeat
                CompInfo.Get;
                HRSetup.Get;
                PPayableSetup.Get;

                RandomDigit := CreateGuid;
                RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                RandomDigit := CopyStr(RandomDigit, 1, 8);

                Password := RandomDigit;

                if CommitteeMemebers."Nominated Bid Opening" = CommitteeMemebers."nominated bid opening"::"Member 1" then
                    CommitteeMemebers."Opening Person 1" := Password
                else if CommitteeMemebers."Nominated Bid Opening" = CommitteeMemebers."nominated bid opening"::"Member 2" then
                    CommitteeMemebers."Opening Person 2" := Password
                else if CommitteeMemebers."Nominated Bid Opening" = CommitteeMemebers."nominated bid opening"::"Member 3" then
                    CommitteeMemebers."Opening Person 3" := Password;

                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                if PPayableSetup."Default Proc Email Contact" = '' then
                    Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
                CustEmail := PPayableSetup."Default Proc Email Contact";

                CompanyDetails := 'Procurement Officer,' + '<BR></BR>' + CompInfo.Name + '<BR></BR>' + CompInfo.Address + '<BR></BR>' + CompInfo."Address 2" + '<BR></BR>' + CompInfo.City;
                SenderMessage := '<BR>Please find below system Generated Bid Opening Secret code to be used in Process:</BR>' + '<BR></BR>';
                LoginDetails := 'Password:' + Password;
                ActivationDetails := '<BR>Please fill the Secret Code on the Bid Opening to be able to proceed :' + Format(CommitteeMemebers."Nominated Bid Opening") + '</BR>';
                emailhdr := 'Bid Opening Activation (Bid Opening No:' + ProcurementRequest.No + ')';

                   //CC//     SMTP1.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
                   //CC//     CompanyDetails + '<BR></BR>' + SenderMessage + LoginDetails + ActivationDetails, true);

                    //CC//    SMTP1.Send;
                CommitteeMemebers.Modify(true);
            until CommitteeMemebers.Next = 0;
        end
    end;
}
