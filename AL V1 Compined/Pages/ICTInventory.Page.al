#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56133 "ICT Inventory"
{
    PageType = Card;
    SourceTable = "ICT Inventory";

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Sub-Type"; Rec."Sub-Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Sub Type No."; Rec."Sub Type No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field("ICT Asset Category"; Rec."ICT Asset Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Sub Category';
                }
                field("Sub Type Description"; Rec."Sub Type Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = Basic;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tag No."; Rec."Tag No.")
                {
                    ApplicationArea = Basic;
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Under Maintenance"; Rec."Under Maintenance")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Current Assigned Employee"; Rec."Current Assigned Employee")
                {
                    ApplicationArea = Basic;
                }
                field("Current Assigned Division/Unit"; Rec."Current Assigned Division/Unit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field("Leasing/Issuing"; Rec."Leasing/Issuing")
                {
                    ApplicationArea = Basic;
                }
                field("Shared Inventory"; Rec."Shared Inventory")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Has Expiry Date"; Rec."Has Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Laptop & CPU")
            {
                Caption = 'Laptop & CPU';
                field("Operating System"; Rec."Operating System")
                {
                    ApplicationArea = Basic;
                }
                field(Processor; Rec.Processor)
                {
                    ApplicationArea = Basic;
                }
                field("Hard Disk Type"; Rec."Hard Disk Type")
                {
                    ApplicationArea = Basic;
                }
                field("Hard Disk (GB)"; Rec."Hard Disk (GB)")
                {
                    ApplicationArea = Basic;
                }
                field("RAM (GB)"; Rec."RAM (GB)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22; Outlook)
            {
            }
            systempart(Control23; Notes)
            {
            }
            systempart(Control24; MyNotes)
            {
            }
            systempart(Control25; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Issuance Entries")
            {
                ApplicationArea = Basic;
                Image = ShipmentLines;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "ICT Issuance Entries";
                RunPageLink = Code = field(Code),
                              Type = const(Issuance);
            }
            action("Movement Entries")
            {
                ApplicationArea = Basic;
                Image = ViewDocumentLine;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "ICT Issuance Entries";
                RunPageLink = Code = field(Code),
                              Type = const(Movement);
            }
            action("Helpdesk entries")
            {
                ApplicationArea = Basic;
                RunObject = Page "ICT Helpdesk History List";
                RunPageLink = "ICT Inventory" = field(Code);
            }
        }
    }
}
