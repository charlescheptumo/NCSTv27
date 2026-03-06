#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59059 "M&E Role Center"
{
    Caption = 'Records Management Role Center', Comment = '{Dependency=Match,"ProfileDescription_ACCOUNTINGMANAGER"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part("<Records Management  Activities>"; "M&E  Activities")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            separator(Action64)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            separator(Action67)
            {
            }
            action("Analysis &Views")
            {
                ApplicationArea = Dimensions;
                Caption = 'Analysis &Views';
                Image = AnalysisView;
                RunObject = Page "Analysis View List";
                ToolTip = 'Analyze amounts in your general ledger by their dimensions using analysis views that you have set up.';
            }
            action("Analysis by &Dimensions")
            {
                ApplicationArea = Dimensions;
                Caption = 'Analysis by &Dimensions';
                Image = AnalysisViewDimension;
                RunObject = Page "Analysis by Dimensions";
                ToolTip = 'Analyze activities using dimensions information.';
            }
            action("Adjust E&xchange Rates")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Adjust E&xchange Rates';
                Ellipsis = true;
                Image = AdjustExchangeRates;
                //RunObject = Report "Adjust Exchange Rates";;                ToolTip = 'Adjust general ledger, customer, vendor, and bank account entries to reflect a more updated balance if the exchange rate has changed since the entries were posted.';
            }
            separator(Action73)
            {
            }
            action("Calc. and Pos&t VAT Settlement")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Calc. and Pos&t VAT Settlement';
                Image = SettleOpenTransactions;
                RunObject = Report "Calc. and Post VAT Settlement";
                ToolTip = 'Close open VAT entries and transfers purchase and sales VAT amounts to the VAT settlement account. For every VAT posting group, the batch job finds all the VAT entries in the VAT Entry table that are included in the filters in the definition window.';
            }
            separator(Action89)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Navi&gate';
                Image = Navigate;
                RunObject = Page Navigate;
                ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';
            }
        }
    }
}
