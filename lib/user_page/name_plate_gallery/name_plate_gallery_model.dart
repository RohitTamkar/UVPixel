import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/drawer/drawer_widget.dart';
import '/user_page/footer_mobile/footer_mobile_widget.dart';
import '/user_page/footer_web/footer_web_widget.dart';
import '/user_page/header/header_widget.dart';
import 'name_plate_gallery_widget.dart' show NamePlateGalleryWidget;
import 'package:flutter/material.dart';

class NamePlateGalleryModel extends FlutterFlowModel<NamePlateGalleryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FooterWeb component.
  late FooterWebModel footerWebModel;
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
    footerWebModel.dispose();
    footerMobileModel.dispose();
    headerModel.dispose();
    drawerModel.dispose();
  }
}
