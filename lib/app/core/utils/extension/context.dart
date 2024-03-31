import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  Object? get routeArguments => ModalRoute.of(this)?.settings.arguments;

  Future<T?> to<T extends Object?>(String route, {Object? arguments}) {
    return Navigator.pushNamed<T>(this, route, arguments: arguments);
  }

  Future<T?> toReplacement<T extends Object?>(String route,
      {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, route, arguments: arguments);
  }

  popUntilFirst() => Navigator.popUntil(this, (route) => route.isFirst);

  pop<T>([T? result]) => Navigator.pop(this, result);
}
