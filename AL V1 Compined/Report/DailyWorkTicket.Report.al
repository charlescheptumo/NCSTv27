#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65016 "Daily Work Ticket"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Daily Work Ticket.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Dialy Work Ticket Header"; "Dialy Work Ticket Header")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Daily Work Ticket";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(VehicleAllocated_DialyWorkTicketHeader; "Dialy Work Ticket Header"."Vehicle Allocated")
            {
            }
            column(DriverAllocated_DialyWorkTicketHeader; "Dialy Work Ticket Header"."Driver Allocated")
            {
            }
            column(DriverName_DialyWorkTicketHeader; "Dialy Work Ticket Header"."Driver Name")
            {
            }
            dataitem("Daily Work Ticket Lines"; "Daily Work Ticket Lines")
            {
                DataItemLink = "Daily Work Ticket" = field("Daily Work Ticket");
                column(ReportForNavId_1; 1)
                {
                }
                column(TransportRequisitionNo_DailyWorkTicketLines; "Daily Work Ticket Lines"."Transport Requisition No")
                {
                }
                column(Commencement_DailyWorkTicketLines; "Daily Work Ticket Lines".Commencement)
                {
                }
                column(Destination_DailyWorkTicketLines; "Daily Work Ticket Lines".Destination)
                {
                }
                column(VehicleAllocated_DailyWorkTicketLines; "Daily Work Ticket Lines"."Vehicle Allocated")
                {
                }
                column(DateofRequest_DailyWorkTicketLines; "Daily Work Ticket Lines"."Date of Request")
                {
                }
                column(OpeningOdometerReading_DailyWorkTicketLines; "Daily Work Ticket Lines"."Opening Odometer Reading")
                {
                }
                column(Timeout_DailyWorkTicketLines; "Daily Work Ticket Lines"."Time out")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CheckReport: Report Check;
        NumberText: array[2] of Text[80];
        TTotal: Decimal;
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        PaymentMgt: Codeunit "Payments-Post";
        CurrencyCodeText: Code[10];
}
