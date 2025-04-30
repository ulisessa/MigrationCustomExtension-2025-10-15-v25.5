tableextension 50836 tableextension50836 extends "Item Category"
{
    Caption = 'Item Category';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Parent Category")
        {
            Caption = 'Parent Category';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 3)".

            Caption = 'Description';
        }
        modify(Indentation)
        {
            Caption = 'Indentation';
        }
        modify("Presentation Order")
        {
            Caption = 'Presentation Order';
        }
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
    }

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField(Code);
    UpdateIndentation;
    ItemCategoryManagement.CalcPresentationOrder(Rec);
    "Last Modified Date Time" := CurrentDateTime;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TestField(Code);
    UpdateIndentation;
    //++Arbu ItemCategoryManagement.CalcPresentationOrder(Rec);
    "Last Modified Date Time" := CurrentDateTime;
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateIndentation;
    ItemCategoryManagement.CalcPresentationOrder(Rec);
    "Last Modified Date Time" := CurrentDateTime;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    UpdateIndentation;
    //++ARbu ItemCategoryManagement.CalcPresentationOrder(Rec);
    "Last Modified Date Time" := CurrentDateTime;
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "CyclicInheritanceErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CyclicInheritanceErr : ENU=An item category cannot be a parent of itself or any of its children.;ESP=Una categoría de producto no puede ser un elemento principal de sí misma ni de ninguno de sus elementos secundarios.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CyclicInheritanceErr : ENU=An item category cannot be a parent of itself or any of its children.;ESP=Una Categoría de producto no puede ser un elemento principal de sí misma ni de ninguno de sus elementos secundarios.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DeleteWithChildrenErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteWithChildrenErr : ENU=You cannot delete this item category because it has child item categories.;ESP=No puede eliminar esta categoría de producto porque tiene categorías de producto secundarias.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteWithChildrenErr : ENU=You cannot delete this item category because it has child item categories.;ESP=No puede eliminar esta Categoría de producto porque tiene Categorías de producto secundarias.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DeleteItemInheritedAttributesQst(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteItemInheritedAttributesQst : @@@=%1 - item category code;ENU="One or more items belong to item category ''%1''.\\Do you want to delete the inherited item attributes for the items in question? ";ESP="Uno o varios productos pertenecen a la categoría de producto ''%1''.\\¿Desea eliminar los atributos de producto heredados para los productos en cuestión? ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteItemInheritedAttributesQst : @@@=%1 - item category code;ENU=One or more items belong to item category ''%1''.\\Do you want to delete the inherited item attributes for the items in questioNo.;ESP=Uno o varios productos pertenecen a la Categoría de producto ''%1''.\\?Desea eliminar los atributos de producto heredados para los productos en cuesti?No.;
    //Variable type has not been exported.
}

