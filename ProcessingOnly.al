report 94002 "Fill Sales Gen. Prod. Post Grp"
{
    Caption = 'Fill Gen. Prod. Posting Group on Sales Lines';
    ProcessingOnly = true;
    UsageCategory = Tasks;
    ApplicationArea = All;
    dataset
    {
        dataitem(SalesLine; "Sales Line")
        {
            DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
            RequestFilterFields = "Document Type", "Document No.", "No.";
            trigger OnPreDataItem()
            begin
                // Only G/L Account lines with a blank posting group and a value in "No."
                SetRange("Gen. Prod. Posting Group", '');
                SetRange(Type, Type::"G/L Account");
                SetFilter("No.", '<>%1', '');
                if GuiAllowed() then
                    Window.Open(ProgressMsg);
            end;

            trigger OnAfterGetRecord()
            var
                SalesHeader: Record "Sales Header";
                GenProdPostingGroup: Record "Gen. Product Posting Group";
            begin
                if GuiAllowed() then
                    Window.Update(1, "Document No.");
                // Validate runs TestStatusOpen, so released documents are skipped
                SalesHeader.Get("Document Type", "Document No.");
                if SalesHeader.Status <> SalesHeader.Status::Open then begin
                    NotOpenCount += 1;
                    CurrReport.Skip();
                end;
                // Validate needs a matching Gen. Product Posting Group to exist
                if not GenProdPostingGroup.Get("No.") then begin
                    if not CreateMissingGroups then begin
                        NoGroupCount += 1;
                        CurrReport.Skip();
                    end;
                    GenProdPostingGroup.Init();
                    GenProdPostingGroup.Code := "No.";
                    GenProdPostingGroup.Description := CopyStr(Description, 1, MaxStrLen(GenProdPostingGroup.Description));
                    GenProdPostingGroup.Insert(true);
                    CreatedCount += 1;
                end;
                // Copy "No." into the field and validate it (runs OnValidate trigger)
                Validate("Gen. Prod. Posting Group", "No.");
                Modify(true);
                UpdatedCount += 1;
            end;

            trigger OnPostDataItem()
            begin
                if GuiAllowed() then begin
                    Window.Close();
                    Message(DoneMsg, UpdatedCount, CreatedCount, NotOpenCount, NoGroupCount);
                end;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(CreateMissingGroupsField; CreateMissingGroups)
                    {
                        ApplicationArea = All;
                        Caption = 'Create Missing Posting Groups';
                        ToolTip = 'If no Gen. Product Posting Group exists with the line''s No. as its code, create it. Otherwise the line is skipped.';
                    }
                }
            }
        }
    }
    trigger OnPreReport()
    begin
        if GuiAllowed() then
            if not Confirm(ConfirmQst, false) then
                CurrReport.Quit();
    end;

    var
        Window: Dialog;
        CreateMissingGroups: Boolean;
        UpdatedCount: Integer;
        CreatedCount: Integer;
        NotOpenCount: Integer;
        NoGroupCount: Integer;
        ProgressMsg: Label 'Processing Sales Document #1##########';
        ConfirmQst: Label 'G/L Account sales lines with a blank Gen. Prod. Posting Group will get their No. as the posting group. Continue?';
        DoneMsg: Label 'Lines updated: %1\Posting groups created: %2\Lines skipped (document not Open): %3\Lines skipped (no matching posting group): %4';
}
report 94003 "Fill PurchGen Prod Post Grp"
{
    Caption = 'Fill Gen. Prod. Posting Group on Purchase Lines';
    ProcessingOnly = true;
    UsageCategory = Tasks;
    ApplicationArea = All;
    dataset
    {
        dataitem(PurchaseLine; "Purchase Line")
        {
            DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
            RequestFilterFields = "Document Type", "Document No.", "No.";
            trigger OnPreDataItem()
            begin
                // Only lines with a blank posting group and a value in "No."
                SetRange("Gen. Prod. Posting Group", '');
                SetRange(Type, Type::"G/L Account");
                SetFilter("No.", '<>%1', '');
                if GuiAllowed() then
                    Window.Open(ProgressMsg);
            end;

            trigger OnAfterGetRecord()
            var
                PurchaseHeader: Record "Purchase Header";
                GenProdPostingGroup: Record "Gen. Product Posting Group";
            begin
                if GuiAllowed() then
                    Window.Update(1, "Document No.");
                // Validate runs TestStatusOpen, so released documents are skipped
                PurchaseHeader.Get("Document Type", "Document No.");
                if PurchaseHeader.Status <> PurchaseHeader.Status::Open then begin
                    NotOpenCount += 1;
                    CurrReport.Skip();
                end;
                // Validate needs a matching Gen. Product Posting Group to exist
                if not GenProdPostingGroup.Get("No.") then begin
                    if not CreateMissingGroups then begin
                        NoGroupCount += 1;
                        CurrReport.Skip();
                    end;
                    GenProdPostingGroup.Init();
                    GenProdPostingGroup.Code := "No.";
                    GenProdPostingGroup.Description := CopyStr(Description, 1, MaxStrLen(GenProdPostingGroup.Description));
                    GenProdPostingGroup.Insert(true);
                    CreatedCount += 1;
                end;
                // Copy "No." into the field and validate it (runs OnValidate trigger)
                Validate("Gen. Prod. Posting Group", "No.");
                Modify(true);
                UpdatedCount += 1;
            end;

            trigger OnPostDataItem()
            begin
                if GuiAllowed() then begin
                    Window.Close();
                    Message(DoneMsg, UpdatedCount, CreatedCount, NotOpenCount, NoGroupCount);
                end;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(CreateMissingGroupsField; CreateMissingGroups)
                    {
                        ApplicationArea = All;
                        Caption = 'Create Missing Posting Groups';
                        ToolTip = 'If no Gen. Product Posting Group exists with the line''s No. as its code, create it. Otherwise the line is skipped.';
                    }
                }
            }
        }
    }
    trigger OnPreReport()
    begin
        if GuiAllowed() then
            if not Confirm(ConfirmQst, false) then
                CurrReport.Quit();
    end;

    var
        Window: Dialog;
        CreateMissingGroups: Boolean;
        UpdatedCount: Integer;
        CreatedCount: Integer;
        NotOpenCount: Integer;
        NoGroupCount: Integer;
        ProgressMsg: Label 'Processing Purchase Document #1##########';
        ConfirmQst: Label 'Purchase lines with a blank Gen. Prod. Posting Group will get their No. as the posting group. Continue?';
        DoneMsg: Label 'Lines updated: %1\Posting groups created: %2\Lines skipped (document not Open): %3\Lines skipped (no matching posting group): %4';
}