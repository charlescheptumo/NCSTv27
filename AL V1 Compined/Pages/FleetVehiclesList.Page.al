#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59000 "Fleet Vehicles List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Vehicle Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Fleet Vehicles.";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fixed Asset List-flt";
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Main Asset/Component"; Rec."Main Asset/Component")
                {
                    ApplicationArea = Basic;
                }
                field("Component of Main Asset"; Rec."Component of Main Asset")
                {
                    ApplicationArea = Basic;
                }
                field("Budgeted Asset"; Rec."Budgeted Asset")
                {
                    ApplicationArea = Basic;
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = Loans;
                    LookupPageID = Loans;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(Insured; Rec.Insured)
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Under Maintenance"; Rec."Under Maintenance")
                {
                    ApplicationArea = Basic;
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = Basic;
                }
                field(Inactive; Rec.Inactive)
                {
                    ApplicationArea = Basic;
                }
                field("FA Posting Date Filter"; Rec."FA Posting Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("FA Posting Group"; Rec."FA Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Last Service Date"; Rec."Last Service Date")
                {
                    ApplicationArea = Basic;
                }
                field("Service Interval"; Rec."Service Interval")
                {
                    ApplicationArea = Basic;
                }
                field("Service Interval Value"; Rec."Service Interval Value")
                {
                    ApplicationArea = Basic;
                }
                field("Last Service No."; Rec."Last Service No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Operation Setups";
                    LookupPageID = "Operation Setups";
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Vehicle Model List";
                    LookupPageID = "Vehicle Model List";
                }
                field("Year Of Manufacture"; Rec."Year Of Manufacture")
                {
                    ApplicationArea = Basic;
                }
                field("Country Of Origin"; Rec."Country Of Origin")
                {
                    ApplicationArea = Basic;
                }
                field("Start Reading"; Rec."Start Reading")
                {
                    ApplicationArea = Basic;
                }
                field(Ownership; Rec.Ownership)
                {
                    ApplicationArea = Basic;
                }
                field("Chassis Serial No."; Rec."Chassis Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engine Serial No."; Rec."Engine Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Horse Power"; Rec."Horse Power")
                {
                    ApplicationArea = Basic;
                }
                field("Ignition Key Code"; Rec."Ignition Key Code")
                {
                    ApplicationArea = Basic;
                }
                field("Door Key Code"; Rec."Door Key Code")
                {
                    ApplicationArea = Basic;
                }
                field("Body Color"; Rec."Body Color")
                {
                    ApplicationArea = Basic;
                }
                field("Interior Color"; Rec."Interior Color")
                {
                    ApplicationArea = Basic;
                }
                field(Cylinders; Rec.Cylinders)
                {
                    ApplicationArea = Basic;
                }
                field("Wheel Size Rear"; Rec."Wheel Size Rear")
                {
                    ApplicationArea = Basic;
                }
                field("Wheel Size Front"; Rec."Wheel Size Front")
                {
                    ApplicationArea = Basic;
                }
                field("Tire Size Rear"; Rec."Tire Size Rear")
                {
                    ApplicationArea = Basic;
                }
                field("Tire Size Front"; Rec."Tire Size Front")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Rating"; Rec."Fuel Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Current Reading"; Rec."Current Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Readings Based On"; Rec."Readings Based On")
                {
                    ApplicationArea = Basic;
                }
                field("Total Consumption"; Rec."Total Consumption")
                {
                    ApplicationArea = Basic;
                }
                field("Tare Weight"; Rec."Tare Weight")
                {
                    ApplicationArea = Basic;
                }
                field(Available; Rec.Available)
                {
                    ApplicationArea = Basic;
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for Unavailability"; Rec."Reason for Unavailability")
                {
                    ApplicationArea = Basic;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                }
                field("Selected By"; Rec."Selected By")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card No"; Rec."Fuel Card No")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card Pin"; Rec."Fuel Card Pin")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Limit"; Rec."Vehicle Limit")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
