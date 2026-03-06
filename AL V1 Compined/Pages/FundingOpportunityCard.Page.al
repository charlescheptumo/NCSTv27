#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65044 "Funding Opportunity Card"
{
    Caption = 'Funding Opportunity Announcement Card';
    PageType = Card;
    SourceTable = "Funding Opportunity";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Call No."; Rec."Call No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Organization ID"; Rec."Organization ID")
                {
                    ApplicationArea = Basic;
                }
                field("Issuing Organization"; Rec."Issuing Organization")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Type"; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                }
                field("External Announcement No"; Rec."External Announcement No")
                {
                    ApplicationArea = Basic;
                }
                field("Release Date"; Rec."Release Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Due Date"; Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application date"; Rec."Application date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project Duration"; Rec."Project Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    Caption = 'Home Page';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                group("Title Details:")
                {
                    Caption = 'Title Details:';
                    field("Opportunity Details"; WorkDescription)
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        StyleExpr = true;

                        trigger OnValidate()
                        begin
                            Rec.SetWorkDescription(WorkDescription);
                        end;
                    }
                }
            }
            group("Finance Details")
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
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
                field("Opportunity Amount"; Rec."Opportunity Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Opportunity Amount(LCY)"; Rec."Opportunity Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control23; Outlook)
            {
            }
            systempart(Control22; Notes)
            {
            }
            systempart(Control21; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Grants Applications")
            {
                ApplicationArea = Basic;
                Image = Grid;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Grant Funding Application List";
                RunPageLink = "FOA ID" = field("Call No.");
            }
            action("Print Funding Opportunity")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    Rec.SetRange(Rec."Call No.", Rec."Call No.");
                    Report.Run(65017, true, true, Rec)
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WorkDescription := Rec.GetWorkDescription;
    end;

    var
        WorkDescription: Text;
        ChangeExchangeRate: Page "Change Exchange Rate";
}
