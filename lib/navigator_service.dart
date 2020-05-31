import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigateor/widget/base_route.dart';

import 'widget/argument_widget.dart';
import 'widget/page_transition.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Store all the mappings of route names and corresponding [SailorRoute]
  /// Used to generate routes
  Map<String, BaseRoute> _routeNameMappings = {};
  String _currentRoutePath;

  String get currentRoutePath => _currentRoutePath;

  Future<dynamic> navigateTo(String routeName,
      {Object argument,
      Map<String, String> params,
      PageTransitionType transitionType = PageTransitionType.fade}) {
    print('navigateToPage: pageRoute: $routeName');
    _currentRoutePath = routeName;
    if (navigatorKey.currentState == null) {
      print('navigateTo: Navigator State is null');
      return null;
    }
    if (params != null)
      routeName = Uri(path: routeName, queryParameters: params).toString();
    Arguments arguments = Arguments(
        arguments: argument, prams: params, transitionType: transitionType);
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<T> navigateToPageWithReplacement<T>(String routeName,
      {Map<String, dynamic> queryParams}) async {
    _currentRoutePath = routeName;
    print('navigateToPageWithReplacement: '
        'pageRoute:  $routeName');
    if (navigatorKey.currentState == null) {
      print('navigateToPageWithReplacement: Navigator State is null');
      return null;
    }
    routeName = Uri(path: routeName, queryParameters: queryParams).toString();

    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  Future<dynamic> clearStackTo(String routeName) {
    print("clearStackTo to $routeName");
    _currentRoutePath = routeName;
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop<T>([T result]) {
    print('goBack:');
    if (navigatorKey.currentState == null) {
      print('goBack: Navigator State is null');
      return;
    }
    _currentRoutePath =
        ModalRoute.of(navigatorKey.currentState.context).settings.name;
    navigatorKey.currentState.pop(result);
  }

  void addRoute(BaseRoute route) {
    assert(route != null, "'route' argument cannot be null.");

    if (_routeNameMappings.containsKey(route.name)) {
      print("'${route.name}' has already been registered before");
    }

    _routeNameMappings[route.name] = route;
  }

  void addRoutes(List<BaseRoute> routes) {
    if (routes != null && routes.isNotEmpty) {
      routes.forEach((route) => this.addRoute(route));
    }
  }

  RouteFactory generateRoute() {
    return (settings) {
      final uri = Uri.parse(settings.name);
      final routeName = uri.path;
      final prams = uri.queryParameters;
      final route = _routeNameMappings[routeName];
      if (route == null) return null;
      Arguments baseArgs = settings.arguments as Arguments;
      if (baseArgs == null) {
        baseArgs = Arguments(prams: prams);
      }
      return PageTransition(
          child: route, arguments: baseArgs, settings: settings);
    };
  }
}
