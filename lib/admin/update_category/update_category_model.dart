import '/flutter_flow/flutter_flow_util.dart';
import 'update_category_widget.dart' show UpdateCategoryWidget;
import 'package:flutter/material.dart';

class UpdateCategoryModel extends FlutterFlowModel<UpdateCategoryWidget> {
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
