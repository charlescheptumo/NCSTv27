#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59001 "Fleet Vehicle Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fleet Vehicles.";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    LookupPageID = "Fixed Asset List";
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                }
                field(Inactive; Rec.Inactive)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Posting)
            {
                field("FA Class Code"; Rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budgeted Asset"; Rec."Budgeted Asset")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Maintenance)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = Basic;
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                }
                field(Insured; Rec.Insured)
                {
                    ApplicationArea = Basic;
                }
                field("Under Maintenance"; Rec."Under Maintenance")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Vehicle Details")
            {
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Vehicle Make List";
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
                field(Ownership; Rec.Ownership)
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
                field("Chassis Serial No."; Rec."Chassis Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engine Serial No."; Rec."Engine Serial No.")
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
                field("Tare Weight"; Rec."Tare Weight")
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
                field("Maximum Tonnage(Kgs)"; Rec."Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
            group("Drive Train")
            {
                field("Horse Power"; Rec."Horse Power")
                {
                    ApplicationArea = Basic;
                }
                field(Cylinders; Rec.Cylinders)
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
            }
            group("Millage/Hrs Worked Details")
            {
                field("Readings Based On"; Rec."Readings Based On")
                {
                    ApplicationArea = Basic;
                }
                field("Start Reading"; Rec."Start Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Current Reading"; Rec."Current Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Insurance Details")
            {
                field("Licensing Company"; Rec."Licensing Company")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Last Insurance"; Rec."Date of Last Insurance")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Licensing Details"; Rec."Licensing Details")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000069; "Vehicle Accidents")
            {
                Caption = 'Vehicle Incidents/Occurrence';
                SubPageLink = RegNo = field("Registration No.");
            }
            part(Control1000000049; "Approved Transport Requests")
            {
                SubPageLink = "Vehicle Allocated" = field("Registration No.");
            }
            part(Control1000000050; "Fuel and Maintenance List")
            {
                SubPageLink = "Vehicle Reg No" = field("Registration No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Maintenance Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                Promoted = true;
                RunObject = Page "Maintenance Ledger Entries";
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                Promoted = true;
                RunObject = Page "Comment Sheet";
            }
            action(Picture)
            {
                ApplicationArea = Basic;
                Image = Picture;
                Promoted = true;
            }
            action("Maintenance Registration")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                RunObject = Page "Maintenance Registration";
            }
            action(Statistics)
            {
                ApplicationArea = Basic;
                Image = Statistics;
                Promoted = true;
            }
            action("Main Asset Components")
            {
                ApplicationArea = Basic;
                Image = Components;
                Promoted = true;
            }
            action("Total Value Insured")
            {
                ApplicationArea = Basic;
                Image = ValueLedger;
                Promoted = true;
                RunObject = Page "Total Value Insured";
            }
            action("Allocate to Departments")
            {
                ApplicationArea = Basic;
                Image = Dimension;
                Promoted = true;
                //cc//  //RunObject = Page UnknownPage52018565;
            }
            action("Create Plan")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
