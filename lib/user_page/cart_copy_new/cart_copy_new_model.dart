import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/footer_mobile/footer_mobile_widget.dart';
import '/user_page/footer_web/footer_web_widget.dart';
import '/user_page/header/header_widget.dart';
import 'cart_copy_new_widget.dart' show CartCopyNewWidget;
import 'package:flutter/material.dart';

class CartCopyNewModel extends FlutterFlowModel<CartCopyNewWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? image;

  SizeMapStruct? selectedSize;
  void updateSelectedSizeStruct(Function(SizeMapStruct) updateFn) {
    updateFn(selectedSize ??= SizeMapStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CartCopyNew widget.
  CategoryRecord? listifcat;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Switch widget.
  bool? switchValue1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SizeRecord? sizeDocOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ThicknessRecord? thicknessDocOutput;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for pincodeText widget.
  FocusNode? pincodeTextFocusNode;
  TextEditingController? pincodeTextTextController;
  String? Function(BuildContext, String?)? pincodeTextTextControllerValidator;
  // Stores action output result for [Backend Call - API (getPincode)] action in Button widget.
  ApiCallResponse? apiResultepc;
  // Model for FooterWeb component.
  late FooterWebModel footerWebModel;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Switch widget.
  bool? switchValue2;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  CatalogueRecord? priceDetailss;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SizeRecord? sizeDocOutputCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ThicknessRecord? thicknessDocOutputCopy;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for FooterMobile component.
  late FooterMobileModel footerMobileModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    footerWebModel = createModel(context, () => FooterWebModel());
    footerMobileModel = createModel(context, () => FooterMobileModel());
    headerModel = createModel(context, () => HeaderModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    pincodeTextFocusNode?.dispose();
    pincodeTextTextController?.dispose();

    footerWebModel.dispose();
    textFieldFocusNode?.dispose();
    textController2?.dispose();

    footerMobileModel.dispose();
    headerModel.dispose();
    drawerModel.dispose();
  }
}
