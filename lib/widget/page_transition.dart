import 'package:flutter/material.dart';

import 'argument_widget.dart';
import 'base_route.dart';

//https://www.developerlibs.com/2019/06/flutter-screen-navigation-custom-transition.html
enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}

class PageTransition extends PageRouteBuilder {
  final BaseRoute child;
  final RouteSettings settings;
  final Arguments arguments;
  final PageTransitionType type;
  final Curve curve;
  final Alignment alignment;
  final Duration duration;
  PageTransition({
    @required this.child,
    this.arguments,
    this.type,
    this.settings,
    this.curve = Curves.linear,
    this.alignment,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
            settings: settings,
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child.builder(context, arguments),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              switch (arguments.transitionType) {
                case PageTransitionType.fade:
                  return FadeTransition(opacity: animation, child: child);
                  break;
                case PageTransitionType.rightToLeft:
                  return SlideTransition(
                    transformHitTests: false,
                    position: new Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: new SlideTransition(
                      position: new Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(-1.0, 0.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.leftToRight:
                  return SlideTransition(
                    transformHitTests: false,
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: new SlideTransition(
                      position: new Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(1.0, 0.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.upToDown:
                  return SlideTransition(
                    transformHitTests: false,
                    position: Tween<Offset>(
                      begin: const Offset(0.0, -1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: new SlideTransition(
                      position: new Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(0.0, 1.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.downToUp:
                  return SlideTransition(
                    transformHitTests: false,
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: new SlideTransition(
                      position: new Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(0.0, -1.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.scale:
                  return ScaleTransition(
                    alignment: alignment,
                    scale: CurvedAnimation(
                      parent: animation,
                      curve: Interval(
                        0.00,
                        0.50,
                        curve: curve,
                      ),
                    ),
                    child: child,
                  );
                  break;
                case PageTransitionType.rotate:
                  return new RotationTransition(
                    alignment: alignment,
                    turns: animation,
                    child: new ScaleTransition(
                      alignment: alignment,
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                  );
                  break;
                case PageTransitionType.size:
                  return Align(
                    alignment: alignment,
                    child: SizeTransition(
                      sizeFactor: CurvedAnimation(
                        parent: animation,
                        curve: curve,
                      ),
                      child: child,
                    ),
                  );
                  break;
                case PageTransitionType.rightToLeftWithFade:
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset.zero,
                          end: const Offset(-1.0, 0.0),
                        ).animate(secondaryAnimation),
                        child: child,
                      ),
                    ),
                  );
                  break;
                case PageTransitionType.leftToRightWithFade:
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset.zero,
                          end: const Offset(1.0, 0.0),
                        ).animate(secondaryAnimation),
                        child: child,
                      ),
                    ),
                  );
                  break;
                default:
                  return FadeTransition(opacity: animation, child: child);
              }
            });
}
