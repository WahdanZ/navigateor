import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension WidgetExt on Widget {
  Widget padding({
    @required EdgeInsetsGeometry padding,
    Key key,
  }) {
    return Padding(
      child: this,
      padding: padding,
      key: key,
    );
  }

  Widget expanded({
    int flex = 1,
    Key key,
  }) {
    return Expanded(
      child: this,
      flex: flex,
      key: key,
    );
  }

  Widget flexible({
    int flex = 1,
    FlexFit fit = FlexFit.loose,
    Key key,
  }) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: this,
      key: key,
    );
  }

  Widget opacity({
    @required double opacity,
    bool alwaysIncludeSemantics = false,
    Key key,
  }) {
    return Opacity(
      opacity: opacity,
      alwaysIncludeSemantics: alwaysIncludeSemantics,
      child: this,
      key: key,
    );
  }

  Widget align({
    AlignmentGeometry alignment = Alignment.center,
    double widthFactor,
    double heightFactor,
    Key key,
  }) {
    return Align(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
      key: key,
    );
  }

  Widget center({
    Key key,
  }) {
    return Center(
      child: this,
      key: key,
    );
  }

  Widget top({
    double widthFactor,
    double heightFactor,
    Key key,
  }) {
    return Align(
      alignment: Alignment.topCenter,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
      key: key,
    );
  }

  Widget bottom({
    double widthFactor,
    double heightFactor,
    Key key,
  }) {
    return Align(
      alignment: Alignment.bottomCenter,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
      key: key,
    );
  }

  Widget left({
    double widthFactor,
    double heightFactor,
    Key key,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
      key: key,
    );
  }

  Widget right({
    double widthFactor,
    double heightFactor,
    Key key,
  }) {
    return Align(
      alignment: Alignment.centerRight,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
      key: key,
    );
  }

  Widget positioned({
    double left,
    double top,
    double right,
    double bottom,
    double width,
    double height,
    Key key,
  }) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: this,
      key: key,
    );
  }

  Widget rotatedBox({
    @required int quarterTurns,
    Key key,
  }) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: this,
      key: key,
    );
  }

  Widget sizedBox({
    double width,
    double height,
    Key key,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
      key: key,
    );
  }

  Widget constrainedBox({
    @required BoxConstraints constraints,
    Key key,
  }) {
    return ConstrainedBox(
      constraints: constraints,
      key: key,
    );
  }

  Widget expand({Key key}) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      key: key,
    );
  }

  Widget visibility({
    bool visible = true,
    Key key,
  }) {
    return Visibility(
      child: this,
      visible: visible,
      key: key,
    );
  }

  Widget hide({
    Key key,
  }) {
    return Visibility(
      child: this,
      visible: false,
      key: key,
    );
  }

  Widget safeArea({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
    Key key,
  }) {
    return SafeArea(
      child: this,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      key: key,
    );
  }

  Widget onTap(
    GestureTapCallback onTap, {
    Key key,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: this,
      key: key,
    );
  }

  Widget inkWell(
    GestureTapCallback onTap, {
    Key key,
  }) {
    return InkWell(
      onTap: onTap,
      child: this,
      key: key,
    );
  }

  Widget materialInkWell(
    GestureTapCallback onTap, {
    Color color = Colors.transparent,
    Key key,
  }) {
    return Material(
      color: color,
      key: key,
      child: InkWell(
        child: this,
        onTap: onTap,
      ),
    );
  }

  Widget rotate({
    @required double angle,
    Offset origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    Key key,
  }) {
    return Transform.rotate(
      angle: angle,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
      key: key,
    );
  }

  Widget scale({
    @required double scale,
    Offset origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    Key key,
  }) {
    return Transform.scale(
      scale: scale,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
      key: key,
    );
  }

  Widget translate({
    @required Offset offset,
    bool transformHitTests = true,
    Key key,
  }) {
    return Transform.translate(
      offset: offset,
      transformHitTests: transformHitTests,
      child: this,
      key: key,
    );
  }

  Widget get onTapAddJumpEffect => TranslateOnClick(child: this);

  Widget onDoubleTap(Function function) => GestureDetector(
        onDoubleTap: function,
        child: this,
      );

  Widget onLongPress(Function function) => GestureDetector(
        onLongPress: function,
        child: this,
      );
}

