tableextension 51063 tableextension51063 extends "Bin Content"
{
    Caption = 'Bin Content';
    fields
    {
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Bin Type Code")
        {
            Caption = 'Bin Type Code';
        }
        modify("Warehouse Class Code")
        {
            Caption = 'Warehouse Class Code';
        }
        modify("Min. Qty.")
        {
            Caption = 'Min. Qty.';
        }
        modify("Max. Qty.")
        {
            Caption = 'Max. Qty.';
        }
        modify("Bin Ranking")
        {
            Caption = 'Bin Ranking';
        }
        modify("Put-away Qty.")
        {
            Caption = 'Put-away Qty.';
        }
        modify("Cross-Dock Bin")
        {
            Caption = 'Cross-Dock Bin';
        }
        modify(Default)
        {
            Caption = 'Default';
        }
        modify("Put-away Quantity (Base)")
        {
            Caption = 'Put-away Quantity (Base)';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Lot No. Filter")
        {
            Caption = 'Lot No. Filter';
        }
        modify("Serial No. Filter")
        {
            Caption = 'Serial No. Filter';
        }
        field(50000; "Net kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Entry".Quantity WHERE("Location Code" = FIELD("Location Code"),
                                                                "Bin Code" = FIELD("Bin Code"),
                                                                "Item No." = FIELD("Item No."),
                                                                "Variant Code" = FIELD("Variant Code"),
                                                                "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                "Lot No." = FIELD("Lot No. Filter"),
                                                                "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Gross kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Entry".Quantity WHERE("Location Code" = FIELD("Location Code"),
                                                                "Bin Code" = FIELD("Bin Code"),
                                                                "Item No." = FIELD("Item No."),
                                                                "Variant Code" = FIELD("Variant Code"),
                                                                "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                "Lot No." = FIELD("Lot No. Filter"),
                                                                "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "Net kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Entry"."Qty. (Base)" WHERE("Location Code" = FIELD("Location Code"),
                                                                     "Bin Code" = FIELD("Bin Code"),
                                                                     "Item No." = FIELD("Item No."),
                                                                     "Variant Code" = FIELD("Variant Code"),
                                                                     "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                     "Lot No." = FIELD("Lot No. Filter"),
                                                                     "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "Gross kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Entry"."Qty. (Base)" WHERE("Location Code" = FIELD("Location Code"),
                                                                     "Bin Code" = FIELD("Bin Code"),
                                                                     "Item No." = FIELD("Item No."),
                                                                     "Variant Code" = FIELD("Variant Code"),
                                                                     "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                     "Lot No." = FIELD("Lot No. Filter"),
                                                                     "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50004; "Pick net kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding" WHERE("Location Code" = FIELD("Location Code"),
                                                                                  "Bin Code" = FIELD("Bin Code"),
                                                                                  "Item No." = FIELD("Item No."),
                                                                                  "Variant Code" = FIELD("Variant Code"),
                                                                                  "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                  "Action Type" = CONST(Take),
                                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                                  "Serial No." = FIELD("Serial No. Filter"),
                                                                                  "Assemble to Order" = CONST(false)));
            Caption = 'Pick Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "Pick gross kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. Outstanding" WHERE("Location Code" = FIELD("Location Code"),
                                                                                  "Bin Code" = FIELD("Bin Code"),
                                                                                  "Item No." = FIELD("Item No."),
                                                                                  "Variant Code" = FIELD("Variant Code"),
                                                                                  "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                  "Action Type" = CONST(Take),
                                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                                  "Serial No." = FIELD("Serial No. Filter"),
                                                                                  "Assemble to Order" = CONST(false)));
            Caption = 'Pick Qty.';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50006; "Neg. Adjmt. net kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Journal Line"."Gross kilos (Absolute)" WHERE("Location Code" = FIELD("Location Code"),
                                                                                       "From Bin Code" = FIELD("Bin Code"),
                                                                                       "Item No." = FIELD("Item No."),
                                                                                       "Variant Code" = FIELD("Variant Code"),
                                                                                       "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                       "Lot No." = FIELD("Lot No. Filter"),
                                                                                       "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Neg. Adjmt. gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50007; "Neg. Adjmt. gross kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Journal Line"."Gross kilos (Absolute)" WHERE("Location Code" = FIELD("Location Code"),
                                                                                       "From Bin Code" = FIELD("Bin Code"),
                                                                                       "Item No." = FIELD("Item No."),
                                                                                       "Variant Code" = FIELD("Variant Code"),
                                                                                       "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                       "Lot No." = FIELD("Lot No. Filter"),
                                                                                       "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Neg. Adjmt. gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50008; "Put-away net kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Gross kilos Outstanding" WHERE("Location Code" = FIELD("Location Code"),
                                                                                         "Bin Code" = FIELD("Bin Code"),
                                                                                         "Item No." = FIELD("Item No."),
                                                                                         "Variant Code" = FIELD("Variant Code"),
                                                                                         "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                         "Action Type" = CONST(Place),
                                                                                         "Lot No." = FIELD("Lot No. Filter"),
                                                                                         "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Put-away gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50009; "Put-away gross kilos (Base)"; Decimal)
        {
            CalcFormula = Sum("Warehouse Journal Line"."Gross kilos (Absolute)" WHERE("Location Code" = FIELD("Location Code"),
                                                                                       "To Bin Code" = FIELD("Bin Code"),
                                                                                       "Item No." = FIELD("Item No."),
                                                                                       "Variant Code" = FIELD("Variant Code"),
                                                                                       "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                       "Lot No." = FIELD("Lot No. Filter"),
                                                                                       "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Pos. Adjmt. gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50010; "Min. net kilos"; Decimal)
        {
            Caption = 'Min. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(50011; "Max. net kilos"; Decimal)
        {
            Caption = 'Max. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50012; "Min. gross kilos"; Decimal)
        {
            Caption = 'Min. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(50013; "Max. gross kilos"; Decimal)
        {
            Caption = 'Max. Qty.';
            DecimalPlaces = 0 : 5;
            MinValue = 0;

        }
        field(50014; "Pos. Adjmt. net kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Journal Line"."Gross kilos (Absolute)" WHERE("Location Code" = FIELD("Location Code"),
                                                                                       "From Bin Code" = FIELD("Bin Code"),
                                                                                       "Item No." = FIELD("Item No."),
                                                                                       "Variant Code" = FIELD("Variant Code"),
                                                                                       "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                       "Lot No." = FIELD("Lot No. Filter"),
                                                                                       "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Neg. Adjmt. gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; "Pos. Adjmt. gross kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Journal Line"."Gross kilos (Absolute)" WHERE("Location Code" = FIELD("Location Code"),
                                                                                       "From Bin Code" = FIELD("Bin Code"),
                                                                                       "Item No." = FIELD("Item No."),
                                                                                       "Variant Code" = FIELD("Variant Code"),
                                                                                       "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                       "Lot No." = FIELD("Lot No. Filter"),
                                                                                       "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Neg. Adjmt. gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Put-away net kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Gross kilos Outstanding" WHERE("Location Code" = FIELD("Location Code"),
                                                                                         "Bin Code" = FIELD("Bin Code"),
                                                                                         "Item No." = FIELD("Item No."),
                                                                                         "Variant Code" = FIELD("Variant Code"),
                                                                                         "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                         "Action Type" = CONST(Place),
                                                                                         "Lot No." = FIELD("Lot No. Filter"),
                                                                                         "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Put-away gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; "Put-away gross kilos"; Decimal)
        {
            CalcFormula = Sum("Warehouse Journal Line"."Gross kilos (Absolute)" WHERE("Location Code" = FIELD("Location Code"),
                                                                                       "To Bin Code" = FIELD("Bin Code"),
                                                                                       "Item No." = FIELD("Item No."),
                                                                                       "Variant Code" = FIELD("Variant Code"),
                                                                                       "Unit of Measure Code" = FIELD("Unit of Measure Code"),
                                                                                       "Lot No." = FIELD("Lot No. Filter"),
                                                                                       "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Pos. Adjmt. gross kilos';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50500; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50501; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50502; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50503; "Lote origen"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    //Unsupported feature: Parameter Insertion (Parameter: KnBase) (ParameterCollection) on "CheckDecreaseBinContent(PROCEDURE 21)".


    //Unsupported feature: Parameter Insertion (Parameter: ExcludeKnBase) (ParameterCollection) on "CheckDecreaseBinContent(PROCEDURE 21)".


    //Unsupported feature: Parameter Insertion (Parameter: KbBase) (ParameterCollection) on "CheckDecreaseBinContent(PROCEDURE 21)".


    //Unsupported feature: Parameter Insertion (Parameter: ExcludeKbBase) (ParameterCollection) on "CheckDecreaseBinContent(PROCEDURE 21)".


    //Unsupported feature: Variable Insertion (Variable: KNAvailToPickBase) (VariableCollection) on "CheckDecreaseBinContent(PROCEDURE 21)".


    //Unsupported feature: Variable Insertion (Variable: KBAvailToPickBase) (VariableCollection) on "CheckDecreaseBinContent(PROCEDURE 21)".


    //Unsupported feature: Parameter Insertion (Parameter: KNBase) (ParameterCollection) on "CheckIncreaseBinContent(PROCEDURE 22)".


    //Unsupported feature: Parameter Insertion (Parameter: DeductKNBase) (ParameterCollection) on "CheckIncreaseBinContent(PROCEDURE 22)".


    //Unsupported feature: Parameter Insertion (Parameter: KBBase) (ParameterCollection) on "CheckIncreaseBinContent(PROCEDURE 22)".


    //Unsupported feature: Parameter Insertion (Parameter: DeductKBBase) (ParameterCollection) on "CheckIncreaseBinContent(PROCEDURE 22)".


    procedure "----ARBUMASA----"()
    begin
    end;




    procedure CalcKnBase(): Decimal
    var
        WhseEntry: Record "Warehouse Entry";
        WhseActivLine: Record "Warehouse Activity Line";
        WhseJnlLine: Record "Warehouse Journal Line";
    begin
        WhseEntry.SetCurrentKey(
          "Item No.", "Bin Code", "Location Code", "Variant Code",
          "Unit of Measure Code", "Lot No.", "Serial No.");
        WhseEntry.SetRange("Item No.", "Item No.");
        WhseEntry.SetRange("Bin Code", "Bin Code");
        WhseEntry.SetRange("Location Code", "Location Code");
        WhseEntry.SetRange("Variant Code", "Variant Code");
        WhseEntry.SetRange("Unit of Measure Code", "Unit of Measure Code");
        CopyFilter("Lot No. Filter", WhseEntry."Lot No.");
        CopyFilter("Serial No. Filter", WhseEntry."Serial No.");
        WhseEntry.CalcSums("Qty. (Base)");

        WhseActivLine.SetCurrentKey(
          "Item No.", "Bin Code", "Location Code",
          "Action Type", "Variant Code", "Unit of Measure Code",
          "Breakbulk No.", "Activity Type", "Lot No.", "Serial No.");
        WhseActivLine.SetRange("Item No.", "Item No.");
        WhseActivLine.SetRange("Bin Code", "Bin Code");
        WhseActivLine.SetRange("Location Code", "Location Code");
        WhseActivLine.SetRange("Variant Code", "Variant Code");
        WhseActivLine.SetRange("Unit of Measure Code", "Unit of Measure Code");
        CopyFilter("Lot No. Filter", WhseActivLine."Lot No.");
        CopyFilter("Serial No. Filter", WhseActivLine."Serial No.");
        WhseActivLine.CalcSums("Qty. Outstanding (Base)");

        WhseJnlLine.SetCurrentKey(
          "Item No.", "From Bin Code", "Location Code", "Entry Type", "Variant Code",
          "Unit of Measure Code", "Lot No.", "Serial No.");
        WhseJnlLine.SetRange("Item No.", "Item No.");
        WhseJnlLine.SetRange("From Bin Code", "Bin Code");
        WhseJnlLine.SetRange("Location Code", "Location Code");
        WhseJnlLine.SetRange("Variant Code", "Variant Code");
        WhseJnlLine.SetRange("Unit of Measure Code", "Unit of Measure Code");
        CopyFilter("Lot No. Filter", WhseJnlLine."Lot No.");
        CopyFilter("Serial No. Filter", WhseJnlLine."Serial No.");
        WhseJnlLine.CalcSums("Qty. (Absolute, Base)");

        exit(
          WhseEntry."Qty. (Base)" +
          WhseActivLine."Qty. Outstanding (Base)" +
          WhseJnlLine."Qty. (Absolute, Base)");
    end;


    procedure CalcKbBase(): Decimal
    var
        WhseEntry: Record "Warehouse Entry";
        WhseActivLine: Record "Warehouse Activity Line";
        WhseJnlLine: Record "Warehouse Journal Line";
    begin
        WhseEntry.SetCurrentKey(
          "Item No.", "Bin Code", "Location Code", "Variant Code",
          "Unit of Measure Code", "Lot No.", "Serial No.");
        WhseEntry.SetRange("Item No.", "Item No.");
        WhseEntry.SetRange("Bin Code", "Bin Code");
        WhseEntry.SetRange("Location Code", "Location Code");
        WhseEntry.SetRange("Variant Code", "Variant Code");
        WhseEntry.SetRange("Unit of Measure Code", "Unit of Measure Code");
        CopyFilter("Lot No. Filter", WhseEntry."Lot No.");
        CopyFilter("Serial No. Filter", WhseEntry."Serial No.");
        WhseEntry.CalcSums("Qty. (Base)");

        WhseActivLine.SetCurrentKey(
          "Item No.", "Bin Code", "Location Code",
          "Action Type", "Variant Code", "Unit of Measure Code",
          "Breakbulk No.", "Activity Type", "Lot No.", "Serial No.");
        WhseActivLine.SetRange("Item No.", "Item No.");
        WhseActivLine.SetRange("Bin Code", "Bin Code");
        WhseActivLine.SetRange("Location Code", "Location Code");
        WhseActivLine.SetRange("Variant Code", "Variant Code");
        WhseActivLine.SetRange("Unit of Measure Code", "Unit of Measure Code");
        CopyFilter("Lot No. Filter", WhseActivLine."Lot No.");
        CopyFilter("Serial No. Filter", WhseActivLine."Serial No.");
        WhseActivLine.CalcSums("Qty. Outstanding (Base)");

        WhseJnlLine.SetCurrentKey(
          "Item No.", "From Bin Code", "Location Code", "Entry Type", "Variant Code",
          "Unit of Measure Code", "Lot No.", "Serial No.");
        WhseJnlLine.SetRange("Item No.", "Item No.");
        WhseJnlLine.SetRange("From Bin Code", "Bin Code");
        WhseJnlLine.SetRange("Location Code", "Location Code");
        WhseJnlLine.SetRange("Variant Code", "Variant Code");
        WhseJnlLine.SetRange("Unit of Measure Code", "Unit of Measure Code");
        CopyFilter("Lot No. Filter", WhseJnlLine."Lot No.");
        CopyFilter("Serial No. Filter", WhseJnlLine."Serial No.");
        WhseJnlLine.CalcSums("Qty. (Absolute, Base)");

        exit(
          WhseEntry."Qty. (Base)" +
          WhseActivLine."Qty. Outstanding (Base)" +
          WhseJnlLine."Qty. (Absolute, Base)");
    end;



    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot delete this %1, because warehouse document lines have items allocated to this %1.;ESP=No puede eliminar este %1, porque líns. documento alm. tienen productos asignados a este %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot delete this %1, because warehouse document lines have items allocated to this %1.;ESP=No puede eliminar este %1, porque líns. documento alm. tienen productos asignados a este %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=The total cubage %1 of the %2 for the %5 exceeds the %3 %4 of the %5.\Do you still want enter this %2?;ESP=El cubicaje total %1 del %2 para el %5 excede el %3 %4 del %5.\¿Desea introducir este %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=The total cubage %1 of the %2 for the %5 exceeds the %3 %4 of the %5.\Do you still want enter this %2?;ESP=El cubicaje total %1 del %2 para el %5 excede el %3 %4 del %5.\?Desea introducir este %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=The total weight %1 of the %2 for the %5 exceeds the %3 %4 of the %5.\Do you still want enter this %2?;ESP=El peso total %1 del %2 para el %5 excede el %3 %4 del %5.\¿Desea introducir este %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=The total weight %1 of the %2 for the %5 exceeds the %3 %4 of the %5.\Do you still want enter this %2?;ESP=El peso total %1 del %2 para el %5 excede el %3 %4 del %5.\?Desea introducir este %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=You cannot modify the %1, because warehouse document lines have items allocated to this %2.;ESP=No puede modificar el %1, porque líns. documento alm. tienen productos asignados a este %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=You cannot modify the %1, because warehouse document lines have items allocated to this %2.;ESP=No puede modificar el %1, porque líns. documento alm. tienen productos asignados a este %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text009(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text009 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text009 : ENU=You must first set up user %1 as a warehouse employee.;ESP=Primero debe configurar usuario %1 como empleado almacén.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : ENU=There is already a default bin content for location code %1, item no. %2 and variant code %3.;ESP=Hay ya un contenido de ubic. genérica para el cód. de alm. %1, No. prod. %2 y cód. variante %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : ENU=There is already a default bin content for location code %1, item no. %2 and variant code %3.;ESP=Hay ya un contenido de ubic. genérica para el Cód. de alm. %1, No.prod. %2 y Cód. variante %3.;
    //Variable type has not been exported.
}

