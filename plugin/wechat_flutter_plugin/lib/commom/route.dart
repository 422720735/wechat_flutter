
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dim/route/fade_route.dart';
import 'package:dim/route/rotation_route.dart';

typedef VoidCallbackWithType = void Function(String type);
typedef VoidCallbackConfirm = void Function(bool isOk);
typedef VoidCallbackWithMap = void Function(Map item);

final navGK = new GlobalKey<NavigatorState>();
GlobalKey<ScaffoldState> scaffoldGK;

Future<dynamic> routePush(Widget widget) {
  final route = new CupertinoPageRoute(
    builder: (BuildContext context) => widget,
    settings: new RouteSettings(
      name: widget.toStringShort(),
      isInitialRoute: false,
    ),
  );
  return navGK.currentState.push(route);
}

Future<dynamic> routeMaterialPush(Widget widget) {
  final route = new MaterialPageRoute(
    builder: (BuildContext context) => widget,
    settings: new RouteSettings(
      name: widget.toStringShort(),
      isInitialRoute: false,
    ),
  );
  return navGK.currentState.push(route);
}

Future<dynamic> routeFadePush(Widget widget) {
  final route = new FadeRoute(widget);
  return navGK.currentState.push(route);
}

Future<dynamic> routeRotationPush(Widget widget) {
  final route = new RotationRoute(widget);
  return navGK.currentState.push(route);
}

Future<dynamic> routePushAndRemove(Widget widget) {
  final route = new CupertinoPageRoute(
    builder: (BuildContext context) => widget,
    settings: new RouteSettings(
      name: widget.toStringShort(),
      isInitialRoute: false,
    ),
  );
  return navGK.currentState.pushAndRemoveUntil(route, (route) => route == null);
}

popToPage(Widget page) {
  navGK.currentState.pushAndRemoveUntil(new MaterialPageRoute<dynamic>(
    builder: (BuildContext context) {
      return page;
    },
  ), (Route<dynamic> route) => false);
}

pushReplacement(Widget page) {
  navGK.currentState.pushReplacement(new MaterialPageRoute<dynamic>(
    builder: (BuildContext context) {
      return page;
    },
  ));
}

popToRootPage() {
  navGK.currentState.popUntil(ModalRoute.withName('/'));
}