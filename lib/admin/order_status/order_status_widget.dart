import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_page/failed_alert/failed_alert_widget.dart';
import '/user_page/success_alert/success_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_status_model.dart';
export 'order_status_model.dart';

class OrderStatusWidget extends StatefulWidget {
  const OrderStatusWidget({super.key});

  @override
  State<OrderStatusWidget> createState() => _OrderStatusWidgetState();
}

class _OrderStatusWidgetState extends State<OrderStatusWidget> {
  late OrderStatusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderStatusModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().statusFlag = 0;
      });
      _model.apiResults2w = await CheckStatusCall.call(
        merchantId: 'UVPIXELONLINE',
        merchantTransactionId: FFAppState().merchantTransactionId,
      );
      if ((_model.apiResults2w?.succeeded ?? true)) {
        if ('COMPLETED' ==
            getJsonField(
              (_model.apiResults2w?.jsonBody ?? ''),
              r'''$.data.state''',
            )) {
          setState(() {
            FFAppState().statusFlag = 1;
          });
        } else {
          setState(() {
            FFAppState().statusFlag = 2;
          });
        }
      } else {
        setState(() {
          FFAppState().statusFlag = 2;
        });
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text(valueOrDefault<String>(
                (_model.apiResults2w?.statusCode ?? 200).toString(),
                '0',
              )),
              content: const Text('Payment Failed !'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500.0,
                  height: 500.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Thank you !',
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displaySmallFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displaySmallFamily),
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                if (FFAppState().statusFlag == 1)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 50.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.successAlertModel,
                                      updateCallback: () => setState(() {}),
                                      child: const SuccessAlertWidget(),
                                    ),
                                  ),
                                if (FFAppState().statusFlag == 2)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 50.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.failedAlertModel,
                                      updateCallback: () => setState(() {}),
                                      child: const FailedAlertWidget(),
                                    ),
                                  ),
                                if (FFAppState().statusFlag == 0)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 50.0, 0.0),
                                    child: Container(
                                      width: 399.0,
                                      height: 223.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.network(
                                            'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/importantImages%2Fload-8510_256.gif?alt=media&token=70ff4e43-a606-4f04-b9b0-e199ed2b16c4',
                                          ).image,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('HomePage');
                              },
                              child: Text(
                                'Click here to continue',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      letterSpacing: 0.0,
                                      decoration: TextDecoration.underline,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
