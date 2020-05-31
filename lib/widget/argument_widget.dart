import 'package:flutter/material.dart';

import 'page_transition.dart';

abstract class BaseArguments {}

class Arguments<T> {
  final T arguments;
  final Map<String, Object> prams;
  final PageTransitionType transitionType;
  const Arguments(
      {this.arguments,
      this.prams,
      this.transitionType = PageTransitionType.fade});
  Arguments copyWith({
    BaseArguments arguments,
    Map<String, Object> prams,
  }) {
    return new Arguments(
        arguments: arguments ?? this.arguments,
        prams: prams ?? this.prams,
        transitionType: transitionType ?? this.transitionType);
  }
}

typedef ArgumentWidgetBuilder<T extends BaseArguments> = Widget Function(
    BuildContext context, T arguments);

class ArgumentWidget<T extends BaseArguments> extends StatelessWidget {
  final ArgumentWidgetBuilder<T> builder;

  const ArgumentWidget({Key key, @required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final T args =
        (ModalRoute.of(context).settings.arguments as Arguments).arguments as T;

    return builder(context, args);
  }
}