extension StyledText<T extends Text> on T {
  Text copyWith({
    String data,
    TextStyle style,
    StrutStyle strutStyle,
    TextAlign textAlign,
    TextDirection textDirection,
    Locale locale,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    String semanticsLabel,
    TextWidthBasis textWidthBasis,
  }) =>
      Text(
        data ?? this.data,
        style: style ?? this.style,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        locale: locale ?? this.locale,
        maxLines: maxLines ?? this.maxLines,
        overflow: overflow ?? this.overflow,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        softWrap: softWrap ?? this.softWrap,
        textDirection: textDirection ?? this.textDirection,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      );

  T textStyle(TextStyle style) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          background: style?.background,
          backgroundColor: style?.backgroundColor,
          color: style?.color,
          debugLabel: style?.debugLabel,
          decoration: style?.decoration,
          decorationColor: style?.decorationColor,
          decorationStyle: style?.decorationStyle,
          decorationThickness: style?.decorationThickness,
          fontFamily: style?.fontFamily,
          fontFamilyFallback: style?.fontFamilyFallback,
          fontFeatures: style?.fontFeatures,
          fontSize: style?.fontSize,
          fontStyle: style?.fontStyle,
          fontWeight: style?.fontWeight,
          foreground: style?.foreground,
          height: style?.height,
          inherit: style?.inherit,
          letterSpacing: style?.letterSpacing,
          locale: style?.locale,
          shadows: style?.shadows,
          textBaseline: style?.textBaseline,
          wordSpacing: style?.wordSpacing,
        ),
      );

  T textScale(double scaleFactor) =>
      this.copyWith(textScaleFactor: scaleFactor);

  T bold() => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontWeight: FontWeight.bold,
        ),
      );

  T italic() => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontStyle: FontStyle.italic,
        ),
      );

  T fontWeight(FontWeight fontWeight) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontWeight: fontWeight,
        ),
      );

  T fontSize(double size) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontSize: size,
        ),
      );

  T fontFamily(String font) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontFamily: font,
        ),
      );

  T letterSpacing(double space) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          letterSpacing: space,
        ),
      );

  T wordSpacing(double space) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          wordSpacing: space,
        ),
      );

  T textShadow({
    Color color = const Color(0x34000000),
    double blurRadius = 0.0,
    Offset offset = Offset.zero,
  }) =>
      this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          shadows: [
            Shadow(
              color: color,
              blurRadius: blurRadius,
              offset: offset,
            ),
          ],
        ),
      );

  T textColor(Color color) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          color: color,
        ),
      );

  T textAlignment(TextAlign align) => this.copyWith(textAlign: align);

  T textDirection(TextDirection direction) =>
      this.copyWith(textDirection: direction);

  T textBaseline(TextBaseline textBaseline) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          textBaseline: textBaseline,
        ),
      );

  T textWidthBasis(TextWidthBasis textWidthBasis) =>
      this.copyWith(textWidthBasis: textWidthBasis);
}

class TranslateOnClick extends StatefulWidget {
  final Widget child;

  const TranslateOnClick({Key key, this.child}) : super(key: key);

  @override
  _TranslateOnClickState createState() => _TranslateOnClickState();
}

class _TranslateOnClickState extends State<TranslateOnClick> {
  final nonClickTransform = Matrix4.identity();
  final clickTransform = Matrix4.identity()..translate(0, -10, 0);

  bool _clicking = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (d) => _userClick(true),
      onTapUp: (d) => _userClick(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: widget.child,
        transform: _clicking ? clickTransform : nonClickTransform,
      ),
    );
  }

  void _userClick(bool click) {
    setState(() {
      _clicking = click;
    });
  }
}

extension ContainerExtensions on Container {
  /// Add round corners to a Container
  ///  if the Container already has a color use [backgroundColor] instead and remove the
  ///  [Color] from the Container it self
  Container withRoundCorners({@required Color backgroundColor}) => Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: this,
      );

  /// A shadow cast by a box
  ///
  /// [shadowColor]
  Container withShadow(
          {Color shadowColor = Colors.grey,
          double blurRadius = 20.0,
          double spreadRadius = 1.0,
          Offset offset = const Offset(10.0, 10.0)}) =>
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: blurRadius,
                spreadRadius: spreadRadius,
                offset: offset),
          ],
        ),
        child: this,
      );
}
