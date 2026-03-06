#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70046 "Commitee Creation"
{
    PageType = Card;
    SourceTable = "Tender Commitee Appointment1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Appointment No"; Rec."Appointment No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender/Quotation No"; Rec."Tender/Quotation No")
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Committee ID"; Rec."Committee ID")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Name"; Rec."Committee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No of Members"; Rec."No of Members")
                {
                    ApplicationArea = Basic;
                }
                field("Deadline For Report Submission"; Rec."Deadline For Report Submission")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invitation Date';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000016; "Commitee Members")
            {
                SubPageLink = "Appointment No" = field("Appointment No");
                SubPageView = sorting("Appointment No", "Employee No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Committee ")
            {
                Caption = 'Committee ';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    thisrec.Reset;
                    thisrec.SetFilter("Appointment No", Rec."Appointment No");
                    if thisrec.FindSet then begin
                        Report.Run(70031, true, false, thisrec);

                    end;
                end;
            }
            action(PrintPDF)
            {
                ApplicationArea = Basic;
                Image = PrintAcknowledgement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    rfqname := Rec."Appointment No";
                    rfqname2 := Rec."Tender/Quotation No";
                    rfqname := ConvertStr(rfqname, '/', '_');
                    rfqname := ConvertStr(rfqname, '\', '_');
                    thepdffilename := PurchSetup."RFQ Documents Path" + (Format(rfqname)) + '_' + rfqname2 + '.pdf';
                    Clear(thepdffilename);
                    //saveCommiteeReport(Rec);

                    PurchSetup.Get;

                    rfqname2 := ConvertStr(rfqname2, '/', '_');
                    rfqname2 := ConvertStr(rfqname2, '\', '_');
                    Hyperlink(PurchSetup."RFQ Documents Path" + (Format(rfqname)) + '_' + rfqname2 + '.pdf');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Enabled = false;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    /*//======================Checking if it has members
                    committemembers.RESET;
                    committemembers.SETFILTER("Appointment No","Appointment No");
                    IF NOT committemembers.FINDSET THEN BEGIN
                       ERROR('Please Add Committee Members!');
                    END;
                    
                    
                      //if ApprovalMgt.CheckCommitteeApprovalPossible(Rec) THEN
                      //ApprovalMgt.OnSendCommitteeDocForApproval(Rec);
                    
                    //================================================*/


                    //=====================================DBMS Connections====================================================
                    /*"Attached?":=FALSE;
                    GLSetup.RESET;
                    GLSetup.GET;
                    GLSetup.TESTFIELD("DBMS Host Server");
                    GLSetup.TESTFIELD("DMS DB Link");
                    GLSetup.TESTFIELD("DBMS Staging DB");
                    GLSetup.TESTFIELD("Imprest DB Table");
                    
                    ServerName:=GLSetup."DBMS Host Server";
                    NAVDB:=GLSetup."DBMS Staging DB";
                    //ServerName:='192.168.230.11';
                    //BDUserID:='navdb';
                    //BDUserID:='LAPTOP-L7NM5T6N\Attain';
                    //BDPW:='100Bags!';
                    //ERROR('%1..%2',ServerName,NAVDB);
                    //ConnectionString:='Data Source='+ServerName+'Initial Catalog='+NAVDB+'Trusted_Connection=True';
                    ConnectionString:='Data Source='+ServerName+';Initial Catalog='+NAVDB+';Trusted_Connection=True';
                    //ConnectionString:='Data Source='+ServerName+';Initial Catalog='+NAVDB+';UID='+BDUserID+';Pwd='+BDPW+';';
                    
                    SQLConnection:=SQLConnection.SqlConnection(ConnectionString);
                    SQLConnection.Open;
                    //ERROR('...');
                    SQLCommand:=SQLConnection.CreateCommand();
                    Docnobd2:=STRSUBSTNO(Docnobd,"Appointment No");
                    SQLStt:=STRSUBSTNO(BDSTT,GLSetup."DMS DB Link",GLSetup."Imprest DB Table",Docnobd2);
                    //ERROR(SQLStt);//sql statement
                    SQLCommand.CommandText:=SQLStt;
                    SQReader:=SQLCommand.ExecuteReader;
                    WHILE SQReader.Read() DO BEGIN
                        //MESSAGE('%1...%2',FORMAT(SQReader.GetString(1)),FORMAT(SQReader.GetString(2)));
                        "Attached?":=TRUE;
                    END;
                    
                    SQLConnection.Close;
                    CLEAR(SQReader);
                    CLEAR(SQLCommand);
                    CLEAR(SQLConnection);
                    //ERROR('');
                    IF "Attached?"=FALSE THEN BEGIN
                      // ERROR('Please add attachments First!');
                    END;
                    //========================================================================================================
                    
                    commiterec.RESET;
                    commiterec.SETFILTER("Appointment No","Appointment No");
                    IF NOT commiterec.FINDSET THEN BEGIN
                       ERROR('Please add Committee Members!');
                    END;
                    
                    
                    
                    //cc//if ApprovalsMgmt.CheckERCComReqApprovalsWorkflowEnabled(Rec) THEN
                      //cc//ApprovalsMgmt.OnSendERCComReqForApproval(Rec);
                      */

                    /*//if ApprovalMgt.CheckTenderCommApprovalPossible(Rec) THEN
                    //ApprovalMgt.OnSendTenderCommDocForApproval(Rec);*/

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Enabled = false;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin

                    if Rec.Status <> Rec.Status::Released then
;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField(Location);
                    Rec.TestField(Description);


                    //======================Checking if it has members
                    committemembers.Reset;
                    committemembers.SetFilter("Appointment No", Rec."Appointment No");
                    if not committemembers.FindSet then begin
                        Error('Please Add Committee Members!');
                    end;

                    //if ApprovalMgt.CheckCommitteeApprovalPossible(Rec) then
                    //ApprovalMgt.OnSendCommitteeDocForApproval(Rec);

                    //================================================
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    //ApprovalsMgmt.OnCancelCommitteeDocApprovalRequest(Rec);
                end;
            }
            action("DMS Link")
            {
                ApplicationArea = Basic;
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin

                    GLSetup.Get();
                    Link := GLSetup."DMS Link" + Rec."Appointment No";
                    Hyperlink(Link);
                end;
            }
            action("Approval Entries")
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Approval Entries";
                RunPageMode = View;
            }
            group(Approval)
            {
                Caption = 'Approval';
                Image = Alerts;
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                        //CurrPage.CLOSE;
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                        //ApprovalsMgmt.GetApprovalCommentERC(Rec,1,"Appointment No");
                        //CurrPage.CLOSE;
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                        //CurrPage.CLOSE;
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action(Comment1)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments1';
                    Image = ViewComments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        approvalsmgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        approvalentry: Record "Approval Entry";
        OpenApprovalEntriesExistForCurrUser2: Boolean;
        i: Integer;
        approvalentries: Record "Approval Entry";
        CUST: Record Customer;
        Internationalsee: Boolean;
        Localsee: Boolean;
        //cc//   dotnetvalue: dotnet Interaction;
        commentmsg: Text;
        commentline: Record "Approval Comment Line";
        //cc// SQLConnection: dotnet SqlConnection;
        //cc//SQLCommand: dotnet SqlCommand;
        //cc// SQReader: dotnet SqlDataReader;
        ServerName: Text;
        NAVDB: Text;
        ConnectionString: Text;
        BDUserID: Text;
        BDPW: Text;
        SQLStt: Text;
        "Attached?": Boolean;
        Docnobd2: Text;
        GLSetup: Record "General Ledger Setup";
        Link: Text;
        commiterec: Record "Commitee Members";
        thisrec: Record "Tender Commitee Appointment1";
        thisrecord: Record "Tender Commitee Appointment1";
        rfqname: Text;
        rfqname2: Text;
        PurchSetup: Record "Purchases & Payables Setup";
        thepdffilename: Text;
        committemembers: Record "Commitee Members";
        BDSTT: label 'SELECT * FROM %1%2 WHERE [CONTACTS]=''%3''';
        BDSTT2: label 'SELECT * FROM [ERC2017].dbo.[ERC$Customer] where [No_]=''%1''';
        BDSTT3: label 'SELECT * FROM [192.168.230.11].[DMSDB].[dbo].[CF_IMPREST]';
        BDSTT4: label 'SELECT * FROM OPENQUERY([192.168.230.11],''%1'')';
        BDSTT41: label 'SELECT * FROM [DMSDB].[dbo].[CF_IMPREST]';
        Docnobd: label '%1';
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        Attachmentrec: Record "Document Attachment";
        CanCancelApprovalForRecord: Boolean;
        DocumentIsPosted: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;

    // trigger Sqlcommand::StatementCompleted(sender: Variant; e: dotnet StatementCompletedEventArgs)
    // begin
    // end;

    // trigger Sqlcommand::Disposed(sender: Variant; e: dotnet EventArgs)
    // begin
    // end;

    // trigger Sqlconnection::InfoMessage(sender: Variant; e: dotnet SqlInfoMessageEventArgs)
    // begin
    // end;

    // trigger Sqlconnection::StateChange(sender: Variant; e: dotnet StateChangeEventArgs)
    // begin
    // end;

    // trigger Sqlconnection::Disposed(sender: Variant; e: dotnet EventArgs)
    // begin
    // end;
}

