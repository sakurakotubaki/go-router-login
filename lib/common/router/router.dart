import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:value_notifier_example/ui/page/first_page.dart';

import '../../provider/auth_provider.dart';
import '../../ui/page/next_page.dart';

part 'router.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
final routerProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider);
  return GoRouter(
    debugLogDiagnostics: true,
    routes: $appRoutes,// 自動生成されたファイルからパスを読み込む

    // リダイレクトの処理
    redirect: (BuildContext context, GoRouterState state) {
      // asData?.valueは、riverpodのStreamProviderの値を取得するプロパティ
      final bool loggedIn = authState.asData?.value != null;
      // ログインしていない場合は、ログインページにリダイレクトする
      if (!loggedIn) {
        return const FirstRoute().location;
      }

      // ログインしている場合は、NextPageにリダイレクトする
      return const NextRoute().location;

    },
    // 404ページを指定
    errorPageBuilder: (context, state) {
      return const MaterialPage(
          child: Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ));
    },
  );
});

@TypedGoRoute<FirstRoute>(
  path: '/',
)
class FirstRoute extends GoRouteData {
  const FirstRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FirstPage();
  }
}

/// [NextPageのルート]
@TypedGoRoute<NextRoute>(
  path: '/next',
)
class NextRoute extends GoRouteData {
  const NextRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NextPage();
  }
}
