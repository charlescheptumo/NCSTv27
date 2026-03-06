#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70122 "Works Category"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Parent Category"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Indentation; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Presentation Order"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Has Children"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Last Modified Date Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Id; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Default Road Project Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Planning & Design,Construction,Asset Management,Studies and Surveys';
            OptionMembers = "Planning & Design",Construction,"Asset Management","Studies and Surveys";
        }
        field(10; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Construction,Structure Construction,Routine Maintenance,Periodic Maintenance,Spot Improvement,Rehabilitation Work,Asset Protection,Studies & Surveys,Design Works';
            OptionMembers = " ","New Construction","Structure Construction","Routine Maintenance","Periodic Maintenance","Spot Improvement","Rehabilitation Work","Asset Protection","Studies & Surveys","Design Works";
        }
        field(11; "Default BoQ Template Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Default Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Default Department"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        //  ItemCategoryManagement: Codeunit 70005;
        CyclicInheritanceErr: label 'An item category cannot be a parent of itself or any of its children.';
        DeleteWithChildrenErr: label 'You cannot delete this item category because it has child item categories.';
        DeleteItemInheritedAttributesQst: label 'One or more items belong to item category ''''%1''''.\\Do you want to delete the inherited item attributes for the items in question? ', Comment = '%1 - item category code';

    procedure HasChildren(): Boolean
    var
        ItemCategory: Record "Works Category";
    begin
        ItemCategory.SetRange("Parent Category", Code);
        exit(not ItemCategory.IsEmpty)
    end;

    local procedure UpdatePresentationOrderAfterTheTrigger()
    begin
        //   if BindSubscription(ItemCategoryManagement) then;
    end;

    procedure GetStyleText(): Text
    begin
        if Indentation = 0 then
            exit('Strong');

        if "Has Children" then
            exit('Strong');

        exit('');
    end;

    local procedure UpdateDeletedCategoryItems()
    var
        CategoryItem: Record Item;
        TempCategoryItemAttributeValue: Record "Item Attribute Value" temporary;
        ItemAttributeManagement: Codeunit "Item Attribute Management";
        DeleteItemInheritedAttributes: Boolean;
    begin
        CategoryItem.SetRange("Item Category Code", Code);
        if CategoryItem.IsEmpty then
            exit;
        DeleteItemInheritedAttributes := Confirm(StrSubstNo(DeleteItemInheritedAttributesQst, Code));
        if DeleteItemInheritedAttributes then
            TempCategoryItemAttributeValue.LoadCategoryAttributesFactBoxData(Code);
        if CategoryItem.Find('-') then
            repeat
                CategoryItem.Validate("Item Category Code", '');
                CategoryItem.Modify;
                if DeleteItemInheritedAttributes then
                    ItemAttributeManagement.DeleteItemAttributeValueMapping(CategoryItem, TempCategoryItemAttributeValue);
            until CategoryItem.Next = 0;
    end;

    local procedure DeleteAssignedAttributes()
    var
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
    begin
        ItemAttributeValueMapping.SetRange("Table ID", Database::"Item Category");
        ItemAttributeValueMapping.SetRange("No.", Code);
        ItemAttributeValueMapping.DeleteAll;
    end;
}
