tableextension 51320 tableextension51320 extends "Work Center"
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
        modify("Work Center Group Code")
        {
            Caption = 'Work Center Group Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Subcontractor No.")
        {
            Caption = 'Subcontractor No.';
        }
        modify("Queue Time Unit of Meas. Code")
        {
            Caption = 'Queue Time Unit of Meas. Code';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Maximum Efficiency")
        {
            Caption = 'Maximum Efficiency';
        }
        modify("Minimum Efficiency")
        {
            Caption = 'Minimum Efficiency';
        }
        modify("Calendar Rounding Precision")
        {
            Caption = 'Calendar Rounding Precision';
        }
        modify("Simulation Type")
        {
            Caption = 'Simulation Type';
            OptionCaption = 'Moves,Moves When Necessary,Critical';
        }
        modify("Shop Calendar Code")
        {
            Caption = 'Shop Calendar Code';
        }
        modify("Unit Cost Calculation")
        {
            Caption = 'Unit Cost Calculation';
        }
        modify("Specific Unit Cost")
        {
            Caption = 'Specific Unit Cost';
        }
        modify("Flushing Method")
        {
            Caption = 'Flushing Method';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("To-Production Bin Code")
        {
            Caption = 'To-Production Bin Code';
        }
        modify("From-Production Bin Code")
        {
            Caption = 'From-Production Bin Code';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
            end;
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Global Dimension 5 Code");
            end;
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global Dimension 6 Code");
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MfgSetup.Get;
    if "No." = '' then begin
      MfgSetup.TestField("Work Center Nos.");
      NoSeriesMgt.InitSeries(MfgSetup."Work Center Nos.",xRec."No. Series",0D,"No.","No. Series");
    end;
    DimMgt.UpdateDefaultDim(
      DATABASE::"Work Center","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
      "Global Dimension 1 Code","Global Dimension 2 Code",
      //++Arbu
      "Global Dimension 3 Code","Global Dimension 4 Code",
      "Global Dimension 5 Code","Global Dimension 6 Code",
      "Global Dimension 7 Code");
      //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.RenameDefaultDim(DATABASE::"Work Center",xRec."No.","No.");
    "Last Date Modified" := Today;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {DimMgt.RenameDefaultDim(DATABASE::"Work Center",xRec."No.","No.");
    "Last Date Modified" := TODAY;
    }
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=The Work Center is being used on production orders.;ESP=Centro trabajo utilizándose con órdenes producción.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=The Work Center is being used on production orders.;ESP=Centro trabajo utilizándose con órdenes producción.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Do you want to change %1?;ESP=¿Confirma que desea cambiar %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Do you want to change %1?;ESP=?Confirma que desea cambiar %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Work Center Group Code is changed...\\;ESP=Se ha cambiado el Cód. grupo cen. trab...\\;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Work Center Group Code is changed...\\;ESP=Se ha cambiado el Cód. grupo cen. trab...\\;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : @@@="%1 = Table caption; %2 = Field Value; %3 = Table Caption";ENU=You cannot delete %1 %2 because there is at least one %3 associated with it.;ESP=No puede eliminar %1 %2 porque existe al menos un %3 asociado a él.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : @@@="%1 = Table caption; %2 = Field Value; %3 = Table Caption";ENU=You cannot delete %1 %2 because there is at least one %3 associated with it.;ESP=No puede eliminar %1 %2 porque existe al menos un %3 asociado a él.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=If you change the %1, then all bin codes on the %2 and related %3 will be removed. Are you sure that you want to continue?;ESP=Si cambia %1, todos los códigos de ubicación del %2 y los %3 relacionados se eliminarán. ¿Está seguro de que desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=If you change the %1, then all bin codes on the %2 and related %3 will be removed. Are you sure that you want to continue?;ESP=Si cambia %1, todos los Códigos de ubicación del %2 y los %3 relacionados se eliminarán. ?está seguro de que desea continuar?;
    //Variable type has not been exported.
}

