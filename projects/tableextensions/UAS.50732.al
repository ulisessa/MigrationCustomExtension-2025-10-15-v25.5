tableextension 50732 tableextension50732 extends "Item Unit of Measure"
{
    fields
    {
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
        field(50000; "Country code"; Code[3])
        {
            Caption = 'Cód. país';
            ToolTip = 'Specifies the value of the Cód. país field.';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN;
            end;
        }
        field(50001; "Company code"; Code[6])
        {
            Caption = 'Business Unit Code';
            ToolTip = 'Specifies the value of the Business Unit Code field.';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN;
            end;
        }
        field(50002; "Item code"; Code[3])
        {
            Caption = 'Cód. proudcto';
            ToolTip = 'Specifies the value of the Cód. proudcto field.';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN;
            end;
        }
        field(50003; "Validation code"; Code[1])
        {
            Caption = 'Cód. validación';
            ToolTip = 'Specifies the value of the Cód. validación field.';
            Editable = false;
        }
        field(50004; "EAN-13 code"; Code[13])
        {
            Caption = 'Cód. EAN-13';
            ToolTip = 'Specifies the value of the Cód. EAN-13 field.';
        }
        field(50005; "Item description"; Text[250])
        {
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Item No.")));
            Caption = 'Item Description';
            ToolTip = 'Specifies the value of the Item Description field.';
            FieldClass = FlowField;
        }
        field(50006; "Bulk code"; Code[1])
        {
            Caption = 'Cód. bulto';
            ToolTip = 'Specifies the value of the Cód. bulto field.';
            CharAllowed = '12345678';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN;
            end;
        }
        field(50007; "EAN-14 code"; Code[14])
        {
            Caption = 'Cód. EAN-14';
            ToolTip = 'Specifies the value of the Cód. EAN-14 field.';
        }
    }

    procedure fntEAN()
    begin
        if StrLen("Bulk code" + "Country code" + "Company code" + "Item code") = 12 then
            "EAN-13 code" := "Bulk code" + "Country code" + "Company code" + "Item code" + "Validation code"
        else
            "EAN-13 code" := '';

        if StrLen("Bulk code" + "Country code" + "Company code" + "Item code") = 13 then
            "EAN-14 code" := "Bulk code" + "Country code" + "Company code" + "Item code" + "Validation code"
        else
            "EAN-14 code" := '';
    end;

    procedure fntVerificador()
    begin
        case StrLen("Bulk code" + "Country code" + "Company code" + "Item code") of

            12:
                "Validation code" := Format(StrCheckSum("Country code" + "Company code" + "Item code", '131313131313'));
            13:
                "Validation code" := Format(StrCheckSum("Bulk code" + "Country code" + "Company code" + "Item code", '3131313131313'));
            else
                "Validation code" := '';

        end;
    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot rename %1 %2 for item %3 because it is the item's %4 and there are one or more open ledger entries for the item.;ESP=No puede renombrar %1 %2 para el producto %3 por que es el %4 del producto y hay uno ó más movs. contab. para el producto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot rename %1 %2 for item %3 because it is the item's %4 and there are one or more open ledger entries for the item.;ESP=No puede renombrar %1 %2 para el producto %3 por que es el %4 del producto y hay uno ? más movs. contab. para el producto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotModifyPutAwayUnitOfMeasureErr(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotModifyPutAwayUnitOfMeasureErr : @@@=%1 Value of Measure (KG, PCS...), %2 Item ID;ENU=You cannot modify item unit of measure %1 for item %2 because it is the item's put-away unit of measure.;ESP=No puede modificar la unidad de medida %1 del producto %2 porque es la unidad de medida de ubicación del producto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotModifyPutAwayUnitOfMeasureErr : @@@=%1 Value of Measure (KG, PCS...), %2 Item ID;ENU=You cannot modify item unit of measure %1 for item %2 because it is the item's put-away unit of measure.;ESP=No puede modificar la unidad de medida %1 del producto %2 porque es la unidad de medida de ubicación del producto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotModifyUOMWithWhseEntriesErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotModifyUOMWithWhseEntriesErr : @@@="%1 = Item Unit of Measure %2 = Code %3 = Item No.";ENU=You cannot modify %1 %2 for item %3 because there are one or more warehouse adjustment entries for the item.;ESP=No puede modificar %1 %2 para el artículo %3 porque hay uno o varios movimientos de ajuste de almacén para el artículo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotModifyUOMWithWhseEntriesErr : @@@="%1 = Item Unit of Measure %2 = Code %3 = Item No.";ENU=You cannot modify %1 %2 for item %3 because there are one or more warehouse adjustment entries for the item.;ESP=No puede modificar %1 %2 para el artículo %3 porque hay uno o varios movimientos de ajuste de almacén para el artículo.;
    //Variable type has not been exported.
}

