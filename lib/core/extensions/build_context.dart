import 'package:flutter/material.dart';

extension ScreenSizeEx on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}

extension NavigatorEx on BuildContext {
  /// context.push()
  Future<T?> push<T>({
    required Widget Function(BuildContext) builder,
    bool fullscreenDialog = false,
  }) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: builder, fullscreenDialog: fullscreenDialog),
    );
  }

  Future<T?> pushTo<T>(
    BuildContext context, {
    required Widget target,
    bool fullscreenDialog = false,
  }) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (context) => target, fullscreenDialog: fullscreenDialog),
    );
  }

  Future<T?> replace<T>({
    required Widget Function(BuildContext) builder,
  }) {
    return Navigator.of(this).pushReplacement<T, void>(
      MaterialPageRoute(builder: builder, fullscreenDialog: true),
    );
  }
}
