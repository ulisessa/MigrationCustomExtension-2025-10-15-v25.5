tableextension 50067 "Cost Budget Entry Ext." extends "Cost Budget Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Cost Type No.")
        {
            Caption = 'Cost Type No.';
        }
        modify("Cost Center Code")
        {
            Caption = 'Cost Center Code';
        }
        modify("Cost Object Code")
        {
            Caption = 'Cost Object Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }
        modify("Allocated with Journal No.")
        {
            Caption = 'Allocated with Journal No.';
        }
        modify("Last Modified By User")
        {
            Caption = 'Last Modified By User';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Allocation Description")
        {
            Caption = 'Allocation Description';
        }
        modify("Allocation ID")
        {
            Caption = 'Allocation ID';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=This function must be started with a budget name.;ESP=Esta función debe iniciarse con un nombre ppto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=This function must be started with a budget name.;ESP=Esta función debe iniciarse con un nombre ppto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The entries in budget %1 will be compressed. Entries with identical cost type, cost center, cost object, and date will be combined.\\The first entry of each group remains unchanged. The amounts from all subsequent entries will be added to the first entry.\\Additional information such as text and allocation on other entries will be deleted.\\Are you sure that you want to continue?;ESP=Los movimientos del presupuesto %1 se comprimirán. Se combinarán los movimientos que tengan el mismo tipo de coste, centro de coste, objeto de coste y fecha.\\El primer movimiento de cada grupo permanece intacto. Los importes del resto de movimientos se agregarán al primero.\\Se eliminará la información adicional, como la información de texto y asignación del resto de los movimientos.\\¿Está seguro de que desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The entries in budget %1 will be compressed. Entries with identical cost type, cost center, cost object, and date will be combined.\\The first entry of each group remains unchanged. The amounts from all subsequent entries will be added to the first entry.\\Additional information such as text and allocation on other entries will be deleted.\\Are you sure that you want to continue?;ESP=Los movimientos del presupuesto %1 se comprimirán. Se combinarán los movimientos que tengan el mismo tipo de coste, centro de coste, objeto de coste y fecha.\\El primer movimiento de cada grupo permanece intacto. Los importes del resto de movimientos se agregarán al primero.\\Se eliminará la información adicional, como la información de texto y asignación del resto de los movimientos.\\?está seguro de que desea continuar?;
    //Variable type has not been exported.
}

