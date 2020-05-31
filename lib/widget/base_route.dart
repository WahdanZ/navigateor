import 'package:flutter/cupertino.dart';

import 'argument_widget.dart';

typedef BaseRouteBuilder = Widget Function(
    BuildContext context, Arguments arguments);

class BaseRoute {
  final String name;
  final BaseArguments args;
  final BaseRouteBuilder builder;
  const BaseRoute({
    @required this.name,
    @required this.builder,
    this.args,
  });
}
