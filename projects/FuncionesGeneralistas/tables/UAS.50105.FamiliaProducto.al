table 50105 "Familia producto"
{
    DataCaptionFields = "Code", Description;
    fields
    {
        field(1; "Code"; Code[3])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the value of the Code field.';
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(3; "Tipo producto"; Option)
        {
            Caption = 'Item type';
            ToolTip = 'Specifies the value of the Item type field.';
            OptionMembers = Consumo,Pesca;

            trigger OnValidate()
            begin
                if "Tipo producto" = xRec."Tipo producto" then
                    exit;

                Producto.SetCurrentKey(Familia, Subfamilia);
                Producto.SetRange(Familia, Code);
                if Producto.Find('-') then begin
                    if not Confirm(
                      '¨Cambiar el %1 a los productos de esta familia?', false, FieldName("Tipo producto")) then
                        exit;
                    Producto.ModifyAll("Tipo producto", "Tipo producto");
                end;
            end;
        }
        field(4; "Cat. code"; Code[3])
        {
            Caption = 'Cód. categorización';
            ToolTip = 'Specifies the value of the Cód. categorización field.';
            TableRelation = "Categorizacion productos";
        }
        field(5; "Rubric code"; Code[10])
        {
            Caption = 'Cód. rúbrica';
            ToolTip = 'Specifies the value of the Cód. rúbrica field.';

        }
        field(6; "Rubric name"; Code[20])
        {
            Caption = 'Nombre rúbrica';
            ToolTip = 'Specifies the value of the Nombre rúbrica field.';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description, "Tipo producto")
        {
        }
    }

    trigger OnDelete()
    begin
        SubFa.SetRange("Family code", Code);
        SubFa.DeleteAll;

        Producto.SetCurrentKey(Familia, Subfamilia);
        Producto.SetRange(Familia, Code);
        if Producto.Find('-') then
            Error('No puede borrar la familia pues hay productos asociados');
    end;

    var
        SubFa: Record "Subfamilia producto";
        Producto: Record Item;
}

