import 'package:flutter/material.dart';
import 'package:navigateor/widget/argument_widget.dart';
import 'package:navigateor/widget/loading_dialog.dart';

/// Contains some useful methods for build contexts.
extension LocalizationMangerExtension on BuildContext {
//  /// Returns the string associated to the specified key using LocalizationManger.
//  String getString(String key, [dynamic args]) =>
//      LocalizationManger.of(this).get(key, args);
  // Returns the MediaQuery
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;

  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  void showToast(String message) {}

  void showSnackBar(String message) {
    Scaffold.of(this).removeCurrentSnackBar();
    Scaffold.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  void showLoadingDialog() {
    LoadingDialog.show(this);
  }

  void hideLoadingDialog() {
    LoadingDialog.hide(this);
  }

  T getArgs<T>() {
    return (ModalRoute.of(this).settings.arguments as Arguments)?.arguments
        as T;
  }

  Map<String, Object> getPrams() {
    return (ModalRoute.of(this).settings.arguments as Arguments)?.prams;
  }

  T getKey<T>(String key, T defaultValue) {
    return (ModalRoute.of(this).settings.arguments as Arguments)?.prams[key]
            as T ??
        defaultValue;
  }
}

//extension LocalizationString on String {
//  get getLocal => Injector.inject<LocalizationManger>().get(this);
//}
