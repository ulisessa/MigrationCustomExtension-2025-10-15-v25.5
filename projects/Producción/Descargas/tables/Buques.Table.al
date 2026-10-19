table 50100 Entities
{
    fields
    {
        field(1; "Entity Code"; Code[20])
        {
            Caption = 'Entity Code';
            ToolTip = 'Specifies the value of the Entity Code field.';
            NotBlank = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Entity Name"; Text[50])
        {
            Caption = 'Entity Name';
            ToolTip = 'Specifies the value of the Entity Name field.';
            NotBlank = true;
            DataClassification = ToBeClassified;
            OptimizeForTextSearch = true;
        }
        field(3; "Establecimiento No. Oficial"; Code[10])
        {
            Caption = 'Establecimiento No. Oficial';
            ToolTip = 'Specifies the value of the Establecimiento No. Oficial field.';
            DataClassification = ToBeClassified;
        }
        field(4; "Short code"; Code[2])
        {
            Caption = 'Short code';
            ToolTip = 'Specifies the value of the Short code field.';
            DataClassification = ToBeClassified;
        }
        field(5; "Formato codificacion pallet"; Option)
        {
            Caption = 'Formato codificación pallet';
            ToolTip = 'Specifies the value of the Formato codificación pallet field.';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Correlativo por año,Juliano ordenado';
            OptionMembers = " ","Correlativo por año","Juliano ordenado";
        }
        field(6; "Lot code format"; Option)
        {
            Caption = 'Lot code format';
            ToolTip = 'Specifies the value of the Lot code format field.';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Departamento+Marea+Pallet+Día+Máster,Departamento+Día+Pallet+Depto. origen+Marea origen+Máster,Departamento+Día+LoteOrigen,Planta+Fecha+Depto. origen+Marea origen+Pallet';
            OptionMembers = " ","Departamento+Marea+Pallet+Día+Máster","Departamento+Día+Pallet+Depto. origen+Marea origen+Máster","Departamento+Día+LoteOrigen","Planta+Fecha+Depto. origen+Marea origen+Pallet";
        }
        field(7; "Seguimiento para trazabilidad"; Option)
        {
            Caption = 'Seguimiento para trazabilidad';
            ToolTip = 'Specifies the value of the Seguimiento para trazabilidad field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(8; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            ToolTip = 'Specifies the value of the Fórmula de aplicación de fechas de DCL field.';
            DataClassification = ToBeClassified;
        }
        field(9; "GLN Code"; Code[13])
        {
            Caption = 'Cód. GLN';
            ToolTip = 'Specifies the value of the Cód. GLN field.';
            DataClassification = ToBeClassified;
        }
        field(10; Romanos; Text[10])
        {
            Caption = 'Romanos';
            ToolTip = 'Specifies the value of the Romanos field.';
            DataClassification = ToBeClassified;
        }
        field(11; "Patent code"; Code[10])
        {
            Caption = 'Cód. matrícula';
            ToolTip = 'Specifies the value of the Cód. matrícula field.';
            DataClassification = ToBeClassified;
        }
        field(12; "DCL tracking"; Option)
        {
            Caption = 'Rastreo de DCL';
            ToolTip = 'Specifies the value of the Rastreo de DCL field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Lote origen a DCL específico","Lote origen a DCL abierto";
        }
        field(13; "Sello Argentino"; Boolean)
        {
            Caption = 'Sello Argentino';
            ToolTip = 'Specifies the value of the Sello Argentino field.';
            DataClassification = ToBeClassified;
        }
        field(14; "Ownership Type"; Option)
        {
            Caption = 'Ownership Type';
            ToolTip = 'Specifies the value of the Ownership Type field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Propio,Tercero,Mixto;
        }
    }
    keys
    {
        key(Key1; "Entity Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}