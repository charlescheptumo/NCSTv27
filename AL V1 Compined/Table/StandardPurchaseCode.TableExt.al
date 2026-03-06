#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50021 tableextension50021 extends "Standard Purchase Code"
{
    fields
    {

        //Unsupported feature: Property Insertion (DataClassification) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (Description) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (Editable) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (DataClassification) on "Description(Field 2)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Currency Code"(Field 3)".


        //Unsupported feature: Code Insertion on "Code(Field 1)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF Code <> xRec.Code THEN BEGIN
          PurchSetup.GET;
          NoSeriesMgt.TestManual(PurchSetup."ITT No. Series");
          "No. Series" := '';
        END;
        */
        //end;

        //Unsupported feature: Property Deletion (NotBlank) on "Code(Field 1)".



        //Unsupported feature: Code Insertion on "Description(Field 2)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        {IF Purchheader.GET(Description)THEN
          BEGIN
            Description:=Purchheader.Description;
            END}
        */
        //end;
        field(4; "Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction,Public Private Partnership';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction","Public Private Partnership";
        }
        field(5; "Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'When the Solicitation Type is selcted, the system shall auto-populate the Bid Selection Method and Procurement Method fields';
            TableRelation = "Solicitation Type".Code;
        }
        field(6; "External Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(8; "Procurement Category ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;
        }
        field(9; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(10; "Assigned Procurement Officer"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to record the assigned Procurement Officer. Mapped to Sales Person/Purchaser table (Filter Role type: Procurement Officer)';
            TableRelation = "Salesperson/Purchaser".Code where("Role Type" = const("Procurement Officer"));
        }
        field(11; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Roads.Reset;
                Roads.SetRange("No.", Rec."Road Code");
                if Roads.FindSet then
                    Rec."Road Link Name" := Roads.Description
            end;
        }
        field(12; "Road Link Name"; Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Constituency ID"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Requesting Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(15; "Requesting Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(16; "Requesting Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Department),
                                                                "Direct Reports To" = field("Requesting Directorate"));
        }
        field(17; "Engineer Estimate (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is based on estimates for Works that usuallly guide bidders/contarctors in specialized industries such as Road construction';
        }
        field(18; "Tender Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Tender Summary"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(22; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(23; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            DataClassification = ToBeClassified;
        }
        field(24; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(25; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(26; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(27; City; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(28; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(29; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            var
                //CC// Char: dotnet Char;
                i: Integer;
            begin
                //CC//for i := 1 to StrLen(Rec."Phone No.") do
                //CC//    if Char.IsLetter(Rec."Phone No."[i]) then
                //CC//         Error(PhoneNoCannotContainLettersErr);
            end;
        }
        field(30; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            Description = 'Copy default Procurement Email from E-Procurement Setup Table';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField(Rec."E-Mail");
            end;
        }
        field(31; "Tender Box Location Code"; Code[50])
        {
            Caption = 'Tender Box Location Code';
            DataClassification = ToBeClassified;
        }
        field(32; "Bid Charge Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Charges Schedule".Code;

            trigger OnValidate()
            begin
                IFSfee.Reset;
                IFSfee.SetRange(Code, Rec."Bid Charge Code");
                if IFSfee.FindSet then begin
                    Rec."Bid Charge (LCY)" := IFSfee.Amount
                end;
            end;
        }
        field(33; "Bid Charge (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34; "Bid Charge Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                Bank.Reset;
                Bank.SetRange("No.", Rec."Bid Charge Bank Code");
                if Bank.FindSet then begin
                    Rec."Bank Name" := Bank.Name;
                    Rec."Bank Account Name" := Bank.Name;
                    Rec."Bid Charge Bank Branch" := Bank."Bank Branch Name";
                    Rec."Bid Charge Bank A/C No" := Bank."Bank Account No.";
                end;
            end;
        }
        field(35; "Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(36; "Bank Account Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Bid Charge Bank Branch"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Bid Charge Bank A/C No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39; Published; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(40; "Created by"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(41; "Submission Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Submission Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Submission End Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Rec."Tender Validity Expiry Date" := CalcDate(Rec."Tender Validity Duration", Rec."Submission End Date");
                Rec."Bid Security Expiry Date" := CalcDate(Rec."Bid Security Validity Duration", Rec."Submission End Date");
            end;
        }
        field(44; "Submission End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "No. of Submission"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(46; "Enforce Mandatory E-Receipt"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Bid Document Template"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Document Template"."Template ID";
        }
        field(48; "Display Scoring Criteria Vendo"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Bid Scoring Template"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Scoring Template".Code;
        }
        field(50; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(51; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(52; "Invitation Notice Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement";
        }
        field(53; "Bid Envelop Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '1-Envelop,2-Envelop';
            OptionMembers = "1-Envelop","2-Envelop";
        }
        field(54; "Sealed Bids"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(55; "PRN No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Purchase Requisition"),
                                                           Status = const(Released));
        }
        field(56; "Bid Submission Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Manual Bids,Hybrid (Electronic Summary+Hardcopy Submissions),Fully E-Bid';
            OptionMembers = "Manual Bids","Hybrid (Electronic Summary+Hardcopy Submissions)","Fully E-Bid";
        }
        field(57; "Lot No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Field used to track the different Lots for a given tender. On the system, each tender lot shall be created as a separate Tender record but the Lot No used for informational and tracking purposes only';
        }
        field(58; "LCY Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to General Ledger Setup (LCY Code)';
            TableRelation = Currency.Code;
        }
        field(59; "Works Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;
        }
        field(60; "Annual Procurement Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Field auto-populated based on selected PP Entry No';
            TableRelation = "Procurement Plan".Code;
        }
        field(61; "Procurement Plan Line No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Field auto-populated based on selected PP Entry No';
        }
        field(62; "Procurement Plan Entry No1"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Mapped to Procurement Plan Entry No Table';
            TableRelation = "Procurement Plan Entry"."Entry No.";
        }
        field(63; "Financial Year Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Procurement Plan.Financial Year Code';
            Editable = false;
            TableRelation = "Financial Year Code".Code;
        }
        field(64; "Budget Narration"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65; "Available Procurement Budget"; Decimal)
        {
            Caption = 'Available Procurement Budget (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Linked to PP ENtry';
        }
        field(66; "Publish Engineers Estimate"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Used to determine whether the Engineers Estimate should be published or not. When this is being activated, the system checks to ensure that the Estimate is equal to or less than the stated available budget. If it exceeds the budget, the user is notified and an error notification message is generated';
        }
        field(67; "Procuring Entity Name/Contact"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Bid Opening Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Bid Opening Venue"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Tender Validity Duration"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(72; "Tender Validity Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(73; "Enforce Mandatory Pre-bid Visi"; Boolean)
        {
            Caption = 'Enforce Mandatory Pre-bid Visit/Meeting';
            DataClassification = ToBeClassified;
            Description = 'Enforce Mandatory Pre-bid Visit/Meeting';
        }
        field(74; "Mandatory Pre-bid Visit Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(75; "Domestic Bidder Preference"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(76; "Mandatory Special Group Reserv"; Boolean)
        {
            Caption = 'Mandatory Special Group Reserved';
            DataClassification = ToBeClassified;
        }
        field(77; "Bid/Tender Security Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(78; "Bid Security %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(79; "Bid Security Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Special Group Bid Security"; Boolean)
        {
            Caption = 'Special Group Bid Security Waiver';
            DataClassification = ToBeClassified;
            Description = ' Waiver';
        }
        field(81; "Bid Security Validity Duration"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(82; "Bid Security Expiry Date"; Date)
        {
            Caption = 'Bid Security Validity Expiry Date';
            DataClassification = ToBeClassified;
            Description = 'Bid Security Validity Expiry Date';
            Editable = false;
        }
        field(83; "Insurance Cover Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(84; "Performance Security Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85; "Performance Security %"; Decimal)
        {
            Caption = 'Performance Security % (Of Bid Sum)';
            DataClassification = ToBeClassified;
            Description = 'Performance Security % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(86; "Special Group Performance Secu"; Boolean)
        {
            Caption = 'Special Group Performance Security Waiver';
            DataClassification = ToBeClassified;
            Description = 'Special Group Performance Security Waiver';
        }
        field(87; "Advance Payment Security Req"; Boolean)
        {
            Caption = 'Advance Payment Security Required';
            DataClassification = ToBeClassified;
            Description = 'Advance Payment Security Required';
        }
        field(88; "Advance Payment Security %"; Decimal)
        {
            Caption = 'Advance Payment Security % (Of Bid Sum)';
            DataClassification = ToBeClassified;
            Description = 'Advance Payment Security % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(89; "Advance Amount Limit %"; Decimal)
        {
            Caption = 'Advance Amount Limit % (Of Bid Sum)';
            DataClassification = ToBeClassified;
            Description = 'Advance Amount Limit % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(90; "Max Works Kickoff Duration"; Code[10])
        {
            Caption = 'Max Works Kickoff Duration (After Contract/Order)';
            DataClassification = ToBeClassified;
            Description = 'Max Works Kickoff Duration (After Contract/Order)';
        }
        field(91; "Max Works Charter Duration"; Code[10])
        {
            Caption = 'Max Works Charter/Program Duration (After Contract/Order)';
            DataClassification = ToBeClassified;
            Description = 'Max Works Charter/Program Duration (After Contract/Order)';
        }
        field(92; "Max Works Completion Duration"; Code[10])
        {
            Caption = 'Max Works Completion Duration (After Contract/Order';
            DataClassification = ToBeClassified;
            Description = 'Max Works Completion Duration (After Contract/Order';
        }
        field(93; "Payment Terms Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to determine duration within which settlements shall be done for invoiced/completed works (submission of payment certificate for Works). It is linked to the Payment Terms table (T3)';
            TableRelation = "Payment Terms".Code;
        }
        field(94; "Defects Liability Period"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Defects Liability (Warranty) Period';
        }
        field(95; "Daily Liquidated Dam Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(96; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(97; "Payment Retention %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(98; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Retention Amount Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(99; "Min Interim Certificate Amount"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';
            DataClassification = ToBeClassified;
        }
        field(100; "Appointer of Bid Arbitrator"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(101; "Display Scoring Criteria Vend"; Boolean)
        {
            Caption = 'Display Scoring Criteria to Vendors';
            DataClassification = ToBeClassified;
            Description = 'Display Scoring Criteria to Vendors';
        }
        field(102; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Published,Evaluation,Closed,Cancelled';
            OptionMembers = Draft,Published,Evaluation,Closed,Cancelled;
        }
        field(103; "Cancel Reason Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Cancel Reason Code".Code;
        }
        field(104; "Parent Invitation No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'It shall be used to track the Parent ITT in case an Addendum has been done. When the user creates an addendum, the system shall require them to map it to the original ITT (System creates a new ITT that references, the original ITT, and then blocks the Parent ITT. A user can view all the Addenda against a Parent ITT)';
        }
        field(105; "Target Bidder Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'All Bidders,Local Bidders,International Bidders';
            OptionMembers = "All Bidders","Local Bidders","International Bidders";
        }
        field(106; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));

            trigger OnValidate()
            begin
                /*TestStatusOpen;
                IF ("Location Code" <> xRec."Location Code") AND
                   (xRec."Buy-from Vendor No." = "Buy-from Vendor No.")
                THEN
                  MessageIfPurchLinesExist(FIELDCAPTION("Location Code"));
                
                UpdateShipToAddress;
                
                IF "Location Code" = '' THEN BEGIN
                  IF InvtSetup.GET THEN
                    "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
                END ELSE BEGIN
                  IF Location.GET("Location Code") THEN;
                  "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
                END;
                */

            end;
        }
        field(107; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                Rec.TestStatusOpen;
                if not UserSetupMgt.CheckRespCenter(1, Rec."Responsibility Center") then
                    Error(
                      Text028,
                      RespCenter.TableCaption, UserSetupMgt.GetPurchasesFilter);

                Rec."Location Code" := UserSetupMgt.GetLocation(1, '', Rec."Responsibility Center");


                Rec.UpdateAddress(Rec."Responsibility Center");
            end;
        }
        field(108; "Requisition Product Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(109; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            DataClassification = ToBeClassified;
            TableRelation = Language;

            trigger OnValidate()
            begin
                //MessageIfPurchLinesExist(FIELDCAPTION("Language Code"));
            end;
        }
        field(110; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                ApprovalEntry: Record "Approval Entry";
            begin
                /*ValidatePurchaserOnPurchHeader(Rec,FALSE,FALSE);
                
                ApprovalEntry.SETRANGE("Table ID",DATABASE::"Purchase Header");
                ApprovalEntry.SETRANGE("Document Type","Document Type");
                ApprovalEntry.SETRANGE("Document No.","No.");
                ApprovalEntry.SETFILTER(Status,'%1|%2',ApprovalEntry.Status::Created,ApprovalEntry.Status::Open);
                IF NOT ApprovalEntry.ISEMPTY THEN
                  ERROR(Text042,FIELDCAPTION("Purchaser Code"));
                
                CreateDim(
                  DATABASE::"Salesperson/Purchaser","Purchaser Code",
                  DATABASE::Vendor,"Pay-to Vendor No.",
                  DATABASE::Campaign,"Campaign No.",
                  DATABASE::"Responsibility Center","Responsibility Center");*/

            end;
        }
        field(111; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(112; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(113; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(114; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Dimen := Rec."Global Dimension 3 Code";
                Dimen := CopyStr(Dimen, 1, 3);
                Rec."Global Dimension 2 Code" := Dimen;
                Dimens := Rec."Global Dimension 3 Code";
                Dimens := CopyStr(Dimens, 1, 1);
                Rec."Global Dimension 1 Code" := Dimens;

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }  */

            end;
        }
        field(115; "Primary Tender Submission"; Text[80])
        {
            Caption = 'Primary Tender Submission Address';
            DataClassification = ToBeClassified;
            Description = 'Primary Tender Submission Address';
        }
        field(116; "Primary Engineer Contact"; Text[80])
        {
            Caption = 'Primary Engineer Contact Address';
            DataClassification = ToBeClassified;
            Description = 'Primary Engineer Contact Address';
        }
        field(117; "Cancellation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(118; "Cancellation Secret Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(119; "Bid Opening Committe"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No.";
        }
        field(120; "Bid Evaluation Committe"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No.";
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                Rec.ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID(Rec."Dimension Set ID", Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code");
            end;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; Job; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Job;

            trigger OnValidate()
            var
                JobRec: Record Job;
            begin
                /*IF JobRec.GET(Job) THEN BEGIN
                  "Job Name":=JobRec.Description;
                  Approver:=JobRec."Project Manager";
                
                END;
                */

            end;
        }
        field(70042; "Requisition Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code;
        }
        field(70046; "Procurement Plan ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Procurement Plan".Code;
        }
        field(70047; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                PPlanEntry.Reset;
                PPlanEntry.SetRange("Entry No.", Rec."Procurement Plan Entry No");
                if PPlanEntry.Find('-') then begin
                    Rec."PP Planning Category" := PPlanEntry."Planning Category";
                    Rec."PP Funding Source ID" := PPlanEntry."Funding Source ID";
                    Rec."PP Total Budget" := PPlanEntry."Available Procurement Budget";
                    Rec."PP Total Actual Costs" := PPlanEntry."Total Actual Costs";
                    Rec."PP Total Commitments" := PPlanEntry."Total Purchase Commitments";
                    Rec."PP Solicitation Type" := PPlanEntry."Solicitation Type";
                    Rec."PP Procurement Method" := PPlanEntry."Procurement Method";
                    Rec."PP Preference/Reservation Code" := PPlanEntry."Preference/Reservation Code";


                end;
            end;
        }
        field(70048; "PP Planning Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Procurement Plan Entry"."Planning Category";
        }
        field(70049; "PP Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Funding Source".Code;
        }
        field(70050; "PP Total Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70051; "PP Total Actual Costs"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70052; "PP Total Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70053; "PP Total Available Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70054; "Stage 1 EOI Invitation"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information";
        }
        field(70055; "Prebid Meeting Address"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(70056; "Prebid Meeting Register ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register";
        }
        field(70057; "Date/Time Published"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70058; "Cancelled By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70060; "PP Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".Code;
        }
        field(70061; "PP Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(70062; "PP Preference/Reservation Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Special Vendor Category".Code;
        }
        field(70066; "Bid Selection Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Selection Method".Code;
        }
        field(70067; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job),
                                                             "Job Task Type" = const(Posting),
                                                             "Directorate Code" = field("Directorate Code"),
                                                             "Department Code" = field("Department Code"));

            trigger OnValidate()
            begin
                /*
                TESTFIELD("Receipt No.",'');
                
                IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
                  VALIDATE("Job Planning Line No.",0);
                  IF "Document Type" = "Document Type"::Order THEN
                    TESTFIELD("Quantity Received",0);
                END;
                
                IF "Job Task No." = '' THEN BEGIN
                  CLEAR(JobJnlLine);
                  "Job Line Type" := "Job Line Type"::" ";
                  UpdateJobPrices;
                  EXIT;
                END;
                
                JobSetCurrencyFactor;
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine(TRUE);
                  UpdateJobPrices;
                END;
                UpdateDimensionsFromJobTask;
                
                */

            end;
        }
        field(70068; "Sent Cancellation Secret Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70154; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70155; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70156; "Bid Opening Register"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70157; "Finance Opening Register"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70158; "Finance Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := Rec."Dimension Set ID";
        Rec."Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            Rec."Dimension Set ID", StrSubstNo('%1 %2', '', Rec.Code),
            Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    procedure TestStatusOpen()
    begin
        OnBeforeTestStatusOpen;



        Rec.TestField(Rec.Status, Rec.Status::Open);

        OnAfterTestStatusOpen;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusOpen()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusOpen()
    begin
    end;

    procedure UpdateAddress(Respcode: Code[10])
    var
        Resp: Record "Responsibility Center";
    begin
        Resp.Reset;
        Resp.SetRange(Code, Respcode);
        if Resp.FindSet then begin

            Rec."Procuring Entity Name/Contact" := Resp.Name;
            Rec.Validate(Rec.Address, Resp.Address);
            Rec.Validate(Rec."Address 2", Resp."Address 2");
            Rec.Validate(Rec."Post Code", Resp."Post Code");
            Rec.Validate(Rec.City, Resp.City);
            Rec.Validate(Rec."Country/Region Code", Resp."Country/Region Code");
            Rec.Validate(Rec."Phone No.", Resp."Phone No.");
            Rec.Validate(Rec."E-Mail", Resp."E-Mail");

        end;
    end;


    //Unsupported feature: Property Modification (Id) on "StdPurchLine(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //StdPurchLine : 1000;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //StdPurchLine : 1018;
    //Variable type has not been exported.

    var
        PostCode: Record "Post Code";
        Dimen: Text;
        Dimens: Text;
        DimMgt: Codeunit DimensionManagement;
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetupMgt: Codeunit "User Setup Management";
        RespCenter: Record "Responsibility Center";
        InvtSetup: Record "Inventory Setup";
        PPlanEntry: Record "Procurement Plan Entry";
        IFSfee: Record "Bid Charges Schedule";
        Bank: Record "Bank Account";
        Roads: Record "Fixed Asset";
        PPReservation: Record "PP Purchase Activity Schedule";
        Purchheader: Record "Purchase Header";

    var
        PhoneNoCannotContainLettersErr: label 'You cannot enter letters in this field.';
        Text028: label 'Your identification is set up to process from %1 %2 only.';
}
