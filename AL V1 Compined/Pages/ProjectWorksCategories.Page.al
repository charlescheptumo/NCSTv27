#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75099 "Project Works Categories"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Project Works Categories';
    CardPageID = "Item Category Card";
    InsertAllowed = false;
    PageType = List;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = "Works Category";
    SourceTableView = sorting("Presentation Order");
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                IndentationColumn = Rec.Indentation;
                IndentationControls = "Code";
                ShowAsTree = true;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic, Suite;
                    StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the code for the item category.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(false);
                        CurrPage.ItemAttributesFactbox.Page.LoadCategoryAttributesData(Rec.Code);
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a description of the item category.';
                }
            }
        }
        area(factboxes)
        {
            part(ItemAttributesFactbox; "Item Attributes Factbox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Attributes';
            }
        }
    }

    actions
    {
        area(creation)
        {
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        StyleTxt := Rec.GetStyleText;
        CurrPage.ItemAttributesFactbox.Page.LoadCategoryAttributesData(Rec.Code);
    end;

    trigger OnAfterGetRecord()
    begin
        StyleTxt := Rec.GetStyleText;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        StyleTxt := Rec.GetStyleText;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        StyleTxt := Rec.GetStyleText;
    end;

    trigger OnOpenPage()
    var
        ItemCategoryManagement: Codeunit "Item Category Management";
    begin
        ItemCategoryManagement.UpdatePresentationOrder;
    end;

    var
        StyleTxt: Text;

    procedure GetSelectionFilter(): Text
    var
        ItemCategory: Record "Works Category";
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(ItemCategory);
        //EXIT(SelectionFilterManagement.GetSelectionFilterForWorksCategory(ItemCategory));
    end;

    procedure SetSelection(var ItemCategory: Record "Works Category")
    begin
        CurrPage.SetSelectionFilter(ItemCategory);
    end;
}
