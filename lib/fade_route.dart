import 'package:flutter/cupertino.dart';
import 'package:navigateor/widget/argument_widget.dart';

import 'widget/base_route.dart';

class FadeRoute extends PageRouteBuilder {
  final BaseRoute child;
  final RouteSettings settings;
  final Arguments arguments;
  FadeRoute({this.child, this.arguments, this.settings})
      : super(
          settings: settings,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child.builder(context, arguments),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
