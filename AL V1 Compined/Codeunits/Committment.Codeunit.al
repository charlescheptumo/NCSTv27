#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57001 Committment
{

    trigger OnRun()
    begin
    end;

    var
        UncommittmentDate: Date;
        Text000: label 'The imprest is not fully approved';
        Text001: label 'Please insert the imprest date';
        Text002: label 'Line No %1 has been commited';
        Text003: label 'You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4';
        Text004: label 'Items Committed Successfully and the balance is %1';
        Text005: label 'Payment Voucher No %1 has been successfully created';
        Text006: label 'Petty Cash No %1 has been successfully created';
        Text007: label 'Please insert the petty cash date';


    procedure LPOCommittment(var PurchHeader: Record "Purchase Header")
    var
        PurchaseLines: Record "Purchase Line";
        Committments: Record "Committment Entries";
        Item: Record Item;
        GLAccount: Record "G/L Account";
        FixedAsset: Record "Fixed Asset";
        EntryNo: Integer;
        InventoryPostingSetup: Record "Inventory Posting Setup";
        FixedAssetPG: Record "FA Posting Group";
        GenLedSetup: Record "General Ledger Setup";
        InventoryAccount: Code[20];
        AcquisitionAccount: Code[20];
        BudgetAmount: Decimal;
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        CommitmentEntries: Record "Committment Entries";
        CommittedAmount: Decimal;
        Vendor: Record Vendor;
        CashMgt: Record "Cash Management Setup";
    begin

        PurchaseLines.Reset;
        PurchaseLines.SetRange(PurchaseLines."Document No.", PurchHeader."No.");
        PurchaseLines.SetRange(PurchaseLines."Document Type", PurchaseLines."document type"::Order);
        if PurchaseLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";
            repeat
                Committments.Init;
                Committments."Commitment No" := PurchHeader."No.";
                Committments."Commitment Type" := Committments."commitment type"::Committed;
                PurchHeader.Validate("Order Date");
                if PurchHeader."Order Date" = 0D then
                    Error('Please enter the order date');
                Committments."Commitment Date" := PurchHeader."Order Date";
                Committments."Global Dimension 1" := PurchaseLines."Shortcut Dimension 1 Code";
                Committments."Global Dimension 2" := PurchaseLines."Shortcut Dimension 2 Code";
                //Case of G/L Account,Item,Fixed Asset
                case PurchaseLines.Type of
                    PurchaseLines.Type::Item:
                        begin
                            Item.Reset;
                            if Item.Get(PurchaseLines."No.") then
                                if Item."Inventory Posting Group" = '' then
                                    Error('Assign Posting Group to Item No %1', Item."No.");
                            InventoryPostingSetup.Get(PurchaseLines."Location Code", Item."Inventory Posting Group");
                            InventoryAccount := InventoryPostingSetup."Inventory Account";
                            Committments.Account := InventoryAccount;
                        end;
                    PurchaseLines.Type::"G/L Account":
                        begin
                            Committments.Account := PurchaseLines."No.";
                        end;
                    PurchaseLines.Type::"Fixed Asset":
                        begin
                            if FixedAssetPG.Get(PurchaseLines."Posting Group") then begin
                                FixedAssetPG.TestField("Acquisition Cost Account");
                                AcquisitionAccount := FixedAssetPG."Acquisition Cost Account";
                                Committments.Account := AcquisitionAccount;
                            end;
                        end;
                end;
                Committments."Committed Amount" := PurchaseLines."Line Amount";
                //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                CashMgt.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter", CashMgt."Current Budget");
                case PurchaseLines.Type of
                    PurchaseLines.Type::Item:
                        begin
                            GLAccount.SetRange(GLAccount."No.", InventoryAccount);
                        end;
                    PurchaseLines.Type::"G/L Account":
                        begin
                            GLAccount.SetRange(GLAccount."No.", PurchaseLines."No.");
                        end;
                    PurchaseLines.Type::"Fixed Asset":
                        GLAccount.SetRange(GLAccount."No.", AcquisitionAccount);
                end;

                GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                //Get budget amount avaliable
                GLAccount.SetRange(GLAccount."Date Filter", CashMgt."Current Budget Start Date", PurchHeader."Order Date");
                if GLAccount.Find('-') then begin
                    GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                    BudgetAmount := GLAccount."Budgeted Amount";
                    Expenses := GLAccount."Net Change";
                    BudgetAvailable := GLAccount."Budgeted Amount" - GLAccount."Net Change";
                end;
                //Get committed Amount
                CommittedAmount := 0;
                CommitmentEntries.Reset;
                CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                if PurchaseLines.Type = PurchaseLines.Type::Item then
                    CommitmentEntries.SetRange(CommitmentEntries.Account, InventoryAccount);
                if PurchaseLines.Type = PurchaseLines.Type::"G/L Account" then
                    CommitmentEntries.SetRange(CommitmentEntries.Account, PurchaseLines."No.");
                if PurchaseLines.Type = PurchaseLines.Type::"Fixed Asset" then
                    CommitmentEntries.SetRange(CommitmentEntries.Account, AcquisitionAccount);
                CommitmentEntries.SetRange(CommitmentEntries."Commitment Date", CashMgt."Current Budget Start Date",
                                           PurchHeader."Order Date");
                CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                CommittedAmount := CommitmentEntries."Committed Amount";
                if LineCommitted(PurchHeader."No.", PurchaseLines."No.", PurchaseLines."Line No.") then
                    Message('Line No %1 has been commited', PurchaseLines."Line No.")
                else

                    if CommittedAmount + PurchaseLines."Line Amount" > BudgetAvailable then
                        Error('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
                        , Committments.Account,
                        Abs(BudgetAvailable - (CommittedAmount + PurchaseLines."Line Amount")), BudgetAvailable, CommittedAmount);

                Committments.User := UserId;
                Committments."Document No" := PurchHeader."No.";
                Committments.No := PurchaseLines."No.";
                Committments."Line No." := PurchaseLines."Line No.";
                Committments."Account Type" := Committments."account type"::Vendor;
                Committments."Account No." := PurchaseLines."Buy-from Vendor No.";
                if Vendor.Get(PurchaseLines."Buy-from Vendor No.") then
                    Committments."Account Name" := Vendor.Name;
                Committments.Description := PurchaseLines.Description;

                //Check whether line is committed.
                if not LineCommitted(PurchHeader."No.", PurchaseLines."No.", PurchaseLines."Line No.") then begin
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                    //PurchaseLines.Committed:=TRUE;
                    PurchaseLines.Modify;
                end;
            until PurchaseLines.Next = 0;
        end;
        Message('Items Committed Successfully and the balance is %1',
        Abs(BudgetAvailable - (CommittedAmount + PurchaseLines."Line Amount")));
    end;


    procedure LineCommitted(var CommittmentNo: Code[20]; var No: Code[20]; var LineNo: Integer) Exists: Boolean
    var
        Committed: Record "Committment Entries";
    begin
        Exists := false;
        Committed.Reset;
        Committed.SetRange(Committed."Commitment No", CommittmentNo);
        Committed.SetRange(Committed.No, No);
        Committed.SetRange(Committed."Line No.", LineNo);
        if Committed.Find('-') then
            Exists := true;
    end;


    procedure ImprestCommittment(var ImprestHeader: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        BudgetAmount: Decimal;
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        CommittedAmount: Decimal;
        CommitmentEntries: Record "Committment Entries";
        GenLedSetup: Record "General Ledger Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        CashMgt: Record "Cash Management Setup";
    begin

        if ImprestHeader.Status <> ImprestHeader.Status::Released then
            Error(Text000);
        ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
        if ImprestLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";
            repeat
                Committments.Init;
                Committments."Commitment No" := ImprestHeader."No.";
                Committments."Commitment Type" := Committments."commitment type"::Committed;
                ImprestHeader.TestField(Date);
                Committments."Commitment Date" := ImprestHeader.Date;
                Committments."Global Dimension 1" := ImprestLines."Global Dimension 1 Code";
                Committments."Global Dimension 2" := ImprestLines."Global Dimension 2 Code";
                Committments.Account := ImprestLines."Account No.";
                Committments."Committed Amount" := ImprestLines.Amount;

                //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                CashMgt.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter", CashMgt."Current Budget");
                GLAccount.SetRange(GLAccount."No.", ImprestLines."Account No.");
                //Get budget amount avaliable
                GLAccount.SetRange(GLAccount."Date Filter", CashMgt."Current Budget Start Date", ImprestHeader.Date);
                if GLAccount.Find('-') then begin
                    GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                    BudgetAmount := GLAccount."Budgeted Amount";
                    Expenses := GLAccount."Net Change";
                    BudgetAvailable := GLAccount."Budgeted Amount" - GLAccount."Net Change";
                end;
                //Get committed Amount
                CommittedAmount := 0;
                CommitmentEntries.Reset;
                CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                CommitmentEntries.SetRange(CommitmentEntries.Account, ImprestLines."Account No.");
                if ImprestHeader.Date = 0D then
                    Error(Text001);
                CommitmentEntries.SetRange(CommitmentEntries."Commitment Date", CashMgt."Current Budget Start Date",
                                           ImprestHeader.Date);
                CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                CommittedAmount := CommitmentEntries."Committed Amount";
                if LineCommitted(ImprestHeader."No.", ImprestLines."Account No.", ImprestLines."Line No") then
                    Message(Text002, ImprestLines."Line No")
                else begin
                    CashMgt.Get;
                    if CashMgt."Check for Committment" then
                        if CommittedAmount + ImprestLines.Amount > BudgetAvailable then
                            Error(Text003
                           , Committments.Account,
                            Abs(BudgetAvailable - (CommittedAmount + ImprestLines.Amount)), BudgetAvailable, CommittedAmount);
                end;
                Committments.User := UserId;
                Committments."Document No" := ImprestHeader."No.";
                Committments.No := ImprestLines."Account No.";
                Committments."Line No." := ImprestLines."Line No";
                Committments."Account Type" := Committments."account type"::Customer;
                Committments."Account No." := ImprestHeader."Account No.";
                if Customer.Get(ImprestHeader."Account No.") then
                    Committments."Account Name" := Customer.Name;
                CommitmentEntries.Description := ImprestLines.Description;
                //Check whether line is committed.
                if not LineCommitted(ImprestHeader."No.", ImprestLines."Account No.", ImprestLines."Line No") then begin
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                    ImprestLines.Committed := true;
                    ImprestLines.Modify;
                end;
            until ImprestLines.Next = 0;
        end;
        Message(Text004,
        Abs(BudgetAvailable - (CommittedAmount + ImprestLines.Amount)));
        CreatePV(ImprestHeader);
    end;


    procedure ReverseLPOCommittment(var PurchHeader: Record "Purchase Header")
    var
        Committment: Record "Committment Entries";
        PurchLine: Record "Purchase Line";
        EntryNo: Integer;
        Item: Record Item;
        InventoryPostingSetup: Record "Inventory Posting Setup";
        FixedAssetPG: Record "FA Posting Group";
        GenLedSetup: Record "General Ledger Setup";
        InventoryAccount: Code[20];
        AcquisitionAccount: Code[20];
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
    begin
        if Confirm('Are you sure you want to reverse the committed entries for Order no ' + PurchHeader."No." + '?', false) = true then begin
            Committment.Reset;
            Committment.SetRange(Committment."Commitment No", PurchHeader."No.");
            if Committment.Find('-') then begin
                Committment.DeleteAll;
            end;
            PurchLine.Reset;
            PurchLine.SetRange(PurchLine."Document Type", PurchLine."document type"::Order);
            PurchLine.SetRange(PurchLine."Document No.", PurchHeader."No.");
            if PurchLine.FindFirst then begin
                repeat

                    //Insert Reversal entries in the committment entries table
                    if Committment.Find('+') then
                        EntryNo := Committment."Entry No";
                    EntryNo := EntryNo + 1;
                    if LineCommitted(PurchHeader."No.", PurchLine."No.", PurchLine."Line No.") then begin
                        Committment.Init;
                        Committment."Entry No" := EntryNo;
                        Committment."Commitment No" := PurchHeader."No.";
                        Committment."Commitment Type" := Committment."commitment type"::Reversal;
                        Committment."Commitment Date" := PurchLine."Order Date";
                        //Dimensions
                        Committment."Global Dimension 1" := PurchLine."Shortcut Dimension 1 Code";
                        Committment."Global Dimension 2" := PurchLine."Shortcut Dimension 2 Code";
                        //Dimensions
                        //Case of G/L Account,Item,Fixed Asset
                        case PurchLine.Type of
                            PurchLine.Type::Item:
                                begin
                                    Item.Reset;
                                    if Item.Get(PurchLine."No.") then
                                        if Item."Inventory Posting Group" = '' then
                                            Error('Assign Posting Group to Item No %1', Item."No.");
                                    InventoryPostingSetup.Get(PurchLine."Location Code", Item."Inventory Posting Group");
                                    InventoryAccount := InventoryPostingSetup."Inventory Account";
                                    Committment.Account := InventoryAccount;
                                end;
                            PurchLine.Type::"G/L Account":
                                begin
                                    Committment.Account := PurchLine."No.";
                                end;
                            PurchLine.Type::"Fixed Asset":
                                begin
                                    FixedAsset.Reset;
                                    FixedAsset.Get(PurchLine."No.");
                                    FixedAssetPG.Get(FixedAsset."FA Posting Group");
                                    AcquisitionAccount := FixedAssetPG."Acquisition Cost Account";
                                    Committment.Account := AcquisitionAccount;
                                end;
                        end;
                        Committment."Committed Amount" := -PurchLine."Line Amount";

                        Committment.User := UserId;
                        Committment."Document No" := PurchHeader."No.";
                        Committment.No := PurchLine."No.";
                        Committment."Account Type" := Committment."account type"::Vendor;
                        Committment."Account No." := PurchLine."Buy-from Vendor No.";
                        if Vendor.Get(PurchLine."Buy-from Vendor No.") then
                            Committment."Account Name" := Vendor.Name;
                        Committment.Description := PurchLine.Description;

                        Committment.Insert;

                        //Mark entries as uncommited
                        //PurchLine.Committed:=FALSE;
                        PurchLine.Modify;
                    end;

                until PurchLine.Next = 0;
            end;
            Message('Committed entries for Order No %1 Have been reversed Successfully', PurchHeader."No.");
        end;
    end;


    procedure ReverseImprestCommittment(var ImprestHeader: Record Payments)
    var
        Committment: Record "Committment Entries";
        ImprestLine: Record "Imprest Lines";
        EntryNo: Integer;
    begin
        if Confirm('Are you sure you want to reverse the committed entries for Imprest no ' + ImprestHeader."No." + '?', false) = true then begin
            Committment.Reset;
            Committment.SetRange(Committment."Commitment No", ImprestHeader."No.");
            if Committment.Find('-') then begin
                Committment.DeleteAll;
            end;
            ImprestLine.Reset;
            ImprestLine.SetRange(ImprestLine.No, ImprestHeader."No.");
            if ImprestLine.FindFirst then begin
                if Committment.FindLast then
                    EntryNo := Committment."Entry No";
                repeat

                    //Insert reversal entries into the committment table
                    if LineCommitted(ImprestHeader."No.", ImprestLine."Account No.", ImprestLine."Line No") then begin
                        Committment.Init;
                        Committment."Commitment No" := ImprestHeader."No.";
                        Committment."Commitment Type" := Committment."commitment type"::Reversal;
                        Committment."Commitment Date" := ImprestHeader.Date;
                        Committment."Global Dimension 1" := ImprestLine."Global Dimension 1 Code";
                        Committment."Global Dimension 2" := ImprestLine."Global Dimension 2 Code";
                        Committment.Account := ImprestLine."Account No.";
                        Committment."Committed Amount" := -ImprestLine.Amount;
                        Committment.User := UserId;
                        Committment."Document No" := ImprestHeader."No.";
                        Committment.No := ImprestLine."Account No.";
                        Committment."Line No." := ImprestLine."Line No";
                        EntryNo := EntryNo + 1;
                        Committment."Entry No" := EntryNo;
                        Committment.Insert;


                        //Mark imprest lines entries as uncommited
                        ImprestLine.Committed := false;
                        ImprestLine.Modify;
                    end;
                until ImprestLine.Next = 0;
            end;
            Message('Committed entries for Imprest No %1 Have been reversed Successfully', ImprestHeader."No.");
        end;
    end;


    procedure UncommitLPO(var PurchHeader: Record "Purchase Header")
    var
        Committment: Record "Committment Entries";
        PurchLine: Record "Purchase Line";
        EntryNo: Integer;
        Item: Record Item;
        InventoryPostingSetup: Record "Inventory Posting Setup";
        FixedAssetPG: Record "FA Posting Group";
        GenLedSetup: Record "General Ledger Setup";
        InventoryAccount: Code[20];
        AcquisitionAccount: Code[20];
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
    begin
        //Post Reversals to committment entries
        PurchLine.Reset;
        PurchLine.SetRange(PurchLine."Document Type", PurchLine."document type"::Order);
        PurchLine.SetRange(PurchLine."Document No.", PurchHeader."No.");
        if PurchLine.Find('-') then begin
            if Committment.Find('+') then
                EntryNo := Committment."Entry No";
            EntryNo := EntryNo + 1;

            Committment.Reset;
            Committment.SetRange(Committment."Commitment No", PurchHeader."No.");
            Committment.SetRange(Committment."Commitment Type", Committment."commitment type"::Committed);
            if Committment.Find('-') then
                UncommittmentDate := Committment."Commitment Date";

            repeat
                if LineCommitted(PurchHeader."No.", PurchLine."No.", PurchLine."Line No.") then begin
                    Committment.Init;
                    Committment."Entry No" := EntryNo;
                    Committment."Commitment No" := PurchHeader."No.";
                    Committment."Commitment Type" := Committment."commitment type"::Reversal;
                    //Insert the same
                    Committment."Commitment Date" := UncommittmentDate;
                    Committment."Uncommittment Date" := PurchLine."Order Date";
                    //Dimensions
                    Committment."Global Dimension 1" := PurchLine."Shortcut Dimension 1 Code";
                    Committment."Global Dimension 2" := PurchLine."Shortcut Dimension 2 Code";
                    //Dimensions
                    //Case of G/L Account,Item,Fixed Asset
                    case PurchLine.Type of
                        PurchLine.Type::Item:
                            begin
                                Item.Reset;
                                if Item.Get(PurchLine."No.") then
                                    if Item."Inventory Posting Group" = '' then
                                        Error('Assign Posting Group to Item No %1', Item."No.");
                                InventoryPostingSetup.Get(PurchLine."Location Code", Item."Inventory Posting Group");
                                InventoryAccount := InventoryPostingSetup."Inventory Account";
                                Committment.Account := InventoryAccount;
                            end;
                        PurchLine.Type::"G/L Account":
                            begin
                                Committment.Account := PurchLine."No.";
                            end;
                        PurchLine.Type::"Fixed Asset":
                            begin
                                FixedAsset.Reset;
                                FixedAsset.Get(PurchLine."No.");
                                FixedAssetPG.Get(FixedAsset."FA Posting Group");
                                AcquisitionAccount := FixedAssetPG."Acquisition Cost Account";
                                Committment.Account := AcquisitionAccount;
                            end;
                    end;
                    Committment."Committed Amount" := -PurchLine."Line Amount";
                    Committment.User := UserId;
                    Committment."Document No" := PurchHeader."No.";
                    Committment.No := PurchLine."No.";
                    Committment."Line No." := PurchLine."Line No.";
                    Committment."Account Type" := Committment."account type"::Vendor;
                    Committment."Account No." := PurchLine."Buy-from Vendor No.";
                    if Vendor.Get(PurchLine."Buy-from Vendor No.") then
                        Committment."Account Name" := Vendor.Name;
                    Committment.Description := PurchLine.Description;

                    Committment.Insert;
                end;
            until PurchLine.Next = 0;
        end;
        //End Post Reversal to Committment entries

        //Note LPO Uncommittment.
    end;


    procedure UncommitImprest(var ImprestHeader: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        CSetup: Record "Cash Management Setup";
    begin
        ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
        if ImprestLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";

            Committments.Reset;
            Committments.SetRange(Committments."Commitment No", ImprestHeader."No.");
            Committments.SetRange(Committments."Commitment Type", Committments."commitment type"::Committed);
            if Committments.Find('-') then
                UncommittmentDate := Committments."Commitment Date";

            repeat
                if LineCommitted(ImprestHeader."No.", ImprestLines."Account No.", ImprestLines."Line No") then begin
                    Committments.Init;
                    Committments."Commitment No" := ImprestHeader."No.";
                    Committments."Commitment Type" := Committments."commitment type"::Reversal;
                    //Insert same Commitment Date
                    Committments."Commitment Date" := UncommittmentDate;
                    Committments."Uncommittment Date" := ImprestHeader.Date;

                    Committments."Global Dimension 1" := ImprestLines."Global Dimension 1 Code";
                    Committments."Global Dimension 2" := ImprestLines."Global Dimension 2 Code";
                    Committments.Account := ImprestLines."Account No.";
                    Committments."Committed Amount" := -LastCommittment(ImprestHeader."No.", ImprestLines."Account No.", ImprestLines."Line No");
                    Committments.User := UserId;
                    Committments."Document No" := ImprestHeader."No.";
                    Committments.No := ImprestLines."Account No.";
                    Committments."Line No." := ImprestLines."Line No";
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                end;
            until ImprestLines.Next = 0;
        end;
    end;


    procedure CreatePV(var ImprestHeader: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        PVLines: Record "PV Lines";
        LineNo: Integer;
        CSetup: Record "Cash Management Setup";
        PettyCashLines: Record "Petty Cash Lines";
    begin
        //Check whether the petty cash Limt has been exceeded or not
        CSetup.Get;
        CSetup.TestField("Imprest Limit");
        ImprestHeader.CalcFields("Imprest Amount");
        if ImprestHeader."Imprest Amount" > CSetup."Imprest Limit" then begin
            //Create a PV
            ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    PVLines.Init;
                    PVLines.No := ImprestHeader."No.";
                    PVLines."Line No" := ImprestLines."Line No";
                    PVLines.Date := ImprestHeader.Date;
                    PVLines."Account Type" := ImprestLines."Account Type";
                    PVLines."Account No" := ImprestLines."Account No.";
                    PVLines."Account Name" := ImprestLines."Account Name";
                    PVLines.Description := ImprestLines.Description;
                    PVLines.Amount := ImprestLines.Amount;
                    PVLines.Validate(Amount);
                    PVLines."Shortcut Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                    PVLines."Shortcut Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                    if not PVLines.Get(PVLines.No, PVLines."Line No") then
                        PVLines.Insert;
                until
                 ImprestLines.Next = 0;
            end;
            ImprestHeader."Payment Type" := ImprestHeader."payment type"::"Payment Voucher";
            ImprestHeader."Original Document" := ImprestHeader."original document"::Imprest;
            ImprestHeader.Status := ImprestHeader.Status::Released;
            ImprestHeader."PV Creation DateTime" := CreateDatetime(Today, Time);
            ImprestHeader."PV Creator ID" := UserId;
            ImprestHeader.Modify(true);
            Message(Text005, ImprestHeader."No.");
        end else begin
            //Create a petty cash
            ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    PettyCashLines.Init;
                    PettyCashLines.No := ImprestHeader."No.";
                    PettyCashLines."Line No" := ImprestLines."Line No";
                    PettyCashLines."Account Type" := ImprestLines."Account Type";
                    PettyCashLines."Account No" := ImprestLines."Account No.";
                    PettyCashLines."Account Name" := ImprestLines."Account Name";
                    PettyCashLines.Description := ImprestLines.Description;
                    PettyCashLines.Amount := ImprestLines.Amount;
                    PettyCashLines."Global Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                    PettyCashLines."Global Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                    if not PettyCashLines.Get(PettyCashLines.No, PettyCashLines."Line No") then
                        PettyCashLines.Insert;
                until
                 ImprestLines.Next = 0;
            end;
            ImprestHeader."Payment Type" := ImprestHeader."payment type"::"Petty Cash";
            ImprestHeader."Original Document" := ImprestHeader."original document"::Imprest;
            ImprestHeader.Status := ImprestHeader.Status::Released;
            ImprestHeader."PV Creation DateTime" := CreateDatetime(Today, Time);
            ImprestHeader."PV Creator ID" := UserId;
            ImprestHeader.Modify(true);
            Message(Text006, ImprestHeader."No.");
        end;
    end;


    procedure LastCommittment(var CommittmentNo: Code[20]; var No: Code[20]; var LineNo: Integer) CommittmentAmt: Decimal
    var
        Committed: Record "Committment Entries";
    begin
        Committed.Reset;
        Committed.SetRange(Committed."Commitment No", CommittmentNo);
        Committed.SetRange(Committed.No, No);
        Committed.SetRange(Committed."Line No.", LineNo);
        if Committed.Find('-') then
            exit(Committed."Committed Amount");
    end;


    procedure PettyCashCommittment(PettyCash: Record Payments)
    var
        PettyCashLines: Record "Petty Cash Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        BudgetAmount: Decimal;
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        CommittedAmount: Decimal;
        CommitmentEntries: Record "Committment Entries";
        GenLedSetup: Record "General Ledger Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        CashMgt: Record "Cash Management Setup";
    begin
        /*
        IF PettyCash.Status<>PettyCash.Status::Released THEN
            ERROR('The petty cash voucher is not fully approved');
        */
        PettyCashLines.Reset;
        PettyCashLines.SetRange(No, PettyCash."No.");
        PettyCashLines.SetRange("Account Type", PettyCashLines."account type"::"G/L Account");
        if PettyCashLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";
            repeat
                Committments.Init;
                Committments."Commitment No" := PettyCash."No.";
                Committments."Commitment Type" := Committments."commitment type"::Committed;
                PettyCash.TestField(Date);
                Committments."Commitment Date" := PettyCash.Date;
                Committments."Global Dimension 1" := PettyCashLines."Global Dimension 1 Code";
                Committments."Global Dimension 2" := PettyCashLines."Global Dimension 2 Code";
                Committments.Account := PettyCashLines."Account No";
                Committments."Committed Amount" := PettyCashLines.Amount;

                //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                CashMgt.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter", CashMgt."Current Budget");
                GLAccount.SetRange(GLAccount."No.", PettyCashLines."Account No");
                //Get budget amount avaliable
                GLAccount.SetRange(GLAccount."Date Filter", CashMgt."Current Budget Start Date", PettyCash.Date);
                if GLAccount.Find('-') then begin
                    GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                    BudgetAmount := GLAccount."Budgeted Amount";
                    Expenses := GLAccount."Net Change";
                    BudgetAvailable := GLAccount."Budgeted Amount" - GLAccount."Net Change";
                end;
                //Get committed Amount
                CommittedAmount := 0;
                CommitmentEntries.Reset;
                CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                CommitmentEntries.SetRange(CommitmentEntries.Account, PettyCashLines."Account No");
                if PettyCash.Date = 0D then
                    Error(Text007);
                CommitmentEntries.SetRange(CommitmentEntries."Commitment Date", CashMgt."Current Budget Start Date",
                                           PettyCash.Date);
                CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                CommittedAmount := CommitmentEntries."Committed Amount";
                if LineCommitted(PettyCash."No.", PettyCashLines."Account No", PettyCashLines."Line No") then
                    Message(Text002, PettyCashLines."Line No")
                else
                    if CommittedAmount + PettyCashLines.Amount > BudgetAvailable then
                        Error(Text003
                       , Committments.Account,
                        Abs(BudgetAvailable - (CommittedAmount + PettyCashLines.Amount)), BudgetAvailable, CommittedAmount);

                Committments.User := UserId;
                Committments."Document No" := PettyCash."No.";
                Committments.No := PettyCashLines."Account No";
                Committments."Line No." := PettyCashLines."Line No";
                Committments."Account Type" := Committments."account type"::Customer;
                Committments."Account No." := PettyCash."Account No.";
                if GLAccount.Get(PettyCash."Account No.") then
                    Committments."Account Name" := GLAccount.Name;
                CommitmentEntries.Description := PettyCashLines.Description;
                //Check whether line is committed.
                if not LineCommitted(PettyCash."No.", PettyCashLines."Account No", PettyCashLines."Line No") then begin
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                    PettyCashLines.Committed := true;
                    PettyCashLines.Modify;
                end;
            until PettyCashLines.Next = 0;
        end;
        Message(Text004,
        Abs(BudgetAvailable - (CommittedAmount + PettyCashLines.Amount)));

    end;


    procedure ReversePettyCashCommittment(var PettyCash: Record Payments)
    var
        Committment: Record "Committment Entries";
        PettyCashLine: Record "Petty Cash Lines";
        EntryNo: Integer;
    begin
        if Confirm('Are you sure you want to reverse the committed entries for Petty Cash no ' + PettyCash."No." + '?', false) = true then begin
            Committment.Reset;
            Committment.SetRange(Committment."Commitment No", PettyCash."No.");
            if Committment.Find('-') then begin
                Committment.DeleteAll;
            end;
            PettyCashLine.Reset;
            PettyCashLine.SetRange(No, PettyCash."No.");
            if PettyCashLine.FindFirst then begin
                if Committment.FindLast then
                    EntryNo := Committment."Entry No";
                repeat

                    //Insert reversal entries into the committment table
                    if LineCommitted(PettyCash."No.", PettyCashLine."Account No", PettyCashLine."Line No") then begin
                        Committment.Init;
                        Committment."Commitment No" := PettyCash."No.";
                        Committment."Commitment Type" := Committment."commitment type"::Reversal;
                        Committment."Commitment Date" := PettyCash.Date;
                        Committment."Global Dimension 1" := PettyCashLine."Global Dimension 1 Code";
                        Committment."Global Dimension 2" := PettyCashLine."Global Dimension 2 Code";
                        Committment.Account := PettyCashLine."Account No";
                        Committment."Committed Amount" := -PettyCashLine.Amount;
                        Committment.User := UserId;
                        Committment."Document No" := PettyCash."No.";
                        Committment.No := PettyCashLine."Account No";
                        Committment."Line No." := PettyCashLine."Line No";
                        EntryNo := EntryNo + 1;
                        Committment."Entry No" := EntryNo;
                        Committment.Insert;


                        //Mark imprest lines entries as uncommited
                        PettyCashLine.Committed := false;
                        PettyCashLine.Modify;
                    end;
                until PettyCashLine.Next = 0;
            end;
            Message('Committed entries for Petty Cash No %1 Have been reversed Successfully', PettyCash."No.");
        end;
    end;


    procedure UncommitPettyCash(var PettyCash: Record Payments)
    var
        PettyCashLines: Record "Petty Cash Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        CSetup: Record "Cash Management Setup";
    begin
        PettyCashLines.SetRange(No, PettyCash."No.");
        if PettyCashLines.FindFirst then begin
            if Committments.FindLast then
                EntryNo := Committments."Entry No";

            Committments.Reset;
            Committments.SetRange(Committments."Commitment No", PettyCash."No.");
            Committments.SetRange(Committments."Commitment Type", Committments."commitment type"::Committed);
            if Committments.Find('-') then
                UncommittmentDate := Committments."Commitment Date";

            repeat
                if LineCommitted(PettyCash."No.", PettyCashLines."Account No", PettyCashLines."Line No") then begin
                    Committments.Init;
                    Committments."Commitment No" := PettyCash."No.";
                    Committments."Commitment Type" := Committments."commitment type"::Reversal;
                    //Insert same Commitment Date
                    Committments."Commitment Date" := UncommittmentDate;
                    Committments."Uncommittment Date" := PettyCash.Date;

                    Committments."Global Dimension 1" := PettyCashLines."Global Dimension 1 Code";
                    Committments."Global Dimension 2" := PettyCashLines."Global Dimension 2 Code";
                    Committments.Account := PettyCashLines."Account No";
                    Committments."Committed Amount" := -LastCommittment(PettyCash."No.", PettyCashLines."Account No", PettyCashLines."Line No");
                    Committments.User := UserId;
                    Committments."Document No" := PettyCash."No.";
                    Committments.No := PettyCashLines."Account No";
                    Committments."Line No." := PettyCashLines."Line No";
                    EntryNo := EntryNo + 1;
                    Committments."Entry No" := EntryNo;
                    Committments.Insert;
                end;
            until PettyCashLines.Next = 0;
        end;
    end;


    procedure CheckPVCommittment(PV: Record Payments)
    var
        PVLines: Record "PV Lines";
        Committments: Record "Committment Entries";
        EntryNo: Integer;
        BudgetAmount: Decimal;
        Expenses: Decimal;
        BudgetAvailable: Decimal;
        CommittedAmount: Decimal;
        CommitmentEntries: Record "Committment Entries";
        GenLedSetup: Record "General Ledger Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        CashMgt: Record "Cash Management Setup";
    begin
        PVLines.Reset;
        PVLines.SetRange(No, PV."No.");
        PVLines.SetRange("Account Type", PVLines."account type"::"G/L Account");
        if PVLines.Find('-') then begin
            repeat
                //Confirm the Amount to be issued does not exceed the budget and amount Committed
                //Get Budget for the G/L
                CashMgt.Get;
                GLAccount.SetFilter(GLAccount."Budget Filter", CashMgt."Current Budget");
                GLAccount.SetRange(GLAccount."No.", PVLines."Account No");
                //Get budget amount avaliable
                GLAccount.SetRange(GLAccount."Date Filter", CashMgt."Current Budget Start Date", PV.Date);
                if GLAccount.Find('-') then begin
                    GLAccount.CalcFields(GLAccount."Budgeted Amount", GLAccount."Net Change");
                    BudgetAmount := GLAccount."Budgeted Amount";
                    Expenses := GLAccount."Net Change";
                    BudgetAvailable := GLAccount."Budgeted Amount" - GLAccount."Net Change";
                end;
                //Get committed Amount
                CommittedAmount := 0;
                CommitmentEntries.Reset;
                CommitmentEntries.SetCurrentkey(CommitmentEntries.Account);
                CommitmentEntries.SetRange(CommitmentEntries.Account, PVLines."Account No");
                if PV.Date = 0D then
                    Error('Please insert the payment voucher date');
                CommitmentEntries.SetRange(CommitmentEntries."Commitment Date", CashMgt."Current Budget Start Date",
                                           PV.Date);
                CommitmentEntries.CalcSums(CommitmentEntries."Committed Amount");
                CommittedAmount := CommitmentEntries."Committed Amount";
                if GLAccount.Get(PVLines."Account No") then;
                //IF GLAccount."Check Budget" THEN BEGIN
                if CommittedAmount + PVLines.Amount > BudgetAvailable then
                    Error('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
                   , Committments.Account,
                    Abs(BudgetAvailable - (CommittedAmount + PVLines.Amount)), BudgetAvailable, CommittedAmount);
            //END;
            until PVLines.Next = 0;
        end;
    end;
}
