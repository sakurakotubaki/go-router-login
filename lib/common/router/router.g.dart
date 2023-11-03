// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $firstRoute,
      $nextRoute,
    ];

RouteBase get $firstRoute => GoRouteData.$route(
      path: '/',
      factory: $FirstRouteExtension._fromState,
    );

extension $FirstRouteExtension on FirstRoute {
  static FirstRoute _fromState(GoRouterState state) => const FirstRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $nextRoute => GoRouteData.$route(
      path: '/next',
      factory: $NextRouteExtension._fromState,
    );

extension $NextRouteExtension on NextRoute {
  static NextRoute _fromState(GoRouterState state) => const NextRoute();

  String get location => GoRouteData.$location(
        '/next',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
