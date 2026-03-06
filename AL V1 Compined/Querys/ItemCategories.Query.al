#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55026 ItemCategories
{

    elements
    {
        dataitem(Item_Category; "Item Category")
        {
            DataItemTableFilter = Indentation = filter(2);
            column("Code"; "Code")
            {
            }
            column(Parent_Category; "Parent Category")
            {
            }
            column(Description; Description)
            {
            }
            column(Indentation; Indentation)
            {
            }
            column(Presentation_Order; "Presentation Order")
            {
            }
            column(Has_Children; "Has Children")
            {
            }
            column(Last_Modified_Date_Time; "Last Modified Date Time")
            {
            }
            column(Id; SystemId)
            {
            }
        }
    }
}
