table 50105 "Familia producto"
{
    DataCaptionFields = "Code", Description;
    fields
    {
        field(1; "Code"; Code[3])
        {
            Caption = 'Código';
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Descripción';
        }
        field(3; "Tipo producto"; Option)
        {
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
            TableRelation = "Categorizacion productos";
        }
        field(5; "Rubric code"; Code[10])
        {
            Caption = 'Cód. rúbrica';

        }
        field(6; "Rubric name"; Code[20])
        {
            Caption = 'Nombre rúbrica';
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

