tableextension 50981 tableextension50981 extends "Merge Duplicates Buffer"
{
    Caption = 'Merge Duplicates Buffer';

    //Unsupported feature: Code Modification on "IncludeDefaultDimTable(PROCEDURE 8)".

    //procedure IncludeDefaultDimTable();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.DefaultDimObjectNoList(TempAllObjWithCaption);
    if TempAllObjWithCaption.Get(TempAllObjWithCaption."Object Type"::Table,"Table ID") then begin
      TempTableRelationsMetadata.Init;
      TempTableRelationsMetadata."Table ID" := DATABASE::"Default Dimension";
      TempTableRelationsMetadata."Field No." := DefaultDimension.FieldNo("No.");
      TempTableRelationsMetadata.Insert;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    DimMgt.SetupObjectNoList(TempAllObjWithCaption);
    #2..7
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "RenameErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //RenameErr : @@@=%1 - Customer/Vendor, %2 - old No., %3 - new No.;ENU=%1 has not been renamed to %3.;ESP=%1 no se cambió a %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RenameErr : @@@=%1 - Customer/Vendor, %2 - old No., %3 - new No.;ENU=%1 has not been renamed to %3.;ESP=%1 no se cambió a %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConflictsErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConflictsErr : @@@=%1 - number of conflicts;ENU=There are conflicts (%1) to resolve prior merge.;ESP=Hay conflictos (%1) para resolver la combinación anterior.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConflictsErr : @@@=%1 - number of conflicts;ENU=There are conflicts (%1) to resolve prior merge.;ESP=Hay conflictos (%1) para resolver la combinación anterior.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConfirmMergeTxt(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmMergeTxt : ENU=Are you sure you want to merge the two records? This step cannot be undone.;ESP=¿Está seguro de que desea combinar los dos registros? Este paso no se puede deshacer.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmMergeTxt : ENU=Are you sure you want to merge the two records? This step cannot be undone.;ESP=?está seguro de que desea combinar los dos registros? Este paso no se puede deshacer.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConfirmRenameTxt(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmRenameTxt : @@@=%1 - values of the primary key fields;ENU=Are you sure you want to rename record %1?;ESP=¿Está seguro de que desea cambiar el nombre del registro %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmRenameTxt : @@@=%1 - values of the primary key fields;ENU=Are you sure you want to rename record %1?;ESP=?está seguro de que desea cambiar el nombre del registro %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConfirmRemoveTxt(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmRemoveTxt : @@@=%1 - values of the primary key fields;ENU=Are you sure you want to remove record %1?;ESP=¿Está seguro de que desea quitar el registro %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmRemoveTxt : @@@=%1 - values of the primary key fields;ENU=Are you sure you want to remove record %1?;ESP=?está seguro de que desea quitar el registro %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CurrRecordErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //CurrRecordErr : ENU=The current record is not set.;ESP=El registro actual no está establecido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CurrRecordErr : ENU=The current record is not set.;ESP=El registro actual no está establecido.;
    //Variable type has not been exported.
}

