pageextension 60000 "Fixed Asset Card Ext." extends "Fixed Asset Card"
{
    layout
    {
        addafter("FA Location Code")
        {
            field("Current Location"; Rec."Current Location")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Current Location field.';
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(CreateFATransferItem)
            {
                ApplicationArea = All;
                Caption = 'Create FA Transfer Item';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = NewItem;
                ToolTip = 'Executes the Create FA Transfer Item action.';

                trigger OnAction()
                begin
                    FATransferFunctions.NewItemForTransfer(Rec);
                end;
            }
            action(CreateResourceCard)
            {
                ApplicationArea = All;
                Caption = 'Create Resource Card';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = NewResource;
                ToolTip = 'Executes the Create Resource Card action.';

                trigger OnAction()
                begin
                    FATransferFunctions.CreateResourceCard(Rec);
                end;
            }

        }
    }
    var
        FATransferFunctions: Codeunit "FA Transfer Functions";
}
