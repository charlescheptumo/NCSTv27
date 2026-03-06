#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50003 "Release Approval Document"
{
    TableNo = "Purchase Header";

    trigger OnRun()
    begin
    end;

    var
        Text001: label 'There is nothing to release for the document of type %1 with the number %2.';
        Text002: label 'This document can only be released when the approval process is complete.';
        Text003: label 'The approval process must be cancelled or completed to reopen this document.';
        Text004: label 'There are unposted prepayment amounts on the document of type %1 with the number %2.';
        Text005: label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';


    procedure ReleasePV(var PV: Record Payments1)
    begin

        if PV.Status = PV.Status::Released then
            exit;

        //TESTFIELD("Buy-from Vendor No.");
        //IF PV."Document Type"=PV."Document Type"::"Payment Voucher" THEN BEGIN
        PV.Status := PV.Status::Released;
        PV.Modify(true);
        //END;
    end;


    procedure Reopen(var PV: Record Payments1)
    begin
        begin
            if PV.Status = PV.Status::Open then
                exit;
            PV.Status := PV.Status::Open;
            PV.Modify(true);
        end;
    end;


    procedure ReopenLeaveApp(LeaveApp: Record "HR Leave Application")
    begin
        begin
            if LeaveApp.Status = LeaveApp.Status::Open then
                exit;
            LeaveApp.Status := LeaveApp.Status::Open;
            LeaveApp.Modify(true);
        end;
    end;


    procedure ReleaseLeaveApp(LeaveApp: Record "HR Leave Application")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if LeaveApp.Status = LeaveApp.Status::Released then
            exit;

        LeaveApp.Status := LeaveApp.Status::Released;
        LeaveApp.Modify(true);


        ApprovalEntry.Reset;
        ApprovalEntry.SetRange("Document No.", LeaveApp."Application Code");
        if ApprovalEntry.FindSet then begin
            LeaveApp.Reset;
            LeaveApp.SetRange(LeaveApp."Application Code", ApprovalEntry."Document No.");
            if LeaveApp.Find('-') then begin
                //LeaveApp.CreateLeaveLedgerEntries;

              //  ApprovalMgtNotification.SendLeaveApprovedMail(LeaveApp, ApprovalEntry);
            end;
        end;
    end;


    procedure ReopenCopyReg(CopyReg: Record "Copyright Registration Table")
    begin
        begin
            if CopyReg.Status = CopyReg.Status::Open then
                exit;
            CopyReg.Status := CopyReg.Status::Open;
            CopyReg.Modify(true);
        end;
    end;


    procedure ReleaseCopyReg(CopyReg: Record "Copyright Registration Table")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if CopyReg.Status = CopyReg.Status::Approved then
            exit;

        CopyReg.Status := CopyReg.Status::Approved;
        CopyReg.Modify(true);
    end;


    procedure ReopenOvertime(Overtime: Record "Overtime Header")
    begin
        begin
            if Overtime.Status = Overtime.Status::Open then
                exit;
            Overtime.Status := Overtime.Status::Open;
            Overtime.Modify(true);
        end;
    end;


    procedure ReleaseOvertime(Overtime: Record "Overtime Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if Overtime.Status = Overtime.Status::Approved then
            exit;

        Overtime.Status := Overtime.Status::Approved;
        Overtime.Modify(true);
    end;


    procedure ReopenTrainingApp(TrainingApp: Record "Training Requests")
    begin
        begin
            if TrainingApp.Status = TrainingApp.Status::Open then
                exit;
            TrainingApp.Status := TrainingApp.Status::Open;
            TrainingApp.Modify(true);
        end;
    end;


    procedure ReleaseTrainingApp(TrainingApp: Record "Training Requests")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if TrainingApp.Status = TrainingApp.Status::Approved then
            exit;

        TrainingApp.Status := TrainingApp.Status::Approved;
        TrainingApp.Modify(true);
    end;


    procedure ReopenGFA(GFA: Record "Grant Funding Application")
    begin
        begin
            if GFA."Approval Status" = GFA."approval status"::Open then
                exit;
            GFA."Approval Status" := GFA."approval status"::Open;
            GFA.Modify(true);
        end;
    end;


    procedure ReleaseGFA(GFA: Record "Grant Funding Application")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if GFA."Approval Status" = GFA."approval status"::Released then
            exit;

        GFA."Approval Status" := GFA."approval status"::Released;
        GFA.Modify(true);
    end;


    procedure ReopenProjectContract(ProjectContract: Record "Project Contract Header")
    begin
        begin
            if ProjectContract."Approval Status" = ProjectContract."approval status"::Open then
                exit;
            ProjectContract."Approval Status" := ProjectContract."approval status"::Open;
            ProjectContract.Modify(true);
        end;
    end;


    procedure ReleaseProjectContract(ProjectContract: Record "Project Contract Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ProjectContract."Approval Status" = ProjectContract."approval status"::Released then
            exit;

        ProjectContract."Approval Status" := ProjectContract."approval status"::Released;
        ProjectContract.Modify(true);
    end;


    procedure ReopenProcDoc(Procurement: Record "Procurement Request")
    begin
        begin
            if Procurement.Status = Procurement.Status::Open then
                exit;
            Procurement.Status := Procurement.Status::Open;
            Procurement.Modify(true);
        end;
    end;


    procedure ReleaseProcDOc(Procurement: Record "Procurement Request")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if Procurement.Status = Procurement.Status::Released then
            exit;

        Procurement.Status := Procurement.Status::Released;
        Procurement.Modify(true);
    end;


    procedure ReopenFleet(FLeet: Record "Transport Requisition")
    begin
        begin
            if FLeet.Status = FLeet.Status::Open then
                exit;
            FLeet.Status := FLeet.Status::Open;
            FLeet.Modify(true);
        end;
    end;


    procedure ReleaseFleet(Fleet: Record "Transport Requisition")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if Fleet.Status = Fleet.Status::Approved then
            exit;

        Fleet.Status := Fleet.Status::Approved;
        Fleet.Modify(true);
    end;


    procedure ReopenInspectionDoc(Inspection: Record "Inspection Header1")
    begin
        begin
            if Inspection.Status = Inspection.Status::Open then
                exit;
            Inspection.Status := Inspection.Status::Open;
            Inspection.Modify(true);
        end;
    end;


    procedure ReleaseInspectionDOc(Inspection: Record "Inspection Header1")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if Inspection.Status = Inspection.Status::Released then
            exit;

        Inspection.Status := Inspection.Status::Released;
        Inspection.Modify(true);
    end;


    procedure ReopenCommitteeDoc(Committee: Record "Tender Commitee Appointment1")
    begin
        begin
            if Committee.Status = Committee.Status::Open then
                exit;
            Committee.Status := Committee.Status::Open;
            Committee.Modify(true);
        end;
    end;


    procedure ReleaseCommitteeDOc(Committee: Record "Tender Commitee Appointment1")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if Committee.Status = Committee.Status::Released then
            exit;

        Committee.Status := Committee.Status::Released;
        Committee.Modify(true);
    end;


    procedure ReopenFileMovement(FileMovementHeader: Record "File Movement Header")
    begin
        begin
            if FileMovementHeader.Status = FileMovementHeader.Status::Open then
                exit;
            FileMovementHeader.Status := FileMovementHeader.Status::Open;
            FileMovementHeader.Modify(true);
        end;
    end;


    procedure ReleaseFileMovement(FileMovementHeader: Record "File Movement Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if FileMovementHeader.Status = FileMovementHeader.Status::Approved then
            exit;
        FileMovementHeader.Status := FileMovementHeader.Status::Approved;
        FileMovementHeader.Modify(true);
    end;


    procedure ReopenReceipt(ReceiptsHeader1: Record "Receipts Header1")
    begin
        begin
            if ReceiptsHeader1.Status = ReceiptsHeader1.Status::Open then
                exit;
            ReceiptsHeader1.Status := ReceiptsHeader1.Status::Open;
            ReceiptsHeader1.Modify(true);
        end;
    end;


    procedure ReleaseReceipt(ReceiptsHeader1: Record "Receipts Header1")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ReceiptsHeader1.Status = ReceiptsHeader1.Status::Released then
            exit;

        ReceiptsHeader1.Status := ReceiptsHeader1.Status::Released;
        ReceiptsHeader1.Modify(true);
    end;


    procedure ReopenIFP(IFP: Record "Request For Information")
    begin
        begin
            if IFP.Status = IFP.Status::Open then
                exit;
            IFP.Status := IFP.Status::Open;
            IFP.Modify(true);
        end;
    end;


    procedure ReleaseIFP(IFP: Record "Request For Information")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if IFP.Status = IFP.Status::Released then
            exit;

        IFP.Status := IFP.Status::Released;
        IFP.Modify(true);
    end;


    procedure ReopenVendDebarment(VendDebarment: Record "Vendor Debarment Voucher")
    begin
        begin
            if VendDebarment."Approval Status" = VendDebarment."approval status"::Open then
                exit;
            VendDebarment."Approval Status" := VendDebarment."approval status"::Open;
            VendDebarment.Modify(true);
        end;
    end;


    procedure ReleaseVendDebarment(VendDebarment: Record "Vendor Debarment Voucher")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if VendDebarment."Approval Status" = VendDebarment."approval status"::Released then
            exit;

        VendDebarment."Approval Status" := VendDebarment."approval status"::Released;
        VendDebarment.Modify(true);
    end;


    procedure ReopenProcPlan(ProcPlan: Record "Procurement Plan")
    begin
        begin
            if ProcPlan."Approval Status" = ProcPlan."approval status"::Open then
                exit;
            ProcPlan."Approval Status" := ProcPlan."approval status"::Open;
            ProcPlan.Modify(true);
        end;
    end;


    procedure ReleaseProcPlan(ProcPlan: Record "Procurement Plan")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ProcPlan."Approval Status" = ProcPlan."approval status"::Released then
            exit;

        ProcPlan."Approval Status" := ProcPlan."approval status"::Released;
        ProcPlan.Modify(true);
    end;


    procedure ReopenITT(ITT: Record "Standard Purchase Code")
    begin
        begin
            if ITT.Status = ITT.Status::Open then
                exit;
            ITT.Status := ITT.Status::Open;
            ITT."Document Status" := ITT."document status"::Draft;
            ITT.Modify(true);
        end;
    end;


    procedure ReleaseITT(ITT: Record "Standard Purchase Code")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ITT.Status = ITT.Status::Released then
            exit;

        ITT.Status := ITT.Status::Released;
        ITT.Modify(true);
    end;

    local procedure "*******Bank Rec*******************"()
    begin
    end;


    procedure ReopenBankRecReq(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    begin
        /*WITH BankAccReconciliation DO BEGIN
          IF  "Approval Status"= "Approval Status"::Open THEN
            EXIT;
          "Approval Status":="Approval Status"::Open;
          MODIFY(TRUE);
        END;*/

    end;


    procedure ReleaseBankRecReq(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        /*dIF BankAccReconciliation."Approval Status" = BankAccReconciliation."Approval Status"::Released THEN
          EXIT;
        BankAccReconciliation."Approval Status":=BankAccReconciliation."Approval Status"::Released;
        BankAccReconciliation.MODIFY(TRUE);*/

    end;


    procedure ReopenTenderCommitte(TenderCommitte: Record "IFS Tender Committee")
    begin
        begin
            if TenderCommitte."Approval Status" = TenderCommitte."approval status"::Open then
                exit;
            TenderCommitte."Approval Status" := TenderCommitte."approval status"::Open;
            TenderCommitte.Modify(true);
        end;
    end;


    procedure ReleaseTenderCommitte(TenderCommitte: Record "IFS Tender Committee")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if TenderCommitte."Approval Status" = TenderCommitte."approval status"::Released then
            exit;

        TenderCommitte."Approval Status" := TenderCommitte."approval status"::Released;
        TenderCommitte.Modify(true);
    end;


    procedure ReopenTenderAddendum(TenderAddendum: Record "Tender Addendum Notice")
    begin
        begin
            if TenderAddendum.Status = TenderAddendum.Status::Open then
                exit;
            TenderAddendum.Status := TenderAddendum.Status::Open;
            TenderAddendum.Modify(true);
        end;
    end;


    procedure ReleaseTenderAddendum(TenderAddendum: Record "Tender Addendum Notice")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if TenderAddendum.Status = TenderAddendum.Status::Released then
            exit;

        TenderAddendum.Status := TenderAddendum.Status::Released;
        TenderAddendum.Modify(true);
    end;

    local procedure "*******Tender Committe**********"()
    begin
    end;


    procedure ReopenBidEvaluation(BidEvaluation: Record "Bid Evaluation Register")
    begin
        begin
            if BidEvaluation."Approval Status" = BidEvaluation."approval status"::Open then
                exit;
            BidEvaluation."Approval Status" := BidEvaluation."approval status"::Open;
            BidEvaluation.Modify(true);
        end;
    end;


    procedure ReleaseBidEvaluation(BidEvaluation: Record "Bid Evaluation Register")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if BidEvaluation."Approval Status" = BidEvaluation."approval status"::Released then
            exit;

        BidEvaluation."Approval Status" := BidEvaluation."approval status"::Released;
        BidEvaluation.Modify(true);
    end;


    procedure ReopenBidOpening(BidOpening: Record "Bid Opening Register")
    begin
        begin
            if BidOpening."Approval Status" = BidOpening."approval status"::Open then
                exit;
            BidOpening."Approval Status" := BidOpening."approval status"::Open;
            BidOpening.Modify(true);
        end;
    end;


    procedure ReleaseBidOpening(BidOpening: Record "Bid Opening Register")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if BidOpening."Approval Status" = BidOpening."approval status"::Released then
            exit;

        BidOpening."Approval Status" := BidOpening."approval status"::Released;
        BidOpening.Modify(true);
    end;


    procedure ReopenBidTabulation(BidTabulation: Record "Bid Tabulation Header")
    begin
        begin
            if BidTabulation."Approval Status" = BidTabulation."approval status"::Open then
                exit;
            BidTabulation."Approval Status" := BidTabulation."approval status"::Open;
            BidTabulation.Modify(true);
        end;
    end;


    procedure ReleaseBidTabulation(BidTabulation: Record "Bid Tabulation Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if BidTabulation."Approval Status" = BidTabulation."approval status"::Released then
            exit;

        BidTabulation."Approval Status" := BidTabulation."approval status"::Released;
        BidTabulation.Modify(true);
    end;
}
