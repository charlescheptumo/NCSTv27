#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70106 "Asset Disposal Bidders"
{
    PageType = List;
    SourceTable = Bidders;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Response; Rec.Response)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Copies Submitted"; Rec."No. of Copies Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Physical Address"; Rec."Physical Address")
                {
                    ApplicationArea = Basic;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No"; Rec."Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile No"; Rec."Mobile No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Asset No"; Rec."Fixed Asset No")
                {
                    ApplicationArea = Basic;
                }
                field("KBA Bank Code"; Rec."KBA Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("KBA Branch Code"; Rec."KBA Branch Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bank account No"; Rec."Bank account No")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Expiry Date"; Rec."Bid Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Proceed to Tech Evaluation"; Rec."Proceed to Tech Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Doc Receipt Date"; Rec."Tender Doc Receipt Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Bidders)
            {
                Caption = 'Bidders';
                group(Customer)
                {
                    Caption = 'Customer';
                    action("Create Customer")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Create Customer';

                        trigger OnAction()
                        begin
                            // BiddersRec.SETRANGE(BiddersRec."Ref No.","Ref No.");
                            // BiddersRec.SETRANGE(BiddersRec."Proceed to Tech Evaluation",TRUE);
                            // IF BiddersRec.FIND('-') THEN
                            //  REPEAT
                            //   //CreateCustomer(BiddersRec);
                            //
                            //  UNTIL BiddersRec.NEXT=0;
                        end;
                    }
                }
            }
        }
    }
}
