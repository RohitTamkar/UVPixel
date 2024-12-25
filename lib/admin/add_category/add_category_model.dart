import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_category_widget.dart' show AddCategoryWidget;
import 'package:flutter/material.dart';

class AddCategoryModel extends FlutterFlowModel<AddCategoryWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextCatalogueCode widget.
  FocusNode? textCatalogueCodeFocusNode;
  TextEditingController? textCatalogueCodeTextController;
  String? Function(BuildContext, String?)?
      textCatalogueCodeTextControllerValidator;
  // State field(s) for priceTextFeild widget.
  FocusNode? priceTextFeildFocusNode;
  TextEditingController? priceTextFeildTextController;
  String? Function(BuildContext, String?)?
      priceTextFeildTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  CategoryRecord? categoryDocRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textCatalogueCodeFocusNode?.dispose();
    textCatalogueCodeTextController?.dispose();

    priceTextFeildFocusNode?.dispose();
    priceTextFeildTextController?.dispose();
  }
}
