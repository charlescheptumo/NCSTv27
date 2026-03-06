#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65099 "All Grant Funding App Card"
{
    PageType = Card;
    SourceTable = "Grant Funding Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("FOA ID"; Rec."FOA ID")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Opportunity  Title"; Rec."Opportunity  Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grant Type"; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                }
                field("Justification for Application"; Rec."Justification for Application")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Program ID"; Rec."Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Area"; Rec."Primary Research Area")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Admin Team Code"; Rec."Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                }
                field("Application Status"; Rec."Application Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Closed Date"; Rec."Closed Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Award Info")
            {
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                            Rec.Validate(Rec."Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                        //SalesCalcDiscountByType.ApplyDefaultInvoiceDiscount(0,Rec);
                    end;
                }
                field("Requested Grant Amount"; Rec."Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Grant Amount(LCY)"; Rec."Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Grant Amount"; Rec."Awarded Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Grant Amount (LCY)"; Rec."Awarded Grant Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Deadlines && Dates")
            {
                field("Application Due Date"; Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Submitted Date"; Rec."Application Submitted Date")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Award Date"; Rec."Estimated Award Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Grantor Information")
            {
                field("Grantor No."; Rec."Grantor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Name"; Rec."Grantor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Research Contact ID"; Rec."Grantor Research Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Research Reviewer"; Rec."Grantor Research Reviewer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grantor Admin Contact ID"; Rec."Grantor Admin Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Admin Name"; Rec."Grantor Admin Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grantor Finance Contact ID"; Rec."Grantor Finance Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Finance Contact"; Rec."Grantor Finance Contact")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control46; Outlook)
            {
            }
            systempart(Control47; Notes)
            {
            }
            systempart(Control48; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Research Approval Committees")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
}
