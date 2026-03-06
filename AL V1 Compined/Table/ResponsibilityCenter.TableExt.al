#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50045 tableextension50045 extends "Responsibility Center"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".

        field(50005; "No. of Research Programs"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50006; "No. of Grant Proposals"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50007; "No. of Awarded GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Application Status" = const(Won),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50008; "No. of Lost Grant GFO"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Research Center" = field(Code),
                                                                   "Application Status" = const(Lost),
                                                                   "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50009; "No. of Ongoing RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Center" = field(Code),
                                           "Project Start Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50010; "No. of Completed RProjects"; Integer)
        {
            CalcFormula = count(Job where("Research Center" = field(Code),
                                           "Project End Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50011; "Total Amount Awarded(LCY)"; Decimal)
        {
            CalcFormula = sum("Grant Funding Application"."Awarded Grant Amount (LCY)" where("Research Center" = field(Code),
                                                                                              "Application Status" = const(Won),
                                                                                              "Document Date" = field("Date Filter")));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(50012; "No. of Assets"; Integer)
        {
            CalcFormula = count("Fixed Asset" where("Research Center" = field(Code)));
            Description = 'For Statistics';
            FieldClass = FlowField;
        }
        field(80000; "Operating Unit Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Directorate,Department,Division/Section,Region,Branch,Board,Company-Level';
            OptionMembers = " ",Directorate,Department,"Division/Section",Region,Branch,Board,"Company-Level";
        }
        field(80001; "Direct Reports To"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(80002; "Indirect Reports To"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(80003; "Hierarchical  Level ID"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Level 1,Level 2,Level 3,Level 4,Level 5';
            OptionMembers = "Level 1","Level 2","Level 3","Level 4","Level 5";
        }
        field(80004; "Headed By (Title)"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Jobs"."Job ID";
        }
        field(80005; "Current Head"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(80006; "Blocked?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80007; Vision; Text[255])
        {
            DataClassification = ToBeClassified;
            Description = 'SPM';
        }
        field(80008; Mission; Text[255])
        {
            DataClassification = ToBeClassified;
            Description = 'SPM';
        }
        field(80009; Motto; Text[255])
        {
            DataClassification = ToBeClassified;
            Description = 'SPM';
        }
        field(80010; "Research Center?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}
