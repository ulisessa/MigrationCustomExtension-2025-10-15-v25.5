tableextension 50467 tableextension50467 extends Dimension
{
    Caption = 'Dimension';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Code Caption")
        {
            Caption = 'Code Caption';
        }
        modify("Filter Caption")
        {
            Caption = 'Filter Caption';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Consolidation Code")
        {
            Caption = 'Consolidation Code';
        }
        modify("Map-to IC Dimension Code")
        {
            Caption = 'Map-to IC Dimension Code';
        }
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3';
            ToolTip = 'Specifies the value of the Global Dimension 3 field.';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50005; "Mes costo"; Code[10])
        {
            Caption = 'Mes costo';
            ToolTip = 'Specifies the value of the Mes costo field.';

        }
        field(50006; "Address code"; Code[2])
        {
            Caption = 'Cód. dirección';
            ToolTip = 'Specifies the value of the Cód. dirección field.';
            NotBlank = true;

            trigger OnValidate()
            begin
                if "Address code" <> xRec."Address code" then
                    "Area code" := '';
            end;
        }
        field(50007; "Area code"; Code[2])
        {
            Caption = 'Cód. área';
            ToolTip = 'Specifies the value of the Cód. área field.';
            NotBlank = true;
            TableRelation = "Resource family".Nombre WHERE("No" = FIELD("Address code"),
                                                            Nombre = FIELD("Area code"));
        }
        field(50008; "Location code"; Code[30])
        {
            Caption = 'Location Code';
            ToolTip = 'Specifies the value of the Location Code field.';
            TableRelation = Location;
        }
        field(50009; "Use code"; Option)
        {
            Caption = 'Cód. Utilización';
            ToolTip = 'Specifies the value of the Cód. Utilización field.';
            OptionMembers = " ",Planta,Cliente,Buque,Estructura,Tercero;
        }
        field(50010; "Establecimiento No. Oficial"; Code[10])
        {
            Caption = 'Establecimiento No. Oficial';
            ToolTip = 'Specifies the value of the Establecimiento No. Oficial field.';
        }
        field(50011; "% Comprometido de producción"; Option)
        {
            Caption = '% Comprometido de producción';
            ToolTip = 'Specifies the value of the % Comprometido de producción field.';
            OptionMembers = " ","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%";
        }
        field(50020; "Country code"; Code[3])
        {
            Caption = 'Cód. país';
            ToolTip = 'Specifies the value of the Cód. país field.';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN13;
            end;
        }
        field(50021; "Company code"; Code[6])
        {
            Caption = 'Business Unit Code';
            ToolTip = 'Specifies the value of the Business Unit Code field.';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN13;
            end;
        }
        field(50022; "Item code"; Code[3])
        {
            Caption = 'Cód. producto';
            ToolTip = 'Specifies the value of the Cód. producto field.';

            trigger OnValidate()
            begin
                fntVerificador;
                fntEAN13;
            end;
        }
        field(50023; "Validation code"; Code[1])
        {
            Caption = 'Cód. verificador';
            ToolTip = 'Specifies the value of the Cód. verificador field.';
            Editable = false;
        }
        field(50024; "GLN code"; Code[13])
        {
            Caption = 'Cód. GLN';
            ToolTip = 'Specifies the value of the Cód. GLN field.';
        }
        field(50025; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            TableRelation = Estados.Estados;
        }
        field(60000; "% gastos generales"; Decimal)
        {
            BlankZero = true;
            Caption = '% gastos generales';
            ToolTip = 'Specifies the value of the % gastos generales field.';
            DecimalPlaces = 2 : 2;
        }
        field(65000; "Centro trabajo SOLVO"; Code[10])
        {
            Caption = 'Centro trabajo SOLVO';
            ToolTip = 'Specifies the value of the Centro trabajo SOLVO field.';
            NotBlank = true;
        }
        field(65001; "Cta. anticipo a bordo"; Code[20])
        {
            Caption = 'Cta. anticipo a bordo';
            ToolTip = 'Specifies the value of the Cta. anticipo a bordo field.';
            TableRelation = "G/L Account"."No.";
        }
        field(70000; Tipo; Option)
        {
            Caption = 'Tipo';
            ToolTip = 'Specifies the value of the Tipo field.';
            OptionMembers = Barco,Estructura;

            trigger OnValidate()
            begin
                if Tipo = Tipo::Estructura then begin
                    Proyecto.SetCurrentKey(Proyecto."Global Dimension 1 Code");
                    Proyecto.SetRange(Proyecto."Global Dimension 1 Code", Code);
                    if Proyecto.Find('-') then
                        repeat
                            Proyecto.TestField(Tipo, Proyecto.Tipo::Improductivo);
                            Proyecto.TestField("Forma de reparto", Proyecto."Forma de reparto"::Estructura);
                        until Proyecto.Next = 0;
                end;
            end;
        }
    }

    procedure fntVerificador()
    begin
        if StrLen("Country code" + "Company code" + "Item code") = 12 then
            "Validation code" := Format(StrCheckSum("Country code" + "Company code" + "Item code", '131313131313'))
        else
            "Validation code" := '';
    end;

    procedure fntEAN13()
    begin
        if StrLen("Country code" + "Company code" + "Item code") = 12 then
            "GLN code" := "Country code" + "Company code" + "Item code" + "Validation code"
        else
            "GLN code" := '';
    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=%1\This dimension is also used in posted or budget entries.\You cannot delete it.;ESP=%1\Esta dimensión se usa también al registrar ó presup. movs.\No puede borrarla.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=%1\This dimension is also used in posted or budget entries.\You cannot delete it.;ESP=%1\Esta dimensión se usa tambión al registrar ? presup. movs.\No puede borrarla.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot delete this dimension value, because it has been used in one or more documents or budget entries.;ESP=No puede eliminar este valor de dimensión, porque se ha usado en uno o varios documentos o mov. de presupuestos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot delete this dimension value, because it has been used in one or more documents or budget entries.;ESP=No puede eliminar este valor de dimensión, porque se ha usado en uno o varios documentos o mov. de presupuestos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=Code;ESP=Código;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=Code;ESP=Código;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : ENU="This dimension is used in the following setup: ";ESP="Esta dimensión se usa en la siguiente config.: ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : ENU="This dimension is used in the following setup: ";ESP="Esta dimensión se usa en la siguiente config.: ";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU="Analysis View Card, ";ESP="Ficha Vista de análisis, ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU="Analysis View Card, ";ESP="Ficha Vista de análisis, ";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text015(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text015 : ENU="Item Analysis View Card, ";ESP="Ficha vista de análisis de artículo, ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text015 : ENU="Item Analysis View Card, ";ESP="Ficha vista de análisis de artículo, ";
    //Variable type has not been exported.

    var
        Proyecto: Record Job;
        Recurso: Record Resource;
}

