import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation/home/pages/all_example.dart';
import '../presentation/home/pages/query_parameters_screen.dart';
import '../presentation/main_nav/main_nav.dart';
import '../presentation/splash/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  final listenable = ValueNotifier<bool>(true);
  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: listenable,
    routes: router._routes,
    errorPageBuilder: router._errorPageBuilder,
    observers: [
      BotToastNavigatorObserver(),
    ],
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref ref;

  // RouterNotifier(this._ref) {
  //   _ref.listen<String?>(
  //     authProvider.select((value) => value.token),
  //     (_, __) => notifyListeners(),
  //   );
  // }
  RouterNotifier(this.ref) {
    // _ref.listen<String?>(
    //   authProvider.select((value) => value.token),
    //   (_, __) => notifyListeners(),
    // );
  }

  // String? _redirectLogic(GoRouterState state) {
  //   final token = _ref.watch(loggedInProvider).token;
  //   final user = _ref.watch(loggedInProvider).user;

  //   Logger.i('RouterNotifier: $user - $token');

  //   bool isUserIn() => token.isNotEmpty && user != UserModel.init();

  //   final areWeLoggingIn = state.location == SignInScreen.route;
  //   final areWeRegistering = state.location == SignInScreen.route;

  //   if (!isUserIn() && areWeLoggingIn) {
  //     return areWeLoggingIn ? null : SignInScreen.route;
  //   }
  //   if (!isUserIn() && areWeRegistering) {
  //     return areWeRegistering ? null : SignUpScreen.route;
  //   }

  //   if (areWeLoggingIn || areWeRegistering) return MainNav.route;

  //   return null;
  // }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashScreen.route,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: MainNav.route,
          builder: (context, state) => const MainNav(),
        ),
        // GoRoute(
        //   name: QueryparameterScreen.route,
        //   path: QueryparameterScreen.route,
        //   builder: (context, state) => QueryparameterScreen(
        //     id: int.parse(state.uri.queryParameters['id']!),
        //     name: state.uri.queryParameters['name'] ?? 'No name',
        //   ),
        // ),
        GoRoute(
          name: 'allRoutingExample',
          // path: 'allRoutingExample/:${int.tryParse('id') ?? 0})}',
          path: '${AllRoutingExample.route}/:id',
          builder: (BuildContext context, GoRouterState state) {
            return AllRoutingExample(
              id: int.tryParse(state.pathParameters['id']!) ?? int.parse("0"),
              name: state.uri.queryParameters['name'] ?? 'No name',
              age: state.uri.queryParameters['age'] ?? '10',
            );
          },
        ),
        GoRoute(
          path: QueryparameterScreen.route,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: QueryparameterScreen(
              id: int.parse(state.uri.queryParameters['id']!),
              name: state.uri.queryParameters['name'] ?? 'No name',
            ),
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOutCubicEmphasized),
                ),
              ),
              child: child,
            ),
          ),
        ),
      ];
  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          // backgroundColor: Theme.of(context).errorColor.withOpacity(.1),
          body: Center(
            child: Text('Error: ${state.error.toString()}'),
          ),
        ),
      );
}
