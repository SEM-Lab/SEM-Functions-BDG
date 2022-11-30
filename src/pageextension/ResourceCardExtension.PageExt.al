pageextension 60003 "Resource Card Extension" extends "Resource Card"
{
    layout
    {
        addlast(content)
        {
            group("FA Data")
            {
                Caption = 'FA Data';

                field("FA Serial No."; Rec."FA Serial No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the FA Serial No. field.';
                    trigger OnDrillDown()
                    var
                        FixedAsset: Record "Fixed Asset";
                    begin
                        FixedAsset.Get(Rec."No.");
                        Page.Run(Page::"Fixed Asset Card", FixedAsset);
                    end;
                }
                field("Current Location"; Rec."Current Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Location field.';
                }
            }
        }
    }
}
