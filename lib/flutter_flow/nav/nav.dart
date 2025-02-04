import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const AdminDashboardCopyWidget()
          : const LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const AdminDashboardCopyWidget()
              : const LoginPageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'MyAccount',
          path: '/myAccount',
          builder: (context, params) => const MyAccountWidget(),
        ),
        FFRoute(
          name: 'Gallery',
          path: '/gallery',
          builder: (context, params) => const GalleryWidget(),
        ),
        FFRoute(
          name: 'registerpage',
          path: '/registerpage',
          builder: (context, params) => const RegisterpageWidget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/adminLoginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'Category',
          path: '/category',
          builder: (context, params) => const CategoryWidget(),
        ),
        FFRoute(
          name: 'AdminOrders',
          path: '/adminOrders',
          builder: (context, params) => const AdminOrdersWidget(),
        ),
        FFRoute(
          name: 'CartCopyNew',
          path: '/MainPage',
          asyncParams: {
            'category': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => CartCopyNewWidget(
            productTitle: params.getParam(
              'productTitle',
              ParamType.String,
            ),
            categoryId: params.getParam(
              'categoryId',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'VideoPage',
          path: '/VideoPage',
          builder: (context, params) => const VideoPageWidget(),
        ),
        FFRoute(
          name: 'OrderStatus',
          path: '/orderStatus',
          builder: (context, params) => const OrderStatusWidget(),
        ),
        FFRoute(
          name: 'AdminDashboardCopy',
          path: '/adminDashboardCopy',
          builder: (context, params) => const AdminDashboardCopyWidget(),
        ),
        FFRoute(
          name: 'addCategory',
          path: '/AddCategory',
          builder: (context, params) => AddCategoryWidget(
            catCodeLen: params.getParam(
              'catCodeLen',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'updateCategory',
          path: '/updateCategory',
          asyncParams: {
            'catDocRef': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => UpdateCategoryWidget(
            catDocRef: params.getParam(
              'catDocRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'TermsAndConditions',
          path: '/termsAndConditions',
          builder: (context, params) => const TermsAndConditionsWidget(),
        ),
        FFRoute(
          name: 'PrivacyPolicy',
          path: '/privacyPolicy',
          builder: (context, params) => const PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: 'RefundAndReturnPolicy',
          path: '/refundAndReturnPolicy',
          builder: (context, params) => const RefundAndReturnPolicyWidget(),
        ),
        FFRoute(
          name: 'CheckoutDetails',
          path: '/checkoutDetails',
          builder: (context, params) => const CheckoutDetailsWidget(),
        ),
        FFRoute(
          name: 'cutoutPage',
          path: '/cutoutPage',
          asyncParams: {
            'categorydoc': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
            'category': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => CutoutPageWidget(
            categorydoc: params.getParam(
              'categorydoc',
              ParamType.Document,
            ),
            prdTitle: params.getParam(
              'prdTitle',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'FrameDesignPage',
          path: '/FrameDesginPage',
          asyncParams: {
            'categorydoc': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
            'category': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => FrameDesignPageWidget(
            categorydoc: params.getParam(
              'categorydoc',
              ParamType.Document,
            ),
            prdTitle: params.getParam(
              'prdTitle',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.Document,
            ),
            frameIImageUrl: params.getParam(
              'frameIImageUrl',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ShoppingCartnew',
          path: '/shoppingCartnew',
          builder: (context, params) => const ShoppingCartnewWidget(),
        ),
        FFRoute(
          name: 'collagePageNew',
          path: '/collagePageNew',
          asyncParams: {
            'categorydoc': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => CollagePageNewWidget(
            categorydoc: params.getParam(
              'categorydoc',
              ParamType.Document,
            ),
            prdTitle: params.getParam(
              'prdTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'carDashboard',
          path: '/carDashbaord',
          builder: (context, params) => const CarDashboardWidget(),
        ),
        FFRoute(
          name: 'hangingPhoto',
          path: '/carHangingAcrylic',
          builder: (context, params) => const HangingPhotoWidget(),
        ),
        FFRoute(
          name: 'collagePage2img',
          path: '/collagePage2img',
          asyncParams: {
            'categorydoc': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => CollagePage2imgWidget(
            categorydoc: params.getParam(
              'categorydoc',
              ParamType.Document,
            ),
            prdTitle: params.getParam(
              'prdTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'collagePage6img',
          path: '/collagePage6img',
          asyncParams: {
            'categorydoc': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => CollagePage6imgWidget(
            categorydoc: params.getParam(
              'categorydoc',
              ParamType.Document,
            ),
            prdTitle: params.getParam(
              'prdTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'collagePage9img',
          path: '/collagePage9img',
          asyncParams: {
            'categorydoc': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => CollagePage9imgWidget(
            categorydoc: params.getParam(
              'categorydoc',
              ParamType.Document,
            ),
            prdTitle: params.getParam(
              'prdTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Gallerycollage',
          path: '/galleryCollage',
          asyncParams: {
            'category': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => GallerycollageWidget(
            category: params.getParam(
              'category',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'hangingPhotonew',
          path: '/hangingPhotonew',
          builder: (context, params) => const HangingPhotonewWidget(),
        ),
        FFRoute(
          name: 'Clockpageedit',
          path: '/Clockpageedit',
          asyncParams: {
            'category': getDoc(['CATEGORY'], CategoryRecord.fromSnapshot),
          },
          builder: (context, params) => ClockpageeditWidget(
            productTitle: params.getParam(
              'productTitle',
              ParamType.String,
            ),
            categoryId: params.getParam(
              'categoryId',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ShippingPolicy',
          path: '/shippingPolicy',
          builder: (context, params) => const ShippingPolicyWidget(),
        ),
        FFRoute(
          name: 'NamePlateDesign',
          path: '/NamePlateDesign',
          builder: (context, params) => NamePlateDesignWidget(
            namePlateDesignUrl: params.getParam(
              'namePlateDesignUrl',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NamePlateGallery',
          path: '/namePlateGallery',
          builder: (context, params) => const NamePlateGalleryWidget(),
        ),
        FFRoute(
          name: 'ColorfullFrameGallary',
          path: '/colorfullFrameGallary',
          builder: (context, params) => const ColorfullFrameGallaryWidget(),
        ),
        FFRoute(
          name: 'uploadImage',
          path: '/uploadImage',
          builder: (context, params) => const UploadImageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/adminLoginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
