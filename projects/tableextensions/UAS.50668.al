tableextension 50668 tableextension50668 extends Employee
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Mobile Phone No.")
        {
            Caption = 'Mobile Phone No.';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        modify("Alt. Address Code")
        {
            Caption = 'Alt. Address Code';
        }
        modify("Social Security No.")
        {
            Caption = 'Social Security No.';
        }
        modify("Union Code")
        {
            Caption = 'Union Code';
        }
        modify("Union Membership No.")
        {
            Caption = 'Union Membership No.';
        }
        modify(Gender)
        {
            Caption = 'Gender';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Manager No.")
        {
            Caption = 'Manager No.';
        }
        modify("Emplymt. Contract Code")
        {
            Caption = 'Emplymt. Contract Code';
        }
        modify("Statistics Group Code")
        {
            Caption = 'Statistics Group Code';
        }
        modify("Employment Date")
        {
            Caption = 'Employment Date';
        }
        modify("Cause of Inactivity Code")
        {
            Caption = 'Cause of Inactivity Code';
        }
        modify("Termination Date")
        {
            Caption = 'Termination Date';
        }
        modify("Grounds for Term. Code")
        {
            Caption = 'Grounds for Term. Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Resource No.")
        {
            Caption = 'Resource No.';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Global Dimension 1 Filter")
        {
            Caption = 'Global Dimension 1 Filter';
        }
        modify("Global Dimension 2 Filter")
        {
            Caption = 'Global Dimension 2 Filter';
        }
        modify(Extension)
        {
            Caption = 'Extension';
        }
        modify("Employee No. Filter")
        {
            Caption = 'Employee No. Filter';
        }
        modify(Pager)
        {
            Caption = 'Pager';
        }
        modify("Fax No.")
        {
            Caption = 'Fax No.';
        }
        modify("Company E-Mail")
        {
            Caption = 'Company Email';
        }
        modify(Title)
        {
            Caption = 'Title';
        }
        modify("Salespers./Purch. Code")
        {
            Caption = 'Salespers./Purch. Code';
        }
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
        modify("Bank Branch No.")
        {
            Caption = 'Bank Branch No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("SWIFT Code")
        {
            Caption = 'SWIFT Code';
        }
        modify("Application Method")
        {
            Caption = 'Application Method';
        }
        modify("Cost Center Code")
        {
            Caption = 'Cost Center Code';
        }
        modify("Cost Object Code")
        {
            Caption = 'Cost Object Code';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
            end;
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Global Dimension 5 Code");
            end;
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global Dimension 6 Code");
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
            end;
        }
        field(50005; "Cód. grupo seguridad"; Code[10])
        {
            Caption = 'Cód. grupo seguridad';
            ToolTip = 'Specifies the value of the Cód. grupo seguridad field.';
            TableRelation = Seguridad;
        }
        field(50006; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;
        }
        field(50008; "Cód. provincia domicilio"; Code[10])
        {
            Caption = 'Cód. provincia domicilio';
            ToolTip = 'Specifies the value of the Cód. provincia domicilio field.';
        }
        field(50009; "Nombre provincia domicilio"; Text[50])
        {
            Caption = 'Nombre provincia domicilio';
            ToolTip = 'Specifies the value of the Nombre provincia domicilio field.';
        }
        field(50010; "Related shop calendar"; Code[20])
        {
            Caption = 'Calendario de planta relacionado';
            ToolTip = 'Specifies the value of the Calendario de planta relacionado field.';
            DataClassification = ToBeClassified;
            TableRelation = "Shop Calendar";
        }
        field(50100; "CIF/NIF"; Text[20])
        {
            Caption = 'VAT Registration No.';
            ToolTip = 'Specifies the value of the VAT Registration No field.';

            trigger OnValidate()
            begin
                //>>DATA3
                //GestiónCIFNIF.ComprobarCIFNIF("CIF/NIF");
                //<<DATA3
            end;
        }
        field(50200; "pat_Número de Empresa"; Integer)
        {
            Caption = 'pat_Número de Empresa';
            ToolTip = 'Specifies the value of the pat_Número de Empresa field.';
        }
        field(50201; pat_Apellido; Text[30])
        {
            Caption = 'pat_Apellido';
            ToolTip = 'Specifies the value of the pat_Apellido field.';
        }
        field(50202; pat_Nombre; Text[30])
        {
            Caption = 'pat_Nombre';
            ToolTip = 'Specifies the value of the pat_Nombre field.';
        }
        field(50203; "pat_Tipo de documento"; Integer)
        {
            Caption = 'pat_Tipo de documento';
            ToolTip = 'Specifies the value of the pat_Tipo de documento field.';
        }
        field(50204; "pat_No. documento"; Text[30])
        {
            Caption = 'pat_No. documento';
            ToolTip = 'Specifies the value of the pat_No. documento field.';
        }
        field(50205; "pat_Provincia documento"; Integer)
        {
            Caption = 'pat_Provincia documento';
            ToolTip = 'Specifies the value of the pat_Provincia documento field.';
        }
        field(50206; pat_Nacionalidad; Text[10])
        {
            Caption = 'pat_Nacionalidad';
            ToolTip = 'Specifies the value of the pat_Nacionalidad field.';
        }
        field(50207; "pat_Fecha nacimiento"; Date)
        {
            Caption = 'pat_Fecha nacimiento';
            ToolTip = 'Specifies the value of the pat_Fecha nacimiento field.';
            AutoFormatExpression = 'DD/MM/YYYY';
        }
        field(50208; pat_Sexo; Text[4])
        {
            Caption = 'pat_Sexo';
            ToolTip = 'Specifies the value of the pat_Sexo field.';
        }
        field(50209; "pat_Estado civil"; Text[1])
        {
            Caption = 'pat_Estado civil';
            ToolTip = 'Specifies the value of the pat_Estado civil field.';
        }
        field(50210; "pat_Calle domicilio particular"; Text[50])
        {
            Caption = 'pat_Calle domicilio particular';
            ToolTip = 'Specifies the value of the pat_Calle domicilio particular field.';
        }
        field(50211; "pat_Número puerta dom. part."; Text[30])
        {
            Caption = 'pat_Número puerta dom. part.';
            ToolTip = 'Specifies the value of the pat_Número puerta dom. part field.';
        }
        field(50212; "pat_Piso dom. part."; Text[10])
        {
            Caption = 'pat_Piso dom. part.';
            ToolTip = 'Specifies the value of the pat_Piso dom. part field.';
        }
        field(50213; "pat_Unidad dom. part."; Text[2])
        {
            Caption = 'pat_Unidad dom. part.';
            ToolTip = 'Specifies the value of the pat_Unidad dom. part field.';
        }
        field(50214; "pat_Localidad dom. part."; Text[50])
        {
            Caption = 'pat_Localidad dom. part.';
            ToolTip = 'Specifies the value of the pat_Localidad dom. part field.';
        }
        field(50215; "pat_Cód. postal dom. part."; Text[30])
        {
            Caption = 'pat_Cód. postal dom. part.';
            ToolTip = 'Specifies the value of the pat_Cód. postal dom. part field.';
        }
        field(50216; "pat_Cód. provincia dom. part."; Text[30])
        {
            Caption = 'pat_Cód. provincia dom. part.';
            ToolTip = 'Specifies the value of the pat_Cód. provincia dom. part field.';
        }
        field(50217; "pat_Tipo cuenta solicitada"; Integer)
        {
            Caption = 'pat_Tipo cuenta solicitada';
            ToolTip = 'Specifies the value of the pat_Tipo cuenta solicitada field.';
        }
        field(50218; "pat_Cód. ident. AFIP"; Text[17])
        {
            Caption = 'pat_Cód. ident. AFIP';
            ToolTip = 'Specifies the value of the pat_Cód. ident. AFIP field.';
        }
        field(50219; "pat_No. ident. AFIP"; Text[30])
        {
            Caption = 'pat_No. ident. AFIP';
            ToolTip = 'Specifies the value of the pat_No. ident. AFIP field.';
        }
        field(50220; "pat_Ingresos netos"; Decimal)
        {
            Caption = 'pat_Ingresos netos';
            ToolTip = 'Specifies the value of the pat_Ingresos netos field.';
        }
        field(50221; "pat_ Categoría/Cargo/Rango"; Text[50])
        {
            Caption = 'pat_ Categoría/Cargo/Rango';
            ToolTip = 'Specifies the value of the pat_ Categoría/Cargo/Rango field.';
        }
        field(50222; "pat_Fecha ingreso laboral"; Date)
        {
            Caption = 'pat_Fecha ingreso laboral';
            ToolTip = 'Specifies the value of the pat_Fecha ingreso laboral field.';
        }
        field(50223; "pat_Dependencia de pago"; Text[15])
        {
            Caption = 'pat_Dependencia de pago';
            ToolTip = 'Specifies the value of the pat_Dependencia de pago field.';
        }
        field(50224; "pat_Cód. postal dep. pago"; Text[30])
        {
            Caption = 'pat_Cód. postal dep. pago';
            ToolTip = 'Specifies the value of the pat_Cód. postal dep. pago field.';
        }
        field(50225; "pat_Teléfono - prefijo país/p"; Text[4])
        {
            Caption = 'pat_Teléfono - prefijo país/p';
            ToolTip = 'Specifies the value of the pat_Teléfono - prefijo país/p field.';
        }
        field(50226; "pat_Teléfono - característica"; Text[4])
        {
            Caption = 'pat_Teléfono - característica';
            ToolTip = 'Specifies the value of the pat_Teléfono - característica field.';
        }
        field(50227; "pat_Teléfono - Número"; Text[5])
        {
            Caption = 'pat_Teléfono - Número';
            ToolTip = 'Specifies the value of the pat_Teléfono - Número field.';
        }
        field(50228; pat_CBU; Text[250])
        {
            Caption = 'pat_CBU';
            ToolTip = 'Specifies the value of the pat_CBU field.';
        }
        field(50229; "pat_Cod. convenio"; Text[30])
        {
            Caption = 'pat_Cod. convenio';
            ToolTip = 'Specifies the value of the pat_Cod. convenio field.';
        }
        field(50230; "pat_Nombre convenio"; Text[100])
        {
            Caption = 'pat_Nombre convenio';
            ToolTip = 'Specifies the value of the pat_Nombre convenio field.';
        }
        field(50500; "Posición Planta"; Code[20])
        {
            Caption = 'Posición Planta';
            ToolTip = 'Specifies the value of the Posición Planta field.';
        }
        field(50501; "Categoría"; Code[10])
        {
            Caption = 'Categoría';
            ToolTip = 'Specifies the value of the Categoría field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('CATEGORIAS'));
        }
        field(50502; Puesto; Code[10])
        {
            Caption = 'Puesto';
            ToolTip = 'Specifies the value of the Puesto field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUESTOS'));
        }
        field(50503; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
            ToolTip = 'Specifies the value of the Workday code field.';
            TableRelation = Workday;
        }
        field(50504; "Flexible o restricto"; Option)
        {
            Caption = 'Flexible o restricto';
            ToolTip = 'Specifies the value of the Flexible o restricto field.';
            OptionMembers = ,Restricto,Flexible,Mixto," ";
        }
        field(50506; "Salario básico"; Decimal)
        {
            Caption = 'Salario básico';
            ToolTip = 'Specifies the value of the Salario básico field.';
        }
        field(50507; "Payroll posting group"; Code[10])
        {
            Caption = 'Payroll posting group';
            ToolTip = 'Specifies the value of the Payroll posting group field.';
        }
        field(50508; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
        }
        field(60000; "Fecha baja"; Date)
        {
            Caption = 'Fecha baja';
            ToolTip = 'Specifies the value of the Fecha baja field.';
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Modified Date Time" := CurrentDateTime;
    UpdateNamesFromOldFields;
    HumanResSetup.Get;
    #4..7
    if HumanResSetup."Automatically Create Resource" then begin
      ResourcesSetup.Get;
      Resource.Init;
      if NoSeriesMgt.ManualNoAllowed(ResourcesSetup."Resource Nos.") then begin
        Resource."No." := "No.";
        Resource.Insert(true);
      end else
        Resource.Insert(true);
      "Resource No." := Resource."No.";
    end;

    DimMgt.UpdateDefaultDim(
      DATABASE::Employee,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    UpdateSearchName;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
    {  IF NoSeriesMgt.ManualNoAllowed(ResourcesSetup."Resource Nos.") THEN BEGIN
        Resource."No." := "No.";
        Resource.INSERT(TRUE);
      END ELSE
        Resource.INSERT(TRUE);
     } "Resource No." := Resource."No.";
    end;

    fntActualizarSeptima;
    #18..20
      "Global Dimension 1 Code","Global Dimension 2 Code",
      //++Arbu
      "Global Dimension 3 Code","Global Dimension 4 Code",
      "Global Dimension 5 Code","Global Dimension 6 Code",
      "Global Dimension 7 Code"
      //--Arbu
      );
    UpdateSearchName;
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.RenameDefaultDim(DATABASE::Employee,xRec."No.","No.");
    "Last Modified Date Time" := CurrentDateTime;
    "Last Date Modified" := Today;
    UpdateSearchName;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //DimMgt.RenameDefaultDim(DATABASE::Employee,xRec."No.","No.");
    #2..4
    */
    //end;

    local procedure fntActualizarSeptima()
    var
        l_rstGLS: Record "General Ledger Setup";
        l_rstD: Record Dimension;
        l_rstDV: Record "Dimension Value";
        l_rst352: Record "Default Dimension";
    begin
        //++Arbu 2020
        //Cambiar el nombre de la dimensión global 7 a Relación Costo
        Clear(l_rstGLS);
        l_rstGLS.Get();
        if l_rstGLS."Global Dimension 7 Code" <> '' then begin

            Clear(l_rstD);
            l_rstD.SetRange(Code, l_rstGLS."Global Dimension 7 Code");
            if l_rstD.FindFirst then begin

                Clear(l_rstDV);
                l_rstDV."Dimension Code" := l_rstD.Code;
                l_rstDV.Code := "No.";
                l_rstDV.Name := CopyStr(Name, 1, 50);
                l_rstDV."Dimension Value Type" := l_rstDV."Dimension Value Type"::Standard;
                l_rstDV."Global Dimension No." := 7;
                if not l_rstDV.Insert(true) then;

                Clear(l_rst352);
                l_rst352."Table ID" := 5200;
                l_rst352."No." := l_rstDV.Code;
                l_rst352."Dimension Code" := l_rstDV."Dimension Code";
                l_rst352."Dimension Value Code" := l_rstDV.Code;
                l_rst352."Value Posting" := l_rst352."Value Posting"::"Code Mandatory";
                if not l_rst352.Insert(true) then;

                "Global Dimension 7 Code" := l_rstDV.Code;

            end;

        end;

        //--Arbu 2020
    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BlockedEmplForJnrlErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //BlockedEmplForJnrlErr : @@@="%1 = employee no.";ENU=You cannot create this document because employee %1 is blocked due to privacy.;ESP=No puede crear este documento porque el empleado %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BlockedEmplForJnrlErr : @@@="%1 = employee no.";ENU=You cannot create this document because employee %1 is blocked due to privacy.;ESP=No puede crear este documento porque el empleado %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BlockedEmplForJnrlPostingErr(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //BlockedEmplForJnrlPostingErr : @@@="%1 = employee no.";ENU=You cannot post this document because employee %1 is blocked due to privacy.;ESP=No puede registrar este documento porque el empleado %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BlockedEmplForJnrlPostingErr : @@@="%1 = employee no.";ENU=You cannot post this document because employee %1 is blocked due to privacy.;ESP=No puede registrar este documento porque el empleado %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "EmployeeLinkedToResourceErr(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //EmployeeLinkedToResourceErr : @@@="%1 = employee no.";ENU=You cannot link multiple employees to the same resource. Employee %1 is already linked to that resource.;ESP=No puede conectar varios empleados al mismo recurso. El empleado %1 ya está vinculado a ese recurso.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EmployeeLinkedToResourceErr : @@@="%1 = employee no.";ENU=You cannot link multiple employees to the same resource. Employee %1 is already linked to that resource.;ESP=No puede conectar varios empleados al mismo recurso. El empleado %1 ya está vinculado a ese recurso.;
    //Variable type has not been exported.
}

